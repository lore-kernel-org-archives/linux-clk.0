Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AEC1C84D9
	for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 22:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769587; cv=none; b=B/MauVDOi9g88z/xGVPnh9HpbaG1wD7KftOpk9FlWw0XOcTayGo6pPQie/117P9EpHA90o44zwduzvnvi1//owznhxwx+YJ0q14sKsK7UHq5yxU+oSiRJp64/ItrEWMw0UWZ0ZvEwJbldF2SjqUtEV0+clO+BHvm4eIyRvt8QeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769587; c=relaxed/simple;
	bh=rERroOKEbXR4iJkRjuio22Srj7PD96PEiKn+3PUcyEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VoSkQFG+OZzF+9Biqgb9xQ+BEo3ikBtoB922DoXCwW5yFW82w9oYQegGX8pY+Vs+pcsQ5XRnaIWP+VZI1hbYtaB6Eu7YbuF1V4hGSD6s5jdhu9x41jzU09YP2hPv2mmeG0W1CkdbgMVR7P+JfdqFSy96pwNYVX5N0DqjO1jsFsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aul/qAXL; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aul/qAXL"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac345bd8e13so673824666b.0
        for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 15:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769578; x=1743374378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/BfF02ZxGuJsRdlJKwmKz4A2829MjaBQR7CX37kNCLc=;
        b=aul/qAXLiqJtTrqfSAK4IAWdG06813j84+jE/YHiN2qAOyoeOf7CdKktrOGDF+6l3r
         OJA2GFN8HY9Z1kTiB055kERHxQGwY2W6CQsB51jq+W/VvHq+ceHTrOi1zlfQP0Xzmzez
         CY8oL91kFOiMKpExUKLpubCsI4vGsmlbCt4mBvL1h3otp1OK4J237xDMmzfU5+3ta3U0
         owOYKJXR2YHt9XtRswjTc1hideWJwxo90JObFI1HamvRHeHB6F7w7Ci84TC76AppvBHT
         5qAYvtwT5V2C40ex7b4D2ZK6eCUSA8pBpLD8V1uASmnSLmNaQD/S5Mmo47TCZUT/osSw
         jxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769578; x=1743374378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/BfF02ZxGuJsRdlJKwmKz4A2829MjaBQR7CX37kNCLc=;
        b=snGGImgg/s3jEbKNEB6pIm7a1m43Hb5z8pzCYURy8pPYthUYi/PV05lLboBVkBLuO0
         +XMrXa4hLO1OjCdgpFp59fkyOpMmimM+FzrZAORo+Q9H/7mgz28lvy/jQg1TQ+in1bLs
         m9MQn0k2/ePQmEHwOImTPx5ILoh0zxYKVwohaybJmaM6J65ghqtoXR6L8sMV1iKcwV/m
         anYa3pFCjrqTeCS3HEnttjfHHEohhGOdjTvWKj1z/a/YyM328ytcjhTfBdkKGLuMDpKn
         nQnWWxr6R8PhZGc5oZCPjjZ+2DAouL21AIJsN1x386TOLh4p6qdy7vHE94J4dlOPmL1O
         ZNAg==
X-Forwarded-Encrypted: i=1; AJvYcCXawUChB0045VVuT9rdupex7xMwDmZUkgUDNwzDuXdxlsAnaKhAFrasCWbvJZB37yrura8jMFBWeXw=@vger.kernel.org
X-Gm-Message-State: AOJu0YybAcHEF4NtukYhW+0W4eanu04heUtL4C8seyjn0zVhH4xnHUun
	E3mWngAp983T4zIajUSuYXeEbHdAlM6x8Mrv6wNB13hc5lc+OsKieOuJ+YSCalE=
X-Gm-Gg: ASbGnctyigOgRhH3pV8pqPgxoENYYXafApg63RhDctGiLkY6gv+mwR/IlQSzcmayRKu
	dufmIrHMDoc0KQpyUNnADjyxr+1KmT8GSqMecgIkLDk+VeH2d6gi9nXy/LJhTluNHbiFYoqcAeF
	XB4O8pFVjk00UU4uhABWGEovMcFZQDmNuWFTaht/ZE4MQgkafcbNXdqc9bG0ksLZeviX4lCr8X+
	Rr2FcXI9YUOWgDwkTS5BmVSdpRCfV+VqsBZth9EeIPLKfw7cSBOsE6NU0x4cDESbMUoKy33x4aC
	BxUfC/pJKcH27vsEljwuxoO8wq5xwnGJRMBqLypngvms0yMAMCgEqUDOvlB5KSjiM2khzi3oBMA
	oztlFxdOUGjThS2KAg6Vn8NzeenVe
X-Google-Smtp-Source: AGHT+IHQc5/juISCIhGJYSWlIacU3J8GKRH2vNvv6JBixFTUW2yDMQT2CajObU4gYTu9Dfg9Nz5qJw==
X-Received: by 2002:a17:907:e84c:b0:ac4:751:5f16 with SMTP id a640c23a62f3a-ac407515fefmr709698366b.30.1742769578426;
        Sun, 23 Mar 2025 15:39:38 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:38 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:41 +0000
Subject: [PATCH 25/34] mfd: sec: convert to using REGMAP_IRQ_REG() macros
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-25-d08943702707@linaro.org>
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

Use REGMAP_IRQ_REG macro helpers instead of open coding. This makes the
code a bit shorter and more obvious.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-irq.c | 343 +++++++++++---------------------------------------
 1 file changed, 75 insertions(+), 268 deletions(-)

diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 084a40490979058b48640263ff5cdb38765b9ff1..661b0b2d7b7e3da5df7085f468e6860a63c1016f 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -75,212 +75,68 @@ static const struct regmap_irq s2mpg10_irqs[] = {
 };
 
 static const struct regmap_irq s2mps11_irqs[] = {
-	[S2MPS11_IRQ_PWRONF] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_PWRONF_MASK,
-	},
-	[S2MPS11_IRQ_PWRONR] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_PWRONR_MASK,
-	},
-	[S2MPS11_IRQ_JIGONBF] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_JIGONBF_MASK,
-	},
-	[S2MPS11_IRQ_JIGONBR] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_JIGONBR_MASK,
-	},
-	[S2MPS11_IRQ_ACOKBF] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_ACOKBF_MASK,
-	},
-	[S2MPS11_IRQ_ACOKBR] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_ACOKBR_MASK,
-	},
-	[S2MPS11_IRQ_PWRON1S] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_PWRON1S_MASK,
-	},
-	[S2MPS11_IRQ_MRB] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_MRB_MASK,
-	},
-	[S2MPS11_IRQ_RTC60S] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_RTC60S_MASK,
-	},
-	[S2MPS11_IRQ_RTCA1] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_RTCA1_MASK,
-	},
-	[S2MPS11_IRQ_RTCA0] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_RTCA0_MASK,
-	},
-	[S2MPS11_IRQ_SMPL] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_SMPL_MASK,
-	},
-	[S2MPS11_IRQ_RTC1S] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_RTC1S_MASK,
-	},
-	[S2MPS11_IRQ_WTSR] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_WTSR_MASK,
-	},
-	[S2MPS11_IRQ_INT120C] = {
-		.reg_offset = 2,
-		.mask = S2MPS11_IRQ_INT120C_MASK,
-	},
-	[S2MPS11_IRQ_INT140C] = {
-		.reg_offset = 2,
-		.mask = S2MPS11_IRQ_INT140C_MASK,
-	},
+	REGMAP_IRQ_REG(S2MPS11_IRQ_PWRONF, 0, S2MPS11_IRQ_PWRONF_MASK),
+	REGMAP_IRQ_REG(S2MPS11_IRQ_PWRONR, 0, S2MPS11_IRQ_PWRONR_MASK),
+	REGMAP_IRQ_REG(S2MPS11_IRQ_JIGONBF, 0, S2MPS11_IRQ_JIGONBF_MASK),
+	REGMAP_IRQ_REG(S2MPS11_IRQ_JIGONBR, 0, S2MPS11_IRQ_JIGONBR_MASK),
+	REGMAP_IRQ_REG(S2MPS11_IRQ_ACOKBF, 0, S2MPS11_IRQ_ACOKBF_MASK),
+	REGMAP_IRQ_REG(S2MPS11_IRQ_ACOKBR, 0, S2MPS11_IRQ_ACOKBR_MASK),
+	REGMAP_IRQ_REG(S2MPS11_IRQ_PWRON1S, 0, S2MPS11_IRQ_PWRON1S_MASK),
+	REGMAP_IRQ_REG(S2MPS11_IRQ_MRB, 0, S2MPS11_IRQ_MRB_MASK),
+
+	REGMAP_IRQ_REG(S2MPS11_IRQ_RTC60S, 1, S2MPS11_IRQ_RTC60S_MASK),
+	REGMAP_IRQ_REG(S2MPS11_IRQ_RTCA1, 1, S2MPS11_IRQ_RTCA1_MASK),
+	REGMAP_IRQ_REG(S2MPS11_IRQ_RTCA0, 1, S2MPS11_IRQ_RTCA0_MASK),
+	REGMAP_IRQ_REG(S2MPS11_IRQ_SMPL, 1, S2MPS11_IRQ_SMPL_MASK),
+	REGMAP_IRQ_REG(S2MPS11_IRQ_RTC1S, 1, S2MPS11_IRQ_RTC1S_MASK),
+	REGMAP_IRQ_REG(S2MPS11_IRQ_WTSR, 1, S2MPS11_IRQ_WTSR_MASK),
+
+	REGMAP_IRQ_REG(S2MPS11_IRQ_INT120C, 2, S2MPS11_IRQ_INT120C_MASK),
+	REGMAP_IRQ_REG(S2MPS11_IRQ_INT140C, 2, S2MPS11_IRQ_INT140C_MASK),
 };
 
 static const struct regmap_irq s2mps14_irqs[] = {
-	[S2MPS14_IRQ_PWRONF] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_PWRONF_MASK,
-	},
-	[S2MPS14_IRQ_PWRONR] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_PWRONR_MASK,
-	},
-	[S2MPS14_IRQ_JIGONBF] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_JIGONBF_MASK,
-	},
-	[S2MPS14_IRQ_JIGONBR] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_JIGONBR_MASK,
-	},
-	[S2MPS14_IRQ_ACOKBF] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_ACOKBF_MASK,
-	},
-	[S2MPS14_IRQ_ACOKBR] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_ACOKBR_MASK,
-	},
-	[S2MPS14_IRQ_PWRON1S] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_PWRON1S_MASK,
-	},
-	[S2MPS14_IRQ_MRB] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_MRB_MASK,
-	},
-	[S2MPS14_IRQ_RTC60S] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_RTC60S_MASK,
-	},
-	[S2MPS14_IRQ_RTCA1] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_RTCA1_MASK,
-	},
-	[S2MPS14_IRQ_RTCA0] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_RTCA0_MASK,
-	},
-	[S2MPS14_IRQ_SMPL] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_SMPL_MASK,
-	},
-	[S2MPS14_IRQ_RTC1S] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_RTC1S_MASK,
-	},
-	[S2MPS14_IRQ_WTSR] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_WTSR_MASK,
-	},
-	[S2MPS14_IRQ_INT120C] = {
-		.reg_offset = 2,
-		.mask = S2MPS11_IRQ_INT120C_MASK,
-	},
-	[S2MPS14_IRQ_INT140C] = {
-		.reg_offset = 2,
-		.mask = S2MPS11_IRQ_INT140C_MASK,
-	},
-	[S2MPS14_IRQ_TSD] = {
-		.reg_offset = 2,
-		.mask = S2MPS14_IRQ_TSD_MASK,
-	},
+	REGMAP_IRQ_REG(S2MPS14_IRQ_PWRONF, 0, S2MPS11_IRQ_PWRONF_MASK),
+	REGMAP_IRQ_REG(S2MPS14_IRQ_PWRONR, 0, S2MPS11_IRQ_PWRONR_MASK),
+	REGMAP_IRQ_REG(S2MPS14_IRQ_JIGONBF, 0, S2MPS11_IRQ_JIGONBF_MASK),
+	REGMAP_IRQ_REG(S2MPS14_IRQ_JIGONBR, 0, S2MPS11_IRQ_JIGONBR_MASK),
+	REGMAP_IRQ_REG(S2MPS14_IRQ_ACOKBF, 0, S2MPS11_IRQ_ACOKBF_MASK),
+	REGMAP_IRQ_REG(S2MPS14_IRQ_ACOKBR, 0, S2MPS11_IRQ_ACOKBR_MASK),
+	REGMAP_IRQ_REG(S2MPS14_IRQ_PWRON1S, 0, S2MPS11_IRQ_PWRON1S_MASK),
+	REGMAP_IRQ_REG(S2MPS14_IRQ_MRB, 0, S2MPS11_IRQ_MRB_MASK),
+
+	REGMAP_IRQ_REG(S2MPS14_IRQ_RTC60S, 1, S2MPS11_IRQ_RTC60S_MASK),
+	REGMAP_IRQ_REG(S2MPS14_IRQ_RTCA1, 1, S2MPS11_IRQ_RTCA1_MASK),
+	REGMAP_IRQ_REG(S2MPS14_IRQ_RTCA0, 1, S2MPS11_IRQ_RTCA0_MASK),
+	REGMAP_IRQ_REG(S2MPS14_IRQ_SMPL, 1, S2MPS11_IRQ_SMPL_MASK),
+	REGMAP_IRQ_REG(S2MPS14_IRQ_RTC1S, 1, S2MPS11_IRQ_RTC1S_MASK),
+	REGMAP_IRQ_REG(S2MPS14_IRQ_WTSR, 1, S2MPS11_IRQ_WTSR_MASK),
+
+	REGMAP_IRQ_REG(S2MPS14_IRQ_INT120C, 2, S2MPS11_IRQ_INT120C_MASK),
+	REGMAP_IRQ_REG(S2MPS14_IRQ_INT140C, 2, S2MPS11_IRQ_INT140C_MASK),
+	REGMAP_IRQ_REG(S2MPS14_IRQ_TSD, 2, S2MPS14_IRQ_TSD_MASK),
 };
 
 static const struct regmap_irq s2mpu02_irqs[] = {
-	[S2MPU02_IRQ_PWRONF] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_PWRONF_MASK,
-	},
-	[S2MPU02_IRQ_PWRONR] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_PWRONR_MASK,
-	},
-	[S2MPU02_IRQ_JIGONBF] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_JIGONBF_MASK,
-	},
-	[S2MPU02_IRQ_JIGONBR] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_JIGONBR_MASK,
-	},
-	[S2MPU02_IRQ_ACOKBF] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_ACOKBF_MASK,
-	},
-	[S2MPU02_IRQ_ACOKBR] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_ACOKBR_MASK,
-	},
-	[S2MPU02_IRQ_PWRON1S] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_PWRON1S_MASK,
-	},
-	[S2MPU02_IRQ_MRB] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_MRB_MASK,
-	},
-	[S2MPU02_IRQ_RTC60S] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_RTC60S_MASK,
-	},
-	[S2MPU02_IRQ_RTCA1] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_RTCA1_MASK,
-	},
-	[S2MPU02_IRQ_RTCA0] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_RTCA0_MASK,
-	},
-	[S2MPU02_IRQ_SMPL] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_SMPL_MASK,
-	},
-	[S2MPU02_IRQ_RTC1S] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_RTC1S_MASK,
-	},
-	[S2MPU02_IRQ_WTSR] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_WTSR_MASK,
-	},
-	[S2MPU02_IRQ_INT120C] = {
-		.reg_offset = 2,
-		.mask = S2MPS11_IRQ_INT120C_MASK,
-	},
-	[S2MPU02_IRQ_INT140C] = {
-		.reg_offset = 2,
-		.mask = S2MPS11_IRQ_INT140C_MASK,
-	},
-	[S2MPU02_IRQ_TSD] = {
-		.reg_offset = 2,
-		.mask = S2MPS14_IRQ_TSD_MASK,
-	},
+	REGMAP_IRQ_REG(S2MPU02_IRQ_PWRONF, 0, S2MPS11_IRQ_PWRONF_MASK),
+	REGMAP_IRQ_REG(S2MPU02_IRQ_PWRONR, 0, S2MPS11_IRQ_PWRONR_MASK),
+	REGMAP_IRQ_REG(S2MPU02_IRQ_JIGONBF, 0, S2MPS11_IRQ_JIGONBF_MASK),
+	REGMAP_IRQ_REG(S2MPU02_IRQ_JIGONBR, 0, S2MPS11_IRQ_JIGONBR_MASK),
+	REGMAP_IRQ_REG(S2MPU02_IRQ_ACOKBF, 0, S2MPS11_IRQ_ACOKBF_MASK),
+	REGMAP_IRQ_REG(S2MPU02_IRQ_ACOKBR, 0, S2MPS11_IRQ_ACOKBR_MASK),
+	REGMAP_IRQ_REG(S2MPU02_IRQ_PWRON1S, 0, S2MPS11_IRQ_PWRON1S_MASK),
+	REGMAP_IRQ_REG(S2MPU02_IRQ_MRB, 0, S2MPS11_IRQ_MRB_MASK),
+
+	REGMAP_IRQ_REG(S2MPU02_IRQ_RTC60S, 1, S2MPS11_IRQ_RTC60S_MASK),
+	REGMAP_IRQ_REG(S2MPU02_IRQ_RTCA1, 1, S2MPS11_IRQ_RTCA1_MASK),
+	REGMAP_IRQ_REG(S2MPU02_IRQ_RTCA0, 1, S2MPS11_IRQ_RTCA0_MASK),
+	REGMAP_IRQ_REG(S2MPU02_IRQ_SMPL, 1, S2MPS11_IRQ_SMPL_MASK),
+	REGMAP_IRQ_REG(S2MPU02_IRQ_RTC1S, 1, S2MPS11_IRQ_RTC1S_MASK),
+	REGMAP_IRQ_REG(S2MPU02_IRQ_WTSR, 1, S2MPS11_IRQ_WTSR_MASK),
+
+	REGMAP_IRQ_REG(S2MPU02_IRQ_INT120C, 2, S2MPS11_IRQ_INT120C_MASK),
+	REGMAP_IRQ_REG(S2MPU02_IRQ_INT140C, 2, S2MPS11_IRQ_INT140C_MASK),
+	REGMAP_IRQ_REG(S2MPU02_IRQ_TSD, 2, S2MPS14_IRQ_TSD_MASK),
 };
 
 static const struct regmap_irq s2mpu05_irqs[] = {
@@ -304,74 +160,25 @@ static const struct regmap_irq s2mpu05_irqs[] = {
 };
 
 static const struct regmap_irq s5m8767_irqs[] = {
-	[S5M8767_IRQ_PWRR] = {
-		.reg_offset = 0,
-		.mask = S5M8767_IRQ_PWRR_MASK,
-	},
-	[S5M8767_IRQ_PWRF] = {
-		.reg_offset = 0,
-		.mask = S5M8767_IRQ_PWRF_MASK,
-	},
-	[S5M8767_IRQ_PWR1S] = {
-		.reg_offset = 0,
-		.mask = S5M8767_IRQ_PWR1S_MASK,
-	},
-	[S5M8767_IRQ_JIGR] = {
-		.reg_offset = 0,
-		.mask = S5M8767_IRQ_JIGR_MASK,
-	},
-	[S5M8767_IRQ_JIGF] = {
-		.reg_offset = 0,
-		.mask = S5M8767_IRQ_JIGF_MASK,
-	},
-	[S5M8767_IRQ_LOWBAT2] = {
-		.reg_offset = 0,
-		.mask = S5M8767_IRQ_LOWBAT2_MASK,
-	},
-	[S5M8767_IRQ_LOWBAT1] = {
-		.reg_offset = 0,
-		.mask = S5M8767_IRQ_LOWBAT1_MASK,
-	},
-	[S5M8767_IRQ_MRB] = {
-		.reg_offset = 1,
-		.mask = S5M8767_IRQ_MRB_MASK,
-	},
-	[S5M8767_IRQ_DVSOK2] = {
-		.reg_offset = 1,
-		.mask = S5M8767_IRQ_DVSOK2_MASK,
-	},
-	[S5M8767_IRQ_DVSOK3] = {
-		.reg_offset = 1,
-		.mask = S5M8767_IRQ_DVSOK3_MASK,
-	},
-	[S5M8767_IRQ_DVSOK4] = {
-		.reg_offset = 1,
-		.mask = S5M8767_IRQ_DVSOK4_MASK,
-	},
-	[S5M8767_IRQ_RTC60S] = {
-		.reg_offset = 2,
-		.mask = S5M8767_IRQ_RTC60S_MASK,
-	},
-	[S5M8767_IRQ_RTCA1] = {
-		.reg_offset = 2,
-		.mask = S5M8767_IRQ_RTCA1_MASK,
-	},
-	[S5M8767_IRQ_RTCA2] = {
-		.reg_offset = 2,
-		.mask = S5M8767_IRQ_RTCA2_MASK,
-	},
-	[S5M8767_IRQ_SMPL] = {
-		.reg_offset = 2,
-		.mask = S5M8767_IRQ_SMPL_MASK,
-	},
-	[S5M8767_IRQ_RTC1S] = {
-		.reg_offset = 2,
-		.mask = S5M8767_IRQ_RTC1S_MASK,
-	},
-	[S5M8767_IRQ_WTSR] = {
-		.reg_offset = 2,
-		.mask = S5M8767_IRQ_WTSR_MASK,
-	},
+	REGMAP_IRQ_REG(S5M8767_IRQ_PWRR, 0, S5M8767_IRQ_PWRR_MASK),
+	REGMAP_IRQ_REG(S5M8767_IRQ_PWRF, 0, S5M8767_IRQ_PWRF_MASK),
+	REGMAP_IRQ_REG(S5M8767_IRQ_PWR1S, 0, S5M8767_IRQ_PWR1S_MASK),
+	REGMAP_IRQ_REG(S5M8767_IRQ_JIGR, 0, S5M8767_IRQ_JIGR_MASK),
+	REGMAP_IRQ_REG(S5M8767_IRQ_JIGF, 0, S5M8767_IRQ_JIGF_MASK),
+	REGMAP_IRQ_REG(S5M8767_IRQ_LOWBAT2, 0, S5M8767_IRQ_LOWBAT2_MASK),
+	REGMAP_IRQ_REG(S5M8767_IRQ_LOWBAT1, 0, S5M8767_IRQ_LOWBAT1_MASK),
+
+	REGMAP_IRQ_REG(S5M8767_IRQ_MRB, 1, S5M8767_IRQ_MRB_MASK),
+	REGMAP_IRQ_REG(S5M8767_IRQ_DVSOK2, 1, S5M8767_IRQ_DVSOK2_MASK),
+	REGMAP_IRQ_REG(S5M8767_IRQ_DVSOK3, 1, S5M8767_IRQ_DVSOK3_MASK),
+	REGMAP_IRQ_REG(S5M8767_IRQ_DVSOK4, 1, S5M8767_IRQ_DVSOK4_MASK),
+
+	REGMAP_IRQ_REG(S5M8767_IRQ_RTC60S, 2, S5M8767_IRQ_RTC60S_MASK),
+	REGMAP_IRQ_REG(S5M8767_IRQ_RTCA1, 2, S5M8767_IRQ_RTCA1_MASK),
+	REGMAP_IRQ_REG(S5M8767_IRQ_RTCA2, 2, S5M8767_IRQ_RTCA2_MASK),
+	REGMAP_IRQ_REG(S5M8767_IRQ_SMPL, 2, S5M8767_IRQ_SMPL_MASK),
+	REGMAP_IRQ_REG(S5M8767_IRQ_RTC1S, 2, S5M8767_IRQ_RTC1S_MASK),
+	REGMAP_IRQ_REG(S5M8767_IRQ_WTSR, 2, S5M8767_IRQ_WTSR_MASK),
 };
 
 static const struct regmap_irq_chip s2mpg10_irq_chip = {

-- 
2.49.0.395.g12beb8f557-goog

