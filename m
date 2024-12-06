Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2B61FC116
	for <linux-clk@vger.kernel.org>; Fri,  6 Dec 2024 11:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733483640; cv=none; b=Qi3Nxr7gIYTLJWBIzH38zXfsOBdcPpS4kIoYVXj9rUGgyNC7xKGXAfyiNi62MCdI7FAohM3Bac6wivRvQrfFQ9Ena1t/h+2LkdkhOHQqXSMbJVin5pifRkouGVAG2WiwTJbuBzrfkVUOgixS7X3zyK4FNH4hAQrmDwtbFguQ12U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733483640; c=relaxed/simple;
	bh=SIi46sAJ3akHceZIRoH2XmfFqxFkyS3eT+KqHD6fe7k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Du+cRmD+HA20iTFZ2rUsZHXev/lRAGyF8gdaKbZfEnoyIwozQqG30Z9ABb2JhWEJMqj9B3oVkcQEyZBbLi76e5rKN34DaFwlNOpmHgZE4ikpy9xHdwofhaEcQyNWQLfLmX62s0UvUuYQruTAGLSrzQm1t/pBxKlE8fJIwPxZDrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Tpf7fTGG; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Tpf7fTGG"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa642e45241so51113066b.1
        for <linux-clk@vger.kernel.org>; Fri, 06 Dec 2024 03:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733483637; x=1734088437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3NK3+VvNXvn4/X99VXMNRx8LERvbPVlsDcIxAPbW7c=;
        b=Tpf7fTGGqWRvvVKmxhqZPhxTHemi3z83lVgludb3y7timQBHx47S1IFFBreNwj8a+/
         hw3hJ4Fk8wtWmIhzg23F6roQOzgpFQKBPldF2BJ4LGVWMpYkwWY3sOy/pe5yfmrZq9Q1
         cpJtjp/fyCa9TZsRgm1oLmLdL1ve/mDRycnBifJDdc25pdsPwyWfJFCKewHMI0BDVdxj
         wjiMZIW5E3u0p/J1pcRYD84XwRr8H4awCv1nl0mTkr6pa1PVJ0EG+U0aIl8r3X66V9fc
         +B1+oPJBfY9viAL65b7No+0gswkJj2RYF4kKzoClpb5oYtGn1wjPtvpwaJN1ASkoJSYA
         2Ngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733483637; x=1734088437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3NK3+VvNXvn4/X99VXMNRx8LERvbPVlsDcIxAPbW7c=;
        b=br+UhW2Em6IM44TCMROuJ9qRpqW5xgvUKMbGeHLzBKAVba3vbgb+DkxO/v9p/cnc1g
         l690bwPVHB8JG/2welTFHEKWCAGk2Lnw784r+Rc3yCm8m4KmP3dRNbPjzscwQ6AjtNLY
         8EsTfrF4v2F4u6NOK/1NZYkyWOE9EjJ8zwou5/n57uyzat5QsSG5QSezCsUp6Gqvnz1D
         zrY5yLkdNmu5pSwzknLubfIi26iqd40gpUy0kYBC3U/fapZwrq5tXHmg+l9JbjQ7/gD5
         4OptuFR537jcZOOhG7JhFO0IFQTay3NYeiOdoLirx7Mxg3vhWqaO/z5B1KI2KUGpMU/r
         ixYg==
X-Forwarded-Encrypted: i=1; AJvYcCUmZm/AV0NZuiVfvVLjZv3qG3TF5bmZ9u01tEGRenb4tEQmmBKQ9/E7wpmcOGnvtYK6+fq15hwQwiM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFCkQd1quxy0RYzwh/pMD7UZLD4e2tYkhm7YQfQiOW1Ejur8xk
	U2f0/Fv7y1j1RR/T6WNqRUb7TC8BHvUDgXECacJB8Edzh6QzBIBHjitG8O5r3mc=
X-Gm-Gg: ASbGncsPyPKLo2sZjTM7BCighbFeIqTZxpJmb+Hb3XbY70yNdrGFox4Y5IOObwN1ZlY
	D+GwdMdOas3+kXjLuc504Jpi/4evp2Rn+yb9i4+t9tgGNL77tH2wqXcGbkF8ufySGQwsB57/o+o
	L5yez74tXG/dsHIj+hiTYOrJIvpesdOrVp9zdBa3AocV/KIKWzobFLhZD9etdSb+wzH+saiwHro
	6XQDIdrhDMJqhz/B2TWUCxIBXSqfU1eGfw454qAkKj4myNrgUWa2dLkWJtBfgCL08fQ6EYDSGQG
	NHJR
X-Google-Smtp-Source: AGHT+IG5ns28LlIO5EKzt3jy9KG0NXWjALwAdfE48ssUd8bpZB71xSWH7xVctc2Y/hSvsPovXL1IRQ==
X-Received: by 2002:a17:906:3292:b0:aa6:4494:e354 with SMTP id a640c23a62f3a-aa64494e742mr62432466b.42.1733483637032;
        Fri, 06 Dec 2024 03:13:57 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eee2a6sm226877866b.90.2024.12.06.03.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:13:56 -0800 (PST)
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
Subject: [PATCH v2 02/15] iio: adc: rzg2l_adc: Convert dev_err() to dev_err_probe()
Date: Fri,  6 Dec 2024 13:13:24 +0200
Message-Id: <20241206111337.726244-3-claudiu.beznea.uj@bp.renesas.com>
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

Convert all occurrences of dev_err() in the probe path to dev_err_probe().
This improves readability and simplifies the code.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none, this patch is new

 drivers/iio/adc/rzg2l_adc.c | 64 +++++++++++++------------------------
 1 file changed, 22 insertions(+), 42 deletions(-)

diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
index cd3a7e46ea53..8a804f81c04b 100644
--- a/drivers/iio/adc/rzg2l_adc.c
+++ b/drivers/iio/adc/rzg2l_adc.c
@@ -313,15 +313,11 @@ static int rzg2l_adc_parse_properties(struct platform_device *pdev, struct rzg2l
 		return -ENOMEM;
 
 	num_channels = device_get_child_node_count(&pdev->dev);
-	if (!num_channels) {
-		dev_err(&pdev->dev, "no channel children\n");
-		return -ENODEV;
-	}
+	if (!num_channels)
+		return dev_err_probe(&pdev->dev, -ENODEV, "no channel children\n");
 
-	if (num_channels > RZG2L_ADC_MAX_CHANNELS) {
-		dev_err(&pdev->dev, "num of channel children out of range\n");
-		return -EINVAL;
-	}
+	if (num_channels > RZG2L_ADC_MAX_CHANNELS)
+		return dev_err_probe(&pdev->dev, -EINVAL, "num of channel children out of range\n");
 
 	chan_array = devm_kcalloc(&pdev->dev, num_channels, sizeof(*chan_array),
 				  GFP_KERNEL);
@@ -445,62 +441,46 @@ static int rzg2l_adc_probe(struct platform_device *pdev)
 		return PTR_ERR(adc->base);
 
 	adc->pclk = devm_clk_get(dev, "pclk");
-	if (IS_ERR(adc->pclk)) {
-		dev_err(dev, "Failed to get pclk");
-		return PTR_ERR(adc->pclk);
-	}
+	if (IS_ERR(adc->pclk))
+		return dev_err_probe(dev, PTR_ERR(adc->pclk), "Failed to get pclk");
 
 	adc->adclk = devm_clk_get(dev, "adclk");
-	if (IS_ERR(adc->adclk)) {
-		dev_err(dev, "Failed to get adclk");
-		return PTR_ERR(adc->adclk);
-	}
+	if (IS_ERR(adc->adclk))
+		return dev_err_probe(dev, PTR_ERR(adc->adclk), "Failed to get adclk");
 
 	adc->adrstn = devm_reset_control_get_exclusive(dev, "adrst-n");
-	if (IS_ERR(adc->adrstn)) {
-		dev_err(dev, "failed to get adrstn\n");
-		return PTR_ERR(adc->adrstn);
-	}
+	if (IS_ERR(adc->adrstn))
+		return dev_err_probe(dev, PTR_ERR(adc->adrstn), "failed to get adrstn\n");
 
 	adc->presetn = devm_reset_control_get_exclusive(dev, "presetn");
-	if (IS_ERR(adc->presetn)) {
-		dev_err(dev, "failed to get presetn\n");
-		return PTR_ERR(adc->presetn);
-	}
+	if (IS_ERR(adc->presetn))
+		return dev_err_probe(dev, PTR_ERR(adc->presetn), "failed to get presetn\n");
 
 	ret = reset_control_deassert(adc->adrstn);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to deassert adrstn pin, %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to deassert adrstn pin, %d\n", ret);
 
 	ret = devm_add_action_or_reset(&pdev->dev,
 				       rzg2l_adc_reset_assert, adc->adrstn);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to register adrstn assert devm action, %d\n",
-			ret);
-		return ret;
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to register adrstn assert devm action, %d\n", ret);
 	}
 
 	ret = reset_control_deassert(adc->presetn);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to deassert presetn pin, %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to deassert presetn pin, %d\n", ret);
 
 	ret = devm_add_action_or_reset(&pdev->dev,
 				       rzg2l_adc_reset_assert, adc->presetn);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to register presetn assert devm action, %d\n",
-			ret);
-		return ret;
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to register presetn assert devm action, %d\n", ret);
 	}
 
 	ret = rzg2l_adc_hw_init(adc);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to initialize ADC HW, %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to initialize ADC HW, %d\n", ret);
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-- 
2.39.2

