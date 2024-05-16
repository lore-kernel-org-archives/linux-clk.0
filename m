Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C913214C599
	for <linux-clk@vger.kernel.org>; Thu, 16 May 2024 15:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715872134; cv=none; b=Krxx65jlr9NgJ2LPmkBKo/Fn2kePLIdy9JIzt/juTi8UzdrRzcf7H7uz53DvkjIrWT+74Oz7EHiHwWutCIAnP+pmJMlbbyRKsnPu8MwURXYPletSFMYCL62GV6CgK8jlFm874Fvo+swg/HgPPnM05Vl5O82R9kSuFgCfrnyDno4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715872134; c=relaxed/simple;
	bh=GPIkBbQj4IQYkRBMApjzbDefFG1cRgF3e6hKKqXUa84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pVyMrSCmYq++mU1dBwdN+8QrekE4Vyze7wmsm2tIj9KIR76ecF33/KmqYH7/BNJpg8hNRjdLkxZEQLEOeM1ouY5+Xy+uRTrD2t+8pYB/Nnm76fDU8JYbl4DSs7RPmhpDQWmkwmxPWCLYXGMIMAUa017o88yOz2zHh7blWAtFwg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=p0S5dnGS; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="p0S5dnGS"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e3e18c24c1so10088691fa.1
        for <linux-clk@vger.kernel.org>; Thu, 16 May 2024 08:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715872130; x=1716476930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zlq2XgSsulaEdUEoiNJy3+0ETTvrLEFhmOVX/TPKWFg=;
        b=p0S5dnGSdMKtvt45zX7xJfOn2ceBCsFzGZqPG3stB6jWb7rrlM+4+rxT7DlKbC6+sF
         Ze2uXr2DDZ8TzsgSxICYc0pwUU6CVokQnzW1APxdBYqRIzLG69wsDyud92ge1BRoi4VU
         HsXXOMd80A8csNv3JU4mNIHyqx2ep6uCAvbcqLzja1N6iOYkx/dhbKsSePcxXFmXQWW2
         UyS10NhCMqXFtfjfxTlCzg+nCHV2Ly/SW/W6pL2KpiN8NDP/+XNAKzkPgwxT1Ua7KdXE
         f2TdCKVTGuPxMnOHsr+KjiMVysnLnPkC+TFeig89Cprqivn0JwMSdgxGjPrBTABQjQO5
         A6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715872130; x=1716476930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zlq2XgSsulaEdUEoiNJy3+0ETTvrLEFhmOVX/TPKWFg=;
        b=YeIr0Vs79O8umfggYnT1LBZc29g/WdacWUmIGp4RTNsBAg5ZK7PJpjjSGqV/WBM5LL
         CVW3ZmbjY9d2kPT2V6uhRHxLTMLbbFA4mN5aho0LerrV75CdeK7+JmT7sh8PXcLmpcI5
         70qVXHFvmLIqg8f7WsEXdE7KwtEwX3GwsxyvM6xzXeqqltZRzoWQXJZi2zfpvNzhhWkP
         R0IETbW6bg6ZV82igOKZtqu1JttLcQfbxh/mhMCQ1cpbCg8CSRbI74+NDydw7zNAY5/y
         7OR2FRrLUyNnIXk6nMGZaGgxxw2sH/CoPh3EPIvjn05JkRp7UVSWFJ38UkypRUNcuveF
         0h+g==
X-Forwarded-Encrypted: i=1; AJvYcCVB9icSSprq0zlanyWCTip42ssRpQHX1++W5u1In7z1SuJ6g8CA37xYteKinOHljI6rCP3ETT9GDvgnyiW+iydZnnp/i/tVfQMJ
X-Gm-Message-State: AOJu0YxeExvHbN1QhQ7RIahOFbsG5jIVwe0YU2J9ggXa5SLAZ5VWUFOI
	stXvncikXvU26R1QulbCZYoySSmX//H738DPOejpJJzegdPO6Xxc/TEKJRT4Www=
X-Google-Smtp-Source: AGHT+IHr28udNSRatyT+2G5LNG1+hGVEMFrX9RhYuqKy2yHAm390/4kDGgRKQKwjLoGX9pVtnsJ34g==
X-Received: by 2002:a2e:5112:0:b0:2e6:d2bc:1d18 with SMTP id 38308e7fff4ca-2e6d2bc24e5mr52015521fa.22.1715872129966;
        Thu, 16 May 2024 08:08:49 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1fce:7e5a:e201:edd5])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-41f87c25459sm309351725e9.18.2024.05.16.08.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 08:08:49 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [RFC PATCH 3/9] reset: amlogic: split the device and platform probe
Date: Thu, 16 May 2024 17:08:33 +0200
Message-ID: <20240516150842.705844-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240516150842.705844-1-jbrunet@baylibre.com>
References: <20240516150842.705844-1-jbrunet@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

To prepare the addition of the auxiliary device support, split
the device probe from the probe of the platform device.

The device probe will be common to both the platform and auxiliary
driver.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 55 +++++++++++++++++++++++--------------
 1 file changed, 34 insertions(+), 21 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 59126c9f194a..fec55321b52b 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -87,6 +87,27 @@ static const struct reset_control_ops meson_reset_ops = {
 	.deassert	= meson_reset_deassert,
 };
 
+static int meson_reset_probe(struct device *dev, struct regmap *map,
+			     const struct meson_reset_param *param)
+{
+	unsigned int stride = regmap_get_reg_stride(map);
+	struct meson_reset *data;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->param = param;
+	data->map = map;
+	data->rcdev.owner = dev->driver->owner;
+	data->rcdev.nr_resets = param->reg_count * BITS_PER_BYTE
+		* stride;
+	data->rcdev.ops = &meson_reset_ops;
+	data->rcdev.of_node = dev->of_node;
+
+	return devm_reset_controller_register(dev, &data->rcdev);
+}
+
 static const struct meson_reset_param meson8b_param = {
 	.reg_count	= 8,
 	.reset_offset	= 0x0,
@@ -125,46 +146,38 @@ static const struct regmap_config regmap_config = {
 	.reg_stride = 4,
 };
 
-static int meson_reset_probe(struct platform_device *pdev)
+static int meson_reset_pltf_probe(struct platform_device *pdev)
 {
+
+	const struct meson_reset_param *param;
 	struct device *dev = &pdev->dev;
-	struct meson_reset *data;
+	struct regmap *map;
 	void __iomem *base;
 
-	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	data->param = of_device_get_match_data(dev);
-	if (!data->param)
+	param = of_device_get_match_data(dev);
+	if (!param)
 		return -ENODEV;
 
-	data->map = devm_regmap_init_mmio(dev, base, &regmap_config);
-	if (IS_ERR(data->map))
-		return dev_err_probe(dev, PTR_ERR(data->map),
+	map = devm_regmap_init_mmio(dev, base, &regmap_config);
+	if (IS_ERR(map))
+		return dev_err_probe(dev, PTR_ERR(map),
 				     "can't init regmap mmio region\n");
 
-	data->rcdev.owner = THIS_MODULE;
-	data->rcdev.nr_resets = data->param->reg_count * BITS_PER_BYTE
-		* regmap_config.reg_stride;
-	data->rcdev.ops = &meson_reset_ops;
-	data->rcdev.of_node = dev->of_node;
-
-	return devm_reset_controller_register(dev, &data->rcdev);
+	return meson_reset_probe(dev, map, param);
 }
 
-static struct platform_driver meson_reset_driver = {
-	.probe	= meson_reset_probe,
+static struct platform_driver meson_reset_pltf_driver = {
+	.probe	= meson_reset_pltf_probe,
 	.driver = {
 		.name		= "meson_reset",
 		.of_match_table	= meson_reset_dt_ids,
 	},
 };
-module_platform_driver(meson_reset_driver);
+module_platform_driver(meson_reset_pltf_driver);
 
 MODULE_DESCRIPTION("Amlogic Meson Reset Controller driver");
 MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
-- 
2.43.0

