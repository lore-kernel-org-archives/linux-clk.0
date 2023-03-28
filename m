Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78292C77B6C
	for <linux-clk@archiver.kernel.org>; Tue, 28 Mar 2023 19:36:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjC1Tgq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Mar 2023 15:36:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjC1Tgp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Mar 2023 15:36:45 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26F6710F9
        for <linux-clk@vger.kernel.org>; Tue, 28 Mar 2023 12:36:43 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id v20-20020a05600c471400b003ed8826253aso1301205wmo.0
        for <linux-clk@vger.kernel.org>; Tue, 28 Mar 2023 12:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1680032201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fz5lcSDpF7J02lC5C/+yg9eF6HsVD3HRWyB+OFxgdJs=;
        b=pXEpgibP9p3ABJt6Vkv481tXwtfDAEvMM0sFIWQF8Umsnsr5bwRnyP08xtVGXtjuSg
         +Bs8bMncyFdXfaE5mf0nR09vDVakWSFmrqpuxzykekA0lASc8POVN9tDL9aheKJ1Uso7
         TtVzbkDK0q8Lm6ioPcvnbY7oHI3s5RQSFC2brP/3lCTUXtRzHFVuYc1CmDXWRIVgHmtz
         pBGLE8SjFsuAqHH0oLau96BCqs80JoRPmD+So1yviZdXClqu3jwp/uxLHXTjFp8jHgia
         WsLTvBqoDifWUAX9KC3yKtZiHbsSmmKNHuMmDhajwEnkSSQw2KXCnAgUfTOhU3DseeXr
         aTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680032201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fz5lcSDpF7J02lC5C/+yg9eF6HsVD3HRWyB+OFxgdJs=;
        b=h+OwDvZrOGZDl4p0l9jZT8u/pQjxrsY0zxVnHjS68g+9J30DV66J8/IofL/61t3o2+
         WrmWYEfeEfHSbJ081UI8zl9xHEgBoS71fLNH/8HnSE0c4squ2uGliAsJrR9ygUYH3SwN
         KgLu5cOUsYBNDNO6fjUpM8oxi2jRDzYQpiN+lPaH0cts37xI+TW1l7oIKyooS1WnHQq8
         WhWyFFmE+s5RcIML9TNlT8naKSrqwG3x5mVpMVk2n0q+xyBo80F/yWdNwyuBBMDkTsz7
         tWX9+wOP9I9UN5/N7Cna+6gCc69EYAV75vPwpprSXEDvIwENHU49DBOkcxW6o8lNAyUI
         Pagw==
X-Gm-Message-State: AO0yUKXQuYB2lSTK3OJr/10sSQ5SdQYPQ33sTnZ/rTbfovw0jH+IPMGv
        KLklznfwxPHGudzah5mHLZN6cw==
X-Google-Smtp-Source: AK7set/KEtHcAP0x18meQ5Z73P09YQZCecKX+CajuqbeanRgxp1cXfr76S6U49+7lOOKJXbWwwSefg==
X-Received: by 2002:a05:600c:2118:b0:3eb:39e0:3530 with SMTP id u24-20020a05600c211800b003eb39e03530mr12166851wml.41.1680032201623;
        Tue, 28 Mar 2023 12:36:41 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7b39:552d:b2f1:d7e8])
        by smtp.gmail.com with ESMTPSA id g23-20020a7bc4d7000000b003eb5ce1b734sm18060544wmk.7.2023.03.28.12.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 12:36:41 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH 1/7] dt-bindings: clock: qcom: describe the GPUCC clock for SA8775P
Date:   Tue, 28 Mar 2023 21:36:26 +0200
Message-Id: <20230328193632.226095-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230328193632.226095-1-brgl@bgdev.pl>
References: <20230328193632.226095-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add bindings for the Qualcomm Graphics Clock control module present on
sa8775p platforms.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../bindings/clock/qcom,sa8775p-gpucc.yaml    | 61 +++++++++++++++++++
 .../dt-bindings/clock/qcom,sa8775p-gpucc.h    | 50 +++++++++++++++
 2 files changed, 111 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sa8775p-gpucc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,sa8775p-gpucc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-gpucc.yaml
new file mode 100644
index 000000000000..203802f81738
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sa8775p-gpucc.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sa8775p-gpucc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics Clock & Reset Controller on SA8775P
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+description: |
+  Qualcomm graphics clock control module provides clocks, resets and power
+  domains on Qualcomm SoCs.
+
+  See also:: include/dt-bindings/clock/qcom,sa8775p-gpucc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,sa8775p-gpucc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: GPLL0 main branch source
+      - description: GPLL0 div branch source
+      - description: SNoC DVM GFX source
+
+required:
+  - compatible
+  - clocks
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@3d90000 {
+            compatible = "qcom,sa8775p-gpucc";
+            reg = <0x0 0x03d90000 0x0 0xa000>;
+            clocks = <&gcc GCC_GPU_CFG_AHB_CLK>,
+                     <&rpmhcc RPMH_CXO_CLK>,
+                     <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+                     <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+            #clock-cells = <1>;
+            #reset-cells = <1>;
+            #power-domain-cells = <1>;
+        };
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,sa8775p-gpucc.h b/include/dt-bindings/clock/qcom,sa8775p-gpucc.h
new file mode 100644
index 000000000000..a5fd784b1ea2
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sa8775p-gpucc.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2022, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPUCC_SA8775P_H
+#define _DT_BINDINGS_CLK_QCOM_GPUCC_SA8775P_H
+
+/* GPU_CC clocks */
+#define GPU_CC_PLL0				0
+#define GPU_CC_PLL1				1
+#define GPU_CC_AHB_CLK				2
+#define GPU_CC_CB_CLK				3
+#define GPU_CC_CRC_AHB_CLK			4
+#define GPU_CC_CX_FF_CLK			5
+#define GPU_CC_CX_GMU_CLK			6
+#define GPU_CC_CX_SNOC_DVM_CLK			7
+#define GPU_CC_CXO_AON_CLK			8
+#define GPU_CC_CXO_CLK				9
+#define GPU_CC_DEMET_CLK			10
+#define GPU_CC_DEMET_DIV_CLK_SRC		11
+#define GPU_CC_FF_CLK_SRC			12
+#define GPU_CC_GMU_CLK_SRC			13
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK		14
+#define GPU_CC_HUB_AHB_DIV_CLK_SRC		15
+#define GPU_CC_HUB_AON_CLK			16
+#define GPU_CC_HUB_CLK_SRC			17
+#define GPU_CC_HUB_CX_INT_CLK			18
+#define GPU_CC_HUB_CX_INT_DIV_CLK_SRC		19
+#define GPU_CC_MEMNOC_GFX_CLK			20
+#define GPU_CC_SLEEP_CLK			21
+#define GPU_CC_XO_CLK_SRC			22
+
+/* GPU_CC resets */
+#define GPUCC_GPU_CC_ACD_BCR			0
+#define GPUCC_GPU_CC_CB_BCR			1
+#define GPUCC_GPU_CC_CX_BCR			2
+#define GPUCC_GPU_CC_FAST_HUB_BCR		3
+#define GPUCC_GPU_CC_FF_BCR			4
+#define GPUCC_GPU_CC_GFX3D_AON_BCR		5
+#define GPUCC_GPU_CC_GMU_BCR			6
+#define GPUCC_GPU_CC_GX_BCR			7
+#define GPUCC_GPU_CC_XO_BCR			8
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC				0
+#define GPU_CC_GX_GDSC				1
+
+#endif /* _DT_BINDINGS_CLK_QCOM_GPUCC_SA8775P_H */
-- 
2.37.2

