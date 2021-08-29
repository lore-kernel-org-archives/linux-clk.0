Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5856C432BE
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 19:36:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76A3860F23
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 19:36:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231511AbhH2ThS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Aug 2021 15:37:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231450AbhH2ThR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 29 Aug 2021 15:37:17 -0400
X-Greylist: delayed 19600 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 29 Aug 2021 12:36:25 PDT
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D9C1C061575
        for <linux-clk@vger.kernel.org>; Sun, 29 Aug 2021 12:36:25 -0700 (PDT)
Received: from localhost.localdomain (83.6.166.149.neoplus.adsl.tpnet.pl [83.6.166.149])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 8A9DC3E81B;
        Sun, 29 Aug 2021 21:36:22 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2 1/9] dt-bindings: clk: qcom: Add bindings for MSM8994 GCC driver
Date:   Sun, 29 Aug 2021 21:36:08 +0200
Message-Id: <20210829193617.4105-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add documentation for the MSM8994 GCC driver.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Acked-by: Rob Herring <robh@kernel.org>
---
No changes since the original v2, only added Rob's A-b

 .../bindings/clock/qcom,gcc-msm8994.yaml      | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
new file mode 100644
index 000000000000..b44a844d894c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/clock/qcom,gcc-msm8994.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Global Clock & Reset Controller Binding for MSM8994
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on MSM8994 and MSM8992.
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-msm8994.h
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Taniya Das <tdas@codeaurora.org>
+
+properties:
+  compatible:
+    enum:
+      - qcom,gcc-msm8992
+      - qcom,gcc-msm8994
+
+  clocks:
+    items:
+      - description: XO source
+      - description: Sleep clock source
+
+  clock-names:
+    items:
+      - const: xo
+      - const: sleep
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  protected-clocks:
+    description:
+      Protected clock specifier list as per common clock binding.
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@300000 {
+      compatible = "qcom,gcc-msm8994";
+      reg = <0x300000 0x90000>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+      clocks = <&xo_board>, <&sleep_clk>;
+      clock-names = "xo", "sleep";
+    };
+...
-- 
2.33.0

