Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0BA14939E
	for <linux-clk@vger.kernel.org>; Fri, 23 Feb 2024 21:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708723313; cv=none; b=gaRIl+ibWc9N+k+ekm/1DK8WThn7dlW1wBLBfIRQd/gxXifT2/6Y5qdsh/inM+VLKMqsnArymprXx6R2wC5Og9+quzQxy4Xj1lQTZUT8JCsJiORb008TJfub7cEnWeH/bc877UlYli6nmsUMMFpGTNDVBDgZyAfRVIcjWGITV/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708723313; c=relaxed/simple;
	bh=TD3RQaihe9OKVWs8qpYMDEq2XvyP0NvvRJn3/71HkaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W7JpPo8WKb84cx2pEabW/wqWxVxLxmogMAwoOrgeBT0NaTZwlS6W5gW1O3BYzHUQhrAgBxSyKGUcNZRXKYrlozn5MSTfXnGZ9BhsyuX9pomkHiCL2TmUOSikzUp6i2oKdFPyIpb6Cayl5hsb1gC1iotGbELlZmCyjEL8nmUR/Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zjwmKWFZ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zjwmKWFZ"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-512bde3d197so731728e87.0
        for <linux-clk@vger.kernel.org>; Fri, 23 Feb 2024 13:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708723309; x=1709328109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r99mvuJiDsoC0lpdfEAhnBLtsa9rGGaDHQ3a8z2c+0U=;
        b=zjwmKWFZYF3ZlH5Dv9xL5xrmlnx3nTOijKJMF/L93k35thuK2/sTu9zHr73258WSW4
         elhncnCrqzS/KEdWN4m/C08KoY1hSzyFVeGBHqjlpS1eusbV4x9N0WTmhT1gJWJzA6xt
         SuxdHgCr9n6bgSEcw2mo0+kn/JrQpa78WaSn4qiOCdQYaNkzUzfD+aK4HlUzmDtKDvfS
         Dzf+AXKfisiK0vyieCReOBkuvA1uMv9l3A1b6cFjIuefwuNopOtPIH7GPLbRzkv679i4
         /DR4kE2AwlRie94OAS8gU4KlvfdJlf/OaoMEhr9p6v/DPf0Cpaj+ScHcJLT5PawvLM4+
         igtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708723309; x=1709328109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r99mvuJiDsoC0lpdfEAhnBLtsa9rGGaDHQ3a8z2c+0U=;
        b=ACxRurJ/5LCxwlaczTS0pjkBUq6aqVnfj0T5+wdFYGS7nrgHn0KjMeGQU6M+dSFxFr
         pPqWrK3nDr7Gjp8dBSHuhEepNfypYphLQvEj5Jq5PAKY0XJDMdP4iNhLiTWDUeNxKNWw
         cw/y7y9YThfOoXizih/B8sqSXaRA2wFFjhSwGgN3od3qKqjCBl3foVfNuWMzRjg977o+
         icqAvGupTZ4AhqWrIbN8vKq1Xq4hCl0y2D500xN/6a807W4YKEOL4EUfpii1/v4y7J1E
         GxDaILcxtuXSYuTn6gO1BhYkbgd9oHCbtsr7w3UWl2qbqWX3XoKMa6UP+hMaxYMICSjF
         3/jA==
X-Forwarded-Encrypted: i=1; AJvYcCX0++VO1Ir0VnzXRBTVDmUdn3IbfKA5hSuYtpkkomjepXSSgj2+PASSI7MSNgT4+FqKDvPSZgpUS1lEawZ7H8SM0hSdmz67pTmL
X-Gm-Message-State: AOJu0Yw8uFGndKLUchUj1ZN7xJkIVxuy51hx/yvqWeP59tvjFS2P3bl8
	Mvq0YXzfe5sO7xWIaSjw62mBjaa+PjBf3tOdTP74VUNyyLIsIMtRzqHKmwikwFI=
X-Google-Smtp-Source: AGHT+IELdA1bUwEa+c8/S0rmMd8PoumYeVPi636atrNquWFAriHuXDu7VxUzRwDqMxnrBN67jwtDSg==
X-Received: by 2002:a05:6512:3ba6:b0:511:a477:64aa with SMTP id g38-20020a0565123ba600b00511a47764aamr722334lfv.51.1708723309340;
        Fri, 23 Feb 2024 13:21:49 -0800 (PST)
Received: from [10.167.154.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id mj8-20020a170906af8800b00a3ee9305b02sm4091226ejb.20.2024.02.23.13.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 13:21:48 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 23 Feb 2024 22:21:37 +0100
Subject: [PATCH v2 1/7] dt-bindings: clock: Add Qcom QCM2290 GPUCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240219-topic-rb1_gpu-v2-1-2d3d6a0db040@linaro.org>
References: <20240219-topic-rb1_gpu-v2-0-2d3d6a0db040@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v2-0-2d3d6a0db040@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708723303; l=3863;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=TD3RQaihe9OKVWs8qpYMDEq2XvyP0NvvRJn3/71HkaI=;
 b=THh58TXS5b7Ou1TwCROF//MgNMlT6FsI5lTk4UJtZ/Pi2sFOuMnLxgdkbIVi1O+k8x0fDZ+GU
 omov3OszX17BKaNFKuGJ/NQ1R9BKggx4DpbUNtwUgGicsdkzOK05MhK
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Add device tree bindings for graphics clock controller for Qualcomm
Technology Inc's QCM2290 SoCs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../bindings/clock/qcom,qcm2290-gpucc.yaml         | 77 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,qcm2290-gpucc.h     | 32 +++++++++
 2 files changed, 109 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
new file mode 100644
index 000000000000..734880805c1b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,qcm2290-gpucc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics Clock & Reset Controller on QCM2290
+
+maintainers:
+  - Konrad Dybcio <konradybcio@kernel.org>
+
+description: |
+  Qualcomm graphics clock control module provides the clocks, resets and power
+  domains on Qualcomm SoCs.
+
+  See also::
+    include/dt-bindings/clock/qcom,qcm2290-gpucc.h
+
+properties:
+  compatible:
+    const: qcom,qcm2290-gpucc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AHB interface clock,
+      - description: SoC CXO clock
+      - description: GPLL0 main branch source
+      - description: GPLL0 div branch source
+
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the CX power domain.
+    maxItems: 1
+
+  required-opps:
+    description:
+      A phandle to an OPP node describing required CX performance point.
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - power-domains
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@5990000 {
+            compatible = "qcom,qcm2290-gpucc";
+            reg = <0x0 0x05990000 0x0 0x9000>;
+            clocks = <&gcc GCC_GPU_CFG_AHB_CLK>,
+                     <&rpmcc RPM_SMD_XO_CLK_SRC>,
+                     <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+                     <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+            power-domains = <&rpmpd QCM2290_VDDCX>;
+            required-opps = <&rpmpd_opp_low_svs>;
+            #clock-cells = <1>;
+            #reset-cells = <1>;
+            #power-domain-cells = <1>;
+        };
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,qcm2290-gpucc.h b/include/dt-bindings/clock/qcom,qcm2290-gpucc.h
new file mode 100644
index 000000000000..7c76dd05278f
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,qcm2290-gpucc.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024, Linaro Limited
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_QCM2290_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_QCM2290_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK			0
+#define GPU_CC_CRC_AHB_CLK		1
+#define GPU_CC_CX_GFX3D_CLK		2
+#define GPU_CC_CX_GMU_CLK		3
+#define GPU_CC_CX_SNOC_DVM_CLK		4
+#define GPU_CC_CXO_AON_CLK		5
+#define GPU_CC_CXO_CLK			6
+#define GPU_CC_GMU_CLK_SRC		7
+#define GPU_CC_GX_GFX3D_CLK		8
+#define GPU_CC_GX_GFX3D_CLK_SRC		9
+#define GPU_CC_PLL0			10
+#define GPU_CC_SLEEP_CLK		11
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK	12
+
+/* Resets */
+#define GPU_GX_BCR			0
+
+/* GDSCs */
+#define GPU_CX_GDSC			0
+#define GPU_GX_GDSC			1
+
+#endif

-- 
2.43.2

