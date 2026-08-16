Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ED43D9680
	for <linux-clk@vger.kernel.org>; Sun, 16 Aug 2026 08:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786868909; cv=none; b=oLjR75ObEOOow/zyOK4h4EmATDIlrr1ONg1CJHdDiP6a/xsMq1FrYWcthddf2TnoLYPAYy0yfaqKOsNa+gVHSd17G87IkIJFrQG4cMGETWLUentzoaJte8DSn05RsUr7e8TRDmC5ssKx31fNIdg2qo08cgpvPdYKDifU4GLSo4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786868909; c=relaxed/simple;
	bh=7eoeAnLleGJDi9iZrpFJSVDSWOmv6UZ9H1LLn/MNAJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QlXqqNa8CYFU7+YZe/9apTM/8jz1d8hT8bIZvTjtM52Rp1RpGmRbFBREU1kwdwafIFFOBWfT/py6R85zsLNultvRIe3JoDw0ez0s2VV2+1RuH6Gv+JKp1KVlS+uXgzCfyxQagev0ttW3RmPMoEy3dEyQjXrhTvXkw3BaPWN9o9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=di4toUZJ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="di4toUZJ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d53197d8b5so16841915ad.3
        for <linux-clk@vger.kernel.org>; Sun, 16 Aug 2026 01:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786868906; x=1787473706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2yMpTq5unBuhd4yogW49pPfsKAXAauMNz+Dz1FC3v6c=;
        b=di4toUZJbG6JPkBj5dd+d33vFCPSlw7m9TNnRmgd0tv0LZWqVUTQ7oqq93ZHBHY9Xe
         3/h955gbKHErIhAzq6z+v+gZwLrh34oM4jDtKEarwIeq0lkZwNCqgb8ohRKRsIfcbpxo
         i8PSSIZi6n9V+Je9YxQM4SaJBL+YZSI+uwnBdeMASieT+o8PmdSpUF3ociivlvm2fjlI
         qT6Zk8uuP8vY/mhQpMbp09C4GsnXDLDyUfLQwc1vsjyQqS5dbTnqkPxdnT+vfH2yYnRm
         tRJSR7+TA2urBOpj8vy/UdJpwop3rIYmV4VrjT8LbDDhC6EJNE8GYkCdgK6+dXmm6G5a
         M9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786868906; x=1787473706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2yMpTq5unBuhd4yogW49pPfsKAXAauMNz+Dz1FC3v6c=;
        b=e1xl5F7RasSk3wmVmbTJ0NPo9v3OYAdOsnIzIj3h4rjFy61vJDx0enAz7OyMoEWnn9
         hWdxSJaiQs2lAS0aWLFILvUYfXv+ceRQzMrS8qPn+aImw7yUrUCJYBO1l5khYyJ6WF8r
         oIceVxI5gkqfTg4GyoF6u/SGbKAuvzfmzBnxO0vj8rHISMeXV1DrLdj4KcDdbiUsIjPD
         +GZBIpAHOWPGd57tcA47zzDsxXid+4DmndYMkkoN1YaWiKzKDVSO5/qHQi/9liRUf4JO
         wRxCVVlA5g9ZIIlX2UkCzgKsIqCrt/+BRDPGQ+IXcXFFOte6CzRRoQA6uvyITTwYkVL3
         op+Q==
X-Forwarded-Encrypted: i=1; AHgh+RrMLUXsjtuHNW0CdXX0Juwvg01pjbq5Id6ykT7ZyDCsRNxXqetO7+e+SQHIoRCGsarFk/JNtwkjhA8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqdg4uYQJGdhRM0Zuv27hUasiAtnihjUqyydFnYNH30RTktNPk
	53rSWpiA22yH2Rx1mVmar21NkjgJtMYjSMuecudFvlFauUR5AiipJg3U
X-Gm-Gg: AR+sD12/fxp4onfWotMfZTj3WvuxD46EtFK0uWge73hMFnnrHQWX1OGB45oBvcyl3BH
	CxzkkCKkldLGks5awyZsrNrD0Q7hq3113EVFPouj5l6+dTrrDJ+FcPrBLwU6wGFoC5tZJNeBfyG
	btwKyy6SYbQ2GQO1Gi6OBzDocEjWarlUiOtOQY21R+7TMcW5VzjMzOs4KrTBpSdTpNlIc7Fnk5Z
	tTP1SoPmW3YJTV0UzKEaF+DHz97Ee8oJnm+30Vu3DKzb54apv3uqoC3obNE0vEuQNaft2epXAXY
	lJa5sZiojirGZLullCWTikcbgxUa7Gzuk3FlxA47OgvgPAM/h7I4BzU0EwiJpJ+Ge+7cwYcapiU
	bHU+iQPOuWTiXhIFiFNq+szTHdsFCTe08FMwm9Wly2eoeb01ZwDqZ8FS2S1LkZsTPJc0ebC4fpb
	inZqXevDGDHnS4oI47ZAQdLzPyXziiKw5qioeq5KNUBKvIGf6S7H4D61fx84Mxw/t3n42FKLg9k
	iZiwaiJ4qeLr9SDjfnsaqw=
X-Received: by 2002:a05:6a20:a106:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3cc71ac37cbmr18576509637.2.1786868906462;
        Sun, 16 Aug 2026 01:28:26 -0700 (PDT)
Received: from localhost.localdomain ([152.58.201.186])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413889bca5sm39510388c88.12.2026.08.16.01.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 01:28:25 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: bmasney@redhat.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 2/2] dt-bindings: clock: Add GCC clock bindings for SM7250
Date: Sun, 16 Aug 2026 08:28:01 +0000
Message-ID: <20260816082801.5773-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816082801.5773-1-sreeshankar0910@gmail.com>
References: <20260816082801.5773-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for global clock controller on SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 .../bindings/clock/qcom,gcc-sm7250.yaml       |  60 +++++++
 include/dt-bindings/clock/qcom,gcc-sm7250.h   | 163 ++++++++++++++++++
 2 files changed, 223 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm7250.yaml
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm7250.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm7250.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm7250.yaml
new file mode 100644
index 000000000..822df7dc1
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm7250.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-sm7250.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on SM7250
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Sreeshankar K <sreeshankar0910@gmail.com>
+
+description: |
+  Qualcomm global clock control module provides the clocks, resets and power
+  domains on SM7250.
+
+  See also: include/dt-bindings/clock/qcom,gcc-sm7250.h
+
+properties:
+  compatible:
+    const: qcom,gcc-sm7250
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board active XO source
+      - description: Sleep clock source
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+      - const: bi_tcxo_ao
+      - const: sleep_clk
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@100000 {
+      compatible = "qcom,gcc-sm7250";
+      reg = <0x00100000 0x1f0000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>,
+               <&sleep_clk>;
+      clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,gcc-sm7250.h b/include/dt-bindings/clock/qcom,gcc-sm7250.h
new file mode 100644
index 000000000..f50a13173
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gcc-sm7250.h
@@ -0,0 +1,163 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
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
+#define GCC_UFS_PHY_ICE_CORE_CLK				101
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC				102
+#define GCC_UFS_PHY_PHY_AUX_CLK					103
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC				104
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK				105
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK				106
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK				107
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK				108
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC				109
+#define GCC_USB30_PRIM_MASTER_CLK				110
+#define GCC_USB30_PRIM_MASTER_CLK_SRC				111
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK				112
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			113
+#define GCC_USB30_PRIM_SLEEP_CLK				114
+#define GCC_USB3_PRIM_CLKREF_CLK				115
+#define GCC_USB3_PRIM_PHY_AUX_CLK				116
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				117
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				118
+#define GCC_USB3_PRIM_PHY_PIPE_CLK				119
+#define GCC_VIDEO_AHB_CLK					120
+#define GCC_VIDEO_AXI_CLK					121
+#define GCC_VIDEO_XO_CLK					122
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

