Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F57214225
	for <linux-clk@vger.kernel.org>; Wed,  9 Apr 2025 20:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231066; cv=none; b=iOVdmJ6yU19+KjdT3ORAsHLJpYE7Fz9/NtdXfqUaCTDJkgIdPDju7QMsNEQtzOv1d4MKXOFj6hhbpOS6raMUW9eXn5VncL1cjWLZvLnYMG8i0Nvba6APpwdp3XB77NBQeVKEoTQZ08jaddJRYn+FrIas/fahSx1SHXYE5K6Y0jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231066; c=relaxed/simple;
	bh=O4JPugPn1xYM+7ioH06ufb1b5Ml7ZG8ODWJmVaR2vyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BEYiICRjAQxeZDP8AtuRKgzO8HN/ou32a1uaaatsa68M5cJUak+XQ6dOhemG/gYapnKbAeaxVVl+klIBv8Frkmi16NsbHgYWWBSZY+ew/ZkYLaq1zt7wxFQyWP317MjvzUylfwRys/fxzV9FOQSIY+yBh2dv2GQ/Iw87jtHkpow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QSKhtznF; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QSKhtznF"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac289147833so19079466b.2
        for <linux-clk@vger.kernel.org>; Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231059; x=1744835859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9YixQkkh2h+PoC6ERL/H9JIANLx33uZRMtwP8F9qEs=;
        b=QSKhtznFFXhtw8I666k9RPPov0Jeb0/GuqcYV/i8h7a3uPLBzVCKThrqNLL/NEeEfo
         uPEA5/LZgoo8uqck8Q4CRMAd18ot8lIsLjjZnvbsx8LIkEpgtHjsznDv/AuX7UmEsLSF
         668uPgadesgsOhYTO3xMq/isrXBVOHUmLZn0x+3kmFiO+HOUN1a2IYLhbwft7oqb58T4
         bE9DKX/s98yxzHjQ7tZE4l2O8AC0DnSmvHQ8pr/J4/agaErPC87RwCDOpStEu5TIkQfb
         BJ8HdZodcVoJwf5O92kpTa4iWWsv1XISXpVui0xP9M8cLkHdfFjG3n4SHkNVHiCu8ui6
         DsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231059; x=1744835859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9YixQkkh2h+PoC6ERL/H9JIANLx33uZRMtwP8F9qEs=;
        b=mJOH9qMWWa4RlPTi4q8Y5ZffhkZRoGrD2uPqueHCF6cKWWHOlpE/928u6QJlxcZwOB
         qw4HKW8Fr0dL/BeQ8jVk2kBBQ36M3oPyJRLkdXzEkgklOo90UHmsbZCdVEnauauC/Q71
         FShe/BZFxvKzH7KItFB6AR4743kY6X9Xdhr8sKuC9FNBn1mNV4A1JarzPs5A2Ri87bc9
         uUAe4Do+ObXz9vVfPQxIzG3S2UJmHQja+bCM0rTJP2GFl7D5FxlVkpkC8J3dCJuNgk5A
         F7EbvgV7DKQSzsXRGbWM7xPYB7LRlc+vVaCCixXWNDor2qqF1Sy+bPY1+GwnxXOMt42n
         nTSg==
X-Forwarded-Encrypted: i=1; AJvYcCV1uQ+dsfAqtvbRl3IQGSGZVrB9skAOcK2igIAY8nqpkxDzTDGJWsman0wLm1dJIByceRXMXU3r/Gw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWr1zgJHJMBw9fFV7SqpcOLX/J96fFM1YQj4omnDEXaZOAezni
	5WrOFdwjXdxe21oAT8WRrEEN9MXsIwpa2OK60JMJV3KqLOmzit0s0AHOJjD1pOE=
X-Gm-Gg: ASbGncv/UKHjoYmhHQSjwSqGMFS9OCUvgN0mVrKyckbkxnSyECriptDAuV4hRJggr1K
	vrDG0vRT9UnTS2ExBKrnymHh5oiQpgZSUpGxh7VXvT5rWs9aCo/1ne4JKF77Csj36WI/uergne9
	8FPlvR7ThYzAT6yGwb2n6BKnYBxUWkTMSfo4TQ8GDcoQwb2AQhjfBMiwkdiPcfLLqUMllKbEczA
	GOXpY8o7YIMz1Vdk29r0cizxlb053qF/c/YcjZwdBOw1K0PYmzIqAeleC3vWW1aQeh/FgOiTI33
	uR0g/ewsk0aIqRI6QX2mExCb9dX0zQ1kTk9t514QP3gwCxUaE+PjLFHlIneAGvsDbYWajXCeIb4
	pG//Do4M/r4VaHcS5T4F9sO6Vs1Q=
X-Google-Smtp-Source: AGHT+IGySdKlCUCRqIRdMr1m1a7VVzze8sUjh0tF6sp5LZEti5v72rp0jlKeAu4Y6YWVta765Hb6Iw==
X-Received: by 2002:a17:906:4fd4:b0:ac3:b3a3:f19d with SMTP id a640c23a62f3a-acabd3ba32cmr8605966b.43.1744231058840;
        Wed, 09 Apr 2025 13:37:38 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:38 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:39 +0100
Subject: [PATCH v4 18/32] mfd: sec: Change device_type to int
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-18-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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

Now that sec-i2c doesn't match device type by pointer casting anymore,
we can switch the device type from unsigned long to int easily.

This saves a few bytes in struct sec_pmic_dev due to member alignment.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c         | 9 ++++-----
 drivers/mfd/sec-core.h           | 5 ++---
 drivers/mfd/sec-i2c.c            | 2 +-
 drivers/mfd/sec-irq.c            | 5 ++---
 include/linux/mfd/samsung/core.h | 2 +-
 5 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index bb0eb3c2d9a260ddf2fb110cc255f08a0d25230d..4871492548f5efde4248b5b3db74045ec8c9d676 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -155,9 +155,8 @@ sec_pmic_parse_dt_pdata(struct device *dev)
 	return pd;
 }
 
-int sec_pmic_probe(struct device *dev, unsigned long device_type,
-		   unsigned int irq, struct regmap *regmap,
-		   struct i2c_client *client)
+int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
+		   struct regmap *regmap, struct i2c_client *client)
 {
 	struct sec_platform_data *pdata;
 	const struct mfd_cell *sec_devs;
@@ -232,7 +231,7 @@ int sec_pmic_probe(struct device *dev, unsigned long device_type,
 		break;
 	default:
 		return dev_err_probe(sec_pmic->dev, -EINVAL,
-				     "Unsupported device type %lu\n",
+				     "Unsupported device type %d\n",
 				     sec_pmic->device_type);
 	}
 	ret = devm_mfd_add_devices(sec_pmic->dev, -1, sec_devs, num_sec_devs,
@@ -266,7 +265,7 @@ void sec_pmic_shutdown(struct device *dev)
 		 * ignore the rest.
 		 */
 		dev_warn(sec_pmic->dev,
-			 "Unsupported device %lu for manual power off\n",
+			 "Unsupported device %d for manual power off\n",
 			 sec_pmic->device_type);
 		return;
 	}
diff --git a/drivers/mfd/sec-core.h b/drivers/mfd/sec-core.h
index a0a3488924d96f69373e7569079cfefd0544ca26..92c7558ab8b0de44a52e028eeb7998e38358cb4c 100644
--- a/drivers/mfd/sec-core.h
+++ b/drivers/mfd/sec-core.h
@@ -14,9 +14,8 @@ struct i2c_client;
 
 extern const struct dev_pm_ops sec_pmic_pm_ops;
 
-int sec_pmic_probe(struct device *dev, unsigned long device_type,
-		   unsigned int irq, struct regmap *regmap,
-		   struct i2c_client *client);
+int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
+		   struct regmap *regmap, struct i2c_client *client);
 void sec_pmic_shutdown(struct device *dev);
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic);
diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 41b09f5e3c49f410604a5d47e625cbb37d7f5fa2..2ccb494c8c024361c78e92be71ce9c215757dd89 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -27,7 +27,7 @@
 
 struct sec_pmic_i2c_platform_data {
 	const struct regmap_config *regmap_cfg;
-	unsigned long device_type;
+	int device_type;
 };
 
 static bool s2mpa01_volatile(struct device *dev, unsigned int reg)
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 79b4f74b05a24e413a84ff8c0b16156a828310e5..54c674574c701eec979d8c6a94909b78dcc77065 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -449,10 +449,9 @@ static const struct regmap_irq_chip s5m8767_irq_chip = {
 int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 {
 	int ret = 0;
-	int type = sec_pmic->device_type;
 	const struct regmap_irq_chip *sec_irq_chip;
 
-	switch (type) {
+	switch (sec_pmic->device_type) {
 	case S5M8767X:
 		sec_irq_chip = &s5m8767_irq_chip;
 		break;
@@ -484,7 +483,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 		break;
 	default:
 		return dev_err_probe(sec_pmic->dev, -EINVAL,
-				     "Unsupported device type %lu\n",
+				     "Unsupported device type %d\n",
 				     sec_pmic->device_type);
 	}
 
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index c1102324172a9b6bd6072b5929a4866d6c9653fa..d785e101fe795a5d8f9cccf4ccc4232437e89416 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -67,7 +67,7 @@ struct sec_pmic_dev {
 	struct regmap *regmap_pmic;
 	struct i2c_client *i2c;
 
-	unsigned long device_type;
+	int device_type;
 	int irq;
 	struct regmap_irq_chip_data *irq_data;
 };

-- 
2.49.0.604.gff1f9ca942-goog

