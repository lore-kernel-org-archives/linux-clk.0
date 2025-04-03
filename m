Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1416524A053
	for <linux-clk@vger.kernel.org>; Thu,  3 Apr 2025 08:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670761; cv=none; b=GCJb4Hzrb0bwkiCufGwY21E2VbJYxD6LaDwN5MG6vMUjlgSvJ3m7VbSkqjIp7T7mh5kr0mfHr89aS0Gi1e5cm6bd87FVBV2zcGRBru/L0ekJexRVL1w3Rcjg5deb9Xzflkt6u1n0+gYFhaXM78BbnQmC4KnCHfrK6zHc2v7VSTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670761; c=relaxed/simple;
	bh=bllvwGesgocAPfPa0BvtiRJ2XbMS7FrEApqy00ZsPPo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Om921p9FBw2gw5Q/EtClN2NKwZskIMKtpJYoF2PXAR7YTw2fe3bewHqjfS1NsWNoF+uCJKqrQp0dF1szXJd6NRq3CmRa2MbIeR1u4eTS0vIAc26KVAoGEs5xoSThqhe9fLsNLVzUDfs4Hs3i7DYRDRp4d7gxfxK+404thqonAgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PWR6o2sH; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PWR6o2sH"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso1131721a12.0
        for <linux-clk@vger.kernel.org>; Thu, 03 Apr 2025 01:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670751; x=1744275551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZ+pWW3wwfoO36sbVjoQMpP7epgDk59E8mIno/3xwfk=;
        b=PWR6o2sHqfKlE52pGxQ6nvDwYPz3CPIsHrOarlJ9HgaRtlTIHnf62vxvWsYJOiVFcU
         Vi8Bi/Y2DFThyRjtR6vNiggomRAYOpD4dSymCjJSfALCB672k6brKMjtIwS7RVC7AGdw
         0aCsIDqRblRmEhIao5bUaf+NuTnfnp6kDDZK4WRdZvW1L2beo6Xt5CJ/67Adp3YzzkX2
         jTkIz0/X3BFIfgrtVGPdg/TPs9zEG/5Iwpg59HEGmLwhv4lqlrxwwVAT5Xn8a52hXJa0
         HZWAd+sbuhVcSAZdkVMmidglSaN9kNa8h/y9OZXW4tnnGXhhvpkXB0Pmhm/ZOzOOGCkB
         uHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670751; x=1744275551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZ+pWW3wwfoO36sbVjoQMpP7epgDk59E8mIno/3xwfk=;
        b=MpImRCzzWyHv7GLxzK1JXfAmK5k/T4bJZmdyTRAVLxCJPLjZQXCR6UDXgMHZkyZxIq
         M8u04hTZA8I50O9/+Wh/PbIc+lbntk4t6ftle0GSBACNhtXHEumDmEIwXMlgPS80Edrw
         NHMJh+10WmKs296rHkxKo/GRqxrqxR8zDqukdYoltjs9jiAvtnjzhb/+h440yRIw9SjJ
         s1bRL67TWO6nSIo0LFdFvWDgSAXD0WyqfNqSAz09VulPOXkKaT88sF67fwP70tzP0rUv
         CTxjZsfJnFZb0QTc75H1+Hl+TPuUxHdpHNsmUhVvTsoHSl8Q+MEXlQ8U5UKg01m8FDTi
         XUFg==
X-Forwarded-Encrypted: i=1; AJvYcCWeQuSDoVfj0jGmAHecbTvR6BywaKoBeBeXq/lO44YztCOoBKttXX0b6XjOBVsCJcWBVYW0Bb9f688=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCFKsHShnj6lIauiMhfj+LQH94f95CkIc/KcQJvZ9Y/vZx6o0h
	ea9Wtc4so4ESYymts1kwvkFr3orAAv4xt6AA7QnnOz6yoXfx/bEy/Cyyx6uBB9o=
X-Gm-Gg: ASbGncu5YpzCjlA3dRI4jLmis4SQ02t0W2A5p1T8S98FAMQRJh2t6C2RWjMSHMwHTuF
	DMJpwRdHX6YKzu7w5x26x2V083IUtyvJSfAb42hvd8IU3+xYO2YJHnH4wenm0GSgRmcefT8PuB7
	ZeIdyMCe+9yjvUf1MKeMXJySMagK2dzee4jQGgajQ7IYpy/gskUh35y6gsjXp7l18eDEPyeXi/n
	iq6YRrtUh4tvzjnERMzwGY4828rwc1ryoB1HYFporYb+gXY4+iOp17ZPwnQ9HTeLrhZmrZNdLfJ
	i5xPuhGgtGe7qfq3RE7LJvUlCIFicWwaRSv+ck5mq3wLPIv2ulZXz5xjoeivlEvclETomaaU9/X
	cy5rf62b7D8VJ3zw1R9ojGFRYRifN
X-Google-Smtp-Source: AGHT+IEDq89x3CpslTyM0zp7dklQdXkDh51EcU1TCoWVePJqp1R3stB2nQM7HgpHJAOZguo5Gm2LWg==
X-Received: by 2002:a05:6402:3204:b0:5f0:82cd:500b with SMTP id 4fb4d7f45d1cf-5f082cd5216mr2774791a12.19.1743670751382;
        Thu, 03 Apr 2025 01:59:11 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:11 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:10 +0100
Subject: [PATCH v3 18/32] mfd: sec: change device_type to int
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-18-b542b3505e68@linaro.org>
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
index 79a3b33441fa5ab48b4b233eb8d89b4c20c142ed..c4db58813059f07372679223ec570ed07f52cd73 100644
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
2.49.0.472.ge94155a9ec-goog

