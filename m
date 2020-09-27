Return-Path: <SRS0=mS9l=DE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3556EC4741F
	for <linux-clk@archiver.kernel.org>; Sun, 27 Sep 2020 19:08:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EBD1823A05
	for <linux-clk@archiver.kernel.org>; Sun, 27 Sep 2020 19:08:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=marek-ca.20150623.gappssmtp.com header.i=@marek-ca.20150623.gappssmtp.com header.b="WbamDIGm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbgI0TIe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Sep 2020 15:08:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726461AbgI0TId (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 27 Sep 2020 15:08:33 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 969B0C0613D4
        for <linux-clk@vger.kernel.org>; Sun, 27 Sep 2020 12:08:33 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id s131so3637459qke.0
        for <linux-clk@vger.kernel.org>; Sun, 27 Sep 2020 12:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fw4RyR5JTxyJpVIL6AoaKPYGwJ+F5+wSIpEpQsEg0QQ=;
        b=WbamDIGmeY1SGLILbl3KdGUYQWcrfHcc4G+JYAIevLkO99/oLn+g4fq15U5xutdqJi
         uzWOQ2AKtPgVQVQsH3rck3ai3bsvHQmVNMyeRsPNnE0K/rPWLvpfZmUaThrJH4B9DhaX
         99MUxqO9ePI7F74gA4NNjkQEUgeNN4gwTRBNrlzuoZfzbUV4YrvgqcCQ+SOUqIrBdYO3
         Az2YisJvEW9WwyJjMPJu3vdrY357zjhPeK3G3TyWF4v3g5J48xU0at54CsGXqVVK4G/S
         sHwUdttapRbKOrGyD/9xnvrIa26cNuW7VUMqFiFewbYxSd9ynVzcV89vI60mEp83eHBX
         jQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fw4RyR5JTxyJpVIL6AoaKPYGwJ+F5+wSIpEpQsEg0QQ=;
        b=kfpZsry52Z8Qp1Cc3SN4z+VlkX56xbPDjPexXra2/4meFOcnxVZ5DXYxmnrtmzZ2kJ
         yu1OBrqAcQVS/LDG2l0JevGug/f67uLoTrnL/FYa0iNk5gikGmSPvSNa4MW1yOpCU0Mm
         JGtO3YprTh8vnyd1u5L5lS4ATPTK6Wso83E4U0+UMGySk0EdOhCfoAS7RelKWxuTdrHD
         ySKm2jvlZu4JCqrnE4RyM5bMNbD+5lGYGF1qXy77TyoMkYuo1IUofFr3xSMTmsTnNgQF
         azkqhemUwZkUKs/WkTwIB5pEgu226vPcrF+bIiJrdokZ1zKiHvt7x2MmWsfPZYd+FDv4
         FAIA==
X-Gm-Message-State: AOAM531kOiZyWQVfsfVKKSXC39KYKZBh0qIPE9WXXRt7poxKR1+hlHxy
        qeWJt3HehMlgo1uPtBfOV3MByQ==
X-Google-Smtp-Source: ABdhPJxtLx27vkAOSVFLEuSNpN71mkBuqrVJDvNl2/cd2pwV0TCM0OBZzHOmyUmQMIT3ox3uOK3k9g==
X-Received: by 2002:a05:620a:6d9:: with SMTP id 25mr9040081qky.269.1601233712765;
        Sun, 27 Sep 2020 12:08:32 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id s25sm7973827qtc.90.2020.09.27.12.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 12:08:32 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 1/2] dt-bindings: clock: add QCOM SM8150 and SM8250 display clock bindings
Date:   Sun, 27 Sep 2020 15:06:50 -0400
Message-Id: <20200927190653.13876-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200927190653.13876-1-jonathan@marek.ca>
References: <20200927190653.13876-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add device tree bindings for display clock controller for
Qualcomm Technology Inc's SM8150 and SM8250 SoCs.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> (SM8250)
---
 .../bindings/clock/qcom,dispcc-sm8x50.yaml    | 93 +++++++++++++++++++
 .../dt-bindings/clock/qcom,dispcc-sm8150.h    |  1 +
 .../dt-bindings/clock/qcom,dispcc-sm8250.h    | 66 +++++++++++++
 3 files changed, 160 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
 create mode 120000 include/dt-bindings/clock/qcom,dispcc-sm8150.h
 create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm8250.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
new file mode 100644
index 000000000000..0cdf53f41f84
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display Clock & Reset Controller Binding for SM8150/SM8250
+
+maintainers:
+  - Jonathan Marek <jonathan@marek.ca>
+
+description: |
+  Qualcomm display clock control module which supports the clocks, resets and
+  power domains on SM8150 and SM8250.
+
+  See also:
+    dt-bindings/clock/qcom,dispcc-sm8150.h
+    dt-bindings/clock/qcom,dispcc-sm8250.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm8150-dispcc
+      - qcom,sm8250-dispcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Byte clock from DSI PHY0
+      - description: Pixel clock from DSI PHY0
+      - description: Byte clock from DSI PHY1
+      - description: Pixel clock from DSI PHY1
+      - description: Link clock from DP PHY
+      - description: VCO DIV clock from DP PHY
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+      - const: dsi0_phy_pll_out_byteclk
+      - const: dsi0_phy_pll_out_dsiclk
+      - const: dsi1_phy_pll_out_byteclk
+      - const: dsi1_phy_pll_out_dsiclk
+      - const: dp_phy_pll_link_clk
+      - const: dp_phy_pll_vco_div_clk
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
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@af00000 {
+      compatible = "qcom,sm8250-dispcc";
+      reg = <0x0af00000 0x10000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&dsi0_phy 0>,
+               <&dsi0_phy 1>,
+               <&dsi1_phy 0>,
+               <&dsi1_phy 1>,
+               <&dp_phy 0>,
+               <&dp_phy 1>;
+      clock-names = "bi_tcxo",
+                    "dsi0_phy_pll_out_byteclk",
+                    "dsi0_phy_pll_out_dsiclk",
+                    "dsi1_phy_pll_out_byteclk",
+                    "dsi1_phy_pll_out_dsiclk",
+                    "dp_phy_pll_link_clk",
+                    "dp_phy_pll_vco_div_clk";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,dispcc-sm8150.h b/include/dt-bindings/clock/qcom,dispcc-sm8150.h
new file mode 120000
index 000000000000..0312b4544acb
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,dispcc-sm8150.h
@@ -0,0 +1 @@
+qcom,dispcc-sm8250.h
\ No newline at end of file
diff --git a/include/dt-bindings/clock/qcom,dispcc-sm8250.h b/include/dt-bindings/clock/qcom,dispcc-sm8250.h
new file mode 100644
index 000000000000..fdaca6ad5c85
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,dispcc-sm8250.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_SM8250_H
+#define _DT_BINDINGS_CLK_QCOM_DISP_CC_SM8250_H
+
+/* DISP_CC clock registers */
+#define DISP_CC_MDSS_AHB_CLK			0
+#define DISP_CC_MDSS_AHB_CLK_SRC		1
+#define DISP_CC_MDSS_BYTE0_CLK			2
+#define DISP_CC_MDSS_BYTE0_CLK_SRC		3
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC		4
+#define DISP_CC_MDSS_BYTE0_INTF_CLK		5
+#define DISP_CC_MDSS_BYTE1_CLK			6
+#define DISP_CC_MDSS_BYTE1_CLK_SRC		7
+#define DISP_CC_MDSS_BYTE1_DIV_CLK_SRC		8
+#define DISP_CC_MDSS_BYTE1_INTF_CLK		9
+#define DISP_CC_MDSS_DP_AUX1_CLK		10
+#define DISP_CC_MDSS_DP_AUX1_CLK_SRC		11
+#define DISP_CC_MDSS_DP_AUX_CLK			12
+#define DISP_CC_MDSS_DP_AUX_CLK_SRC		13
+#define DISP_CC_MDSS_DP_LINK1_CLK		14
+#define DISP_CC_MDSS_DP_LINK1_CLK_SRC		15
+#define DISP_CC_MDSS_DP_LINK1_DIV_CLK_SRC	16
+#define DISP_CC_MDSS_DP_LINK1_INTF_CLK		17
+#define DISP_CC_MDSS_DP_LINK_CLK		18
+#define DISP_CC_MDSS_DP_LINK_CLK_SRC		19
+#define DISP_CC_MDSS_DP_LINK_DIV_CLK_SRC	20
+#define DISP_CC_MDSS_DP_LINK_INTF_CLK		21
+#define DISP_CC_MDSS_DP_PIXEL1_CLK		22
+#define DISP_CC_MDSS_DP_PIXEL1_CLK_SRC		23
+#define DISP_CC_MDSS_DP_PIXEL2_CLK		24
+#define DISP_CC_MDSS_DP_PIXEL2_CLK_SRC		25
+#define DISP_CC_MDSS_DP_PIXEL_CLK		26
+#define DISP_CC_MDSS_DP_PIXEL_CLK_SRC		27
+#define DISP_CC_MDSS_ESC0_CLK			28
+#define DISP_CC_MDSS_ESC0_CLK_SRC		29
+#define DISP_CC_MDSS_ESC1_CLK			30
+#define DISP_CC_MDSS_ESC1_CLK_SRC		31
+#define DISP_CC_MDSS_MDP_CLK			32
+#define DISP_CC_MDSS_MDP_CLK_SRC		33
+#define DISP_CC_MDSS_MDP_LUT_CLK		34
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK		35
+#define DISP_CC_MDSS_PCLK0_CLK			36
+#define DISP_CC_MDSS_PCLK0_CLK_SRC		37
+#define DISP_CC_MDSS_PCLK1_CLK			38
+#define DISP_CC_MDSS_PCLK1_CLK_SRC		39
+#define DISP_CC_MDSS_ROT_CLK			40
+#define DISP_CC_MDSS_ROT_CLK_SRC		41
+#define DISP_CC_MDSS_RSCC_AHB_CLK		42
+#define DISP_CC_MDSS_RSCC_VSYNC_CLK		43
+#define DISP_CC_MDSS_VSYNC_CLK			44
+#define DISP_CC_MDSS_VSYNC_CLK_SRC		45
+#define DISP_CC_PLL0				46
+#define DISP_CC_PLL1				47
+
+/* DISP_CC Reset */
+#define DISP_CC_MDSS_CORE_BCR			0
+#define DISP_CC_MDSS_RSCC_BCR			1
+
+/* DISP_CC GDSCR */
+#define MDSS_GDSC				0
+
+#endif
-- 
2.26.1

