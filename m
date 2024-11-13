Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492ED20651A
	for <linux-clk@vger.kernel.org>; Wed, 13 Nov 2024 13:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504977; cv=none; b=Bwx9YmeiJWCc+TI6ed9KxDuVNxKYr3Gm1Jy9oRlBWcZS1ptinB+mYshQG5HxP+rD6zJODB8ST2oC5buY/A9lggGkzT0tMY67JYPyv0FXa1IKyNI+DZT3DOYW5IvBPTKvLIYVzztdiJsaYUZHtmDp1HXF7khH5m0DxXzHQkktFqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504977; c=relaxed/simple;
	bh=swYVDvUBCzLyRkayMU9MKgEU3EY7gsU9/tgX62amYyA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YujoNxb63qVjYIrcrb7Qv5DoWWRS19THXVP2ncCxItufN9yp/8r4ML92IjCe8lsg7zGbROhARVSyo0pQdsCX8CUW27iMHMTtBxUoNEnGtei7rUJNYe0uJBkW5h3fR4fSutUrYbjMB3sig3HH9/7Lu9sA/0uNQTqpkgMmUvrcoWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=XV+rQS3Q; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="XV+rQS3Q"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43152b79d25so58053975e9.1
        for <linux-clk@vger.kernel.org>; Wed, 13 Nov 2024 05:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731504974; x=1732109774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvjprfNe+RcRmQfMVBGX5BjKxlNBov52pDWtl+y7heU=;
        b=XV+rQS3QBkYIHBRx0GCHx7BPEtVIS/iQzZIChWHB+LykWHB1HG9FsF8/veLrdtP2va
         mvOwGJgS0j/Bvzw4p7LwGAd0QVeU6ORWkR02bmyX+ozJ04dkPwyRyj89AM3S9ibi9Ohm
         OidDyLw6VPUMlf/t8K97MiQi7CGygMQtXMfz6i0adEATVhSl/c0Sc1fTVA662zBzGfCb
         l9gLIeTrefC03CFiqFmm9Pet4iXO+lgNJ7sKfwUfKXj9caRQDKBAhJHlu+keqjtICFTp
         avh8U+3koDO84Etw4nVOAR3O9QgnUEo5aOpeTFu4TOn8bWaZcI81GA7yXb8aHc2hykvQ
         Rpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504974; x=1732109774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvjprfNe+RcRmQfMVBGX5BjKxlNBov52pDWtl+y7heU=;
        b=NJbVgCVwKWAuhOciDG01/lWnJar9XyTAkKaruMN2UXvRdxpCnQyH1sfJTYCs5b0RmK
         agbT2TRV0a0SZeJoxAxTNRry2q2psdQQd/TARc3UhOveMgY8Oxaexj3Au3NgRrduebXm
         u3+6G44YN/sIvXwFX3NMwDead53YiWoOMNmDhe+jOeNe0zK6xBfZl3BlQzUXrC+1yg3c
         L0HhU05Fjc39bD9ROtty53kET1bI/FN/zJTVStnBA5k34vbQiXoRh1Jt6DZVL2zl+yJ4
         GfrlR41ufbnQzzTMNy1lC9s3UQeemtPXyDoijQmWK0J4yNPhrzc6GlMxfDsT6fdkRYT/
         JhJg==
X-Forwarded-Encrypted: i=1; AJvYcCXJt5yo9irH6Q09VIy2tGTIRrRZ2O2QHlmDwBPoVxPGGjZ5RkAkBm90+mdT4U4Jdd6sT8+fCbZ3bMY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yykhu4JwDVKmsfcaHDGpcz4FCpAXAtrE6zObhHPIQdeBYVDngry
	saV1dvYMlnWr0v0L3ngu4oineu6sd0EdpX3XgUeHdXyHvZfTveVMAMmOajRtJns=
X-Google-Smtp-Source: AGHT+IGuUwbtBtrr3ZZ6UAMjsUgHugqHSsXtvyEE9ikoN+t61whad/FdFQCH9Qvu+4KdYC19WeHHSw==
X-Received: by 2002:a05:600c:a384:b0:432:d797:404a with SMTP id 5b1f17b1804b1-432d797411dmr9929385e9.22.1731504973594;
        Wed, 13 Nov 2024 05:36:13 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54e2f2esm25664165e9.1.2024.11.13.05.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 05:36:13 -0800 (PST)
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
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 14/25] ASoC: renesas: rz-ssi: Use goto label names that specify their actions
Date: Wed, 13 Nov 2024 15:35:29 +0200
Message-Id: <20241113133540.2005850-15-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use goto label names that specify their action. In this way we can have
a better understanding of what is the action associated with the label
by just reading the label name.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 2f56c63582e7..4af381f6d470 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1084,15 +1084,15 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	/* Error Interrupt */
 	ssi->irq_int = platform_get_irq_byname(pdev, "int_req");
 	if (ssi->irq_int < 0) {
-		rz_ssi_release_dma_channels(ssi);
-		return ssi->irq_int;
+		ret = ssi->irq_int;
+		goto err_release_dma_chs;
 	}
 
 	ret = devm_request_irq(dev, ssi->irq_int, &rz_ssi_interrupt,
 			       0, dev_name(dev), ssi);
 	if (ret < 0) {
-		rz_ssi_release_dma_channels(ssi);
-		return dev_err_probe(dev, ret, "irq request error (int_req)\n");
+		dev_err_probe(dev, ret, "irq request error (int_req)\n");
+		goto err_release_dma_chs;
 	}
 
 	if (!rz_ssi_is_dma_enabled(ssi)) {
@@ -1136,7 +1136,7 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	ssi->rstc = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(ssi->rstc)) {
 		ret = PTR_ERR(ssi->rstc);
-		goto err_reset;
+		goto err_release_dma_chs;
 	}
 
 	reset_control_deassert(ssi->rstc);
@@ -1152,17 +1152,17 @@ static int rz_ssi_probe(struct platform_device *pdev)
 					      ARRAY_SIZE(rz_ssi_soc_dai));
 	if (ret < 0) {
 		dev_err(dev, "failed to register snd component\n");
-		goto err_snd_soc;
+		goto err_pm_put;
 	}
 
 	return 0;
 
-err_snd_soc:
+err_pm_put:
 	pm_runtime_put(dev);
 err_pm:
 	pm_runtime_disable(dev);
 	reset_control_assert(ssi->rstc);
-err_reset:
+err_release_dma_chs:
 	rz_ssi_release_dma_channels(ssi);
 
 	return ret;
-- 
2.39.2

