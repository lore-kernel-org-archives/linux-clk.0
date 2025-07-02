Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E0230E85E
	for <linux-clk@vger.kernel.org>; Wed,  2 Jul 2025 15:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470058; cv=none; b=R04nBKF0v1ZlLbDPSVxQYAN8Jy5+wgdvzPz2DBtlC4JJNXccPog7K/IZ5jd9MZ7GXQHv0pSynPyarZ4J6Scz0C5bEFDQLbL4e8yu02oiPaC1WratiBljj6iLPbeE+Vm5LO94LmhQaDbqDo/TaYuRU1G1pqNVok6Ax+tnksF7Sow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470058; c=relaxed/simple;
	bh=qq/eL5yEAoN3nScD76VoSuqGaNhQzBfh2eFMxTU6NCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cm2JBBJTboktzXWOg/uXyKXorPKR/h+ETIpyuADFdGhMhhzpHkhE59Mg2hOI1NGeZiFK6kniAFR36jhH7y8Y76gQDyjaEerJMLSBoZWW2VghExRngE1brXl0JT4lq3wTPzauaD3dDD+IQUX0gr87deLrCY5qmVgu9v9GtR4G3hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vMZvFnt8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vMZvFnt8"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so25207895e9.2
        for <linux-clk@vger.kernel.org>; Wed, 02 Jul 2025 08:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470051; x=1752074851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=es+x5B23JLKMVFmXzXLfTung7wYY9JNA5Dn02KTo5Ok=;
        b=vMZvFnt8aFVMeOzS6QPUFysCJLqGa4/eh73W/NgMMMkHDR0NPqPX0TrP5Qf7W2IS+j
         PGbVp10LSxHfxBBU22GtRWw/Fq+TpLPAYYpWshtg2Cy+bPheexi6sd4y47sBdufkNimA
         dHFqSF+0FOuPRqlPQCRdfQ7ei8fsBAS6ewg5mRolUbOQDOI+NT8/cwPoa77uFGd4NXJO
         LqKQ+78O5lztA0SCF2r9W1WxEfGcogJJqkRAI+AhhRCIDvsf4eK2LaiFL4wlj6pQx+7P
         ltqfi9dahD+jDva3W6LOUENx0t/TyfjklulhXcRQyjemzmauYUuurZ7Bz1Y+WWyNJqpN
         UfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470051; x=1752074851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=es+x5B23JLKMVFmXzXLfTung7wYY9JNA5Dn02KTo5Ok=;
        b=lmHGJZdEfHFggDt0e5mkDUFRR7nGIDhF2g0DqlvjuaWnqjCXnaJKzNBQv+F7h5cQhh
         rkoMA6oLmHA/+fI5aIwSiz1QOwzushLAzY447gZ4p7HPdjPB6Y5O+NTHZr0X3sASZ99w
         o++sgJApdxmDZ1wYeXPsv4RSAFVGRkMxQla0rIq/VoTvahE//kR97RJL1mdD4cV0o8kn
         5Q5UeK6eRQfA0vZ1BHFxn1lJPQuV808I+zZCDha3uV96PYIgk3iqiMiDNRAGzL0vJOu+
         WtdP52u37SlUnfZdYk94rLx3aYpG8wyicwCeYjX/HP9FBfTO2G2VRg8yccL93eSQ1rTS
         XIfw==
X-Forwarded-Encrypted: i=1; AJvYcCU3y/oXwXY5PPX2QERLIifdVRcjHsjtXgcN/277WGch5PYWPJwEH2EUD7i/+W4/VPFaO2PPsaY3+cI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfvKIRJzjURevTP1precTLYfkPXobZgWbIqYzmD/ZQHnCtilbU
	bHQ1CBk97tdoLw3oG+uNN1m5p9PhXJqnHHKVHBqLx6OjX294StnUSP5vsiJfxKH2c/4=
X-Gm-Gg: ASbGncskIrEzhLz7CBbMdAXU2wGPVKc5xyu4vrGXWxilTvgEP3/CCaX9pdt3ePt+9BM
	PxQ7FhsXB+fng+zbdk5s6B3jRUl1cqCA9LeMQImbRhU3jLQVQqZUwD0cUgJUOkwyn5B71ii0//D
	KwwkJ/YX5pFHbTbGxw2ZgT6mPh3KEl1aBpOuyNuxQ5aB0k+j+Hmhu63+qmJKyXxOGusEYIX8X4v
	Cg2w1XeZY3Njm9eGQyA/hcs7yrZQt8j/GcnfYmR6QMhYt939O7G5VdUiCqTD6YSoeNg9sGU2qz9
	QqA6vL6rnnJE4txtOdwK6EVCp+usCM6+PxWVSjCVe+GwZyiTqlB4Enmkuf3A26s7ceZTGtB6+wL
	H
X-Google-Smtp-Source: AGHT+IGX4dE1voKiDwyjnUORRRh7YQgAyFTeQD1J30/5oQejkmnnEsoCststyJaHIDp9k8z8kp1MWw==
X-Received: by 2002:a05:600c:348a:b0:440:68db:9fef with SMTP id 5b1f17b1804b1-454a370c56emr30812975e9.20.1751470050800;
        Wed, 02 Jul 2025 08:27:30 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:15 +0200
Subject: [PATCH 17/26] clk: amlogic: use probe helper in mmio based
 controllers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-meson-clk-cleanup-24-v1-17-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=16542; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=qq/eL5yEAoN3nScD76VoSuqGaNhQzBfh2eFMxTU6NCM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU/G1wQecKycDnO1spbfvtJ48I3unHPu1uMOw
 gB9mmnNfbeJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPxgAKCRDm/A8cN/La
 hQ3+D/4vHXwIXzTWUs+tDJDM/gzixWqj+YMBu8PVXrk0J2ot5UTL9B9UZNbpNVIChgsfFpZkwUL
 fjKVOW2rKRy2R5EjWwV4ajUdqRulMd/kPB3jN37jwP19qRP1yf6Do4Z4yoGkhrU4VIbQuPT0iaW
 FqJ2jNcM3hSuBUw7ZFYmeZ6IilsUH41JboAQyfudshuLwcqkbHCnSbB17W/mUIT7GyJzwK9P4ic
 I+zx7Ubiu7glMAtenideKNE1i3NmJCXJYdb2Rxb4FOfrIvX+S1lKkKIkYasJQ4IwuWr6lb80XCe
 vGiAvyWi7+6E10Z1272xE/OMWhqj2J0JAcp4zbNbJhe+YgYlB5b4aiBC07azGotXhp1+GtMzjKk
 v2AMZwuPf6ie3rXyfmbREW0hJOyWkcLYG6Ty8/nvMoPp+SB2WtsWoml3KSe2Wj7H1jq168lEqG9
 abcLL5zdeZ3oUlJJdKepGAy0GM9/n3gyOg3trmbNHtzlQfMWV7J4Xg6LRowyNIa4PDCGyR1WtMi
 3N6dJMKhDPuE5kg3GKA9MkQpix2QeymLCZ044mEzyWctOFL1A8suioOlb+nnijYEYeR1tSsXnGB
 42IKDTVJNT6p3J8nd0U5NFHAzTQJXkAQf6vkAHW5Ypzp4w0oDS5bamV5kG1KLRvhioI6Drz2s56
 1bI3FxGy42nwfaw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Factorize the probe function of the mmio based amlogic clock controllers
using the newly introduced probe helper. This removes a fair amount
of duplicated code.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/a1-peripherals.c | 52 +++++++--------------------------
 drivers/clk/meson/a1-pll.c         | 52 +++++++--------------------------
 drivers/clk/meson/c3-peripherals.c | 51 +++++---------------------------
 drivers/clk/meson/c3-pll.c         | 49 +++++--------------------------
 drivers/clk/meson/meson8-ddr.c     | 57 +++++++++---------------------------
 drivers/clk/meson/s4-peripherals.c | 49 +++++--------------------------
 drivers/clk/meson/s4-pll.c         | 60 +++++++-------------------------------
 7 files changed, 66 insertions(+), 304 deletions(-)

diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
index 9e352dba54775c22126ee8bf7861ee1d981d6c88..b2feb8fe4775e38a17d8aa9ce9b992b3e1fb2bb8 100644
--- a/drivers/clk/meson/a1-peripherals.c
+++ b/drivers/clk/meson/a1-peripherals.c
@@ -2057,54 +2057,24 @@ static struct clk_hw *a1_peripherals_hw_clks[] = {
 	[CLKID_DMC_SEL2]		= &a1_dmc_sel2.hw,
 };
 
-static const struct regmap_config a1_peripherals_regmap_cfg = {
-	.reg_bits   = 32,
-	.val_bits   = 32,
-	.reg_stride = 4,
-	.max_register = DMC_CLK_CTRL,
-};
-
-static struct meson_clk_hw_data a1_peripherals_clks = {
-	.hws = a1_peripherals_hw_clks,
-	.num = ARRAY_SIZE(a1_peripherals_hw_clks),
-};
-
-static int a1_peripherals_clkc_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	void __iomem *base;
-	struct regmap *map;
-	int clkid, err;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return dev_err_probe(dev, PTR_ERR(base),
-				     "can't ioremap resource\n");
-
-	map = devm_regmap_init_mmio(dev, base, &a1_peripherals_regmap_cfg);
-	if (IS_ERR(map))
-		return dev_err_probe(dev, PTR_ERR(map),
-				     "can't init regmap mmio region\n");
-
-	for (clkid = 0; clkid < a1_peripherals_clks.num; clkid++) {
-		err = devm_clk_hw_register(dev, a1_peripherals_clks.hws[clkid]);
-		if (err)
-			return dev_err_probe(dev, err,
-					     "clock[%d] registration failed\n",
-					     clkid);
-	}
-
-	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, &a1_peripherals_clks);
-}
+static const struct meson_clkc_data a1_peripherals_clkc_data = {
+	.hw_clks = {
+		.hws = a1_peripherals_hw_clks,
+		.num = ARRAY_SIZE(a1_peripherals_hw_clks),
+	},
+};
 
 static const struct of_device_id a1_peripherals_clkc_match_table[] = {
-	{ .compatible = "amlogic,a1-peripherals-clkc", },
+	{
+		.compatible = "amlogic,a1-peripherals-clkc",
+		.data = &a1_peripherals_clkc_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, a1_peripherals_clkc_match_table);
 
 static struct platform_driver a1_peripherals_clkc_driver = {
-	.probe = a1_peripherals_clkc_probe,
+	.probe = meson_clkc_mmio_probe,
 	.driver = {
 		.name = "a1-peripherals-clkc",
 		.of_match_table = a1_peripherals_clkc_match_table,
diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
index 79ef4cbe955326ecedceb68cda7f59bb8882b165..1f82e9c7c14ebeae5d43cf2623c3ab69427a8504 100644
--- a/drivers/clk/meson/a1-pll.c
+++ b/drivers/clk/meson/a1-pll.c
@@ -295,56 +295,24 @@ static struct clk_hw *a1_pll_hw_clks[] = {
 	[CLKID_HIFI_PLL]	= &a1_hifi_pll.hw,
 };
 
-static const struct regmap_config a1_pll_regmap_cfg = {
-	.reg_bits   = 32,
-	.val_bits   = 32,
-	.reg_stride = 4,
-	.max_register = ANACTRL_HIFIPLL_STS,
-};
-
-static struct meson_clk_hw_data a1_pll_clks = {
-	.hws = a1_pll_hw_clks,
-	.num = ARRAY_SIZE(a1_pll_hw_clks),
+static const struct meson_clkc_data a1_pll_clkc_data = {
+	.hw_clks = {
+		.hws = a1_pll_hw_clks,
+		.num = ARRAY_SIZE(a1_pll_hw_clks),
+	},
 };
 
-static int a1_pll_clkc_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	void __iomem *base;
-	struct regmap *map;
-	int clkid, err;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return dev_err_probe(dev, PTR_ERR(base),
-				     "can't ioremap resource\n");
-
-	map = devm_regmap_init_mmio(dev, base, &a1_pll_regmap_cfg);
-	if (IS_ERR(map))
-		return dev_err_probe(dev, PTR_ERR(map),
-				     "can't init regmap mmio region\n");
-
-	/* Register clocks */
-	for (clkid = 0; clkid < a1_pll_clks.num; clkid++) {
-		err = devm_clk_hw_register(dev, a1_pll_clks.hws[clkid]);
-		if (err)
-			return dev_err_probe(dev, err,
-					     "clock[%d] registration failed\n",
-					     clkid);
-	}
-
-	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get,
-					   &a1_pll_clks);
-}
-
 static const struct of_device_id a1_pll_clkc_match_table[] = {
-	{ .compatible = "amlogic,a1-pll-clkc", },
+	{
+		.compatible = "amlogic,a1-pll-clkc",
+		.data = &a1_pll_clkc_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, a1_pll_clkc_match_table);
 
 static struct platform_driver a1_pll_clkc_driver = {
-	.probe = a1_pll_clkc_probe,
+	.probe = meson_clkc_mmio_probe,
 	.driver = {
 		.name = "a1-pll-clkc",
 		.of_match_table = a1_pll_clkc_match_table,
diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
index a09cb1435ab108b2dcc209c6557bcd1988c4ba1a..e9c1ef99be13d0542b8a972ceffe69c8a9977118 100644
--- a/drivers/clk/meson/c3-peripherals.c
+++ b/drivers/clk/meson/c3-peripherals.c
@@ -2091,52 +2091,17 @@ static struct clk_hw *c3_peripherals_hw_clks[] = {
 	[CLKID_VAPB]			= &c3_vapb.hw,
 };
 
-static const struct regmap_config c3_peripherals_regmap_cfg = {
-	.reg_bits       = 32,
-	.val_bits       = 32,
-	.reg_stride     = 4,
-	.max_register   = NNA_CLK_CTRL,
-};
-
-static struct meson_clk_hw_data c3_peripherals_clks = {
-	.hws = c3_peripherals_hw_clks,
-	.num = ARRAY_SIZE(c3_peripherals_hw_clks),
-};
-
-static int c3_peripherals_clkc_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct regmap *regmap;
-	void __iomem *base;
-	int clkid, ret;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	regmap = devm_regmap_init_mmio(dev, base, &c3_peripherals_regmap_cfg);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	for (clkid = 0; clkid < c3_peripherals_clks.num; clkid++) {
-		/* array might be sparse */
-		if (!c3_peripherals_clks.hws[clkid])
-			continue;
-
-		ret = devm_clk_hw_register(dev, c3_peripherals_clks.hws[clkid]);
-		if (ret) {
-			dev_err(dev, "Clock registration failed\n");
-			return ret;
-		}
-	}
-
-	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get,
-					   &c3_peripherals_clks);
-}
+static const struct meson_clkc_data c3_peripherals_clkc_data = {
+	.hw_clks = {
+		.hws = c3_peripherals_hw_clks,
+		.num = ARRAY_SIZE(c3_peripherals_hw_clks),
+	},
+};
 
 static const struct of_device_id c3_peripherals_clkc_match_table[] = {
 	{
 		.compatible = "amlogic,c3-peripherals-clkc",
+		.data = &c3_peripherals_clkc_data,
 	},
 	{ /* sentinel */ }
 };
@@ -2144,7 +2109,7 @@ static const struct of_device_id c3_peripherals_clkc_match_table[] = {
 MODULE_DEVICE_TABLE(of, c3_peripherals_clkc_match_table);
 
 static struct platform_driver c3_peripherals_clkc_driver = {
-	.probe		= c3_peripherals_clkc_probe,
+	.probe		= meson_clkc_mmio_probe,
 	.driver		= {
 		.name	= "c3-peripherals-clkc",
 		.of_match_table = c3_peripherals_clkc_match_table,
diff --git a/drivers/clk/meson/c3-pll.c b/drivers/clk/meson/c3-pll.c
index ccfcd4b5be8996592c27df31fa62d4871c826926..dd047d17488c1309dcc4607dfb55582ea978528d 100644
--- a/drivers/clk/meson/c3-pll.c
+++ b/drivers/clk/meson/c3-pll.c
@@ -653,59 +653,24 @@ static struct clk_hw *c3_pll_hw_clks[] = {
 	[CLKID_MCLK1]		= &c3_mclk1.hw
 };
 
-static const struct regmap_config c3_pll_regmap_cfg = {
-	.reg_bits       = 32,
-	.val_bits       = 32,
-	.reg_stride     = 4,
-	.max_register   = ANACTRL_MPLL_CTRL4,
-};
-
-static struct meson_clk_hw_data c3_pll_clks = {
-	.hws = c3_pll_hw_clks,
-	.num = ARRAY_SIZE(c3_pll_hw_clks),
+static const struct meson_clkc_data c3_pll_clkc_data = {
+	.hw_clks = {
+		.hws = c3_pll_hw_clks,
+		.num = ARRAY_SIZE(c3_pll_hw_clks),
+	},
 };
 
-static int c3_pll_clkc_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct regmap *regmap;
-	void __iomem *base;
-	int clkid, ret;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	regmap = devm_regmap_init_mmio(dev, base, &c3_pll_regmap_cfg);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	for (clkid = 0; clkid < c3_pll_clks.num; clkid++) {
-		/* array might be sparse */
-		if (!c3_pll_clks.hws[clkid])
-			continue;
-
-		ret = devm_clk_hw_register(dev, c3_pll_clks.hws[clkid]);
-		if (ret) {
-			dev_err(dev, "Clock registration failed\n");
-			return ret;
-		}
-	}
-
-	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get,
-					   &c3_pll_clks);
-}
-
 static const struct of_device_id c3_pll_clkc_match_table[] = {
 	{
 		.compatible = "amlogic,c3-pll-clkc",
+		.data = &c3_pll_clkc_data,
 	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, c3_pll_clkc_match_table);
 
 static struct platform_driver c3_pll_clkc_driver = {
-	.probe		= c3_pll_clkc_probe,
+	.probe		= meson_clkc_mmio_probe,
 	.driver		= {
 		.name	= "c3-pll-clkc",
 		.of_match_table = c3_pll_clkc_match_table,
diff --git a/drivers/clk/meson/meson8-ddr.c b/drivers/clk/meson/meson8-ddr.c
index 6a9efde9b570d8a2609c118d7d38334a3b4a5dcc..0f93774f73718d29afca87b4c601bd32b9745d30 100644
--- a/drivers/clk/meson/meson8-ddr.c
+++ b/drivers/clk/meson/meson8-ddr.c
@@ -83,57 +83,26 @@ static struct clk_hw *meson8_ddr_hw_clks[] = {
 	[DDR_CLKID_DDR_PLL]		= &meson8_ddr_pll.hw,
 };
 
-static struct meson_clk_hw_data meson8_ddr_clks = {
-	.hws = meson8_ddr_hw_clks,
-	.num = ARRAY_SIZE(meson8_ddr_hw_clks),
-};
-
-static const struct regmap_config meson8_ddr_regmap_cfg = {
-	.reg_bits = 8,
-	.val_bits = 32,
-	.reg_stride = 4,
-	.max_register = DDR_CLK_STS,
+static const struct meson_clkc_data meson8_ddr_clkc_data = {
+	.hw_clks = {
+		.hws = meson8_ddr_hw_clks,
+		.num = ARRAY_SIZE(meson8_ddr_hw_clks),
+	},
 };
 
-static int meson8_ddr_clkc_probe(struct platform_device *pdev)
-{
-	struct regmap *regmap;
-	void __iomem *base;
-	struct clk_hw *hw;
-	int ret, i;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	regmap = devm_regmap_init_mmio(&pdev->dev, base,
-				       &meson8_ddr_regmap_cfg);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	/* Register all clks */
-	for (i = 0; i < meson8_ddr_clks.num; i++) {
-		hw = meson8_ddr_clks.hws[i];
-
-		ret = devm_clk_hw_register(&pdev->dev, hw);
-		if (ret) {
-			dev_err(&pdev->dev, "Clock registration failed\n");
-			return ret;
-		}
-	}
-
-	return devm_of_clk_add_hw_provider(&pdev->dev, meson_clk_hw_get,
-					   &meson8_ddr_clks);
-}
-
 static const struct of_device_id meson8_ddr_clkc_match_table[] = {
-	{ .compatible = "amlogic,meson8-ddr-clkc" },
-	{ .compatible = "amlogic,meson8b-ddr-clkc" },
+	{
+		.compatible = "amlogic,meson8-ddr-clkc",
+		.data = &meson8_ddr_clkc_data,
+	}, {
+		.compatible = "amlogic,meson8b-ddr-clkc",
+		.data = &meson8_ddr_clkc_data,
+	},
 	{ /* sentinel */ }
 };
 
 static struct platform_driver meson8_ddr_clkc_driver = {
-	.probe		= meson8_ddr_clkc_probe,
+	.probe		= meson_clkc_mmio_probe,
 	.driver		= {
 		.name	= "meson8-ddr-clkc",
 		.of_match_table = meson8_ddr_clkc_match_table,
diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index 9bcd35f12836de5e318fd1ad9c9ae15a2bfc3dd7..fc1500df926d056ce17252987dd91095a8399b55 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -3449,59 +3449,24 @@ static struct clk_hw *s4_peripherals_hw_clks[] = {
 	[CLKID_HDCP22_SKPCLK]		= &s4_hdcp22_skpclk.hw,
 };
 
-static const struct regmap_config s4_peripherals_regmap_cfg = {
-	.reg_bits       = 32,
-	.val_bits       = 32,
-	.reg_stride     = 4,
-	.max_register   = CLKCTRL_DEMOD_CLK_CTRL,
-};
-
-static struct meson_clk_hw_data s4_peripherals_clks = {
-	.hws = s4_peripherals_hw_clks,
-	.num = ARRAY_SIZE(s4_peripherals_hw_clks),
+static const struct meson_clkc_data s4_peripherals_clkc_data = {
+	.hw_clks = {
+		.hws = s4_peripherals_hw_clks,
+		.num = ARRAY_SIZE(s4_peripherals_hw_clks),
+	},
 };
 
-static int s4_peripherals_clkc_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct regmap *regmap;
-	void __iomem *base;
-	int ret, i;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return dev_err_probe(dev, PTR_ERR(base),
-				     "can't ioremap resource\n");
-
-	regmap = devm_regmap_init_mmio(dev, base, &s4_peripherals_regmap_cfg);
-	if (IS_ERR(regmap))
-		return dev_err_probe(dev, PTR_ERR(regmap),
-				     "can't init regmap mmio region\n");
-
-	for (i = 0; i < s4_peripherals_clks.num; i++) {
-		/* array might be sparse */
-		if (!s4_peripherals_clks.hws[i])
-			continue;
-
-		ret = devm_clk_hw_register(dev, s4_peripherals_clks.hws[i]);
-		if (ret)
-			return dev_err_probe(dev, ret,
-					     "clock[%d] registration failed\n", i);
-	}
-
-	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, &s4_peripherals_clks);
-}
-
 static const struct of_device_id s4_peripherals_clkc_match_table[] = {
 	{
 		.compatible = "amlogic,s4-peripherals-clkc",
+		.data = &s4_peripherals_clkc_data,
 	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, s4_peripherals_clkc_match_table);
 
 static struct platform_driver s4_peripherals_clkc_driver = {
-	.probe		= s4_peripherals_clkc_probe,
+	.probe		= meson_clkc_mmio_probe,
 	.driver		= {
 		.name	= "s4-peripherals-clkc",
 		.of_match_table = s4_peripherals_clkc_match_table,
diff --git a/drivers/clk/meson/s4-pll.c b/drivers/clk/meson/s4-pll.c
index 6a266bcafd6257937c1de50cbc5606dcc6f8207b..56ce6f566e537a26e932db245ede17d900d9f093 100644
--- a/drivers/clk/meson/s4-pll.c
+++ b/drivers/clk/meson/s4-pll.c
@@ -798,66 +798,26 @@ static const struct reg_sequence s4_pll_init_regs[] = {
 	{ .reg = ANACTRL_MPLL_CTRL0,	.def = 0x00000543 },
 };
 
-static const struct regmap_config s4_pll_clkc_regmap_cfg = {
-	.reg_bits       = 32,
-	.val_bits       = 32,
-	.reg_stride     = 4,
-	.max_register   = ANACTRL_HDMIPLL_CTRL0,
-};
-
-static struct meson_clk_hw_data s4_pll_clks = {
-	.hws = s4_pll_hw_clks,
-	.num = ARRAY_SIZE(s4_pll_hw_clks),
-};
-
-static int s4_pll_clkc_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct regmap *regmap;
-	void __iomem *base;
-	int ret, i;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return dev_err_probe(dev, PTR_ERR(base),
-				     "can't ioremap resource\n");
-
-	regmap = devm_regmap_init_mmio(dev, base, &s4_pll_clkc_regmap_cfg);
-	if (IS_ERR(regmap))
-		return dev_err_probe(dev, PTR_ERR(regmap),
-				     "can't init regmap mmio region\n");
-
-	ret = regmap_multi_reg_write(regmap, s4_pll_init_regs, ARRAY_SIZE(s4_pll_init_regs));
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Failed to init registers\n");
-
-	/* Register clocks */
-	for (i = 0; i < s4_pll_clks.num; i++) {
-		/* array might be sparse */
-		if (!s4_pll_clks.hws[i])
-			continue;
-
-		ret = devm_clk_hw_register(dev, s4_pll_clks.hws[i]);
-		if (ret)
-			return dev_err_probe(dev, ret,
-					     "clock[%d] registration failed\n", i);
-	}
-
-	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get,
-					   &s4_pll_clks);
-}
+static const struct meson_clkc_data s4_pll_clkc_data = {
+	.hw_clks = {
+		.hws = s4_pll_hw_clks,
+		.num = ARRAY_SIZE(s4_pll_hw_clks),
+	},
+	.init_regs = s4_pll_init_regs,
+	.init_count = ARRAY_SIZE(s4_pll_init_regs),
+};
 
 static const struct of_device_id s4_pll_clkc_match_table[] = {
 	{
 		.compatible = "amlogic,s4-pll-clkc",
+		.data = &s4_pll_clkc_data,
 	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, s4_pll_clkc_match_table);
 
 static struct platform_driver s4_pll_clkc_driver = {
-	.probe		= s4_pll_clkc_probe,
+	.probe		= meson_clkc_mmio_probe,
 	.driver		= {
 		.name	= "s4-pll-clkc",
 		.of_match_table = s4_pll_clkc_match_table,

-- 
2.47.2

