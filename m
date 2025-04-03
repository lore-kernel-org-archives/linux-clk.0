Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB7124C692
	for <linux-clk@vger.kernel.org>; Thu,  3 Apr 2025 08:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670771; cv=none; b=g4u1LKTRFo1zyFP4pjfd107N3/jVtfRWt/o44F8JdpYMPvoK/idjDp07Rb92d8I4YpDmgzprNJdgQYLUSo7D7G0kHL1kvnvzhyV26tFfxyqC4ULPpLEi2C3nSYlTUXFzp5B/zHLhtkK6HGjiryvYXh/sxzP7CkyTXpuql+pb/lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670771; c=relaxed/simple;
	bh=XY+ty2A6DQsXp5psWmWSxlDWQ8KjYhDNZ4NRtatMswk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rq1LqaPbJk39chac0lv2kgnyGoqI9/xU6CZHJsojVFRa6RnruGBCYBdxfkGoW7KhUMivnAUf4AtPlvD8vN9vMiOkaU/gqwJFM6VfUIUJvd1Ed0EFK/KtUEM66ENPFKCrwoBAVCYtigX5tfGpWq6BYPDMALC2wLjX584SLMunoP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MK9oQ5Ll; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MK9oQ5Ll"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so122306766b.1
        for <linux-clk@vger.kernel.org>; Thu, 03 Apr 2025 01:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670756; x=1744275556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwiQ684ZfeWSIriRYeiGWHceehqqEuabrmdfgVRjbUU=;
        b=MK9oQ5LlNoFVd/eiMrTIFte5DX5KBItDdT5nwdslQOV0d74+Rv6+RE8WRrGV1zk/MV
         fUWV+fldEyWoycNJF1zNTQEOHIKPcfQShWUfdd/4lSVIUBAQsN8MB9WMqq3MxOIoixcw
         E3sK899aMCyIENr4RWnal14aRubHIRzVFsP+mwIGeE+7FNnOm3+yvVDmcebmOrB29fxj
         gwegwC857GTWxfjk78BTXuZuqUeOW0y6aFFbao+Jb/BDZIh8MnUUX5T0PUKvSPigU3Nh
         pKcMGmktO+m6HLrf3ujS2hbuaUmQFOz1L5Am8GBtIpYyjzkqUNNDsp9PjKEl8fQQH1SI
         A6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670756; x=1744275556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZwiQ684ZfeWSIriRYeiGWHceehqqEuabrmdfgVRjbUU=;
        b=mpWRTWo1ZC0iwKDopJRNv8MhdiznVh5sGb1bnN3sjnonkVcEJZBaY113yTSAMjujpN
         2alwmw0Jwahk8HHXQKRugSCXuV6tAPfLbK9HLTRJIrjKo7KOrrx6jqoFqP1VaeMHmx4n
         mkcrdOJbBgqLERDZ3RaMrAjI4Rqjm0moXin7nsdXEmy5K4OdGJCBokMJwIBjXYxrqcLG
         mduSnVDbZUVdfr9JmmEdeN/zi9LWHNbOqBIxhqvH5S+hgdn/+5qbNFhkCk0BJrfbLFE5
         kF7rqsPEWCs/R8AoNJbDo6rBDKqsHdGP3tYzfBH2dFikXNDDM816l7l/0lj/e3lCFMeB
         pvtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqZi4AR7lZbhfb7G6bwt83iYnFXMhIE+5Hq9aQOvPuiYMn8R4vpFog2ETEU5FnwcGvD/DWRhUjhJU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjJU2g0EoxCzBxslu6+i4aPNIABak3s+tb669VZfseZI1Cs9Ng
	I7MFmUuat5EOy4PZiljI545qehPWozdC3O0Xo+kT4tXf3mTO1pB3493f9uMkBig=
X-Gm-Gg: ASbGncsqCrEfqjMPWQUW4vpoXYxzArauvY+hGj8cBaKf0gHBPqOPhxOq8wz2Nyv0sHo
	cLLCX72HnOaKnZ5ZUmQA7rniiimSPsHGr1Op8Q/jU3UNk6yFmnXW+emOwNc2TV+/uUJf2I9wRCf
	R/OV5YigbOoxsqpBuOUsnydAQkzIgbPNaqgEEmN4QX6WEpucYNEC1yfrA7DVzn4G/xQf20iuH2I
	xDMeq6lipIytLSIOJ8vxueQIDFE/4f/ZEoBQiKGqmavPEglFwlTktrLB29LfACYA2HXWQlSxdjr
	uxvQtllCAo6Fhk1XGXxQ+i2fr3K7Lq6eHn1/mxaDRCz1E/fH3+vjtknPtaydV1v7HGBnlTJGqDT
	axY4woGyezLb0z+P5u5/CM2s1hoaU
X-Google-Smtp-Source: AGHT+IGxqvs9WDVLgnZbd0Q1P61p74Sjm20wNP22/EBrrIOH4ecB3274nitjn+0Tvp+BuQBO2JC0vA==
X-Received: by 2002:a17:907:c23:b0:ac3:8895:8e99 with SMTP id a640c23a62f3a-ac7a165e83fmr473122266b.3.1743670756231;
        Thu, 03 Apr 2025 01:59:16 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:15 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:18 +0100
Subject: [PATCH v3 26/32] rtc: s5m: prepare for external regmap
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-26-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
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

The Samsung S2MPG10 PMIC is not connected via I2C as this driver
assumes, hence this driver's current approach of creating an I2C-based
regmap doesn't work for it, and this driver should use the regmap
provided by the parent (core) driver instead for that PMIC.

To prepare this driver for s2mpg support, restructure the code to only
create a regmap if one isn't provided by the parent.

No functional changes, since the parent doesn't provide a regmap for
any of the PMICs currently supported by this driver. Having this change
separate will simply make the addition of S2MPG10 support more
self-contained, without additional restructuring.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 81 ++++++++++++++++++++++++++++-----------------------
 1 file changed, 45 insertions(+), 36 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 53c76b0e4253a9ba225c3c723d35d9182d071607..86ccf666c68059408907c97f2647716ffaad10c6 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -640,52 +640,61 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	const struct platform_device_id	* const id =
 		platform_get_device_id(pdev);
 	struct s5m_rtc_info *info;
-	struct i2c_client *i2c;
-	const struct regmap_config *regmap_cfg;
 	int ret, alarm_irq;
 
 	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
 
-	switch (id->driver_data) {
-	case S2MPS15X:
-		regmap_cfg = &s2mps14_rtc_regmap_config;
-		info->regs = &s2mps15_rtc_regs;
-		alarm_irq = S2MPS14_IRQ_RTCA0;
-		break;
-	case S2MPS14X:
-		regmap_cfg = &s2mps14_rtc_regmap_config;
-		info->regs = &s2mps14_rtc_regs;
-		alarm_irq = S2MPS14_IRQ_RTCA0;
-		break;
-	case S2MPS13X:
-		regmap_cfg = &s2mps14_rtc_regmap_config;
-		info->regs = &s2mps13_rtc_regs;
-		alarm_irq = S2MPS14_IRQ_RTCA0;
-		break;
-	case S5M8767X:
-		regmap_cfg = &s5m_rtc_regmap_config;
-		info->regs = &s5m_rtc_regs;
-		alarm_irq = S5M8767_IRQ_RTCA1;
-		break;
-	default:
+	info->regmap = dev_get_regmap(pdev->dev.parent, "rtc");
+	if (!info->regmap) {
+		const struct regmap_config *regmap_cfg;
+		struct i2c_client *i2c;
+
+		switch (id->driver_data) {
+		case S2MPS15X:
+			regmap_cfg = &s2mps14_rtc_regmap_config;
+			info->regs = &s2mps15_rtc_regs;
+			alarm_irq = S2MPS14_IRQ_RTCA0;
+			break;
+		case S2MPS14X:
+			regmap_cfg = &s2mps14_rtc_regmap_config;
+			info->regs = &s2mps14_rtc_regs;
+			alarm_irq = S2MPS14_IRQ_RTCA0;
+			break;
+		case S2MPS13X:
+			regmap_cfg = &s2mps14_rtc_regmap_config;
+			info->regs = &s2mps13_rtc_regs;
+			alarm_irq = S2MPS14_IRQ_RTCA0;
+			break;
+		case S5M8767X:
+			regmap_cfg = &s5m_rtc_regmap_config;
+			info->regs = &s5m_rtc_regs;
+			alarm_irq = S5M8767_IRQ_RTCA1;
+			break;
+		default:
+			return dev_err_probe(&pdev->dev, -ENODEV,
+					     "Unsupported device type %lu\n",
+					     id->driver_data);
+		}
+
+		i2c = devm_i2c_new_dummy_device(&pdev->dev,
+						s5m87xx->i2c->adapter,
+						RTC_I2C_ADDR);
+		if (IS_ERR(i2c))
+			return dev_err_probe(&pdev->dev, PTR_ERR(i2c),
+					     "Failed to allocate I2C\n");
+
+		info->regmap = devm_regmap_init_i2c(i2c, regmap_cfg);
+		if (IS_ERR(info->regmap))
+			return dev_err_probe(&pdev->dev, PTR_ERR(info->regmap),
+					     "Failed to allocate regmap\n");
+	} else {
 		return dev_err_probe(&pdev->dev, -ENODEV,
-				     "Device type %lu is not supported by RTC driver\n",
+				     "Unsupported device type %lu\n",
 				     id->driver_data);
 	}
 
-	i2c = devm_i2c_new_dummy_device(&pdev->dev, s5m87xx->i2c->adapter,
-					RTC_I2C_ADDR);
-	if (IS_ERR(i2c))
-		return dev_err_probe(&pdev->dev, PTR_ERR(i2c),
-				     "Failed to allocate I2C for RTC\n");
-
-	info->regmap = devm_regmap_init_i2c(i2c, regmap_cfg);
-	if (IS_ERR(info->regmap))
-		return dev_err_probe(&pdev->dev, PTR_ERR(info->regmap),
-				     "Failed to allocate RTC register map\n");
-
 	info->dev = &pdev->dev;
 	info->s5m87xx = s5m87xx;
 	info->device_type = id->driver_data;

-- 
2.49.0.472.ge94155a9ec-goog

