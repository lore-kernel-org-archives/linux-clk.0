Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FE7C4321E
	for <linux-clk@archiver.kernel.org>; Sat,  4 Sep 2021 18:30:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9AA1560FA0
	for <linux-clk@archiver.kernel.org>; Sat,  4 Sep 2021 18:30:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237405AbhIDSbp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 4 Sep 2021 14:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234085AbhIDSbp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 4 Sep 2021 14:31:45 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC39C061575
        for <linux-clk@vger.kernel.org>; Sat,  4 Sep 2021 11:30:43 -0700 (PDT)
Received: from localhost.localdomain (83.6.166.194.neoplus.adsl.tpnet.pl [83.6.166.194])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id A47FC3EBA1;
        Sat,  4 Sep 2021 20:30:38 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/9] dt-bindings: clk: qcom: Add bindings for MSM8994 GCC driver
Date:   Sat,  4 Sep 2021 20:30:05 +0200
Message-Id: <20210904183014.43528-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add documentation for the MSM8994 GCC driver.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
Changes since v2:

- Dropped second dt-binding part for the weird SD card clock configuration
- Fix up many mistakes, including maintainers, license and order
- I still have no idea why I get a pinctrl regex error.. need help here!

 .../bindings/clock/qcom,gcc-msm8994.yaml      | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
new file mode 100644
index 000000000000..22e67b238bb6
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-msm8994.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding for MSM8994
+
+maintainers:
+  - Konrad Dybcio <konrad.dybcio@somainline.org>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on MSM8994 and MSM8992.
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-msm8994.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,gcc-msm8992
+      - qcom,gcc-msm8994
+
+  clocks:
+    items:
+      - description: Board XO source
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
+required:
+  - compatible
+  - clocks
+  - clock-names
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
+      reg = <0x00300000 0x90000>;
+      clocks = <&xo_board>, <&sleep_clk>;
+      clock-names = "xo", "sleep";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+
+...
-- 
2.33.0

