Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431A8232378
	for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 17:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850645; cv=none; b=lx7K2qHM+4/XHRA0Bp32ezCmDE3+ZR5sBU06vpPeSLWh9E07m5ESHO1YvsCY76Pg/9m2IjNTCw4e7bCstwWVRQtAjWNh5SNFbiXz8ppI3IZ40N0oGyyIJVNFPaO0RdwessSGLPBjTa/gbkQBtLhA16VqzlbtYj68inBbDwGW5/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850645; c=relaxed/simple;
	bh=QfMAQ3ObJOM7gWSlinrrpwhjt1hderzxfmdZZzAXUok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y4HDQ5/GgErBPrQ9VeocZ2R7ijkp+JJftD0wISjkz6/opfM9Epc7kFnpk2w3G6ps3QPykpa1xW/ZqKx9fLL+6S8Y1UACQ42Ji9Z05HAftgiBqHoISdMdeZ41hufX/Ha7DlLAqEUVZVz1YGFj7mh/KT+knKmwAG89H8xvkHQZMjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JqwHzBsB; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JqwHzBsB"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso4040637a12.0
        for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 09:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850641; x=1734455441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UysEDL+tYPOXb/CerEK2e/yd8/mnBKQO5ExCdaAA4A=;
        b=JqwHzBsBEtd6G7nP26tKtUetS/eenZbMMrUCRVLkWx99zAOMVKHQFyp8iaVQCf8OyC
         pK0H6wj5Qz2eWGxAGNMG82okQscg8tl5fVDnO55YWDbGhrh/K1+YOykOomQREU8H9yHs
         PTSEEQV+ewrbVQFglz+GYna9/XyO6nmPvpQmYCHLs9smQM+ayP85EAhIQlNgmOM2oGSY
         EUUVRaFxjvpyaDHkAdpcrzmXnvOi+QwqCiU0SxGsaOnTJ1xh7gN9LN+ugcGDiIKJap8t
         LRbpYIWSPUtH8TcB1Ly1vA2Bk6FHKxqZnE1DZBOe0TyasfNUoUm1xQ31sRez2CrvhUGB
         hrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850641; x=1734455441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6UysEDL+tYPOXb/CerEK2e/yd8/mnBKQO5ExCdaAA4A=;
        b=UOKY04lxYu+Xb9OwDp5/hqGV9pE+fhQrY6mWQ7JNziOniroYPo7fAxuIFD/sjUyHS8
         CAVQXGiXv78OrdAlLPqezvdSxFj0pUBNi73FTHxwI9A8AsTOGubcqhrw7ZILLAj4g7mD
         aASxayrfZc3ryGD6TJjfWBQO5TUFP9vtWKipfOHsp0M5ceesDZH3npgV3/Uug6SKxtq9
         h+jt9jw8X+7OQRsKMw0taDJBpk2vAnuueyfmuT0ZTpLMbbMrGuZGPjVE377dz6HZu6Ch
         XDxHLZhPt6zRO4nKHkdI2OdPjGTFT6dz9i+nIyOkoaj8fc0URbY0NTJD/2rcwmZ6/40w
         IzRQ==
X-Forwarded-Encrypted: i=1; AJvYcCW39bWD0uGMIOqu0vkLbfwfKAKFCrvSPShUuJDVf7ZqHJacvkvzpgoR7g4aKOqpP72gGDh278ODAHA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/1NgOvgXppeSB3t5k0kPSfmoqp0f55KHZaTNQ8FeLQe8igYO8
	wSJ2X5OiGANFFURWZ1/BsbbAd27tGsQA3jm34nWch+a0ItmWw0HonF3VuwpkI1g=
X-Gm-Gg: ASbGncskbs4J9SnxGeiDOmIshPkp/LPkWRs8NDHSCCVT7Ei9q08oKZAdXZNxuVy0CUz
	ZhMSe5qpQBzACPovQutum9GAbwabUbmnf38R/Ku5yYRYenM0bhaH4rGeCSRAQV9D5IFa1JIP986
	yXFy1RD64SW0JSuB4am+9AbJ85EZMMVpnsOnMlxwm0wKbrYqBxcMf2ywCPs8U5erK4KuFddKaBx
	Ah9nPiB0jqCUF4dO9xkkPcybHZ3NZfKvc+TlHjUVlVOwCFTm2lhLlX7hGov2XuYEuih1C6guDhh
	7NBy+EoZ
X-Google-Smtp-Source: AGHT+IGDKksFRS7v8EJ79Qo0q8lVB55Bo0RkH6EDk6sqVxrrszOEC3HW/n36JzbvJ+iqRQS48HVTZQ==
X-Received: by 2002:a05:6402:35d1:b0:5d0:a80d:bce9 with SMTP id 4fb4d7f45d1cf-5d3be71c114mr15442107a12.20.1733850640930;
        Tue, 10 Dec 2024 09:10:40 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:40 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 15/24] ASoC: renesas: rz-ssi: Add runtime PM support
Date: Tue, 10 Dec 2024 19:09:44 +0200
Message-Id: <20241210170953.2936724-16-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
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

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index eebf2d647ef2..34c2e22b5a67 100644
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

