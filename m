Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD7A1FF7BD
	for <linux-clk@vger.kernel.org>; Fri,  6 Dec 2024 11:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733483644; cv=none; b=XyUiNspqO0UrMu0pYjfqwmzyNuamGxLSHcBcZpHtXHyG1lRZITuY97xmws4MRJHKSZwElYFanFSah4RuAXk4bqoVy8/yMejpoVNFieYZLkz5o7Z+Oa7fCk1UGsjDFiKSA86E9NTXXuohFVEGEOUnANPmgPJ47XM6nCspBr3zeWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733483644; c=relaxed/simple;
	bh=gLFQxm2yw1A/z6UCgE5w4vdul6md567AjzUUdwmf1eY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PXTjdgmVJ48rGF0OeD1ki5nYLzxgFFMYyoy8EkeoZoCtiB/buK+O2Y0cc8rMGdcdPYpAm5Ml0fMZaBQCSnnSEq4FC6fm9aehZNaZx5fVDguLtazj4wlfjoffwN5hkMAg94mrMYfEeU8DyC3ALCCVR3h885mt3OIrgSKZHJHf6i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VzBb0xhG; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VzBb0xhG"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5cec9609303so2021907a12.1
        for <linux-clk@vger.kernel.org>; Fri, 06 Dec 2024 03:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733483641; x=1734088441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LK+A22UoYLzMHBRjgcTvKCaVtCrM95+xKIADzMQGcIY=;
        b=VzBb0xhGNfibMuEaQVUKHVUbq1BCEF01X2MwF5EpbXNYeb9ijpaH8iJh9ioCyMJull
         iF+iQogkJAF+WxiEzbFO8ublXzG8+FBUeUX58ysIJIJwBnVQ1feBdXaKCXQcUTw18BhX
         gPR721+tYBJjS/0+z+vIM8DgtCFK0CQs24hSg+jy2QdqXXWzOXlksEZR0elQpa+BID+n
         /cptDksxSsEjmQoGozm7rcHtu5Zdd2XHi6hzUqyLahxSoHdMqas2mq+2sRvvuB5DOTzx
         vUE10fju8463NvUAXs0XYgzdKIoQARyRbahL/mNiljrZhP7gV+DFVtjZlANpwfiVFiHf
         p1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733483641; x=1734088441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LK+A22UoYLzMHBRjgcTvKCaVtCrM95+xKIADzMQGcIY=;
        b=n5Z28Whu5uO8OuKSUKhEI9Es3NtqI4LcccLHqhpmkTTuBqD/9eCVsZK0dgmfknmi0k
         g9DtJ6jqqG2t0Q8pjb5N6GXRMJ7EiyJcnHXYNqyXJj2EbPpjvPxDeihEHF+kB8iU8vCi
         k34Ku1V3swf7vsdsiGIB56tU671TLC9ZlB79jnNyy1ZWdf0PudAD2y1OstsJYiFppSCg
         vw/QZRH7luVL8gBCL57LLJCujciaLKgL+WzAzm/z2+lVEOmS0iqWxC8BHXRoUiIW5hRb
         SujA9VPbHNuEFers283UWzIpJKpljaB5c7vyTDpFaQgZifzdLIzyYI6GtJY6B/Go8MmB
         mjuw==
X-Forwarded-Encrypted: i=1; AJvYcCXtzXtx+0huObPQS2lZlql29PXHkFxwym8xc5q79IT4NTy5PaAngjyWaimYJGUsH0r3xrgc0Hi32lU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKED7LL2emOpUHueT2OAiEkzxtmYHUe85EwZ0QivkrVayseUis
	Aj+meNXmxn75MF58MHP/S3nwz0gDuqBp1N0KlE9f43CE2MHdT9vJTGptuXtJEpc=
X-Gm-Gg: ASbGnctQfVOZTetusSQkI+sM9f4dBOepMXjF5xVPGzNv2YWRGSdV0TeZQG/k+BeVNo3
	zBf09D+waqhDl+gPHpy0NbgB1wFVoYMAwrJVZAHLBOZqcCXnyYmkz7OywFdAF1hu4KHNp6dWumM
	yBFbneQ4ccfnaFHEYT3uzldgZBS4fVHJA3G1B7RHuxCS7rDB6DccRK+ARv58htFQXxavXPSLCL5
	3dYq6bXsZaLrYc3bwmh1Wd07kj3lvpL0B0u83ZYObCaLX94R8s2HE1rKDQHcl6szK+WMNgY3MGb
	GdathTki
X-Google-Smtp-Source: AGHT+IFuzLKbXu8rAPLAdGLusru5W/d5iskWC5RkGqbMd759pHt8MKL7B7opME79jVgcPPIhEmgadw==
X-Received: by 2002:a17:907:6190:b0:aa5:c9a:5f4b with SMTP id a640c23a62f3a-aa63a07f0cdmr143555566b.24.1733483640969;
        Fri, 06 Dec 2024 03:14:00 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eee2a6sm226877866b.90.2024.12.06.03.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:14:00 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com,
	jic23@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 04/15] iio: adc: rzg2l_adc: Simplify the runtime PM code
Date: Fri,  6 Dec 2024 13:13:26 +0200
Message-Id: <20241206111337.726244-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241206111337.726244-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241206111337.726244-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

All Renesas SoCs using the rzg2l_adc driver manage ADC clocks through PM
domains. Calling pm_runtime_{resume_and_get, put_sync}() implicitly sets
the state of the clocks. As a result, the code in the rzg2l_adc driver that
explicitly manages ADC clocks can be removed, leading to simpler and
cleaner implementation.

Additionally, replace the use of rzg2l_adc_set_power() with direct PM
runtime API calls to further simplify and clean up the code.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- rebased on top of patch 02/15 from this version

 drivers/iio/adc/rzg2l_adc.c | 96 ++++++++-----------------------------
 1 file changed, 20 insertions(+), 76 deletions(-)

diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
index c0c13e99aa92..780cb927eab1 100644
--- a/drivers/iio/adc/rzg2l_adc.c
+++ b/drivers/iio/adc/rzg2l_adc.c
@@ -8,7 +8,6 @@
  */
 
 #include <linux/bitfield.h>
-#include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/iio/iio.h>
@@ -69,8 +68,6 @@ struct rzg2l_adc_data {
 
 struct rzg2l_adc {
 	void __iomem *base;
-	struct clk *pclk;
-	struct clk *adclk;
 	struct reset_control *presetn;
 	struct reset_control *adrstn;
 	struct completion completion;
@@ -188,29 +185,18 @@ static int rzg2l_adc_conversion_setup(struct rzg2l_adc *adc, u8 ch)
 	return 0;
 }
 
-static int rzg2l_adc_set_power(struct iio_dev *indio_dev, bool on)
-{
-	struct device *dev = indio_dev->dev.parent;
-
-	if (on)
-		return pm_runtime_resume_and_get(dev);
-
-	return pm_runtime_put_sync(dev);
-}
-
 static int rzg2l_adc_conversion(struct iio_dev *indio_dev, struct rzg2l_adc *adc, u8 ch)
 {
+	struct device *dev = indio_dev->dev.parent;
 	int ret;
 
-	ret = rzg2l_adc_set_power(indio_dev, true);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
 		return ret;
 
 	ret = rzg2l_adc_conversion_setup(adc, ch);
-	if (ret) {
-		rzg2l_adc_set_power(indio_dev, false);
-		return ret;
-	}
+	if (ret)
+		goto rpm_put;
 
 	reinit_completion(&adc->completion);
 
@@ -219,12 +205,14 @@ static int rzg2l_adc_conversion(struct iio_dev *indio_dev, struct rzg2l_adc *adc
 	if (!wait_for_completion_timeout(&adc->completion, RZG2L_ADC_TIMEOUT)) {
 		rzg2l_adc_writel(adc, RZG2L_ADINT,
 				 rzg2l_adc_readl(adc, RZG2L_ADINT) & ~RZG2L_ADINT_INTEN_MASK);
-		rzg2l_adc_start_stop(adc, false);
-		rzg2l_adc_set_power(indio_dev, false);
-		return -ETIMEDOUT;
+		ret = -ETIMEDOUT;
 	}
 
-	return rzg2l_adc_set_power(indio_dev, false);
+	rzg2l_adc_start_stop(adc, false);
+
+rpm_put:
+	pm_runtime_put_sync(dev);
+	return ret;
 }
 
 static int rzg2l_adc_read_raw(struct iio_dev *indio_dev,
@@ -348,13 +336,13 @@ static int rzg2l_adc_parse_properties(struct platform_device *pdev, struct rzg2l
 	return 0;
 }
 
-static int rzg2l_adc_hw_init(struct rzg2l_adc *adc)
+static int rzg2l_adc_hw_init(struct device *dev, struct rzg2l_adc *adc)
 {
 	int timeout = 5;
 	u32 reg;
 	int ret;
 
-	ret = clk_prepare_enable(adc->pclk);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
 		return ret;
 
@@ -392,25 +380,10 @@ static int rzg2l_adc_hw_init(struct rzg2l_adc *adc)
 	rzg2l_adc_writel(adc, RZG2L_ADM(3), reg);
 
 exit_hw_init:
-	clk_disable_unprepare(adc->pclk);
-
+	pm_runtime_put_sync(dev);
 	return ret;
 }
 
-static void rzg2l_adc_pm_runtime_disable(void *data)
-{
-	struct device *dev = data;
-
-	pm_runtime_disable(dev->parent);
-}
-
-static void rzg2l_adc_pm_runtime_set_suspended(void *data)
-{
-	struct device *dev = data;
-
-	pm_runtime_set_suspended(dev->parent);
-}
-
 static int rzg2l_adc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -435,14 +408,6 @@ static int rzg2l_adc_probe(struct platform_device *pdev)
 	if (IS_ERR(adc->base))
 		return PTR_ERR(adc->base);
 
-	adc->pclk = devm_clk_get(dev, "pclk");
-	if (IS_ERR(adc->pclk))
-		return dev_err_probe(dev, PTR_ERR(adc->pclk), "Failed to get pclk");
-
-	adc->adclk = devm_clk_get(dev, "adclk");
-	if (IS_ERR(adc->adclk))
-		return dev_err_probe(dev, PTR_ERR(adc->adclk), "Failed to get adclk");
-
 	adc->adrstn = devm_reset_control_get_exclusive_deasserted(dev, "adrst-n");
 	if (IS_ERR(adc->adrstn))
 		return dev_err_probe(dev, PTR_ERR(adc->adrstn), "failed to get/deassert adrst-n\n");
@@ -453,7 +418,13 @@ static int rzg2l_adc_probe(struct platform_device *pdev)
 				     "failed to get/deassert presetn\n");
 	}
 
-	ret = rzg2l_adc_hw_init(adc);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, indio_dev);
+
+	ret = rzg2l_adc_hw_init(dev, adc);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "failed to initialize ADC HW, %d\n", ret);
 
@@ -468,26 +439,12 @@ static int rzg2l_adc_probe(struct platform_device *pdev)
 
 	init_completion(&adc->completion);
 
-	platform_set_drvdata(pdev, indio_dev);
-
 	indio_dev->name = DRIVER_NAME;
 	indio_dev->info = &rzg2l_adc_iio_info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
 	indio_dev->channels = adc->data->channels;
 	indio_dev->num_channels = adc->data->num_channels;
 
-	pm_runtime_set_suspended(dev);
-	ret = devm_add_action_or_reset(&pdev->dev,
-				       rzg2l_adc_pm_runtime_set_suspended, &indio_dev->dev);
-	if (ret)
-		return ret;
-
-	pm_runtime_enable(dev);
-	ret = devm_add_action_or_reset(&pdev->dev,
-				       rzg2l_adc_pm_runtime_disable, &indio_dev->dev);
-	if (ret)
-		return ret;
-
 	return devm_iio_device_register(dev, indio_dev);
 }
 
@@ -503,8 +460,6 @@ static int __maybe_unused rzg2l_adc_pm_runtime_suspend(struct device *dev)
 	struct rzg2l_adc *adc = iio_priv(indio_dev);
 
 	rzg2l_adc_pwr(adc, false);
-	clk_disable_unprepare(adc->adclk);
-	clk_disable_unprepare(adc->pclk);
 
 	return 0;
 }
@@ -513,17 +468,6 @@ static int __maybe_unused rzg2l_adc_pm_runtime_resume(struct device *dev)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev);
 	struct rzg2l_adc *adc = iio_priv(indio_dev);
-	int ret;
-
-	ret = clk_prepare_enable(adc->pclk);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare_enable(adc->adclk);
-	if (ret) {
-		clk_disable_unprepare(adc->pclk);
-		return ret;
-	}
 
 	rzg2l_adc_pwr(adc, true);
 
-- 
2.39.2

