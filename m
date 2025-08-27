Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD0535085E
	for <linux-clk@vger.kernel.org>; Wed, 27 Aug 2025 12:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756298544; cv=none; b=m1hsYjMqp7l1POovFCzmy5vPsYQglaU5WSAvuYoe8Rt+jTa+B3foBU3otDFT/EJjbCQqld/xxHrCx8eo4iRu7aZ7zrTm/5/FdJTQz87rpl8oyigFZFss6bQNAU8ABRJRSafAZ/2DhcSzSituG+AUzvJbjQ8J/8ks0vzeklku5mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756298544; c=relaxed/simple;
	bh=FUVnP6N7cHQr47dLL4bin/JIRmBbPwyaNW8naNR4SC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vDIaJP4jPxY90JRprJQYEnvT3fS2ofid0eNSKlYDkVwPJQvYDBtWs7CcQkpfOrqU6jX8AYtHWcnbJ9QeeGgKBGeNZkb8VI+ALfYGFJcDW1zF8mb8f6sU93GDQWb878T72ihZlRQYdvPLnnp0uHn2YatFwhtxbodLpY9cJPt+iVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d0n9PSEf; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d0n9PSEf"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3c854b644c1so2569829f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 27 Aug 2025 05:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756298540; x=1756903340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/mZvV9kb0orEkNWMjrJAyvdt/44HABaPUU1+rYsimU=;
        b=d0n9PSEf1iLKn/iLkzzmaAeP2ilekJfZZo3zx8KE9J1GKnmDmLuxn/wtdzSZNYjvK5
         UH+WyFysw1B1+N8pH8Eh+BQCX3qbvjmRYBIOivzyUHdq1mtaHL87suD1MY07Se6bnonQ
         x/Cyf7PC5s55D4/C+g0efqLrzz925C6LsOnJGhAHfjenD4s8s6YiBz5YPJt/+zWdQi9y
         WQKfetJviK/ARGtWi9Pkn3zGzbE9LDVUQABfu09vL9+pfVs1wxNJrXpFTzwAhMc+Dl2c
         kfyhBFPdB0nih99EYc0cZztAv7Ok6vmS01a3wGBvYXTE6esfGQQZB6uD9avFZmx0wxCs
         Ipqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756298540; x=1756903340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/mZvV9kb0orEkNWMjrJAyvdt/44HABaPUU1+rYsimU=;
        b=rrKqoGcJkFUSpPubMw/KYI+mBMtd6EC3xlAQaHeEin8hQ4hxrvjEl9C4E816PlvsCX
         2a5Q7ja8MIXc/fFS5FKoTCOX5DPzHpLVcI+TZFVR4vSoOn+UQweevahNqMRkQKj+/IJe
         sRt2nunJAcy4P2/ZBKWN9/GTFasg4Y7Ej6xDaG53cEEwCV2MIu8PRZ0/p4PveoyzEq84
         iv/va7gDlEooQv1btoy7ltdr2rKDjjt6UncpcAaJ9R4Yk+PtpilunPFB5TCpXRHb0X0P
         Ger8ejQYRB1NbEumi97h/fYuD9NqSRMHezzP2lR9kxv9UYYg1GY6hfeloMFfqOeNTReh
         FP7A==
X-Forwarded-Encrypted: i=1; AJvYcCVIMBP2gNANbKW4y6+mEh3/c+Z9nkedpKgSz89eN2C0AkOJ6x+CQLjVL1hLaZzv+3zByTJ5aVL4/4k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq5dkroiyxqx5bwOpxVRBI1CYeQzhFgsrFjg+2Ih6w6AUZmALg
	Xluy4ASrETqrsY6W9AgZWjUYAJvwciZi+4S79F1ko4KHfFkTE3vrmNXN4i6GH1PDKIs=
X-Gm-Gg: ASbGncv0tUWvL4nvUdM8v1yHqlyez/vOereLUtbmh4WXQxgWxkJD94oUzMXmcWCrui+
	JCsMqjXQ29Q3wVlmz6iw6KcHOMQd+GWiq8ue0ZIWP53Aj7bPb4R1sw/EGLejKlxj/Nagnx3Ihdi
	G6C1opxp5LMKUe7d56OKSCLl/3G7Jzt5ZOdU6S3dyi+TMoKK8ksw4cvr4iIDON15BqMxvhqevAY
	/KF28wWjS3l/OWIv3ABEvuHteA7by9Vk2ffLFOIvJjbcu0e7g2YgMNW28hiVD6MvELxPOTEyjNi
	TX9tpVkt1UPyxjRsAy9z/VMMvSIA5j9du3+FWLpVHH4n2d7WnUjxXOel1oYw+h/92eIHmIgRWwN
	b9BnLFfrtO/iXc8/Q0b9jYvF5SkjP/3y0DfKSHF0UY79+Oceu/UUm/wA2JWT/kfL7GfO+PWQYW5
	H9IQ==
X-Google-Smtp-Source: AGHT+IHDaXwaFMJ9SMq4opGoNcipuyVIDBjCdJ6Q67OG3cP6PVryX0OdauanSBAD0FIphu46Ph59Og==
X-Received: by 2002:a05:6000:26c7:b0:3ca:368b:b816 with SMTP id ffacd0b85a97d-3ca368bb8d4mr6810396f8f.62.1756298539689;
        Wed, 27 Aug 2025 05:42:19 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cbab3ead0dsm6439420f8f.29.2025.08.27.05.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 05:42:19 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 27 Aug 2025 12:42:15 +0000
Subject: [PATCH v2 5/5] arm64: defconfig: enable Exynos ACPM clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-acpm-clk-v2-5-de5c86b49b64@linaro.org>
References: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
In-Reply-To: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756298535; l=820;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=FUVnP6N7cHQr47dLL4bin/JIRmBbPwyaNW8naNR4SC8=;
 b=vr4YUS7k2uOJpKSWAUY/kzAsaucmPj03Ajnab4gJvYwF+6XrFjwzDMIGkG2H/vJmrLX4DqF85
 Z56PRG77k/rBpCAlx0bGdbJTtH91a+wz1P3HRfiu3UXboI+aGKI2hkH
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Enable the Exynos ACPM clocks driver. Samsung Exynos platforms
implement ACPM to provide support for clock configuration, PMIC
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366cd12ae212a1d107660afe8be6c5ef..4255bc885545fb3bb7e9cf02760cac35bf2872fa 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1445,6 +1445,7 @@ CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_SM_VIDEOCC_8450=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_EXYNOS_ACPM_CLK=m
 CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_OMAP=m

-- 
2.51.0.261.g7ce5a0a67e-goog

