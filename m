Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3336CC4332F
	for <linux-clk@archiver.kernel.org>; Wed,  9 Nov 2022 14:19:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbiKIOT1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Nov 2022 09:19:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231165AbiKIOTZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Nov 2022 09:19:25 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09DA61BEB4
        for <linux-clk@vger.kernel.org>; Wed,  9 Nov 2022 06:19:24 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id c25so25980162ljr.8
        for <linux-clk@vger.kernel.org>; Wed, 09 Nov 2022 06:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ayswml3Gys9+89Da5+RrDn+F9xiVZqaGFJX2IFU9YtM=;
        b=BaE0m5CU0FGeX2WLOc+xmLoDoD6rVKDgjqc5wl9TRAHbQ2/5KFNoqOE+6H62h8eZR5
         QS7J2Mscyp7mfckEQhESyaSzamC6Jb4zdShQJxIdRpzJ1t4wCLE6u8ZlIgJG1yWZnxW5
         hK42KNMKiFexyllVQ4ebylFtuH6y+iPKT1la8TtbpcIhL/Ur8kIuiOhosIvWY97zqXHF
         SHborT7RAC+n3k3ujK1dDK/+uoHlBFq1kv5dCe6DXld1ANqsWa3mpYkZc00iEbzQoQE0
         1Kl6k1443trDwPJyAe1RxA6w8dB9+43S7UiB472gsr2iSrE95rZYWGTqMymB8eQu107R
         jxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ayswml3Gys9+89Da5+RrDn+F9xiVZqaGFJX2IFU9YtM=;
        b=MNJbljTOX54mTkecHZy5ln7EMPqJUmiXmHqdZuCoIFVuryqUJh7KMDCiaAIbCFhu4a
         cyeSQSxbjDVyMQAgq2mW46OLZI6YFPNPmf9Q6a0HyhiV1Z1Eoo5XIGREkbpslUwtXQ25
         hGXqGg65gNqWhRfN5hBxWfjJMVVr/6K1YUZ1q9hnEFqbvAHjlZO3pyjRlma0THPMBiqP
         p5VALP2PoSDGC5AXJmuhvoIu0J9OAUhuHzrzq58HkyWxmnhyq8UbXueXc80bX4d9YTP0
         5RUVN8k57kuZ4Un2CV6+It9+yAgYt2FwPupHZV9zYHkYYj82PYDiDdQ16SyB78X6sqBs
         CCRA==
X-Gm-Message-State: ACrzQf2uE3ul65LR/xU1CQg7JJGwZxXBxYLMXi2ajapN6t2OuAvcBYcQ
        WClIE/av6uSK+R+6VTJUkXRWMQ==
X-Google-Smtp-Source: AMsMyM7cOTd18BIq7PWF/NmSoMPAJ9RI/Ti81FsjDNkl4dVjmwDnXlZP+WZk//iAnp9PWs1DqxaDuQ==
X-Received: by 2002:a2e:bc0b:0:b0:277:5059:82c8 with SMTP id b11-20020a2ebc0b000000b00277505982c8mr8065930ljf.315.1668003561979;
        Wed, 09 Nov 2022 06:19:21 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id f14-20020ac2508e000000b0049478cc4eb9sm2240843lfm.230.2022.11.09.06.19.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Nov 2022 06:19:21 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: add QCOM SM6375 display clock bindings
Date:   Wed,  9 Nov 2022 15:18:51 +0100
Message-Id: <20221109141855.52628-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add device tree bindings for display clock controller for
Qualcomm Technology Inc's SM6375 SoC.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../bindings/clock/qcom,sm6375-dispcc.yaml    | 68 +++++++++++++++++++
 .../dt-bindings/clock/qcom,sm6375-dispcc.h    | 42 ++++++++++++
 2 files changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6375-dispcc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,sm6375-dispcc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm6375-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm6375-dispcc.yaml
new file mode 100644
index 000000000000..4f905f0bc1d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm6375-dispcc.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm6375-dispcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display Clock & Reset Controller Binding for SM6375
+
+maintainers:
+  - Konrad Dybcio <konrad.dybcio@linaro.org>
+
+description: |
+  Qualcomm display clock control module which supports the clocks, resets and
+  power domains on SM6375.
+
+  See also:
+  - dt-bindings/clock/qcom,dispcc-sm6375.h
+
+properties:
+  compatible:
+    const: qcom,sm6375-dispcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: GPLL0 source from GCC
+      - description: Byte clock from DSI PHY
+      - description: Pixel clock from DSI PHY
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
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sm6375-gcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    clock-controller@5f00000 {
+      compatible = "qcom,sm6375-dispcc";
+      reg = <0x05f00000 0x20000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&gcc GCC_DISP_GPLL0_CLK_SRC>,
+               <&dsi_phy 0>,
+               <&dsi_phy 1>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,sm6375-dispcc.h b/include/dt-bindings/clock/qcom,sm6375-dispcc.h
new file mode 100644
index 000000000000..b1de14677a61
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm6375-dispcc.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022, Linaro Limited
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_SM6375_H
+#define _DT_BINDINGS_CLK_QCOM_DISP_CC_SM6375_H
+
+/* Clocks */
+#define DISP_CC_PLL0					0
+#define DISP_CC_MDSS_AHB_CLK				1
+#define DISP_CC_MDSS_AHB_CLK_SRC			2
+#define DISP_CC_MDSS_BYTE0_CLK				3
+#define DISP_CC_MDSS_BYTE0_CLK_SRC			4
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC			5
+#define DISP_CC_MDSS_BYTE0_INTF_CLK			6
+#define DISP_CC_MDSS_ESC0_CLK				7
+#define DISP_CC_MDSS_ESC0_CLK_SRC			8
+#define DISP_CC_MDSS_MDP_CLK				9
+#define DISP_CC_MDSS_MDP_CLK_SRC			10
+#define DISP_CC_MDSS_MDP_LUT_CLK			11
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK			12
+#define DISP_CC_MDSS_PCLK0_CLK				13
+#define DISP_CC_MDSS_PCLK0_CLK_SRC			14
+#define DISP_CC_MDSS_ROT_CLK				15
+#define DISP_CC_MDSS_ROT_CLK_SRC			16
+#define DISP_CC_MDSS_RSCC_AHB_CLK			17
+#define DISP_CC_MDSS_RSCC_VSYNC_CLK			18
+#define DISP_CC_MDSS_VSYNC_CLK				19
+#define DISP_CC_MDSS_VSYNC_CLK_SRC			20
+#define DISP_CC_SLEEP_CLK				21
+#define DISP_CC_XO_CLK					22
+
+/* Resets */
+#define DISP_CC_MDSS_CORE_BCR				0
+#define DISP_CC_MDSS_RSCC_BCR				1
+
+/* GDSCs */
+#define MDSS_GDSC					0
+
+#endif
-- 
2.38.1

