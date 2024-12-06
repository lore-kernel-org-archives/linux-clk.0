Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5FC1FF603
	for <linux-clk@vger.kernel.org>; Fri,  6 Dec 2024 11:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733483642; cv=none; b=GtqOfHc3WCKHnBoP15xcUkaqVRuh7A9f9gVFYHcLfM9F5ejXBhzWbwcbeFrjvfGyCxO5Aj0qR1poQVCnt4DdkGXy0rf4JDCAtDT/egtjLInGGAafWl2rdvnXvwL8jQNDMyp2g1cB+qE00AbWUxo1puViqEKKWOaGTx3o8Dgzq6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733483642; c=relaxed/simple;
	bh=pFeVqwq5TdQjxpLyK7iTM1W+bmcdyJjKWS9gDr7aPgY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ggy4/RgjkKDat6tP40cVxSo4iw0mWHzllHOMtgmQVpzpEsmME6NzVI2qWjZ+Z8gOmvoxCDVQXQS2BzQX8esy6c/UYZIOuLniBZHGtPxzfkjmIN7PHIHsU6OhTgd94FjilVpaqd31rPOfd1Swy6OnBQdgJwBgXNSLBaWJPwpmJQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=KTyk/JTS; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="KTyk/JTS"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa530a94c0eso389835366b.2
        for <linux-clk@vger.kernel.org>; Fri, 06 Dec 2024 03:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733483639; x=1734088439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IF+3d6YLoFd8ymBLjEJf+CI6Y+EI/atf0HIxguIiGOc=;
        b=KTyk/JTSj84SQaukd1UW5/e2pUXUmY4LMfK3scIgA5GUK5NXxh1JUjIOy2mvdCKPoc
         4RUOzTCk5ejmI4TMxPI3IwlvgJjccg1KUm6GMuMzUzjZc+HWNEj8NwF8fse4+ucyoKg+
         SDm/FliQmJHkw1u9yJtjMtAyvUjx/EsHww0B4qy5WoTGpkUDAnvI4fQqEhQthyRwxEDM
         5gkzMPLMBvwF4AkmMYF59/a3vKFgNjklGsCTjrJYjkFXemCR2JL54Trv7bbgoyuMxm0Y
         FUD3dKOJMLvLka7DIOiO+PwSXNGSqFFeDqWAWM2CHIwKpRHFdvsze5IgCdmo6d+gZSaW
         we4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733483639; x=1734088439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IF+3d6YLoFd8ymBLjEJf+CI6Y+EI/atf0HIxguIiGOc=;
        b=IPILTtwg+OsuB3V7rQvNlqyKOtVIS84Gw0R8QHQkXLKbNXENQXYLbCVcD7kaPSLiRJ
         CTEkni7lQpoXvBO7Y+7bdk96INCU2etehqRl9DDkiwP6yMsibRbBYjH4q3K0M8DMA6B1
         yqkSrnAGlohHPLtwdOobRqH55FuzHB93tYG27dC9sDOzzWxY1wLI4pyIZIw/Jk55ZkiK
         L4ieaHmYXN1ot4/nLq4fblhhh2CaqldaSU2xRPmfvDp9Yh3DBXbKhTAZkQjP867l05MC
         4UIUx+6QzYh+qkdJfx1iAioc8UgbVruMK+mP73/KOUocReUUwSeMqLznXQ1RIdALZh1D
         8ZMw==
X-Forwarded-Encrypted: i=1; AJvYcCV07Uy6HsGOFC/FAiQ4cJCQ1sU3LXya+YrNnlEWvkRZxuy0/HpQy4BkqnsULxig8NP6ORlfuYbDq7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq43HttUmuNT3RxC7oEqROA7SmGpKCElUtnt8oz0A1Z8MhMCSs
	T0mxwSKFNVO0ytkZxeXQntQ5EFlMbljKEqgj7z6tHXsHe2VqdIunZ9aEwCr0RQ0=
X-Gm-Gg: ASbGncsHwkwuwwOqmP2D4sWGqbQ4jxHc11tbAeQzBHiAnSd4MeyBZa1DQsYWbPXxy26
	9J3RfHEFNZwBwfHPuyHivCtoC1o1WpTQXaBGJuvQMdUVOI1UOn5ruQY0cPZlEDCEBWM9YlByxqh
	eWIZbUIyp8yUIYyfXIobzIipjulj4y92ptZzAtvtwDnvYnpd8VOzqXfbvnZ8rq4XQOedqjdQiSY
	8HE8ytcN4qA7f4moxBZZRtrVQ1qAyEqr2hHZs++cF8bCHmWuBNk4vT83TIVPPW/ODkZDXtbM5my
	mboO
X-Google-Smtp-Source: AGHT+IE8/6k5bsY8E9y5ISlKPNleG7y4yY/FFLd5nbbFNGCG10Rgtm0MhHvZLaSwwmr1LC62i+/LQg==
X-Received: by 2002:a17:907:3a57:b0:aa5:1cdf:7bb1 with SMTP id a640c23a62f3a-aa63a03afedmr192091466b.24.1733483639246;
        Fri, 06 Dec 2024 03:13:59 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eee2a6sm226877866b.90.2024.12.06.03.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:13:58 -0800 (PST)
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
Subject: [PATCH v2 03/15] iio: adc: rzg2l_adc: Use devres helpers to request pre-deasserted reset controls
Date: Fri,  6 Dec 2024 13:13:25 +0200
Message-Id: <20241206111337.726244-4-claudiu.beznea.uj@bp.renesas.com>
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

Starting with commit d872bed85036 ("reset: Add devres helpers to request
pre-deasserted reset controls"), devres helpers are available to simplify
the process of requesting pre-deasserted reset controls. Update the
rzg2l_adc driver to utilize these helpers, reducing complexity in this
way.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- rebased on top of patch 2/15 from this version
- used "failed to get/deassert" failure messages

 drivers/iio/adc/rzg2l_adc.c | 37 ++++++-------------------------------
 1 file changed, 6 insertions(+), 31 deletions(-)

diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
index 8a804f81c04b..c0c13e99aa92 100644
--- a/drivers/iio/adc/rzg2l_adc.c
+++ b/drivers/iio/adc/rzg2l_adc.c
@@ -411,11 +411,6 @@ static void rzg2l_adc_pm_runtime_set_suspended(void *data)
 	pm_runtime_set_suspended(dev->parent);
 }
 
-static void rzg2l_adc_reset_assert(void *data)
-{
-	reset_control_assert(data);
-}
-
 static int rzg2l_adc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -448,34 +443,14 @@ static int rzg2l_adc_probe(struct platform_device *pdev)
 	if (IS_ERR(adc->adclk))
 		return dev_err_probe(dev, PTR_ERR(adc->adclk), "Failed to get adclk");
 
-	adc->adrstn = devm_reset_control_get_exclusive(dev, "adrst-n");
+	adc->adrstn = devm_reset_control_get_exclusive_deasserted(dev, "adrst-n");
 	if (IS_ERR(adc->adrstn))
-		return dev_err_probe(dev, PTR_ERR(adc->adrstn), "failed to get adrstn\n");
-
-	adc->presetn = devm_reset_control_get_exclusive(dev, "presetn");
-	if (IS_ERR(adc->presetn))
-		return dev_err_probe(dev, PTR_ERR(adc->presetn), "failed to get presetn\n");
-
-	ret = reset_control_deassert(adc->adrstn);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "failed to deassert adrstn pin, %d\n", ret);
-
-	ret = devm_add_action_or_reset(&pdev->dev,
-				       rzg2l_adc_reset_assert, adc->adrstn);
-	if (ret) {
-		return dev_err_probe(&pdev->dev, ret,
-				     "failed to register adrstn assert devm action, %d\n", ret);
-	}
+		return dev_err_probe(dev, PTR_ERR(adc->adrstn), "failed to get/deassert adrst-n\n");
 
-	ret = reset_control_deassert(adc->presetn);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "failed to deassert presetn pin, %d\n", ret);
-
-	ret = devm_add_action_or_reset(&pdev->dev,
-				       rzg2l_adc_reset_assert, adc->presetn);
-	if (ret) {
-		return dev_err_probe(&pdev->dev, ret,
-				     "failed to register presetn assert devm action, %d\n", ret);
+	adc->presetn = devm_reset_control_get_exclusive_deasserted(dev, "presetn");
+	if (IS_ERR(adc->presetn)) {
+		return dev_err_probe(dev, PTR_ERR(adc->presetn),
+				     "failed to get/deassert presetn\n");
 	}
 
 	ret = rzg2l_adc_hw_init(adc);
-- 
2.39.2

