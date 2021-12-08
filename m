Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C5D0C433F5
	for <linux-clk@archiver.kernel.org>; Wed,  8 Dec 2021 17:05:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237535AbhLHRI5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Dec 2021 12:08:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237526AbhLHRI4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Dec 2021 12:08:56 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 902C8C0617A1
        for <linux-clk@vger.kernel.org>; Wed,  8 Dec 2021 09:05:24 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id j3so5260063wrp.1
        for <linux-clk@vger.kernel.org>; Wed, 08 Dec 2021 09:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YR/2vGWZHeBMgde5ORehOtykBe6sle8e8s6nTFv/bzo=;
        b=QeLapHn2fyK83X/BSi9XHMAYbBtpZ2EvXoXANoAd7wvwM6qLw0wQXyA5tQthLDGn/M
         98kOyUxx6XZnKVCWFF/xRkD+FV2Hm+A9iEpj2fbh2jDw4htbloVlimRavtPnqGFWfgfr
         ICl/Sa9iXjcse4XJsY0AZQ5GpYW/kKNo8CjMu5a3IBItBa5gvZMdMfhwhGCim8TheR+c
         UztyoMGzeNVTCSyFL5myzxaTLSc5ve5YDGVDoM3QUgYD1nClxsK7JxHQEaucasEbkI7E
         y+fOSiaaK+Lr3ntvRR4NGjToUij6QyzzaMbODmnFbZDbteAy5vQz9JS/MLazOZ5PT8kj
         CWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YR/2vGWZHeBMgde5ORehOtykBe6sle8e8s6nTFv/bzo=;
        b=EWACuHdFDH5GpJ1IJIl0jS8u/SGh/B3KFMtHhDroH5jOYHmKV9wT5Orpk9VOAADAun
         5Ivu1X/Y2YzvnjmWMsqXZxwqcs3/Dw8ZR8og0+UNaF36Cl2f12te9qNlPYTxraSGj+ks
         mEBsLAa1OnMWnM7HGDmc32cpWI2Uk5VAhT2mfL4OljGK8M3jVIKxA5/K3tml3A01vexS
         mNzuIAQoEJsk5jhnq6Tuk7t39y6QqvO5qW8zMTevHmYW7eVjHJ9FEH0AFl5BXuHL9Ce8
         jypRqCpY/O9j5ySqhQdB2DqVSa0A3q0kzwYXVjcAoKRnyJrZRfmq2+n0oZ+eYZ7G/RO8
         xOaw==
X-Gm-Message-State: AOAM531UPH9/vQQzgUc6VwiJ0ojqCF15amGfX81yTWgm4CCwqM9xSwee
        BiTdlrjZ6OCmAqOmr8+R5iSyai1GpTNzHg==
X-Google-Smtp-Source: ABdhPJwASlolKwSqDxW4C/k6+e2eDfwwejSZxDegidEKgRpfkB00YVfQYkA5IpgjEibVfRdYCDd6gQ==
X-Received: by 2002:a5d:6211:: with SMTP id y17mr60986067wru.97.1638983122998;
        Wed, 08 Dec 2021 09:05:22 -0800 (PST)
Received: from localhost.localdomain ([88.160.176.23])
        by smtp.gmail.com with ESMTPSA id h27sm7183883wmc.43.2021.12.08.09.05.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Dec 2021 09:05:22 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, shawn.guo@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 2/2] dt-bindings: clock: Add qualcomm QCM2290 DISPCC bindings
Date:   Wed,  8 Dec 2021 18:17:21 +0100
Message-Id: <1638983841-23773-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1638983841-23773-1-git-send-email-loic.poulain@linaro.org>
References: <1638983841-23773-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add device tree bindings for display clock controller on QCM2290 SoCs.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 .../bindings/clock/qcom,qcm2290-dispcc.yaml        | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml

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
-- 
2.7.4

