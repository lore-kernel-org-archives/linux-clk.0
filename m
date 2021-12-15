Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF39C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 15 Dec 2021 16:57:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245062AbhLOQ5h (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Dec 2021 11:57:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245055AbhLOQ5h (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 11:57:37 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12922C061574
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 08:57:37 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id z4-20020a1c7e04000000b0032fb900951eso1902947wmc.4
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 08:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=bPbLtdEb72RbOotERiySsN3cFX5+TLHqG45GxlHnsnM=;
        b=ujQWfflkuq9/X5ZI9mVZWnwM2LSn+8BSjGuYDxWT7OHcYLjXdOLm6WuIZLKlK6AZ3R
         y6xrfyjnMkjcIpR98r81MAklT/UcQyTIjehsr5eSQcaQK0Q9z//J9YEX4hM1T9E74D5n
         VvN25zvj2UnCkBYSFkS6DJ4/uSzBIA0mF0/1qSu67ieXQzhY8QRonnUWgBKsDUJNkuBF
         HZDFkBMWKgMmpy7flW7RiMeIX7jiY4JlZP0y3WEc38GTNsbfBNS7a5DCjxzb4zY4Djgt
         8gpuUvYl6t9rF2HEEHkcQqeCL3NU6luDtobMg4DC+A/nplix/zn1wyxEBLg88H3Z9h0Y
         7KFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bPbLtdEb72RbOotERiySsN3cFX5+TLHqG45GxlHnsnM=;
        b=Y2Fadh/FQhcxbyF9YUfRVcJSsnAs7dcBTcdOZsQC9RJDV5Im3ieljw1FJuM8nPFrdi
         r3Fq6SrAQngAI1HEQwIqQ3GBwHu7+2kPBRqZLoHM71x9HwFJK6zLHc3OE6RjzYfQ/QOA
         xAv5tnLz3VlxSmMFMytXCaAWLs3XNQPlmAEtUCEdZ0fiAmzKXXKeUpZwQ50jiumF+5oP
         MktH3/Yuw+D3YzBANrE/4gkjCHg5yaYyYWNuZoXureo2eak2FdYst3vZZ/H5dsawUOOc
         9SM+2Cp84vIlGocZCjL0K+8rlQgp5ryjjmynEc21EJql/fq1cbn5vqsxqI5KWmv8rYR/
         PnFA==
X-Gm-Message-State: AOAM532ugejaSLgedleRz/g93SqReZEU6ZRmbAPpNyq2w5oSRPdHcN/y
        IY8cIy6EhyV1auZPB6bloOTMmg==
X-Google-Smtp-Source: ABdhPJx/5RDh0nOj2cF3cZiYSyIyK7EC74XPaQB/I3AFacstodEyqxY55Kph1Sz0aXoRkbv3LAtFog==
X-Received: by 2002:a1c:1fc2:: with SMTP id f185mr745260wmf.149.1639587454646;
        Wed, 15 Dec 2021 08:57:34 -0800 (PST)
Received: from localhost.localdomain ([88.160.176.23])
        by smtp.gmail.com with ESMTPSA id k7sm2507969wri.110.2021.12.15.08.57.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Dec 2021 08:57:34 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, shawn.guo@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: clock: Add qualcomm QCM2290 DISPCC bindings
Date:   Wed, 15 Dec 2021 18:09:39 +0100
Message-Id: <1639588180-32454-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add device tree bindings for display clock controller on QCM2290 SoCs.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 v2: no change
 v3: Include dt-bindings header (qcom,dispcc-qcm2290.h) in that commit
 
 .../bindings/clock/qcom,qcm2290-dispcc.yaml        | 87 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,dispcc-qcm2290.h    | 34 +++++++++
 2 files changed, 121 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,dispcc-qcm2290.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
new file mode 100644
index 00000000..44d5ce7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,qcm2290-dispcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display Clock & Reset Controller Binding for qcm2290
+
+maintainers:
+  - Loic Poulain <loic.poulain@linaro.org>
+
+description: |
+  Qualcomm display clock control module which supports the clocks, resets and
+  power domains on qcm2290.
+
+  See also dt-bindings/clock/qcom,dispcc-qcm2290.h.
+
+properties:
+  compatible:
+    const: qcom,qcm2290-dispcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board active-only XO source
+      - description: GPLL0 source from GCC
+      - description: GPLL0 div source from GCC
+      - description: Byte clock from DSI PHY
+      - description: Pixel clock from DSI PHY
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+      - const: bi_tcxo_ao
+      - const: gcc_disp_gpll0_clk_src
+      - const: gcc_disp_gpll0_div_clk_src
+      - const: dsi0_phy_pll_out_byteclk
+      - const: dsi0_phy_pll_out_dsiclk
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
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    clock-controller@5f00000 {
+            compatible = "qcom,qcm2290-dispcc";
+            reg = <0x5f00000 0x20000>;
+            clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+                     <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
+                     <&gcc GCC_DISP_GPLL0_CLK_SRC>,
+                     <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
+                     <&dsi0_phy 0>,
+                     <&dsi0_phy 1>;
+            clock-names = "bi_tcxo",
+                          "bi_tcxo_ao",
+                          "gcc_disp_gpll0_clk_src",
+                          "gcc_disp_gpll0_div_clk_src",
+                          "dsi0_phy_pll_out_byteclk",
+                          "dsi0_phy_pll_out_dsiclk";
+            #clock-cells = <1>;
+            #reset-cells = <1>;
+            #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,dispcc-qcm2290.h b/include/dt-bindings/clock/qcom,dispcc-qcm2290.h
new file mode 100644
index 00000000..5b20fb0
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,dispcc-qcm2290.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_QCM2290_H
+#define _DT_BINDINGS_CLK_QCOM_DISP_CC_QCM2290_H
+
+/* DISP_CC clocks */
+#define DISP_CC_PLL0				0
+#define DISP_CC_MDSS_AHB_CLK			1
+#define DISP_CC_MDSS_AHB_CLK_SRC		2
+#define DISP_CC_MDSS_BYTE0_CLK			3
+#define DISP_CC_MDSS_BYTE0_CLK_SRC		4
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC		5
+#define DISP_CC_MDSS_BYTE0_INTF_CLK		6
+#define DISP_CC_MDSS_ESC0_CLK			7
+#define DISP_CC_MDSS_ESC0_CLK_SRC		8
+#define DISP_CC_MDSS_MDP_CLK			9
+#define DISP_CC_MDSS_MDP_CLK_SRC		10
+#define DISP_CC_MDSS_MDP_LUT_CLK		11
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK		12
+#define DISP_CC_MDSS_PCLK0_CLK			13
+#define DISP_CC_MDSS_PCLK0_CLK_SRC		14
+#define DISP_CC_MDSS_VSYNC_CLK			15
+#define DISP_CC_MDSS_VSYNC_CLK_SRC		16
+#define DISP_CC_SLEEP_CLK			17
+#define DISP_CC_SLEEP_CLK_SRC			18
+#define DISP_CC_XO_CLK				19
+#define DISP_CC_XO_CLK_SRC			20
+
+#define MDSS_GDSC				0
+
+#endif
-- 
2.7.4

