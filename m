Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23A81DB92A
	for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 22:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769575; cv=none; b=SaPt2FMkSZ2ykdAGS3FrtbWLHTp/lq9j8ZXfTUzHKypCz8PVijFrNKJz0CMtPaTg6oD0J9B22a6LNnmEcTRMBf3X+lphSj39MDvmtsIxeAlVh7QxnnOqIiO78pT5vR2v9rhH4io1Zbb/CsiOa5cOqCPBEf3jWk3frzafJZS/buQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769575; c=relaxed/simple;
	bh=vhmwcNLdq/vAk/57/nIwHgfUXmRE5veIwzqtkTfIDCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DmJxh0hhoLFt+dYyV3S1jeYkvIsIejCbdjpq4MPs95/ORUUONqCWuG86T5G+gRmEt4rUp6SWDvPnJt9WgszkSK5FU+pNumFi5eaqdttpmOraInrEKB8P8Ttc/Iz2DWOup++t8slqwfpTSKcjBr46vLIkDcS/3NbLRl/71PlNQ6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=evgXH92t; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="evgXH92t"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so499754566b.1
        for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 15:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769570; x=1743374370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPaIY3x3VVrMkB4/G8kk/a/tWB9/OjPG56rBALdlvrQ=;
        b=evgXH92tqHyJLaExNh4ZZ8xmGgq54s0dUHli9+RWyVVeMQgxKwBPqgNUNz0NTbUKmt
         X4nhCb8UtjXIROlwBJrVveHFIKsHis4G5uEl1/7Acxh9QIiC6kQX7TJiZgX0p5diHZOV
         iJL0kLCMz5v5paf4P1xrwduIoXzK5eIpNYZDwQQsG4nCsRR8mZu8XLdMOUbz9SgpNut/
         sX90rblFd5gfW4jk0iinBQPRvGGsXH3u1AhRjMA331+a8JdABeHlrzOy7Mj+BV69FpGy
         47Az53jUg/1QoF2F+L0D+n+DDFucYPdV8DShGzY0JJiw203ZlWQQsZ6Z1sXAN6JjEx3r
         w/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769570; x=1743374370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UPaIY3x3VVrMkB4/G8kk/a/tWB9/OjPG56rBALdlvrQ=;
        b=XcaX9VxHDfi0BB3dagGokyu9/7NSc0uZwE94kcoI/NBgdqDkp3p6yKn2m+9HpNPh9P
         9Z1/oucDtk7W/p6l7l8psK/Xtr8hyhJqV8rtS4gKrGJy05KVSP5//wxvEv25OPZ+yJEk
         mVmL+SsHMMntj6sdzZZjxOFOieei6qNKdpXoOTxyPMITqI9Oym5JA9L/KQ5oxXJxfJwR
         OgA5ICq2qlC+uDZhGrxtlIh6S186RrWItdlNOS+5INPVJyGMYA/qSdW4mgd96ZSHImAM
         5lcpDNhKqwQicP+pFzUqS1detWXLeieIWVUotnRIsaWWSfGvSX5GPqnRkJXoUlTPUT1y
         Icbg==
X-Forwarded-Encrypted: i=1; AJvYcCXyejtu3RgzRdDhARo7A0SvlnAPCsS0Hn9yudEgG7mTAxnr3XqTZsA+ZX5WWKjs+dqB4O0Q5/buupM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7594VZCALEhVPfRKEPRoMuYyZ5JR8RS2FuLHxI7YFX8ZQZfea
	/0pecUNHjp5J1zd6T1ho0WWLCvoQauRWk5StPjc8XcUDXtLLgt0ojd0i08lxFQA=
X-Gm-Gg: ASbGncvqdIDx/2ruH7qFIAZT++ZXenJZQr6ledPIJ+H9/zUEVH4N96JRcpksbBkGgI0
	RHzqtKd14e+gGCDfZgy0Dtp6jcyZLIeMl0VTiKGFc6YoRMDzINovDr11MhMysHpH7IG/SNF2oBY
	VKfFqYaJgsp9n8F1RrcYFYY+7egxxTwuIdAL/6l53vb0VzRWeY9Qe8WbUijEKKMJAocujq1v2M8
	Yec0l/HfTKxIvy/LVV9jPGC1hqRY0p3UXxzr4B5oo0tyioUP2Sg6epgPH0NhZEgUemod82zji6S
	1FIOxgEXep6mrE4TCRG4Eo/f9+FXbYfTwutcy8mcFseSXSIGo4mccDtU8/fChg+p9Kbk5eFuRte
	JVWsGEq8CH5ZufdBPVcUAhwHe7p/C
X-Google-Smtp-Source: AGHT+IFPXn5kuydsVZ5juxiG+97RkmMKn/3aV6ozY9UpbUvRFJV9i4K4wAS7EARyuWbOU8je237GtQ==
X-Received: by 2002:a17:907:7293:b0:abf:fb78:673a with SMTP id a640c23a62f3a-ac3f22b0fb0mr895769166b.29.1742769569876;
        Sun, 23 Mar 2025 15:39:29 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:29 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:27 +0000
Subject: [PATCH 11/34] defconfigs: rename CONFIG_MFD_SEC_CORE to
 CONFIG_MFD_SEC_I2C
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-11-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

We are adding support for Samsung PMICs that aren't using I2C and
therefore had to rename the Kconfig symbol.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm/configs/exynos_defconfig   | 2 +-
 arch/arm/configs/multi_v7_defconfig | 2 +-
 arch/arm/configs/pxa_defconfig      | 2 +-
 arch/arm64/configs/defconfig        | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 7ad48fdda1dac69a4a9612eabb573729bed7b3a6..251f45be6c14af59263373f21b27b15f42ec7f61 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -167,7 +167,7 @@ CONFIG_MFD_MAX77686=y
 CONFIG_MFD_MAX77693=y
 CONFIG_MFD_MAX8997=y
 CONFIG_MFD_MAX8998=y
-CONFIG_MFD_SEC_CORE=y
+CONFIG_MFD_SEC_I2C=y
 CONFIG_MFD_STMPE=y
 CONFIG_STMPE_I2C=y
 CONFIG_MFD_TPS65090=y
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index ad037c175fdb0ec8601c9b3607aca0c0e5f3c145..7d06ac5369b1a2f325462f2cf5b54fe22061ca77 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -612,7 +612,7 @@ CONFIG_MFD_QCOM_RPM=y
 CONFIG_MFD_SPMI_PMIC=y
 CONFIG_MFD_RK8XX_I2C=y
 CONFIG_MFD_RN5T618=y
-CONFIG_MFD_SEC_CORE=y
+CONFIG_MFD_SEC_I2C=y
 CONFIG_MFD_STMPE=y
 CONFIG_MFD_PALMAS=y
 CONFIG_MFD_TPS65090=y
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index de0ac8f521d7612704ce327e9ac16ab9e999f3d3..064e79baf20da809c9ab1f1fa18282aaba11a41f 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -335,7 +335,7 @@ CONFIG_MFD_MAX77693=y
 CONFIG_MFD_MAX8907=m
 CONFIG_EZX_PCAP=y
 CONFIG_UCB1400_CORE=m
-CONFIG_MFD_SEC_CORE=y
+CONFIG_MFD_SEC_I2C=y
 CONFIG_MFD_PALMAS=y
 CONFIG_MFD_TPS65090=y
 CONFIG_MFD_TPS6586X=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e8dfbe22db68d9aa24df5af0786a2eeb8f33bf3c..cc4dc330cfe82d11ca0c4c9ba8cac4b14decdeab 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -769,7 +769,7 @@ CONFIG_MFD_MT6397=y
 CONFIG_MFD_SPMI_PMIC=y
 CONFIG_MFD_RK8XX_I2C=y
 CONFIG_MFD_RK8XX_SPI=y
-CONFIG_MFD_SEC_CORE=y
+CONFIG_MFD_SEC_I2C=y
 CONFIG_MFD_SL28CPLD=y
 CONFIG_RZ_MTU3=y
 CONFIG_MFD_TI_AM335X_TSCADC=m

-- 
2.49.0.395.g12beb8f557-goog

