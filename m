Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B703D3D969E
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 05:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792041624; cv=none; b=s75hYOTDrHfiSEaFuWPh8zRASLuZD5nCy/nm+qplIIyzRVEYcX7ir8XZ+QXcTK5DZW2JO9CzgFYGmCWww3Wf55yQHgPy4NyGz0eOUYaMAtcEX925MhKJE+p/dBeH8eunTmebkAMn2J1clS06jUWd6QOy1QLutHHHesTRWJ+0vNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792041624; c=relaxed/simple;
	bh=Bq3BrCpS1saoaC9pcAkXW7h9tZPSIsy5t6QHJNoUVJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cbvzZoFFtqdE3X/uIGM4GOU/1h32TQXSsfglOdyM8qsgHoCAww8luARq6x0irGNJm2PftAkJxDYJUHhzP5oRGKWVcQdauqPlsa00wQzhxDsvqSiVVL4IPHOToTOgvnHMjLs/XiIOuRCBzPSZZlqM7yMOKbHoIwY+YnT1qzmVZLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eW50PlJs; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eW50PlJs"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35b2c599f43so181404eec.0
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 22:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792041622; x=1792646422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qD+DMp9zjCP5w6OLu0TvOshn0oVo8G5wz9l77nkHkMo=;
        b=eW50PlJsJZ3aMF5g7aWYG3eVA0Q1dEFjgOQ2CLBZ9x7Z1FEwJ+SsbD1oxdUlGrIcTL
         ImPpnXaw8UqgwBxLHdW97PZJokZDX2OeIzBNJbrFGhVR0a4vXBOMgBnIqRi8U0eaHhdn
         eMEmE/3xXz5V+FBrAXQoaiwrI+JhxgGEVEQMNJpoFS7rHwj5F0b5eqDf6gvQoHzmMP2J
         FtqT3BPEFfLSmmMcdRNrQEctxqfMt2BdHcn3akEr8yQi+Vz2uZu2ed131PQAufBw+eGf
         uHIkvcGIPloZUP2yjVoDI2zUd4yCXktivZLp70T64AIzoy3QiV+Y6e7ZDGpbzxYcub8Y
         3tRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792041622; x=1792646422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qD+DMp9zjCP5w6OLu0TvOshn0oVo8G5wz9l77nkHkMo=;
        b=sf0g+UzHPcCUSM8X0e8MZIAO+4sxSZjT5ac51XHI9MzK73MiqFK5T+ZrSBQFBCc6oz
         tS7QulRVa6iTglp/71SHyGYB9g8dMyGLbq68SHvR0iP0Ng9GzI7qm4YeXl0w6uaKskRm
         sIgRfHQ+N68sxZzkL2D5clML4oaY41xYHiKrK9xrXZRoEmtdcVhohli45HeEnEszpIVd
         7vuMLlbFAEFW4LyERI1gVT7tXiVChUZpn/sEnEZzS3DlKw36MHcPvHJMeGfnNnxiWo9N
         amLeBl8Bqn7EeOsisbe8yDBUmaSx1t1iTKRb2zW1C49nb2j/Pmg3q/94w7VdR7mZ6d7x
         RD4Q==
X-Forwarded-Encrypted: i=1; AKwUvByznmCyXCWsHWspjx6k7wA7M9pj05D4ZgKVJMrwu1KeFt4Km6wNlioAsAF4MXZpeYYf4HcfM2l58nE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgdnTX4M5lhBgWgv+JNv/3Kagqz33G5dX6k3JMP0iBTvO4+Oem
	9h0/gCdgGWzzrYvpP216v7vkh0rhVTisTsyxuoQxL/rKUkV/wy2BwDvk
X-Gm-Gg: AYBFou1R1JKjY89JyDqdY6fwQdx9Dq+Avw92fCC1oMSkcdciXPsq46TlS17KZXYfNPp
	OgOrsKGaDuw8EUze9XFqw0sgI4+NFtWef3Vg9kTb7/w9MzKXpZ7PY6tVeZLBr2lIKi3M+u2pbLR
	8xVHoxfsurhFn9CfuofAOSlDI+Kx83OWU2XRwkJqNJwws4eJHhb/CGKY7vWYcpmvGK59rWkG5rC
	Z8Azy3XUp7PEipJ+ACWfIi/ffDvwbXY4fnnOec4kLg+jotYmyihgGejkIhKEC+aHUk6UCep32it
	R2okVw6g6Aa6LUvpCyhcCZy2RU39dW2ZblP+nmUVOpQl/ySpXLkjVbUfsgYx/BepTk0IvUsH//n
	2N3ETidnpFtjW8vbdEzrSBd2a2udsbx8NcYvOOeSX/vVqkttYSqR4rEdlXTogsNIbF5yHM7TGeR
	pcSqT2eV2wg4s9CUP1BmaF8w7dh3aWnKdf97VXeJ5WZjKg+36Yrq1rhrUgZomCF18j4APEnMCsz
	3n7SwRea66cMOXXLjp8kDvdOA5/NYbsTTsCbrtmplhoNs3WOIEUEp8=
X-Received: by 2002:a05:7301:9f0e:b0:353:417e:aad3 with SMTP id 5a478bee46e88-3537e069fa1mr33231288eec.33.1792041621658;
        Wed, 14 Oct 2026 22:20:21 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35de709d928sm12923112eec.25.2026.10.14.22.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:20:21 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v10 1/6] dt-bindings: clock: Add SM7250 global clock controller
Date: Thu, 15 Oct 2026 05:19:21 +0000
Message-ID: <20261015051926.13752-2-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015051926.13752-1-sreeshankar0910@gmail.com>
References: <20261015051926.13752-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for global clock controller on SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm6375-gcc.yaml       |   4 +-
 include/dt-bindings/clock/qcom,sm7250-gcc.h   | 167 ++++++++++++++++++
 2 files changed, 170 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/clock/qcom,sm7250-gcc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
index b4ad2ad14..39a2d2839 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
@@ -4,13 +4,14 @@
 $id: http://devicetree.org/schemas/clock/qcom,sm6375-gcc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Global Clock & Reset Controller on SM6375 and SM7150
+title: Qualcomm Global Clock & Reset Controller on SM6375, SM7150 and SM7250
 
 maintainers:
   - Konrad Dybcio <konradybcio@kernel.org>
   - Bjorn Andersson <andersson@kernel.org>
   - Danila Tikhonov <danila@jiaxyga.com>
   - David Wronek <davidwronek@gmail.com>
+  - Sreeshankar K <sreeshankar0910@gmail.com>
 
 description: |
   Qualcomm global clock control module provides the clocks, resets and power
@@ -26,6 +27,7 @@ properties:
     enum:
       - qcom,sm6375-gcc
       - qcom,sm7150-gcc
+      - qcom,sm7250-gcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,sm7250-gcc.h b/include/dt-bindings/clock/qcom,sm7250-gcc.h
new file mode 100644
index 000000000..6550c34ce
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm7250-gcc.h
@@ -0,0 +1,167 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2026, Sreeshankar K <sreeshankar0910@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SM7250_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_SM7250_H
+
+/* GCC clocks */
+#define GPLL0							0
+#define GPLL0_OUT_EVEN						1
+#define GPLL6							2
+#define GPLL9							3
+#define GCC_AGGRE_UFS_PHY_AXI_CLK				4
+#define GCC_AGGRE_USB3_PRIM_AXI_CLK				5
+#define GCC_BOOT_ROM_AHB_CLK					6
+#define GCC_CAMERA_AHB_CLK					7
+#define GCC_CAMERA_HF_AXI_CLK					8
+#define GCC_CAMERA_SF_AXI_CLK					9
+#define GCC_CAMERA_XO_CLK					10
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				11
+#define GCC_CPUSS_AHB_CLK					12
+#define GCC_CPUSS_AHB_CLK_SRC					13
+#define GCC_CPUSS_GNOC_CLK					14
+#define GCC_CPUSS_RBCPR_CLK					15
+#define GCC_DDRSS_GPU_AXI_CLK					16
+#define GCC_DISP_GPLL0_CLK_SRC					17
+#define GCC_DISP_AHB_CLK					18
+#define GCC_DISP_HF_AXI_CLK					19
+#define GCC_DISP_SF_AXI_CLK					20
+#define GCC_DISP_XO_CLK						21
+#define GCC_GP1_CLK						22
+#define GCC_GP1_CLK_SRC						23
+#define GCC_GP2_CLK						24
+#define GCC_GP2_CLK_SRC						25
+#define GCC_GP3_CLK						26
+#define GCC_GP3_CLK_SRC						27
+#define GCC_GPU_CFG_AHB_CLK					28
+#define GCC_GPU_GPLL0_CLK_SRC					29
+#define GCC_GPU_GPLL0_DIV_CLK_SRC				30
+#define GCC_GPU_IREF_CLK					31
+#define GCC_GPU_MEMNOC_GFX_CLK					32
+#define GCC_GPU_SNOC_DVM_GFX_CLK				33
+#define GCC_NPU_AXI_CLK						34
+#define GCC_NPU_BWMON2_AXI_CLK					35
+#define GCC_NPU_BWMON_AXI_CLK					36
+#define GCC_NPU_BWMON_CFG_AHB_CLK				37
+#define GCC_NPU_CFG_AHB_CLK					38
+#define GCC_NPU_DMA_CLK						39
+#define GCC_NPU_GPLL0_CLK_SRC					40
+#define GCC_NPU_GPLL0_DIV_CLK_SRC				41
+#define GCC_PDM2_CLK						42
+#define GCC_PDM2_CLK_SRC					43
+#define GCC_PDM_AHB_CLK						44
+#define GCC_PDM_XO4_CLK						45
+#define GCC_PRNG_AHB_CLK					46
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK				47
+#define GCC_QMIP_CAMERA_RT_AHB_CLK				48
+#define GCC_QMIP_DISP_AHB_CLK					49
+#define GCC_QMIP_RT_DISP_AHB_CLK				50
+#define GCC_QMIP_VIDEO_CVP_AHB_CLK				51
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK				52
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK				53
+#define GCC_QUPV3_WRAP0_CORE_CLK				54
+#define GCC_QUPV3_WRAP0_S0_CLK					55
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC				56
+#define GCC_QUPV3_WRAP0_S1_CLK					57
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC				58
+#define GCC_QUPV3_WRAP0_S2_CLK					59
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC				60
+#define GCC_QUPV3_WRAP0_S3_CLK					61
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC				62
+#define GCC_QUPV3_WRAP0_S4_CLK					63
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC				64
+#define GCC_QUPV3_WRAP0_S5_CLK					65
+#define GCC_QUPV3_WRAP0_S5_CLK_SRC				66
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK				67
+#define GCC_QUPV3_WRAP1_CORE_CLK				68
+#define GCC_QUPV3_WRAP1_S0_CLK					69
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC				70
+#define GCC_QUPV3_WRAP1_S1_CLK					71
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC				72
+#define GCC_QUPV3_WRAP1_S2_CLK					73
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC				74
+#define GCC_QUPV3_WRAP1_S3_CLK					75
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC				76
+#define GCC_QUPV3_WRAP1_S4_CLK					77
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC				78
+#define GCC_QUPV3_WRAP1_S5_CLK					79
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC				80
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK				81
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK				82
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK				83
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK				84
+#define GCC_SDCC1_AHB_CLK					85
+#define GCC_SDCC1_APPS_CLK					86
+#define GCC_SDCC1_APPS_CLK_SRC					87
+#define GCC_SDCC1_ICE_CORE_CLK					88
+#define GCC_SDCC1_ICE_CORE_CLK_SRC				89
+#define GCC_SDCC2_AHB_CLK					90
+#define GCC_SDCC2_APPS_CLK					91
+#define GCC_SDCC2_APPS_CLK_SRC					92
+#define GCC_SDCC4_AHB_CLK					93
+#define GCC_SDCC4_APPS_CLK					94
+#define GCC_SDCC4_APPS_CLK_SRC					95
+#define GCC_SYS_NOC_CPUSS_AHB_CLK				96
+#define GCC_UFS_1X_CLKREF_CLK					97
+#define GCC_UFS_PHY_AHB_CLK					98
+#define GCC_UFS_PHY_AXI_CLK					99
+#define GCC_UFS_PHY_AXI_CLK_SRC					100
+#define GCC_UFS_PHY_AXI_HW_CTL_CLK				101
+#define GCC_UFS_PHY_ICE_CORE_CLK				102
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC				103
+#define GCC_UFS_PHY_ICE_CORE_HW_CTL_CLK				104
+#define GCC_UFS_PHY_PHY_AUX_CLK					105
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC				106
+#define GCC_UFS_PHY_PHY_AUX_HW_CTL_CLK				107
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK				108
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK				109
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK				110
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK				111
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC				112
+#define GCC_UFS_PHY_UNIPRO_CORE_HW_CTL_CLK			113
+#define GCC_USB30_PRIM_MASTER_CLK				114
+#define GCC_USB30_PRIM_MASTER_CLK_SRC				115
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK				116
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			117
+#define GCC_USB30_PRIM_SLEEP_CLK				118
+#define GCC_USB3_PRIM_CLKREF_CLK				119
+#define GCC_USB3_PRIM_PHY_AUX_CLK				120
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				121
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				122
+#define GCC_USB3_PRIM_PHY_PIPE_CLK				123
+#define GCC_VIDEO_AHB_CLK					124
+#define GCC_VIDEO_AXI_CLK					125
+#define GCC_VIDEO_XO_CLK					126
+
+/* GCC resets */
+#define GCC_DPM_BCR						0
+#define GCC_GPU_BCR						1
+#define GCC_MMSS_BCR						2
+#define GCC_NPU_BWMON_BCR					3
+#define GCC_NPU_BCR						4
+#define GCC_PDM_BCR						5
+#define GCC_PRNG_BCR						6
+#define GCC_QUPV3_WRAPPER_0_BCR					7
+#define GCC_QUPV3_WRAPPER_1_BCR					8
+#define GCC_QUSB2PHY_PRIM_BCR					9
+#define GCC_SDCC1_BCR						10
+#define GCC_SDCC2_BCR						11
+#define GCC_SDCC4_BCR						12
+#define GCC_UFS_PHY_BCR						13
+#define GCC_USB30_PRIM_BCR					14
+#define GCC_USB3_DP_PHY_PRIM_BCR				15
+#define GCC_USB3_PHY_PRIM_BCR					16
+#define GCC_USB3PHY_PHY_PRIM_BCR				17
+#define GCC_USB_PHY_CFG_AHB2PHY_BCR				18
+
+/* GCC power domains */
+#define UFS_PHY_GDSC						0
+#define USB30_PRIM_GDSC						1
+#define HLOS1_VOTE_MMNOC_MMU_TBU_HF0_GDSC			2
+#define HLOS1_VOTE_MMNOC_MMU_TBU_HF1_GDSC			3
+#define HLOS1_VOTE_MMNOC_MMU_TBU_SF0_GDSC			4
+
+#endif
-- 
2.43.0

