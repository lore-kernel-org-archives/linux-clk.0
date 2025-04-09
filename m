Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40CB219312
	for <linux-clk@vger.kernel.org>; Wed,  9 Apr 2025 20:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231072; cv=none; b=Zd8boCw/JZtR9Zwu/1ahQhi1IYCiHwc/3EgkR5kvNA6vLPae+BfRii9A/nzDvQCL2AkcdtwmToald/f/mJ8COo6x/IyAUlVnBRK2jDT2PSKUQlKxEnfwV8BWSjWrfPP9kgOSyvz0ms/72+Feuq9PTNKusI4e+AveRShWKBkDQoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231072; c=relaxed/simple;
	bh=+hryrykXS9VQjW9x2uaLv9FXNLWJHO9HAediWJbl+4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y2Nsn/Y7qjZvoPvzUAdtnuwXDMzbmvjEb8QnA+hubNGssajods7Jwkkq6yCejRdS4Dz6fevdZ8b4RlxGMhyQckIktnUpLIriEW0eOdW7mnodMTJ/1bZqFCKYQEKVfyyTbtKaBz0afsBm19ejdnBUO4C9mCNbSurJT6aZMkQyjPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e+6DrJtq; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e+6DrJtq"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso198587a12.0
        for <linux-clk@vger.kernel.org>; Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231059; x=1744835859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jsTeSqRDsCA5+cibF5ZIdcCibqmvRgKvrsS7xjyPMNg=;
        b=e+6DrJtqOp556vcssHT+q3B6i4qOa9LWOWl115rrXNQXL/128L8QSZhuhFRvH4nXCc
         IQnYgA3TCRYUSfZsMOTOwaOdsRmojSclYyGBhNIxJk8PqUu0KJ1iY5Y89Bu62ErH+4E/
         8NPnOFTdlLGC10zyRIXXlMCZhGNSbsHwxtgxmpEal9oXXaI034xXvyZg8v+u6c4adCSA
         GQNKoryE4r66GBb3IsIRxHtKOShhVHMUas3f9TRNVBggubcYLjErS4bH09Sy//WmykoW
         kLXlYKgBxgU984k0nLK41F/aFF9rMO9UqI42ESVYIG9kk+3bjaTDvxkAFPHQ8MnalVhh
         8QwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231059; x=1744835859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jsTeSqRDsCA5+cibF5ZIdcCibqmvRgKvrsS7xjyPMNg=;
        b=LbWPHDaMO6pgNPzhrAGFvnO7bYqOhaQ1F4TLOfh6NcqMT0FsDXF8mxFI1IbfBRJhuP
         1jOVI5ImZRIY9bePlPqJ2WeNUMpLwGO7ieVJ0Vg+0ceD18k1wXdDMYAPtA65VTm3IweP
         ztXBBOajw5LrM0DNwO5NLUA3jnLLVSmUbbQ66LUK75JkPSxkHNfa7BGqzcUNfwQg2qtp
         rqmsctpyqkawujRC4ykQ03SfvuQho0zN1GZmzidxDgVqh98oEMf5Hi/TmFY8dhXXJ3WQ
         +oaW+sy7wIVBD79i20+uMM6XCthc4fbpVAKPJl+3fL4R+7K8PJ4+9DGPTNMrfA0JPGuA
         oc1A==
X-Forwarded-Encrypted: i=1; AJvYcCXJ7Gdsp/rQ5s0qWl9eQ8SXw1qmPd8ifrviamHK8Eg6HkyyOTKYYM49tsV2rmSVXMjyCFA+sGAEB74=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHXZ4NBTaJZ0wKJ38VI+EllHrIfkFJCaNEwijARVA+wpfMJZTZ
	s8zWS3Nq9xy+Vdj+3bcxM56I8crl8Y495tc/WQZWjx8OVCXnTjtJftrtoZAS7F0=
X-Gm-Gg: ASbGnctpG78e+MsawR0k30kz7crgbpYnln7OTL1+dieNhNuegmxzgj1mWjJXEaFCC0E
	xph5oYjGKYg1ERjJiLmiXXHPKeAMaANpgObVL94lGiOYKmnuzkP0PzKoCghQ0f0GRzGvmOYv7/a
	G/iyKR06bcmlswTKZbGECaT+B8wsl3s1OnpQ0e9rHjbh7nolL8jfD8x1ck8Ua4+016Wk+3d/U4V
	rz+HvsyY8KTyRpWE2s7o/9De9FGiHNmecghaow/DlyBuAuI5J/gVcZsA/luwxo63qwIg/VJYHrd
	DSY47Ghraw2W6DErgXDNDiLTUczhTtp7xCWDDYtPNf5UYBL0kDKCcWdsctyqvfgkH/mbQl0aLlR
	9IVOFeBZXEI33ZqQ7rhxrc4L6qY4=
X-Google-Smtp-Source: AGHT+IFaBUkiGU7OFSd2C8+eXihngB2V9lqLexzEyqiPbNYC3ushPCaeGAspEyeXYhQ5fM5m2o3CBA==
X-Received: by 2002:a17:907:c1b:b0:ac4:5f1:a129 with SMTP id a640c23a62f3a-acabd1dda12mr11931066b.15.1744231059324;
        Wed, 09 Apr 2025 13:37:39 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:38 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:40 +0100
Subject: [PATCH v4 19/32] mfd: sec: Don't compare against NULL / 0 for
 errors, use !
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-19-d66d5f39b6bf@linaro.org>
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
index 54c674574c701eec979d8c6a94909b78dcc77065..4a6585a6acdb71d2fb368ddf38463f001e513c7c 100644
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
2.49.0.604.gff1f9ca942-goog

