Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E582356DA
	for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 13:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168681; cv=none; b=nzsEb+IidlWjOaxpwBaa7OL87sfsKwBZwtEBm0U7IGSpJtrfhm+JPIvZIne+sQYTT1b/acgWDyB7FX5HUJKgbZjdvzBZzl4i0aQvH5zAsb4odHHyK1/d1LaB+QBP6Pq2ePeppc6X3CXf2lirOZdYrNBMOJfVVhqbU/Ep4tpQrCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168681; c=relaxed/simple;
	bh=XY+ty2A6DQsXp5psWmWSxlDWQ8KjYhDNZ4NRtatMswk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CEE1fXzqYt8NTFwRtIHr27ivHpnBpE2DmjBfUG1iPc3uaUmuEDefyZcQ+7/xrSsRq4Ldf4kyqQjGm5gDKCfGTMDpvOKthM91w4MCmiWv5u5ZzYJ4Sj1tgsKBs4ru7VxCeP5/xAFURKdBGTx9pcIs+bYSovOKEv8MSYs2fJqU+NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=htuI/5Kj; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="htuI/5Kj"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso3578827a12.0
        for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 06:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168668; x=1743773468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwiQ684ZfeWSIriRYeiGWHceehqqEuabrmdfgVRjbUU=;
        b=htuI/5Kj+N4M9iQ5qZsneFvMhkGiG/Dvah7wWJMKzFBvwI510nAHZ5AUuhuaqWwWlJ
         2X0Rozmqiv9JHUciOoMO6ufGvwmdBJHtYriBGNohYh22Qc+Mk5RyJ2OtlYIkRmz5ZX6O
         A4iJAXDUsncgula5qYVi+pRl5CfS09LsLz594rq0TpLT3kauYHsvs+rfJpLXSOUXHoil
         l4IPK6KBuGAc95SDQvOiTzipo9gfDWJ92h5zkFxi7ry9F1BEb58/ATYbpWpSpT7ZNNKv
         CCrlGkO7l3lhbtOBAWms5mBXCtUzKRiG3KgcDSR6lcnSd8N6Y09WXbX2CQ5DA+8D/Wj/
         UEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168668; x=1743773468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZwiQ684ZfeWSIriRYeiGWHceehqqEuabrmdfgVRjbUU=;
        b=iSld8kt+Dx5Zvnwu7mAiUKT3aFTxwD8zzCnuvL4YbzjR1CLIEmjRRfYurrF+p0h7dq
         S5mBlVtPSUw6hUvVffH3qxRIkpD/qPjCJH9DmcscCj0adV49AdfDCUeb8sS94I5oQ/8S
         N9q/7dRLU0Un8PFlgeGW7VWvVPwS+xncV0kyTvwfEYBGiX9cJ/VK+NZgrap7cVjR1nAT
         caWuOoL/TFSU88d8iL2RQ6b4Gdw1kWFd6vbofXkEou0BDj42RXer2D1jm43PtDfoR/EU
         zKm5Alel3qFxzqxOVR8p5e77xlqJgG90ZK6bDBD/MnAay4ajWLTtafcoAMZjZefVpYCG
         WB0A==
X-Forwarded-Encrypted: i=1; AJvYcCVWbKb0cV8U5xsfIZOZzw5EXUo+so91L+JD76SV2oUWWw7B+iMO5E2Zf1O2tZzPYpahBxKNl6Vk+zI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywib7+t4fPom+jbACvjyzUTwKdv4GI7uy7s/rAwLP597vv6G1y0
	OeBEibd890thC+4Y38UphVt3/FCoYzFPHvfZWeoXHGybzbtoYIRKs3ZikXLPE2pQM/5dpkDCzow
	Od/k=
X-Gm-Gg: ASbGnctBtVUK+9dAA0NDWePRX/hCNfExYaMa+eI61dEzS5TMjsmc0jZ6cFqcOnRQcye
	bT61UfWDNPOPVpwA0iUTkSwokwr+uzGkrgRRuYhvZ7OJK5R4KEu7KVRRDDBYRvTJnbGpIi2p2Ms
	kWWo5BWLUEIsonN/fGE7fa3edUD0sVe3yaNuT5WF2o4P+IuXO3bqjHZanLEhA/8H6Ka/HQlLWG0
	LuVvhXICKbgSWIsRzzJqWnx/Ji1dKhulH+A1TYLlH4RFDR0tBPpDBVM0rzQ+cj/5YugsaoKwg8s
	Z3WHhYunj9/c6v+V+hnJc8JEvLfO4vzWuS3N0BQDCb5Ml/xXc4cHwUJOLv+k+sUfFg1/JsTH7ge
	Pw85M9XizwZYPcaGWZteriWCHI1NzdVaI0N+47m4=
X-Google-Smtp-Source: AGHT+IGGNzjfKLDz9VEqvXIc5x4+us5D+sfcsDSKvKIds4Ov17i1NhheRxJHbrgm44PnOKBE2PxwXA==
X-Received: by 2002:a05:6402:350c:b0:5e4:9348:72c3 with SMTP id 4fb4d7f45d1cf-5ed8e27b242mr8087751a12.10.1743168667494;
        Fri, 28 Mar 2025 06:31:07 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:07 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:12 +0000
Subject: [PATCH v2 26/32] rtc: s5m: prepare for external regmap
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-26-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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

