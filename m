Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161F02417EE
	for <linux-clk@vger.kernel.org>; Thu,  3 Apr 2025 08:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670763; cv=none; b=IgOWWHz6w/S8V9ozRSJxjvHaG2UU5uaJ9JJ+enc3zQQPlomguteKwoVVyf24OY2o9Dubar/dumTrMeZH9ei38YtDXBeIREzfdqpgCQqGAgLT9I3EI1tVyuHT/zkwuV/ECuTWJojKhWg8YHXYfk1TuG9MOUHE3vg1/cP7n2yLRAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670763; c=relaxed/simple;
	bh=3HQSCKKi1fwFRVm95IbU9t5Hr7ITyiskN+9xAwmrKhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NGTjH97UJU757yPKsTVwMg0B5GBZorQnzUi3zxHE7E2UV+ye2L7LQyzzaYQvYBKEWVDx1F15c53G/zydHqdLVYHteqlOfFffYm5/PjYSSJNoqIj7q4E+mXFGrfK+9HoD/tOH3DDmGdeGwj5nBSBM/lMK2agypUphwX2GBnhSjLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=inbk4I+r; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="inbk4I+r"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so1167901a12.0
        for <linux-clk@vger.kernel.org>; Thu, 03 Apr 2025 01:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670752; x=1744275552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c021jwV5dbsG8JoPrCRgjZmmvCnTfk3Xe/yBggRzooI=;
        b=inbk4I+r/k4ykJ/Nugo2yeQ4wXSJAhl8r0L/UHumax8beFQaeSG7wW4K6eYJdwPJwZ
         Op0as6SlDG2WVK8j7/uNNJJbIaJPNoo2yCKtf/Vfl9PbHDO2KR5MRn1lEqCbQciktX61
         VLwdEtLQjuWnmdTveoWv+1/5eY/w/E8A9MK8knRh7CK7gR7dTvRGlsifjdN1mhQ3Rc/v
         OL66GgE4HbECZJwJDdT48ZKXQcD0Mp21Mn0x+xsLlROFznQ1mT4WX82yuzac997GeFdV
         geLKIEl2t2qixDmGw3o4SSPEM4mZPXUfp24PUpgVGntda4dXhgJ/87dGlGS/vq/xYcFJ
         fc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670752; x=1744275552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c021jwV5dbsG8JoPrCRgjZmmvCnTfk3Xe/yBggRzooI=;
        b=o8RBOuHp5uYghKBrOFEcuPA4acG0nbXnSN4VEYhLHfLtpnEMZdPhxEfZN8Q/Wh78zF
         EPP4ZPqoM3GEraywjuHLhHAJYCLXSWLtabirhd462T+1sCZ85ygpfy0O+FX8EXowIgLJ
         sF5jqCgbZCS/OXjFpAE9qFaGevO20caYgqE6/jGAfrotsSPxtR0jXL3huBcUpFZDYhkz
         1K/3Uqt3ktGWe1r0SQtOpX4XOGwjYtBwaZu4Ic0KhNFkQ7RtXEOxDuvaqJmKnYIkom4z
         7CHuV0hauBq+cai5TyGIObV2YOlCs6gYRBs7XQiFabLCQyJ6Or3aSbjVDq1tm918pDku
         EJTA==
X-Forwarded-Encrypted: i=1; AJvYcCVWlZH1i6c73sbBcltAPbojasHGoEUJ0N8oRlVsY5/30xR4ebuYXEnM0CWp3W78rZfW+zbkwfTygc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwipF0BJBh9jTEuVnjhfS/hhleYddsBwtTBLEfvnqSbE2kzjZzL
	1qqaScSUPoSF7URg4Y8fDsA8AJ5y8YkfEj6WbkDVzonskI8WghZc2s+tsoN+YV8=
X-Gm-Gg: ASbGnctALLtn5LJ1yRoxX9JNkJxxGOEEzAjet8ypT0AoJceUZUZ25KcV1zkB/boLJM4
	VhCBWbMG/n1gNwE8WaBdzO6B8YERA8ANgMSCrttyZrNakF/+r49vvIhzdg8x/fAYCLBLPuaJ5/k
	Ar0WiBnriGOM7o6jcIEEKpwnYGGZM0jjdA8n/TWEKYy9l1rQOFzjhqhdJ7uXKw3SGaZaYhiy7FS
	xEzIiUPOZ+eK6mZ8fWbnFEh5mWhHltM7QHC9FjQp49DoB3SDVYHT3iICQuD4oYYZwdhIiSaAqkB
	y4rU2Amm2U1Gntb1dGAWFOK830ABhuzXac+KExsXMZkisbsuPEHuqbJpMX6DCmL6btIwXAiTkhR
	xGamuiPE0Hylw2yBet+j/BEMDau4SRTXhrEdOJ7E=
X-Google-Smtp-Source: AGHT+IHCv1y/iOD6tATf8l6JbAVP7nosxikaub6pMGAtowLVbGuj8LVxbHPFWCZvGPjo74E5dX1Kfg==
X-Received: by 2002:a05:6402:90e:b0:5e8:c0a7:4244 with SMTP id 4fb4d7f45d1cf-5f08716b5edmr1415400a12.9.1743670751910;
        Thu, 03 Apr 2025 01:59:11 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:11 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:11 +0100
Subject: [PATCH v3 19/32] mfd: sec: don't compare against NULL / 0 for
 errors, use !
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-19-b542b3505e68@linaro.org>
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

Follow general style and use if (!arg) instead of comparing against
NULL.

While at it, drop a useless init in sec-irq.c.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 2 +-
 drivers/mfd/sec-irq.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 4871492548f5efde4248b5b3db74045ec8c9d676..55edeb0f73ff4643f23b9759b115658d3bf03e9a 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -164,7 +164,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 	int ret, num_sec_devs;
 
 	sec_pmic = devm_kzalloc(dev, sizeof(struct sec_pmic_dev), GFP_KERNEL);
-	if (sec_pmic == NULL)
+	if (!sec_pmic)
 		return -ENOMEM;
 
 	dev_set_drvdata(dev, sec_pmic);
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index c4db58813059f07372679223ec570ed07f52cd73..5cd9667a21e9e8b052b2ef0b5d2991369bffe8bb 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -448,8 +448,8 @@ static const struct regmap_irq_chip s5m8767_irq_chip = {
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 {
-	int ret = 0;
 	const struct regmap_irq_chip *sec_irq_chip;
+	int ret;
 
 	switch (sec_pmic->device_type) {
 	case S5M8767X:
@@ -496,7 +496,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
 				       0, sec_irq_chip, &sec_pmic->irq_data);
-	if (ret != 0)
+	if (ret)
 		return dev_err_probe(sec_pmic->dev, ret,
 				     "Failed to add %s IRQ chip\n",
 				     sec_irq_chip->name);

-- 
2.49.0.472.ge94155a9ec-goog

