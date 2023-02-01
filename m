Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A21C63797
	for <linux-clk@archiver.kernel.org>; Wed,  1 Feb 2023 18:37:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232090AbjBAShW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Feb 2023 13:37:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232094AbjBAShU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Feb 2023 13:37:20 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0533C80012
        for <linux-clk@vger.kernel.org>; Wed,  1 Feb 2023 10:36:47 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id v10so18640535edi.8
        for <linux-clk@vger.kernel.org>; Wed, 01 Feb 2023 10:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGnNtC4Awi0nUMpoeI3htL1/o9C3zMSo8k9y9gT/K8g=;
        b=Jj0uDyoSYSc2BG3cMNXHfjyAOBmIv/eEYOsj/Msz/PnGphWpGJ/t3f6aRZ9Q7DDiLH
         UqKzqnkDFLuh+OaemZGHyYvIlDCLls/Yrwr/1ihkecOxLxY4E0zd4MLRP5MEbiApWnKt
         z0qiawxyqghQSqB9TMJEtoYE+CXZc7jYZUpFym58yrQvc0tOMXh4C3r7JRZ2e1wPbDAe
         7b3r9IpT3NDdRSOCd20w2UJHpP4X1AvMBpAO/PaDigoYcOQfjTsOHJ55XbhVP06vHaV5
         s/TaIPvFhHMOKtlKKMsuJeId5b4uIIikubJHZLLLSw+D5Ml4WNZRHtDJTZoIga3IDe5P
         4IaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGnNtC4Awi0nUMpoeI3htL1/o9C3zMSo8k9y9gT/K8g=;
        b=am3mSHe7zlyyN6hqy4gYXozBx9Sqq9NwUxJOjNebMM++e8IHkLSMfaBqWLzV1NjS8d
         1iFMrMLtplU5wqjDs+8sr4vzkwEZBGNtFmv+iXMxHDyfrnNWpZqmIy+ur6/gVND5pbL3
         60/hw94kGa3ogjgyi1vQMRJS1U/vup1jzQd3I5Gfa1CMRnb8hgBuvlPAIM+AYtL0/iaQ
         zKzYreILY9HSt8MWlm2zxP01u0Umq73zQ18QbJrBvopRlab53CsGpdBz7SWHFqqBy1hK
         EFtt9mwh+Pb5sIMsUOlnXWA1uFDLkmFgUk7kT45+XsQ1FftzxNPPzpy96huUcwwtcm9c
         TmcA==
X-Gm-Message-State: AO0yUKXZ3Fa4NGB1wkURaj6DdpZvc69UxFDyQcRmVhwmJaN1nzXPJN1z
        EQgIMF1ZA7uw7r8zmj3gKHWBug==
X-Google-Smtp-Source: AK7set+FU15vjgJJQfGO499QbgtRoVzoW7swVQmcRwWOdIskzBSUlwSqoXQwGWZvQ+VYCIn4lQ4zNg==
X-Received: by 2002:a05:6402:40d3:b0:4a2:4269:6dff with SMTP id z19-20020a05640240d300b004a242696dffmr3605518edb.21.1675276599470;
        Wed, 01 Feb 2023 10:36:39 -0800 (PST)
Received: from localhost.localdomain (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id t13-20020a50d70d000000b00458b41d9460sm10297508edi.92.2023.02.01.10.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 10:36:39 -0800 (PST)
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
Subject: [PATCH v5 05/10] dt-bindings: clock: Add Qcom SM6125 GPUCC
Date:   Wed,  1 Feb 2023 19:36:21 +0100
Message-Id: <20230201183626.351211-6-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201183626.351211-1-konrad.dybcio@linaro.org>
References: <20230201183626.351211-1-konrad.dybcio@linaro.org>
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
v4 -> v5:

No changes

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

