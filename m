Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E844194AF0
	for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 16:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720628743; cv=none; b=U57AF4gSaLFvktRUcMUSEc21givZdzvJH7FCOaMLHrMw0usz6fg8QRIq0p3U7DQLU6LasHud065wFagqizPmMxXVW2Hpn+2ieOR6v9G5nNWy0UGEk+z/u4Iud6Ks+m1kcnLUjswdE8DMT30Lk4KX2WxacbTSai+3oFaoKxAk0SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720628743; c=relaxed/simple;
	bh=leqWY2m2s/OnXBwNz4GSKae8ZvHNnF69+cyJbS5K14c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LxvKI5VgKdmkO7gOtMQeV5FhzGD/RSZsRGAFH6Uz3U62Ty8cAqxu8D98EQwet+tjIlld6pjTozXtw/YqZmJtQBKveUK2DzHkCA2KO6jeO0mBOqMCMabcL7qY1uFnsd4qLUNV38Rtma9TA00Ag636+LxkLZDKHha3AbFQFnp3csE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vdAdAtOl; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vdAdAtOl"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42660b8dd27so27409405e9.3
        for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 09:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720628740; x=1721233540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cy32ICucHSRFg8Zvj0U3F+/oAcafvm3gP5oJRBTbz3s=;
        b=vdAdAtOlpwHOxfULAOXVoxPT7nuF8t0hkni04Zq+lwxUhbU9/2mJbvZK6wso0QbTEV
         cSoNbgl94iM/xdV7VHrfjmzFVET9MZoahz2qYJCbPpUcM+Pf69iMj1Nf85E5yBmaMp3N
         AYJB8oOkz/oOApEQf5kU1s61Lgt/LOjT4ARK7v8kAymtMgnFMFdrg7CuApuIXu4WaR1Y
         1+1yPop8IFbinCr4WLh/nZjWFhyceZL5jw/g7Bnw+AI81+QB6F5qP9taL3UbEdoRkSbW
         Zq8/pIit9vl16VW9pzUeNeZssFbrr1OC9NhLtPTs1GmBzijM/R8Iy1u6GH+SPkttWVHw
         1sdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720628740; x=1721233540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cy32ICucHSRFg8Zvj0U3F+/oAcafvm3gP5oJRBTbz3s=;
        b=JH8RHJDW3/XXm9OIbACcw+meqkz0Rm35ugmUZkVlLTLNRtQvFhJmPe6cI063yQcv1l
         gSgSb91LOMPdExDo6Lo6kWeQmUktXFRSc9sSw16tq/2UUcDru94Fy6SHzFxLPNL0CIhJ
         NkMTlz8DKDCMvqEhVKQsKc4l3uC9Y6Nj5TvaSZBnnakp+8y0Nl5w4XNyBbT8AAs45QR4
         vUOfKTtcKrBG8TMZ7p2rjmmCshVTFTc4XBOieOtFCxxgozXP2fgW03xpik+MjZI0NX11
         ogkPRZGmv86+/y6S0+cNiaPBHNkCm99KoV/W138vMCmDsgPEXEKMW0ND7fPZzj3OTA/4
         m8fg==
X-Forwarded-Encrypted: i=1; AJvYcCVGJ9qhwX40yAT7XafLVvvnmaZLZ/7U67H0f3VKF6mTJnpnmNMnl4W2xuoI0680yoEeO0nfW49bXOVeOeChLvAvQ86NyDdNoUzr
X-Gm-Message-State: AOJu0YzO1vzBiB1XD2UZuhAyofAVwLnASwXJVPcC5DG+6rrY+8gMS+hy
	rVYr1DjGHGam0yDcDK1KzgYGxKlchg+oeQ6OWNtlU7KDiPwkViEL2bd1cAII3oM=
X-Google-Smtp-Source: AGHT+IEuVqr7vAPRyxsPi49PFNqWl5DSKnIEvhUozJ1PVrnSPX2EIlRX+Aqw6wjznRQ9Dov91P/Otw==
X-Received: by 2002:a05:600c:896:b0:426:5216:3254 with SMTP id 5b1f17b1804b1-426708f1eebmr46095795e9.32.1720628739886;
        Wed, 10 Jul 2024 09:25:39 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1c99:6356:8466:36cf])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4266f6e09e5sm88693815e9.5.2024.07.10.09.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 09:25:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 3/8] reset: amlogic: split the device and platform probe
Date: Wed, 10 Jul 2024 18:25:12 +0200
Message-ID: <20240710162526.2341399-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240710162526.2341399-1-jbrunet@baylibre.com>
References: <20240710162526.2341399-1-jbrunet@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

To prepare the addition of the auxiliary device support, split
out the device probe from the probe of the platform device.

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

