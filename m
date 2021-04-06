Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08FE0C433B4
	for <linux-clk@archiver.kernel.org>; Tue,  6 Apr 2021 23:19:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6C89613D5
	for <linux-clk@archiver.kernel.org>; Tue,  6 Apr 2021 23:19:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236097AbhDFXTW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Apr 2021 19:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244247AbhDFXTW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Apr 2021 19:19:22 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CA22C061762
        for <linux-clk@vger.kernel.org>; Tue,  6 Apr 2021 16:19:13 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id v140so7593457lfa.4
        for <linux-clk@vger.kernel.org>; Tue, 06 Apr 2021 16:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MqUyCQ8bApydwGreXPqVnRLc78HVU/m7ATGYH5tMkXg=;
        b=YhWJ4w34d5BT8WeRgmPjRzgfvtQ/G+N5xQqF+e/xyxgLPYXcQCJIOmOuw07gRyk8di
         KsiuvhrWHUj7AIm14xo/f0UXiVt83vGwvX9wMEg2WJkbfGQ4kETjogeiVfOMVaogxwbx
         sVAM2uaUvZFanT+G9mvxDOQE6TOtNZ8sxliDOl4R7LdKme5VmVwZEw7eAORzx1kuPoIG
         okrfJEhGPKCb7/vfC/MkGsf9CE+3HKYJs1PUswBHYrK8JTP6lJF4Q60Ko+V5jK+vioH7
         BomBa+V0WIcsX6F9/NA2pd3xpa92W5kA3CWdzeb3th/Bl2EH3Pc43ouHr19cwTiiQVTJ
         kfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MqUyCQ8bApydwGreXPqVnRLc78HVU/m7ATGYH5tMkXg=;
        b=rBeatKUvevRktXK+Kjpj5HzgIOsIJMYOBqHBpMlJ3oPdoOSf7rRYsVXa02hvHBYymF
         6deEussEYYTyyWZiHbylgyEXi5CDQosdGelMwuaL0jsXCVPGekrDGPGbaEz7MaHNv+Rc
         sG0SaqgliyvQ19fcJ60L9hR+Z9QWVExhxT8BxtksZ7r4tMAFOh7SugSGRlamC0oWvd/a
         PAdHj9Z+aDH9qVckeG4uzV6tsdvhJCzYMqNqb5NVQXgGe5BOg2RR5ZsJDxiX2kV1GKTG
         BcyVE9lwIfku0oP9ql4A20rfgX0+Miop3VWEYkE1Ghn7FONKWUgA9Bjkq2zXgdRVedO7
         nIwg==
X-Gm-Message-State: AOAM5308Ii4gziR08QK6Tcd5ygqU9+pG1GED3MmGBYt+QErZFufUBSyj
        f9r+W2m26MORVqdznJ/cVsO4zA==
X-Google-Smtp-Source: ABdhPJwkLWiyhCewoLQCKO+jo8s3cpku/eCJjC3nN5ah9VRA02+LNwBh7nJO7JtF32yDagLZbL6+wQ==
X-Received: by 2002:a05:6512:11c7:: with SMTP id h7mr393606lfr.197.1617751152000;
        Tue, 06 Apr 2021 16:19:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u16sm2366565lja.48.2021.04.06.16.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 16:19:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: clock: separate SDM845 GCC clock bindings
Date:   Wed,  7 Apr 2021 02:19:06 +0300
Message-Id: <20210406231909.3035267-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210406231909.3035267-1-dmitry.baryshkov@linaro.org>
References: <20210406231909.3035267-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Separate qcom,gcc-sdm845 clock bindings, adding required clocks and
clock-names properties.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gcc-sdm845.yaml       | 84 +++++++++++++++++++
 .../devicetree/bindings/clock/qcom,gcc.yaml   |  2 -
 2 files changed, 84 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
new file mode 100644
index 000000000000..4808fa7a6b8c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-sdm845.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on SDM845
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-sdm845.h
+
+properties:
+  compatible:
+    const: qcom,gcc-sdm845
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board active XO source
+      - description: Sleep clock source
+      - description: PCIE 0 Pipe clock source (Optional clock)
+      - description: PCIE 1 Pipe clock source (Optional clock)
+    minItems: 3
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+      - const: bi_tcxo_ao
+      - const: sleep_clk
+      - const: pcie_0_pipe_clk # Optional clock
+      - const: pcie_1_pipe_clk # Optional clock
+    minItems: 3
+    maxItems: 5
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
+  # Example for GCC for MSM8960:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@100000 {
+      compatible = "qcom,gcc-sdm845";
+      reg = <0x100000 0x1f0000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>,
+               <&sleep_clk>;
+      clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
index ee0467fb5e31..490edad25830 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
@@ -32,7 +32,6 @@ description: |
   - dt-bindings/clock/qcom,gcc-mdm9615.h
   - dt-bindings/reset/qcom,gcc-mdm9615.h
   - dt-bindings/clock/qcom,gcc-sdm660.h  (qcom,gcc-sdm630 and qcom,gcc-sdm660)
-  - dt-bindings/clock/qcom,gcc-sdm845.h
 
 properties:
   compatible:
@@ -52,7 +51,6 @@ properties:
       - qcom,gcc-mdm9615
       - qcom,gcc-sdm630
       - qcom,gcc-sdm660
-      - qcom,gcc-sdm845
 
   '#clock-cells':
     const: 1
-- 
2.30.2

