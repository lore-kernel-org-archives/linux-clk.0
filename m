Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B911EA7C3
	for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 22:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769591; cv=none; b=CExCjvgj4W1hivQ/uZ81/l6x72cF+3t/KPpXAln2Ism82CSTFw+SH4aa4Nes0z5CrlZeG5PZtftQBtoAApbeI/lfHJp0fOmeWbNOm6G0364nJyBajIbxaGzo9AHj0fnSL7x948feL8US7DcKdtmiNjmUhwB5Y9zTY80NIQJsIE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769591; c=relaxed/simple;
	bh=JzkdkeBjoD27fDThowAsLW8EIMXc8+ZDmGc3PzCcN1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RXWdFYz0SUS0HZXIRZwabU9dx0oSuURcpFxylEV+B61cHlzJYZSFZfZhRbdK2tX3h2Y18peevFmXkJNXej/IWBTk7tFNoEDK1524aQKP6+Eis23M/NAb9Y2xsUmphyF82lARgTFHNkg9oXJWCqjreTMNu5cAhf7HsCrsSRpDsro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cWooRd0l; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cWooRd0l"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso838517666b.3
        for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 15:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769577; x=1743374377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Z8QgNOGdyxdSVBJRkjlahCtXXFXCQYtK5J/GCQaRwI=;
        b=cWooRd0loMHH/8nAfMH/P78842SkwtNP2Rw5WfIHBTZf48+RqfYbZ//N3gRauhHM0I
         ITeVKOLt9YV1EJruvPZdpRGmrR79yg8Q7h5TATc7g6RCk7lTYNs/NQnRbds4Vuh8EdxQ
         q3FBoNGeTVyHuN03HTzYHddpPEeIDvoRISuiGCtVROc76p3XYyVyUmoCWMlvjPjZVJm4
         VTQkVnoYJVdg7E6ksa9mxXZM9X1KUm0QQm2Mu5flcs8QylKTU2PpBKbxRZoTXf4W0hLi
         xvw2ieHRVVqTd88zuf24XR+5Z2qnCDgQ+5coOJJnRfU0HBzpgso6R2nfX1QkRQr8qIcZ
         VHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769577; x=1743374377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Z8QgNOGdyxdSVBJRkjlahCtXXFXCQYtK5J/GCQaRwI=;
        b=XujWLtipvbdtwJxP8b1h+IGvAbqBp7UUUFD9E0XdW+uXVtPbJIt14xN+9A0DBCvrBM
         0ayAyoSCTD7g1N/Bxl5dc1diVLwd3Lqt6/pyNI1RKmwxW11hwfZstWjcfsJn/BlvzbmM
         Ve1Fqte/JLEEglelBtmlQCM7X8SIwEDA036LvLnLUMCKD9st/xNN9gMfQE5BH13YhvsY
         GPCf6DywzLMmfEImkax68x3xaCSQav8Vv4bLi0BbMLWBZ2QnLxKpXym8SP06XSjGnCq/
         zUJ1JsmRRdQvWq7dOOQ/Ks9LwloV//kXMcwkW1nPzj1m5G5bfxfKBihHV8+fx7NFILod
         Wi1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJzjAnU9vMs5VWqhvX6YUJy9DSyuCEhqqYvO47fwt3IAMlFiCDizaNnNxerMoIWZ0WDvD4EoxuXhA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdd7l11kUhZH4PIwO6zan2zhiSgbyfYNE+kjGi6sKzOXvUdS49
	VYUvHvpAWeyGZqDr6wF+4zx1E9sN1yv2z6eZ+BdbaF0AtsOtQmf+qD+DZXbypJ4=
X-Gm-Gg: ASbGncssnrL1T7H6jk22wABPwG99dHvzvNRdSNwmgTfCL7SZDtiot+mAMQT/VoBvlkm
	/IWt/MS3sDwcTZoALr3PgUv/T0v53pFpKeWuzWiB6zD2V24ntYlNan78Yd7PQg2Lu744vEC8Wi7
	NPpI8KNY4116b44UYdMBr8adN6+RFC3t+pK1ohYohSCQpECR7BQK1AdhbPTp1K/1VEaFxSqtdAR
	IPEr/Hnk3zpFr1U+Q5rBPkWCzIrsSCHfJp0WCKUCCRHTmmBgQpKPnKSW8F4llShQ0vHWOKO9/9N
	EuQG8WbrzPy9YxjgwqG4cTJIr6CKnU8I3vaydYAaQaAkdv2Vcdpq1CFh3zmPhrCNhqxwv3VQ715
	NEbawkKpZXFMyWaLjpg6fIWPZB08N
X-Google-Smtp-Source: AGHT+IG1+wcYan4wIw2G87vBZ9kZLmE/4EPPJ6sSCzBbDr/N/WxDb6EjTSy7GHnKX+cpVY7JCrLHPw==
X-Received: by 2002:a17:907:3f9b:b0:ac2:63a9:df0b with SMTP id a640c23a62f3a-ac3f251f206mr898500466b.35.1742769576773;
        Sun, 23 Mar 2025 15:39:36 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:36 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:38 +0000
Subject: [PATCH 22/34] mfd: sec: don't compare against NULL / 0 for errors,
 use !
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-22-d08943702707@linaro.org>
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

Follow general style and use if (!arg) instead of comparing against
NULL.

While at it, drop a useless init in sec-irq.c.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 2 +-
 drivers/mfd/sec-irq.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 48d5c9a23230d0927b9dc610166ae3f8f1aec924..90225b683fa083d4df7a20dfaa4f47084051e250 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -140,7 +140,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 	int ret, num_sec_devs;
 
 	sec_pmic = devm_kzalloc(dev, sizeof(struct sec_pmic_dev), GFP_KERNEL);
-	if (sec_pmic == NULL)
+	if (!sec_pmic)
 		return -ENOMEM;
 
 	dev_set_drvdata(dev, sec_pmic);
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index cf1add30dcd0ff1ad149b483fe40edf82c2b57e1..084a40490979058b48640263ff5cdb38765b9ff1 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -449,8 +449,8 @@ static const struct regmap_irq_chip s5m8767_irq_chip = {
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 {
-	int ret = 0;
 	const struct regmap_irq_chip *sec_irq_chip;
+	int ret;
 
 	switch (sec_pmic->device_type) {
 	case S5M8767X:
@@ -497,7 +497,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
 				       0, sec_irq_chip, &sec_pmic->irq_data);
-	if (ret != 0)
+	if (ret)
 		return dev_err_probe(sec_pmic->dev, ret,
 				     "Failed to add %s IRQ chip\n",
 				     sec_irq_chip->name);

-- 
2.49.0.395.g12beb8f557-goog

