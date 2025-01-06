Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691861DE2A0
	for <linux-clk@vger.kernel.org>; Mon,  6 Jan 2025 13:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736171086; cv=none; b=a4r9XnM93vgi94jPi4sh1HHU6/k5vHnjhTPYYO90JLuxGqellxI5NZtAbsm2TPDzmLd66xhnGSjeK4MXhjmO4+9x98eR/GmsfwfDmXTM5RolmUD4X5aLlmedpovj0yFS1OImIHqRBX0qyfeknet517mXcG/sxoglviXK6Fwyx30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736171086; c=relaxed/simple;
	bh=ey4i06XsJ6chSmPblLF8uJUW8RLOYZRQKUh/x6yaUhM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HlZIxcF56Q53a7mF6ZsEMNW33BNAxBxFrI/OyAR8SbKsbEUk+ZbVCMxnGCRI7xMUAA3vWRNfjROltTzU6LlSscWaVe1R+XQMTSGxKkYYPtMC/+7zeCYcVzjYAEQJ/Ji0FrLgU2SOUqLmhYazXZPgOV9TBgX4SrKaoCAHx233N8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tn3DlaKd; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tn3DlaKd"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-436246b1f9bso22982265e9.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Jan 2025 05:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736171083; x=1736775883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCeVkTO7HVSj79SPR3UYJj7dWwSIuDyfyGRyxF3nOZk=;
        b=tn3DlaKdH6i7sxZfrrMfnIHvo3mg94KRjEF1KMOEWrL2oMYFjF3kBLa1OWHFuABN5h
         a9pWBv6vUIua5w5MFbZRHOocInujYseLhAAZSX4/K71oLRtjQUJFuYyatYDGlBn68sbD
         GMlhoFVwGJtkvh/Qbwj+a89EBRci8ZSvkPMB5bAui1ds9HRnO+/TMQfZ1R0mhRBunO/Q
         3zINnwRrV0yjyXKWEzkUFal8218R9P+Bum9NO5aNYcesFYhCCsV2aQABcAT3sqnNnlyN
         JmpnkNVE7AwDCifAklk0EaZOQ1bgnPzAd71G1RIiFxynwjIF5RDtWg6sYSjTVcaGEIKT
         PK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736171083; x=1736775883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCeVkTO7HVSj79SPR3UYJj7dWwSIuDyfyGRyxF3nOZk=;
        b=QNo99pBBP33/D8+OgDhzwabeUPePnVoumLY6DNgjPWlvfUVMmnCs38hhm4/Euzzk7q
         UeD2MsTP38eEPNLggEN4TsJuQl4a8M3lk71S7Y8YaD2DckhwN9RBPAcJnS1csTgQmmHd
         8BQu1DCdkN965OLtUoxZWr9Es4/Djyw1PGAOD8C5oSLqwkHqrIxzAoP2Uz7ePIgnEVFe
         cTqd6z8kxx9V5H9Jq2Zj/+3fHDg2M8fxRdsosP56qEUpDV3uGTd4OXrzcROcbNwfREEU
         Pjk6r13vvf1He4q7enX9QMKKca4fZyvlb5BKZ/jYuFToAPy4ZUZ4Gzp+eT7lwkfKx9Qs
         f7wg==
X-Forwarded-Encrypted: i=1; AJvYcCVm2SvLdYBhECrEyxVLX/7xe0ngzLKH6R3Czde2Yy30Qkv7PccfOGPzj2tFBVH8PCIusBWFvkdeuL4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrCx6T55ZxaBsPBzFCKZ4iTsY7yuih5pEH6yMbP4J2uljAEV9R
	Qmy7SmAXA0P1J/CVZjsBmzCS1YJT/fzPeUZxyU3Bd2m9rTeefRwnfDqlhrkXnSM=
X-Gm-Gg: ASbGncvc3Nx9Qu+5vOLV0gOTKClsN420Z/HsAPShiRRWbzUStbOa2wgHtDHOggv0qlM
	cGsaR+A+bl3RIoghJvL5NQvxkb3lqBMygXl/uDVolvO8abaGk4upjH0eNinkbWvCL9XScy3/E5f
	p8ikEj2u+mrSp/BKplvH7ZpK2KBwTkUaFVTY33tCgeeb0HJEmK3ByZL7wD4+43zu0Qmln/4sZ0u
	HjJViHAbGIubX0tB2Tstx+qzc3Sxh7iv1qOG30rQwdxNpYZj2G5uSPgQZZ54h4+qFJl9uy7
X-Google-Smtp-Source: AGHT+IFfng3FS+Or2CimhenZtv8taGgmbGVi9p7J736A+0Jnu5KPVn9KPItLt6Po7n7LMv6qVYjGMw==
X-Received: by 2002:a05:600c:3ba9:b0:434:f586:7535 with SMTP id 5b1f17b1804b1-4366790dcdbmr209866755e9.0.1736171082571;
        Mon, 06 Jan 2025 05:44:42 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acc02sm47383151f8f.104.2025.01.06.05.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 05:44:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 06 Jan 2025 14:44:29 +0100
Subject: [PATCH v2 1/3] dt-bindings: clock: qcom,sm8550-dispcc: Add SM8750
 DISPCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-sm8750-dispcc-v2-1-6f42beda6317@linaro.org>
References: <20250106-sm8750-dispcc-v2-0-6f42beda6317@linaro.org>
In-Reply-To: <20250106-sm8750-dispcc-v2-0-6f42beda6317@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6599;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ey4i06XsJ6chSmPblLF8uJUW8RLOYZRQKUh/x6yaUhM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBne95EB0GfXzRYpVv0ZNlD3g27bV3HYG4gMBpip
 9sv+kIDQEaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3veRAAKCRDBN2bmhouD
 1x7TEACUyVjSCdFbUkd3jMz+yeRH/K1Sm8yK12Meo8ZYLY02BkoU/CTYnu5LyVEK9t3OVuC/PnL
 IjgWxEPMbDcO6jK+fEs46I9jL1cYdcph3RIxt179VdRK7BgkiaK1ABnuTG3nwpt2Q5Rac9lhk7L
 kjsYTbcecHbDidtpBwLbb0okBfJ3q9vW6EldxUABLZUA3barh0pLr/1fJMw1TwqNoZReSdvUoxh
 mX3jrJEhUp4SxbnaVxVo6LvCX0VDoTzT3pxeEabqQRTLJ4dRGPDkM7ZY7pnJoUms+vfOKVkaeMQ
 j9acsrQ125sBjIFMdD4ZZ4V5VB4b00HyLdIgX8wS7aA3BeUwaAtHRSdHEGAffP3y2ABlBOXiRIv
 JbMKaseQGJkESeMV5SAmLAeoq6xtg1DwnQF88gMZUeeRfsp7Sbv25i3ejqL2XkCdg/o/qHkg3dQ
 h12KtW2KcPLCKeTeJrXyCh0Nv477afBNjQLiPeTlfnci5C2xIeJ9qZepc9qAjoGJ2D/bKXe80uk
 CkJWTdBAa3Ieq55n7MGQLRSSVyVk8PnEu25sxOJvsoHYamXc2HAMlkTxdBmWs1g0Y3xUFNfnLgb
 K1JrWuZ89nrcxADTlIgqZw/1nXnTiY+2sOJrMuLFd4QpY+a8tXnH6/jOtRhhflFyaKPKHpj7tI0
 KfJCHyFbqCmpu9w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add bindings for the Qualcomm SM8750 Display Clock Controller (DISPCC).
Bindings are similar to existing SM8550 and SM8650 (same clock inputs),
but the clock hierarchy is quite different and these are not compatible
devices.

The binding header was copied from downstream sources, so I retained
original copyrights.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

v2:
- Add Ack
- No changes
---
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |   4 +-
 include/dt-bindings/clock/qcom,sm8750-dispcc.h     | 112 +++++++++++++++++++++
 2 files changed, 115 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
index c57d55a9293c214c4c101902cdd9603074e2243d..30e4b46315752b93754ab2f946c684e13b06ab93 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
@@ -12,11 +12,12 @@ maintainers:
 
 description: |
   Qualcomm display clock control module provides the clocks, resets and power
-  domains on SM8550.
+  domains on SM8550, SM8650, SM8750 and few other platforms.
 
   See also:
   - include/dt-bindings/clock/qcom,sm8550-dispcc.h
   - include/dt-bindings/clock/qcom,sm8650-dispcc.h
+  - include/dt-bindings/clock/qcom,sm8750-dispcc.h
   - include/dt-bindings/clock/qcom,x1e80100-dispcc.h
 
 properties:
@@ -25,6 +26,7 @@ properties:
       - qcom,sar2130p-dispcc
       - qcom,sm8550-dispcc
       - qcom,sm8650-dispcc
+      - qcom,sm8750-dispcc
       - qcom,x1e80100-dispcc
 
   clocks:
diff --git a/include/dt-bindings/clock/qcom,sm8750-dispcc.h b/include/dt-bindings/clock/qcom,sm8750-dispcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..dafb5069c96a0c3f83c15f3c61978e138baa886c
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8750-dispcc.h
@@ -0,0 +1,112 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2022, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2024, Linaro Ltd.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_SM8750_DISP_CC_H
+#define _DT_BINDINGS_CLK_QCOM_SM8750_DISP_CC_H
+
+/* DISP_CC clocks */
+#define DISP_CC_ESYNC0_CLK					0
+#define DISP_CC_ESYNC0_CLK_SRC					1
+#define DISP_CC_ESYNC1_CLK					2
+#define DISP_CC_ESYNC1_CLK_SRC					3
+#define DISP_CC_MDSS_ACCU_SHIFT_CLK				4
+#define DISP_CC_MDSS_AHB1_CLK					5
+#define DISP_CC_MDSS_AHB_CLK					6
+#define DISP_CC_MDSS_AHB_CLK_SRC				7
+#define DISP_CC_MDSS_BYTE0_CLK					8
+#define DISP_CC_MDSS_BYTE0_CLK_SRC				9
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC				10
+#define DISP_CC_MDSS_BYTE0_INTF_CLK				11
+#define DISP_CC_MDSS_BYTE1_CLK					12
+#define DISP_CC_MDSS_BYTE1_CLK_SRC				13
+#define DISP_CC_MDSS_BYTE1_DIV_CLK_SRC				14
+#define DISP_CC_MDSS_BYTE1_INTF_CLK				15
+#define DISP_CC_MDSS_DPTX0_AUX_CLK				16
+#define DISP_CC_MDSS_DPTX0_AUX_CLK_SRC				17
+#define DISP_CC_MDSS_DPTX0_CRYPTO_CLK				18
+#define DISP_CC_MDSS_DPTX0_LINK_CLK				19
+#define DISP_CC_MDSS_DPTX0_LINK_CLK_SRC				20
+#define DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC			21
+#define DISP_CC_MDSS_DPTX0_LINK_INTF_CLK			22
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK				23
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC			24
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK				25
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC			26
+#define DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK		27
+#define DISP_CC_MDSS_DPTX1_AUX_CLK				28
+#define DISP_CC_MDSS_DPTX1_AUX_CLK_SRC				29
+#define DISP_CC_MDSS_DPTX1_CRYPTO_CLK				30
+#define DISP_CC_MDSS_DPTX1_LINK_CLK				31
+#define DISP_CC_MDSS_DPTX1_LINK_CLK_SRC				32
+#define DISP_CC_MDSS_DPTX1_LINK_DIV_CLK_SRC			33
+#define DISP_CC_MDSS_DPTX1_LINK_INTF_CLK			34
+#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK				35
+#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC			36
+#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK				37
+#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC			38
+#define DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK		39
+#define DISP_CC_MDSS_DPTX2_AUX_CLK				40
+#define DISP_CC_MDSS_DPTX2_AUX_CLK_SRC				41
+#define DISP_CC_MDSS_DPTX2_CRYPTO_CLK				42
+#define DISP_CC_MDSS_DPTX2_LINK_CLK				43
+#define DISP_CC_MDSS_DPTX2_LINK_CLK_SRC				44
+#define DISP_CC_MDSS_DPTX2_LINK_DIV_CLK_SRC			45
+#define DISP_CC_MDSS_DPTX2_LINK_INTF_CLK			46
+#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK				47
+#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC			48
+#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK				49
+#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC			50
+#define DISP_CC_MDSS_DPTX3_AUX_CLK				51
+#define DISP_CC_MDSS_DPTX3_AUX_CLK_SRC				52
+#define DISP_CC_MDSS_DPTX3_CRYPTO_CLK				53
+#define DISP_CC_MDSS_DPTX3_LINK_CLK				54
+#define DISP_CC_MDSS_DPTX3_LINK_CLK_SRC				55
+#define DISP_CC_MDSS_DPTX3_LINK_DIV_CLK_SRC			56
+#define DISP_CC_MDSS_DPTX3_LINK_INTF_CLK			57
+#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK				58
+#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC			59
+#define DISP_CC_MDSS_ESC0_CLK					60
+#define DISP_CC_MDSS_ESC0_CLK_SRC				61
+#define DISP_CC_MDSS_ESC1_CLK					62
+#define DISP_CC_MDSS_ESC1_CLK_SRC				63
+#define DISP_CC_MDSS_MDP1_CLK					64
+#define DISP_CC_MDSS_MDP_CLK					65
+#define DISP_CC_MDSS_MDP_CLK_SRC				66
+#define DISP_CC_MDSS_MDP_LUT1_CLK				67
+#define DISP_CC_MDSS_MDP_LUT_CLK				68
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK				69
+#define DISP_CC_MDSS_PCLK0_CLK					70
+#define DISP_CC_MDSS_PCLK0_CLK_SRC				71
+#define DISP_CC_MDSS_PCLK1_CLK					72
+#define DISP_CC_MDSS_PCLK1_CLK_SRC				73
+#define DISP_CC_MDSS_PCLK2_CLK					74
+#define DISP_CC_MDSS_PCLK2_CLK_SRC				75
+#define DISP_CC_MDSS_RSCC_AHB_CLK				76
+#define DISP_CC_MDSS_RSCC_VSYNC_CLK				77
+#define DISP_CC_MDSS_VSYNC1_CLK					78
+#define DISP_CC_MDSS_VSYNC_CLK					79
+#define DISP_CC_MDSS_VSYNC_CLK_SRC				80
+#define DISP_CC_OSC_CLK						81
+#define DISP_CC_OSC_CLK_SRC					82
+#define DISP_CC_PLL0						83
+#define DISP_CC_PLL1						84
+#define DISP_CC_PLL2						85
+#define DISP_CC_SLEEP_CLK					86
+#define DISP_CC_SLEEP_CLK_SRC					87
+#define DISP_CC_XO_CLK						88
+#define DISP_CC_XO_CLK_SRC					89
+
+/* DISP_CC resets */
+#define DISP_CC_MDSS_CORE_BCR					0
+#define DISP_CC_MDSS_CORE_INT2_BCR				1
+#define DISP_CC_MDSS_RSCC_BCR					2
+
+/* DISP_CC GDSCR */
+#define MDSS_GDSC						0
+#define MDSS_INT2_GDSC						1
+
+#endif

-- 
2.43.0

