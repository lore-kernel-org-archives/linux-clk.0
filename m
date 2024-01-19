Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9376A4E1AC
	for <linux-clk@vger.kernel.org>; Fri, 19 Jan 2024 11:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705662719; cv=none; b=bgtcM6X85wzmxSlVsMSNjk0ClHVDxDgr4eE80YBlqpog4j0dKkizo/fZAeGjN6dqFVNucU+vLaTa/6qie6sdxO7svxlegAIsp/OScrBUi/ZJ1AOsR6wdJsLrj6uDanNwhTbqS6Ww2FUVkkDprxRaoLcrniPYtDoxOhlxkHhpS7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705662719; c=relaxed/simple;
	bh=yWuIqf8vUZzSTKlBz8yW9cLKwGqjFtk+CU+CFxiivvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EFcI5KcMKWF17fu/tJWJWCnH3wAbyq7q8BfwgAy/BE6uV6xJLN8iVgm6Te8F+Plr1uZqq81eJsQsN8CWZOElPWigwv8E6qG0koO7qbFq5TRqCMbAc0DilKQl83wMCcZYSA//UxhVSPFV1UA+Cuya1yrW5jrrAErFd/MdlCJiMSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gtb5rWs6; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gtb5rWs6"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40e7065b7bdso6860375e9.3
        for <linux-clk@vger.kernel.org>; Fri, 19 Jan 2024 03:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705662716; x=1706267516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgotcyv6wBhXLN6V7LbPKLDpi2/3Hoq5LfRbcHxmUHc=;
        b=Gtb5rWs6uJafhrua5kNsli0lkX7+ukNaJ3GTyhMzmcG4bBY7+a4GGX2UNESnK20D7P
         BRluODrBMyIaEED9RUkeCkxmBWxBx+eyod9nyx8NjLNeCwEYh4OXpVFHL2Rm2vSQ0UbY
         aUH+qBqafEFmV4Lp+fGUYRJ2OT+idCezfB8NxGqWPUciM8B7oR/6q4Sr/AV9ibN7s1jJ
         p3EcItSIxdfsC0V0rNK+Xum+gC1BSwOSDkKTUP3Lk2sX/zhuLJlowoxIb9rw8bQX3VPb
         jcRk1CqaF7WcCqT6tPYcwimeHVpFxj9O78gqwXv4C8zM11380z9YmaeF9Prqrz9eGx9G
         ShRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705662716; x=1706267516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgotcyv6wBhXLN6V7LbPKLDpi2/3Hoq5LfRbcHxmUHc=;
        b=rgxVUXrvWrZZW8kqedNBM7TRM7nck2ZdLoc42x01li0rWYA4f79jKW7zC2luGjr4vk
         NykbzIji8EBJWvkfqeJW75v5VOVn2TGGlFy2zPAEydQBb6Xa1si2yM8gRG90q93HPb0P
         xJqnyGJZB6qBx1+J5Q1yDAOeb5hIc4He/WqqUBVC8QtWUquZOVT+ilZM8j3rBiv1Oqjf
         5zPAZOTgir9KA9a5SxGoUfFimuVzgaF8X9lPeX5Mj8FzFsxQanj43bTu/32tAFcqfxI7
         IUXQ7E8eRV43YzZV6puNVOxoZxpVribz8IEBuyUgmeLjXv9ukJWQkAb6DdlTjKHM3H9N
         5c+w==
X-Gm-Message-State: AOJu0Yx2I6xZhQbV1h1TuaxoEdvS46FgC3QAIx/cN3teDy/gANRa6u0I
	0EJZpQ6H2JjhwOR3//GrSXJ53bsIT15iTKGSBwSghvMxLValK1EyYebOocOQ6PA=
X-Google-Smtp-Source: AGHT+IFOpbihLWfMf2GioHDTZHU+LDQAEWF13vJ2V013dnNsxpZseCv/sWgDjN14DXvTqQqv3RW4Kg==
X-Received: by 2002:a05:600c:2184:b0:40e:50e7:daf1 with SMTP id e4-20020a05600c218400b0040e50e7daf1mr897840wme.263.1705662715986;
        Fri, 19 Jan 2024 03:11:55 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id o10-20020a5d62ca000000b00337d4ce6ab4sm3341868wrv.20.2024.01.19.03.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:11:55 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: andi.shyti@kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	willmcvicker@google.com,
	kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 7/8] arm64: dts: exynos: gs101: define USI8 with I2C configuration
Date: Fri, 19 Jan 2024 11:11:31 +0000
Message-ID: <20240119111132.1290455-8-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240119111132.1290455-1-tudor.ambarus@linaro.org>
References: <20240119111132.1290455-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

USI8 I2C is used to communicate with an eeprom found on the battery
connector. Define USI8 in I2C configuration.

USI8 CONFIG register comes with a 0x0 reset value, meaning that USI8
doesn't have a default protocol (I2C, SPI, UART) at reset. Thus the
selection of the protocol is intentionally left for the board dts file.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 29 ++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 6aa25cc4676e..f14a24628d04 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -352,6 +352,35 @@ pinctrl_peric0: pinctrl@10840000 {
 			interrupts = <GIC_SPI 625 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 
+		usi8: usi@109700c0 {
+			compatible = "google,gs101-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109700c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x101c>;
+			status = "disabled";
+
+			hsi2c_8: i2c@10970000 {
+				compatible = "google,gs101-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10970000 0xc0>;
+				interrupts = <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c8_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				status = "disabled";
+			};
+		};
+
 		usi_uart: usi@10a000c0 {
 			compatible = "google,gs101-usi",
 				     "samsung,exynos850-usi";
-- 
2.43.0.429.g432eaa2c6b-goog

