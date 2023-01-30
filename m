Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EDB7C636D3
	for <linux-clk@archiver.kernel.org>; Mon, 30 Jan 2023 15:33:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237190AbjA3PdP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 30 Jan 2023 10:33:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236432AbjA3PdN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 30 Jan 2023 10:33:13 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECFA23D0BE
        for <linux-clk@vger.kernel.org>; Mon, 30 Jan 2023 07:33:10 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id p26so21623501ejx.13
        for <linux-clk@vger.kernel.org>; Mon, 30 Jan 2023 07:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIBTHdMpJGj1YCjdQaodZetEO+nkmZdzZbbwqCGyEGM=;
        b=A29o/c5r086DH6T0OW7hZKhQP2tstypbmwm5lL7Aykly0tstb/giuKS2rJtm4RBtw6
         LnCBV0KefbIAQps+qOpsO7aDYDeK+x4vV4XaX4T8Ax2idrC3dPhIanvHmVWi8T//O/4/
         ZNbUeEfOv7ROAeDSp1NOkRaoNyl9NbDkXe3cAhQaHcdY57UZXY7lGg+LXnyVdU7uioE0
         iecT9bgIsp2fpWrhDu1MFLsQNfkMn6fZLPt3tMfYy1qDGiTKL9/vCWd8TRRWxnjzxB8m
         bpvlAXkwASxksPvse0OUIqIjm6VG3CWjQCn/VNRYYa/wo3LKYlw7w4Z0ibZzfts74Cvc
         Qfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIBTHdMpJGj1YCjdQaodZetEO+nkmZdzZbbwqCGyEGM=;
        b=cr/jS2jqjHRHoYSWc1oWeL2ulF2zy/AS5NvTJkDBSOfSVJauF8afOcf7UD63rf2BUb
         tsk6wyp8jctvUC5Kw5IcQPWnS2tz2rD0xayyzClQ3tP5J8PPq+6GMmtCCCWXLsQPIy4q
         jBvIjWJ4fjpV00DVwzHxz/QEo99E3GlGT3Y8yZpyA3jnOv0hEGOqPwgkmjyim5HO/WFw
         XQDH52rxuZ6Q0tpEy0kxU2Q4SVI7cw/ltRmttmYo9Ptr+wIq80HBu9N8Q2pFERNVzI+2
         lINhVYjQsbm+0ZKnImllP5N4TqT2EfBKH7q5QnlMf1oSh95HDICzhlD8jb3sAu1x+6fn
         H4Vg==
X-Gm-Message-State: AO0yUKVxmfi2X7Vy2w/yDMZzt1Obk9KCmA6gm3grk6Sl20bgbpW3OmO/
        fHE47JUlxwq2irawlqugWXjVDA==
X-Google-Smtp-Source: AK7set+enu/02rrlVse3Ho3Yo5U7L+3CdvygfxO4W2i8vDptBU0UB18eyCP0SINUsbsCcub/4HrEIQ==
X-Received: by 2002:a17:907:6da0:b0:878:58e6:f1eb with SMTP id sb32-20020a1709076da000b0087858e6f1ebmr20264075ejc.23.1675092789331;
        Mon, 30 Jan 2023 07:33:09 -0800 (PST)
Received: from localhost.localdomain (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id k7-20020a170906054700b00878769f1e6bsm6805773eja.55.2023.01.30.07.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 07:33:08 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/8] dt-bindings: clock: Add Qcom SM6125 GPUCC
Date:   Mon, 30 Jan 2023 16:32:47 +0100
Message-Id: <20230130153252.2310882-4-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130153252.2310882-1-konrad.dybcio@linaro.org>
References: <20230130153252.2310882-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add device tree bindings for graphics clock controller for Qualcomm
Technology Inc's SM6125 SoCs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v2 -> v3:

- Pick up tags

 .../bindings/clock/qcom,sm6125-gpucc.yaml     | 64 +++++++++++++++++++
 include/dt-bindings/clock/qcom,sm6125-gpucc.h | 31 +++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6125-gpucc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,sm6125-gpucc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm6125-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm6125-gpucc.yaml
new file mode 100644
index 000000000000..374a1844a159
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm6125-gpucc.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm6125-gpucc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics Clock & Reset Controller on SM6125
+
+maintainers:
+  - Konrad Dybcio <konrad.dybcio@linaro.org>
+
+description: |
+  Qualcomm graphics clock control module provides clocks and power domains on
+  Qualcomm SoCs.
+
+  See also:: include/dt-bindings/clock/qcom,sm6125-gpucc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm6125-gpucc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: GPLL0 main branch source
+
+  '#clock-cells':
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
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sm6125.h>
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+
+    soc {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        clock-controller@5990000 {
+            compatible = "qcom,sm6125-gpucc";
+            reg = <0x05990000 0x9000>;
+            clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+                     <&gcc GCC_GPU_GPLL0_CLK_SRC>;
+            #clock-cells = <1>;
+            #power-domain-cells = <1>;
+        };
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,sm6125-gpucc.h b/include/dt-bindings/clock/qcom,sm6125-gpucc.h
new file mode 100644
index 000000000000..ce5bd920f2c4
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm6125-gpucc.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_SM6125_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_SM6125_H
+
+/* Clocks */
+#define GPU_CC_PLL0_OUT_AUX2			0
+#define GPU_CC_PLL1_OUT_AUX2			1
+#define GPU_CC_CRC_AHB_CLK			2
+#define GPU_CC_CX_APB_CLK			3
+#define GPU_CC_CX_GFX3D_CLK			4
+#define GPU_CC_CX_GMU_CLK			5
+#define GPU_CC_CX_SNOC_DVM_CLK			6
+#define GPU_CC_CXO_AON_CLK			7
+#define GPU_CC_CXO_CLK				8
+#define GPU_CC_GMU_CLK_SRC			9
+#define GPU_CC_SLEEP_CLK			10
+#define GPU_CC_GX_GFX3D_CLK			11
+#define GPU_CC_GX_GFX3D_CLK_SRC			12
+#define GPU_CC_AHB_CLK				13
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK		14
+
+/* GDSCs */
+#define GPU_CX_GDSC				0
+#define GPU_GX_GDSC				1
+
+#endif
-- 
2.39.1

