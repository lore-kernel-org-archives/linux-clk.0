Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DF81DE4E3
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 08:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881197; cv=none; b=EJWrphekr48VYmC+KkB27BcchkNz6e+6BYo6YkRIG1V+Q7aEjtiE2l4/SFNztvbNoX8qgDgdzWvn2DDJ2PWZJ8bIbx3LhbsFjRSnbpXc7v/FiB4dq+QxM7hVseFt5+8Nuygk8/WYqKFbuAxUQMkZ/u+lF66PS2Q33CyQI9npMZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881197; c=relaxed/simple;
	bh=vcuxRNbvNHFXIJ12LMc8mO5giKBAKMkgkoqT7f2OQBk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CeiONsOzH4Ww0PlniYZVe8Bbs8OEm3LDr/2NCCepbgVXdAPDGbfbP+2r7Q7KvR7K5OliYCWK7tJtFBhRFAX/t3TXR92xwTTfy39SX4RxCJYOdDP9ooMa/P+td1jpBNj0z5sqFmgg739O54f98y56DcbN+UM+u6oaPZ+0XTLHvJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Gny/M7HW; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Gny/M7HW"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso1019793966b.1
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2024 00:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881194; x=1731485994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJSsIgMTNdT8sJbYVvXU1xDsTjBwGMjS4qJNOYo0+mE=;
        b=Gny/M7HWzmlcsJNDoAgQEFaxtLFBkUjNMhp6PEh3oBey4D4ZCfzHbhA7xfH7Du/Vlu
         5NxniWsNeyysGN2yZDxRqSJsoj7b1l5wRZBrAWEjQhmka/M/JAwWnRP5GcSWh6PT/Pxf
         MCxvThNo6sLkBSa1Aqcjb0mt4Qjj2P7r14y6BL/NMTrxLN5yuz3PTkZItFa8BsMkWvn4
         k4q2aaallNg52giFp/zwCwU14laDpHw6yWyjLb9qWPQErNMxCkxBQ6XteYie/8Yo5ege
         F+S98lqIQ3d/tCYIdJUCo8MlanqBE1d8RBjIk8O84bsfpDXTPmA/lZ9YqOCb/nYATJpR
         b0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881194; x=1731485994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJSsIgMTNdT8sJbYVvXU1xDsTjBwGMjS4qJNOYo0+mE=;
        b=BYgmTVmd6lFb7qgvC4G/KjPvKwTHs2+fJiLtGhhTovf+Fdfk5XO/0qmfqP8bLNwKkm
         p/Qz+bgBym/PKeL4rGEG98XtB0NeMfhhdF6dG4FahVFFf5ss4CspyaMRAsKd0yHg6CFQ
         b0TGAEMBg37DrcdN/sZ7EXv42sb9oIl26a9rau97shJONlR3RR/38HD/lefk0djPc4yN
         lP3imYUUOmUONx/4bGxppzmBi45jsj7SwUXa+V3QUJ9JU6/T392zxBAmW0L4gw3lPUP0
         o6N/4MydQp5lFTPz0KWfk7CeFw/lBwYa2zbwqEGg/Pd8pzEtZ6+kgx6O9MkUO7csuIsS
         ssYA==
X-Forwarded-Encrypted: i=1; AJvYcCWRmGKAHiVzlgSEcIjP9bMs0FrQ6y1BtTHGge2YfDRKaZoktuTjXJ3kDnLS5QW+L/FpDhVU0Vwfytw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIA6daxPJ3/UHL7HCpinpa5mfV5rORTmL7IV2/sclzjaAdvjyh
	7lHt/zggD1UZMA62xGUOoV2An8nD+RXuxRezUZd4kDO0KljQfd3Ja/mjfDmy+Fg=
X-Google-Smtp-Source: AGHT+IHA6GZ3mGvsNrJNfACEgxPKeSILQc0Ff23Q+aU/bmIy1rxj/og4ekfVRW6dsilLNwV9naTmNQ==
X-Received: by 2002:a17:906:f5a8:b0:a99:f0cf:f571 with SMTP id a640c23a62f3a-a9de5f6ddb5mr3756022266b.33.1730881193710;
        Wed, 06 Nov 2024 00:19:53 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:19:53 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	support.opensource@diasemi.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	Adam.Thomson.Opensource@diasemi.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 18/31] ASoC: sh: rz-ssi: Add runtime PM support
Date: Wed,  6 Nov 2024 10:18:13 +0200
Message-Id: <20241106081826.1211088-19-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add runtime PM support to the ssi driver. This assert/de-assert the
reset lines on runtime suspend/resume. Along with it the de-assertion of
the reset line from probe function was removed as it is not necessary
anymore.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index be96376dcd0f..16bca493a254 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1139,14 +1139,13 @@ static int rz_ssi_probe(struct platform_device *pdev)
 		goto err_release_dma_chs;
 	}
 
-	reset_control_deassert(ssi->rstc);
 	/* Default 0 for power saving. Can be overridden via sysfs. */
 	pm_runtime_set_autosuspend_delay(dev, 0);
 	pm_runtime_use_autosuspend(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0) {
 		dev_err(dev, "Failed to enable runtime PM!\n");
-		goto err_reset;
+		goto err_release_dma_chs;
 	}
 
 	ret = devm_snd_soc_register_component(dev, &rz_ssi_soc_component,
@@ -1154,13 +1153,11 @@ static int rz_ssi_probe(struct platform_device *pdev)
 					      ARRAY_SIZE(rz_ssi_soc_dai));
 	if (ret < 0) {
 		dev_err(dev, "failed to register snd component\n");
-		goto err_reset;
+		goto err_release_dma_chs;
 	}
 
 	return 0;
 
-err_reset:
-	reset_control_assert(ssi->rstc);
 err_release_dma_chs:
 	rz_ssi_release_dma_channels(ssi);
 
@@ -1182,10 +1179,29 @@ static const struct of_device_id rz_ssi_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, rz_ssi_of_match);
 
+static int rz_ssi_runtime_suspend(struct device *dev)
+{
+	struct rz_ssi_priv *ssi = dev_get_drvdata(dev);
+
+	return reset_control_assert(ssi->rstc);
+}
+
+static int rz_ssi_runtime_resume(struct device *dev)
+{
+	struct rz_ssi_priv *ssi = dev_get_drvdata(dev);
+
+	return reset_control_deassert(ssi->rstc);
+}
+
+static const struct dev_pm_ops rz_ssi_pm_ops = {
+	RUNTIME_PM_OPS(rz_ssi_runtime_suspend, rz_ssi_runtime_resume, NULL)
+};
+
 static struct platform_driver rz_ssi_driver = {
 	.driver	= {
 		.name	= "rz-ssi-pcm-audio",
 		.of_match_table = rz_ssi_of_match,
+		.pm = pm_ptr(&rz_ssi_pm_ops),
 	},
 	.probe		= rz_ssi_probe,
 	.remove		= rz_ssi_remove,
-- 
2.39.2

