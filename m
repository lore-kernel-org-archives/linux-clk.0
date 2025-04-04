Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8ADC1F4607
	for <linux-clk@vger.kernel.org>; Fri,  4 Apr 2025 11:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743767830; cv=none; b=mksyQIaAFbTJscg/sGnOPWQWIqFlYatMPG1b9Yhf0Udaoa10vyAjhU3Qf8FwuerIGJyq0/VD8eoH2mnHqi9975dN7gjXvNgrLLnBtnd1UZ76cjy79T4KDkDRWUpGl2yybtRWGMwknwy8+/dDMTQYLmRZrj+HR2kRUJ7I0Fjv6qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743767830; c=relaxed/simple;
	bh=uxxC2+rJC3Z2VSNCxxoKI1uj53Ey55YFQVhXgUJlMmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iIHxJyhPJs7sm1qZvdHKgMMcN/9pGxOYmnb2R4pOromYqvHu9QmhXJNfnxabG/CgDHIJeqg56j2lVnBqi2zPxo7hab0oYpSJqumzX/uJtbAUm0pfA3hITHTT8rE1S5dFTwYe4o5yy9BTaVoe8nomcsLS4mso/Mdqef9HBs51dCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KE0oJY8K; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KE0oJY8K"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cee550af2so1880855e9.1
        for <linux-clk@vger.kernel.org>; Fri, 04 Apr 2025 04:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767827; x=1744372627; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dWTh0iUxbFDZj1OSxB2YpSs0Atj06C+ykZmPKxNCsxA=;
        b=KE0oJY8Ko+uG4iv2WCdHr2Gz0AO0ftR+YrN9X6gnkJ7tXit85VfVvhiNuD1WFHrlfq
         52rIIqZAdJnQay9rnheQspL4GTZXqJUpdG99JD7W9xLjySHrEaU35VhZ0aQJVRtZC5M/
         Xu2sg4mZoCo8SvJZzWqGRxioi0VlR/8jMh4tVziF44PyPb/UaJYaMRHCOptkTMUaaTkb
         l2B8MPHz0LLVcr3JiHlvqsaICvZv8sey3QKN3IwetYnofuIeWV1+Bc3+R0gyCdwI+RCN
         Remnt121HcJztRmineUjJ/aPC9vAc9h3YUm6e7/zMSPVgpiIjqth5zmLm8P1mojfXBIy
         WPJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767827; x=1744372627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWTh0iUxbFDZj1OSxB2YpSs0Atj06C+ykZmPKxNCsxA=;
        b=EZENXEGQIejIdyKc7DCWOIMvctFxm3IXs4Weeqcri9oGjub2t0l5rypiIItJEiZTGS
         NvdletdlGvG4CfkEWSCZpIhY90Ga86+S1JGSGfbB+ABxhrW3xKp5XLyf2IT/2qczxThA
         XiNkj9fySfY33hVgtzD3KdymX62Qs9fDmGk/vwszG624BW6+sPde7D7Dr0xxYnJzgWVW
         wqLTsQ0USKwLWrJDVsNsmzPhLSTexR1KfzqGlZI5QOx8uumzEPXMbGlDbfD8gqz2+C8N
         bVBRTHwgoFKvXDE5TKlo8Z3HzAWI3Lq1buNd/cwOYbLRmb+Ns6JEoNA+C2gSxspuEvhJ
         4HIw==
X-Forwarded-Encrypted: i=1; AJvYcCVWHwgwMI/u8vhYV+kS+RaX/b6+hTDgKRZF3gZY9xVYF17Q59Lmed8uDaCK7hw03Emxzs0D5+61sx8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG1/25555kvqKdQuPve5PSAIg87H+kGjI1DuIDGUgL+ppan+vh
	ycNE79CGBjIg5ZMlhew5mpqe8c8bioShCgXTLIrABDSD8h5Ueee8rzK54/f2tPE=
X-Gm-Gg: ASbGncss7V2EAmelGECjy5kNYkOpYEMdDEup0Pyp/2juyzZpyCbronopxDMc32DU5Cx
	DLM+/AnvI3GJtT2yjITcQiRmL2KPDMrxx0p59dS3B9ttO3VPuo91dw0a+RMQ94GceH5e6pcjko3
	sMAbuFDcKijQTV0HLlC50W9MkL5LIxMHKoXUPb4KXl25qM0Q6SHLmuDS8rn5IBic+kGEmmG6VmT
	Q1ttyVAzPUYE9okWxmpD3Ho3dmdP1W1pScoIOtzUc1fIyYasgaLIqkZ2t4dvtH+Boedao7W+nuf
	owzaCgLV0P2565+iU/ndVutQGTJuO56pFT1OfzAoD/rpXHxI1d44OS+kMOxNjYI=
X-Google-Smtp-Source: AGHT+IHHD7HuendpPytpQj7rstsIi+Mc3ng61xMnf8Qu66Hus393p51dcdiyAL39bcJzERvr8KKSjw==
X-Received: by 2002:a05:600c:848d:b0:439:a3df:66f3 with SMTP id 5b1f17b1804b1-43ecfa18ba7mr9352835e9.6.1743767827420;
        Fri, 04 Apr 2025 04:57:07 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364cb9asm43842815e9.31.2025.04.04.04.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:57:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 04 Apr 2025 13:57:00 +0200
Subject: [PATCH 4/5] clk: sunxi-ng: Do not enable by default during compile
 testing
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-kconfig-defaults-clk-v1-4-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
In-Reply-To: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Enabling the compile test should not cause automatic enabling of all
drivers.  Restrict the default to ARCH also for individual drivers, even
though their choice is not visible without selecting parent Kconfig
symbol, because otherwise selecting parent would select the child during
compile testing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/sunxi-ng/Kconfig | 48 ++++++++++++++++++++++----------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
index 5830a9d87bf25d536ac787fe83669c64c8214952..8896fd052ef1784d60d488ab1498737c1405deb2 100644
--- a/drivers/clk/sunxi-ng/Kconfig
+++ b/drivers/clk/sunxi-ng/Kconfig
@@ -9,123 +9,123 @@ if SUNXI_CCU
 
 config SUNIV_F1C100S_CCU
 	tristate "Support for the Allwinner newer F1C100s CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUNIV || COMPILE_TEST
 
 config SUN20I_D1_CCU
 	tristate "Support for the Allwinner D1/R528/T113 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || RISCV || COMPILE_TEST
 
 config SUN20I_D1_R_CCU
 	tristate "Support for the Allwinner D1/R528/T113 PRCM CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || RISCV || COMPILE_TEST
 
 config SUN50I_A64_CCU
 	tristate "Support for the Allwinner A64 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_A100_CCU
 	tristate "Support for the Allwinner A100 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_A100_R_CCU
 	tristate "Support for the Allwinner A100 PRCM CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_H6_CCU
 	tristate "Support for the Allwinner H6 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_H616_CCU
 	tristate "Support for the Allwinner H616 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_H6_R_CCU
 	tristate "Support for the Allwinner H6 and H616 PRCM CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN55I_A523_CCU
 	tristate "Support for the Allwinner A523/T527 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN55I_A523_R_CCU
 	tristate "Support for the Allwinner A523/T527 PRCM CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN4I_A10_CCU
 	tristate "Support for the Allwinner A10/A20 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN4I || MACH_SUN7I || COMPILE_TEST
 
 config SUN5I_CCU
 	bool "Support for the Allwinner sun5i family CCM"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN5I || COMPILE_TEST
 	depends on SUNXI_CCU=y
 
 config SUN6I_A31_CCU
 	tristate "Support for the Allwinner A31/A31s CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN6I || COMPILE_TEST
 
 config SUN6I_RTC_CCU
 	tristate "Support for the Allwinner H616/R329 RTC CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || ARM64 || RISCV || COMPILE_TEST
 
 config SUN8I_A23_CCU
 	tristate "Support for the Allwinner A23 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || COMPILE_TEST
 
 config SUN8I_A33_CCU
 	tristate "Support for the Allwinner A33 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || COMPILE_TEST
 
 config SUN8I_A83T_CCU
 	tristate "Support for the Allwinner A83T CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || COMPILE_TEST
 
 config SUN8I_H3_CCU
 	tristate "Support for the Allwinner H3 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || ARM64 || COMPILE_TEST
 
 config SUN8I_V3S_CCU
 	tristate "Support for the Allwinner V3s CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || COMPILE_TEST
 
 config SUN8I_DE2_CCU
 	tristate "Support for the Allwinner SoCs DE2 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || ARM64 || RISCV || COMPILE_TEST
 
 config SUN8I_R40_CCU
 	tristate "Support for the Allwinner R40 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || COMPILE_TEST
 
 config SUN9I_A80_CCU
 	tristate "Support for the Allwinner A80 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN9I || COMPILE_TEST
 
 config SUN8I_R_CCU
 	tristate "Support for Allwinner SoCs' PRCM CCUs"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || ARM64 || COMPILE_TEST
 
 endif

-- 
2.45.2

