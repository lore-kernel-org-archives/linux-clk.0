Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A918219F43A
	for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 13:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168669; cv=none; b=BQeSTnbGoI0MVtk2bJSwUWQyBsnhabSoVVgKwplkv9Vf2Pcu0Z1K33jfzePpT0VEtrfaiY4Hu6M6fnaTtM3kbhabqUAO1gakvSuSOnBT2s6+61S19Q2xHzY3GRzaHjWin53JdlnR3OHL/+KmIeCaw68n5zN6vYZsZCRn0klbZsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168669; c=relaxed/simple;
	bh=NTgWVUrUYjaObzH0fsi/8He5KrYlIX0x8gD4jTNG9uA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hqD2tjdVmdztIWP195hZ35tFAwnchBgEK8/AKiKVhaim4HsFU3darkrzmmymkjVdSuDPq09it2/wvpJOrc6UNhD7C8UE58YKfjGtsbG6lgLA+A70VsYuCLNgn1irM2waBlPwrK4uYk32s/5H9uuMq+P5GaeHT7yRo5NEFzOy1eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hfBm6FaU; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hfBm6FaU"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so2961154a12.1
        for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 06:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168660; x=1743773460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VoGJVSU0pPXxfOhXBJG1TDUozXlWar2eJ++GWdYkqc=;
        b=hfBm6FaUvF5ufr/6w20JAmMdnAfe5Cs7Uu0B0X/jIZ7rwqhe0FL05aR/SXyWw+lBMB
         AMjDsFSJ7+uo2+H/WQNRfdcvI6aMwKcMBqm8Vjm6hCFc1NDu9E833UX0qe2AGX49IYSI
         1f7HG1bdspdTNEsdzdpWmyBB/JpxBheNxIsXgWW9dRquYjCvqMeiU3sqK8xRo9Pa9Y0q
         19EgVMEtFKxcjA05SHiIL/UwKBgp79K1MlmAGPuB4A3XLBjxWfTb+jQGLk7921ZNbyvf
         r5K8oFHqpAsORNg3eca41emAY0svAQpYx43FOjxxKUGQv0CGnE9GkvKpQAvzFh+sQZvU
         8KwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168660; x=1743773460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VoGJVSU0pPXxfOhXBJG1TDUozXlWar2eJ++GWdYkqc=;
        b=mr5svEjWcDn6Sj2e0MCH+CXm9zC3u8ou146Sw4ONsF2uLD6IMDutIMcXQSklKMI7lr
         VckYdFRYKlcD2m6+tId7mdqs/MVPCxnySOIMsDsf4Ia0OqjlllhIFNuEtLtNegTdpOLt
         EzC++illjCBPIIS+OW3z64NrfZDLMdOIQKnqK5oIY0iAuQNSLINNhe3rVWf8qG2u6OV3
         qZLdS1pP/KnHQ8qYuwis9R7Cbbaf+7dV4Y3Z0P16jgMfQnHTUxqaxVaEt9EylzX/Wlgg
         xviuiiFoOejeascaBwTCXzelW/rlv1mS3fo2VIyTIirWdgS84VS1t2Uv4X3BHt4RGCW9
         9LWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6pRQ3+1lMj+JvPnNH26/gA9a2TBSUctdcde9r0wgZSNXCCYc2DRDTk88ynV1b4JVGjsx0hjzzRbc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5lLwTknhF5drGXGCT52lucZHGcMXkHDuG2DxVi8GxToBZt3Ty
	G+RT3SXSi9zQHk1U6WF5dMhSqJlS6VBr/UfU12GZ9oVEQTyOjtUZWI/GdByel+o=
X-Gm-Gg: ASbGncsxMDecyU7ghgwahejPznQsuvf53Mfm2mmR9rUTVeJdodsYWmmulFtpfQ8tHWd
	l29p3h/HSw2bGsyat2dykniy3SuP/2QdqijpFzGmrv8qzTymXpQ+jGW32MIalZnwYzzuMepmuqZ
	a11fgQIq2p9C+dfZQrg3Dn2LfBQfMp3qnI319VydeFwNharHIIbIkBKv+lf/8a4CvpA4cQYX4Ew
	F4RTk4wO3fEfs5KrsDuhBJQmpuJmY3mSo08nKd8l69iJDvdozb2fxWvFalQo/EJCo+Hs1HlFz1i
	hzO1YMP0PeDIryxf7Y/Ky9pBw1rSYC6ibFJ6MQTcsa3w1Dzxt1hi6bhEFbSNB/q84ollzttBEMc
	vsvIi3iiDzZ+hsSSrF9deqeFMOWZH
X-Google-Smtp-Source: AGHT+IFa1ywqWtMZSnG9pts0mMrN/sttXLfnO6tOUzdFdR1G8cdCfNjEuqB1D3yndUkb+y2vUxTGqQ==
X-Received: by 2002:a05:6402:3485:b0:5e5:bfab:51f with SMTP id 4fb4d7f45d1cf-5ed8c1f880amr7936018a12.0.1743168660409;
        Fri, 28 Mar 2025 06:31:00 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:00 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:59 +0000
Subject: [PATCH v2 13/32] mfd: sec: use dev_err_probe() where appropriate
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-13-b54dee33fb6b@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

dev_err_probe() exists to simplify code and harmonise error messages,
there's no reason not to use it here.

While at it, harmonise some error messages.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c |  6 +++---
 drivers/mfd/sec-i2c.c    | 10 +++-------
 drivers/mfd/sec-irq.c    | 14 +++++++-------
 3 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 1a6f14dda825adeaeee1a677459c7399c144d553..f4c606c5ee5a809a106b13e947464f35a926b199 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -229,9 +229,9 @@ int sec_pmic_probe(struct device *dev, unsigned long device_type,
 		num_sec_devs = ARRAY_SIZE(s2mpu05_devs);
 		break;
 	default:
-		dev_err(sec_pmic->dev, "Unsupported device type %lu\n",
-			sec_pmic->device_type);
-		return -EINVAL;
+		return dev_err_probe(sec_pmic->dev, -EINVAL,
+				     "Unsupported device type %lu\n",
+				     sec_pmic->device_type);
 	}
 	ret = devm_mfd_add_devices(sec_pmic->dev, -1, sec_devs, num_sec_devs,
 				   NULL, 0, NULL);
diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 966d116dd781ac6ab63453f641b2a68bba3945a9..a107a9c1e760f90fcb59a9944b74e9a39a0d946c 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -134,7 +134,6 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	const struct regmap_config *regmap;
 	unsigned long device_type;
 	struct regmap *regmap_pmic;
-	int ret;
 
 	device_type = (unsigned long)of_device_get_match_data(&client->dev);
 
@@ -166,12 +165,9 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	}
 
 	regmap_pmic = devm_regmap_init_i2c(client, regmap);
-	if (IS_ERR(regmap_pmic)) {
-		ret = PTR_ERR(regmap_pmic);
-		dev_err(&client->dev, "Failed to allocate register map: %d\n",
-			ret);
-		return ret;
-	}
+	if (IS_ERR(regmap_pmic))
+		return dev_err_probe(&client->dev, PTR_ERR(regmap_pmic),
+				     "regmap init failed\n");
 
 	return sec_pmic_probe(&client->dev, device_type, client->irq,
 			      regmap_pmic, client);
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index aa467e488fb5ef79d5bc7110e1ba7c26fcfa9892..9f0173c48b0c8186a2cdc1d2179db081ef2e09c4 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -487,18 +487,18 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 		sec_irq_chip = &s2mpu05_irq_chip;
 		break;
 	default:
-		dev_err(sec_pmic->dev, "Unknown device type %lu\n",
-			sec_pmic->device_type);
-		return -EINVAL;
+		return dev_err_probe(sec_pmic->dev, -EINVAL,
+				     "Unsupported device type %lu\n",
+				     sec_pmic->device_type);
 	}
 
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
 				       0, sec_irq_chip, &sec_pmic->irq_data);
-	if (ret != 0) {
-		dev_err(sec_pmic->dev, "Failed to register IRQ chip: %d\n", ret);
-		return ret;
-	}
+	if (ret != 0)
+		return dev_err_probe(sec_pmic->dev, ret,
+				     "Failed to add %s IRQ chip\n",
+				     sec_irq_chip->name);
 
 	/*
 	 * The rtc-s5m driver requests S2MPS14_IRQ_RTCA0 also for S2MPS11

-- 
2.49.0.472.ge94155a9ec-goog

