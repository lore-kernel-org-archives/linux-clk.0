Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65583302771
	for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 14:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756132035; cv=none; b=OnjmYmR2wyyYGLcm1ONA3EEgvQ3QoRC8u0HbLLS7lUU3L8TJ/3pTiGP1lYThn1dzlJ3oyMro8jUDA1oQYG7Giz+q2lOmA/uWgZR137/N4mOX87ugZ45utcJ5V5nKrELWVFTNIZIBbFUewRqYPzsl7GrSCtl0hvzGGK5xEUHx4oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756132035; c=relaxed/simple;
	bh=mV4e9A5hAMuH50dPvN6Eogw/db6BsyrhlDBBLhpRuDk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eKv9MqP6sn/73X9O7N6SskEMy4xcKlpfRQonsEX5qd8Cao0ELmULA1q39uf5HZsTJA9O+5KS4DcNP7WRBbzGvyjqzGZCLADKhcjxCuKprs+K/evIQgjXLHAIzGVGky80eGdxU9/bPL8SeqegN0D6vkIvLIAn/gt3QtrlEbMYKRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=MI9Ro0pr; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MI9Ro0pr"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3c79f0a5c29so1603947f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 07:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756132028; x=1756736828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DIJEmsB/8rs8xNSH4XrNmepRzdvgwCQLygjTeJuMmaQ=;
        b=MI9Ro0prNH5juf+T6iLRAWBSWIFA6JPYMP//vYm0lf4cZxNly7zlD79xX+2tiZOTQL
         XFJ+wntdcCMtJeWQ7KCt8Gk8/ZiJHXyhzf4GIIR9NXRbPN0gZbuGkC1cC1Z0DoyM9UgC
         9UsnkUov4IOqD1XaEUifh00ZIirz06UhvsRvOBPIXVTs0FCyUR7MFZjzo7Y6B5acaYuH
         thmWbGMJtxqpm3EJTnqqVLNfoviOQ7YK3VJc0au+xDr3hBQMw/ItORB9nTPIF+zGu9dH
         7USBOd2Z1tCPWQOWhP8ndqkzkd8thdMqiSTGmKU+O1/Rj9wRf/TaytRQ8hVSVByd3GCV
         1vRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756132028; x=1756736828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DIJEmsB/8rs8xNSH4XrNmepRzdvgwCQLygjTeJuMmaQ=;
        b=iLyfu/CjhH7FlNi8d88WK/KrU4IVuxaJ0Bx362EuylcNpygjsAAtAkN+LOpHLddx2i
         GJb1IaoS1s+rqHHAQLdzemadizsY8AoeIGZbF7xYMkz6Ztg5mTne+XxD7mrQ5yKl3lUa
         TEnvDXGDEvGgCIEn2p/7zAzcvdGCffP4u3T3a1A1zF5g/Bsdb9hHzrTg0UH9SywQRdNi
         TdP4YlPTKYOpxyRlWtHX7UT2cHgX6V9Qv6mfjS5jjn+sAnQY/OBSagiUdduCWfFJTBS0
         g5xC3QAEjHuPr/EB22I0TwstaxTyot4xU1YTs1Dqld2GQ5uQs9GFJTqMA1IrQN8ym6Yj
         haDw==
X-Forwarded-Encrypted: i=1; AJvYcCXv4Zk65QgKQZxkA+Op/GggpA3XvoOOzzWukXjl3i+x6Z+bq5zPS1TWQHh0/M9FuIzyL44fTVuwGJY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCMlpMBwhBu81bg7sD5LE62wMi74mhgbdb1jiuj5Ic+8/Wdo2z
	OQdAoL4GA0CiP8RHSlMxzOxWx50ZIK1Yb9fdv90PqlnOeoMWkfHcj7sqXtGWqpV6lGE=
X-Gm-Gg: ASbGncvLd6OQnlPq2CLq9KVpgkWBxzs0vwVD9W+IZmDNBUprmoXBXE2s645QY05/TEu
	rBOTVTRRWXQZeThuiPxEP4dt/vWXcCeSTNRT4Fb4qY8J67+pV5zjf9K/DqYqj7UaR5iGH10CkKV
	OLBD2rXVg5ADbtMMElHWSgp6kbP5/NrORoop3mY0X+XLTIy80CXQNj9FBlffIPG5YqUYpk9bC0A
	eBwdHWLWnDasbWBeZ4veUQBo/BV7CVI6n+PXmCJ7NnUuMqw9eVDmVfo8xMYceLz4NA4JqzuCTbb
	sidyYIaAVfSymDRn1tvlfRPyDDYlHOlD0lU4jPCwNjWH4edJ9Zlh8W4Uu1kLxVyFY4K5yNDfKxg
	2ng7HsZ+Qz5fPs/utS4ch6VJF+ay7K9vrVrbLGH+waYXKQsA=
X-Google-Smtp-Source: AGHT+IEXfyq5m2bLUeQjUXFA2zrBYTIxS3J/1xQIovcTnCPbPWUNt6OGW4xg2+q3mV00zpwUEtqa3Q==
X-Received: by 2002:a5d:4846:0:b0:3b7:6d95:56d2 with SMTP id ffacd0b85a97d-3c5da7402e3mr6635931f8f.7.1756132028370;
        Mon, 25 Aug 2025 07:27:08 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b261:baab:ed3d:3cb6])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3c70e4b9e1fsm12634462f8f.14.2025.08.25.07.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:27:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 25 Aug 2025 16:26:28 +0200
Subject: [PATCH v2 03/12] clk: amlogic: use probe helper in mmio based
 controllers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-meson-clk-cleanup-24-v2-3-0f402f01e117@baylibre.com>
References: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
In-Reply-To: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=16590; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=mV4e9A5hAMuH50dPvN6Eogw/db6BsyrhlDBBLhpRuDk=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBorHKwFTVxum2O6ljQ+WO53Pz7AsJ09Q8raP7e+
 49CuC6SJT2JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaKxysAAKCRDm/A8cN/La
 hU52D/47UTicmhVW7zkjB77rRCoL61Jnysns+K3Yf7zEjypTy4ajihwF3zobtWrskG0mj/i+/Yx
 U1qBg24vC0hV+hRO1OPaHCWLon7JJ0ej5tUBRXJ9kA37cg2ciBnBs0NpFxp95HcV6ETEJiB9kz3
 M00zQ82Q4Iw2ltRXFmC6ykM0mXP0unSo613Dt6/MadcJqcBu3YaqgW5f2qiBE+z28E9Dlk6d49Q
 9abfgkKCAz8SsOGf01an5M3pUAfNg2hqu1gNsauWbnSB4KTCJR8Uo0quMtcNPMYBpVbmRpABOYS
 huNi9kqwv69Fmg0objwMAs3JJ6GAbY6VitSNjsmbPREs7yGBbmELWfnPLOtRQ7QE5xZtOMT5Sdg
 7z9Dj3f1ZZ34qKeIpTq8SUY4+Bm9/VQ0QM/Whif2vjxPrlNZVsGj59ILJjlijjxOn/ZnT33ljdK
 cL3JQfY2MUo13UFi01RpgDvHz8RkhxsoqhBa8JuFcB7XKzViLNvv/YfNN8bp0buApY59SjU0u4B
 QfUwG1r8w0+QVjW9H7ihFjmXcd5vLo2d6+rDzBI9tGQVWthBmdQDMStrrt+tm14dU/21OhvJR+8
 SFyFr08Hs38pPayQbGaDsqr3rkL3qHHSl8jnJFE/vhHxfa8Ux8PbplrPpGzG4fvxDC0skdzROOB
 wDqtK4AQQ06KLwQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Factorize the probe function of the mmio based amlogic clock controllers
using the newly introduced probe helper. This removes a fair amount
of duplicated code.

Reviewed-by: Chuan Liu <chuan.liu@amlogic.com>
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

