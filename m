Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9EF1DB92A
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 08:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881181; cv=none; b=I9+6XZvIfBMDHbUpPvvbaqWgdZsQIjFrqvW9yxK1+tFEDTY2RunKh3yIzwv14uuk2g6ioLkMxkeOOT6QNkgn8ufOrqY9Pm74FF5rr+rtwKbV7m1aNf0ZUquZcR0wS41cpqXiVY/JuhQxCieveUjVJi7b7KcmxljxiyY+JhQPzBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881181; c=relaxed/simple;
	bh=8brdO5ChBsCEBMmJOpKr1+NwPqqTnVgOGPNS89BzLPk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G9B8I2VVjU/mZ5u7yFcDGP8ej/ti7zjHt0Kb1xBDEHAs73N0oUl5Qf5SsHPLaQ2eMQWYUDtFkGNNa6bhQKp6GcyHJIdPSdkw3z9AEXQGje0R/Q7zSwdt26lfNir8kWSIGTWMzIVReqGypmDa2aDWVBd6O60PXdSGIvnAFcaXI94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=IRex85bZ; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="IRex85bZ"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c9388a00cfso7392350a12.3
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2024 00:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881176; x=1731485976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFv/zMw2ngNH0YDOPU2osn55F7oJfnsaip/WAIG44tk=;
        b=IRex85bZ+TNiiBfgGzRFmsmYY0pOs4rlGjjkk2OoWtvx0XSzpdmAzT6HZhGU/wVKUH
         ys2BZnlFslUrZTK6owbLjcAdRpDH8dmX91jVOQtwLTIrL45QbZ2iNNjUUsYHhKjzMgLv
         yemy8EYiZ9eJeYi7S5jEABmzjdPpi1G/03uLwKf7C9SPIJeDZnWEQVrxgC6xVO6s6Xgm
         mmAsO8fBXc/6CQPWbLPUyv9I3B/SJP4kq4nMikzFUgteHqy9EBemDDVqogGy1jDau9mG
         o4K2cD7e7I1RWIFBzilFbm5h5nWhPuDA4jdhPZTjSFoJhPt0gAQpNuzHE2egvdcQ54LY
         YJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881176; x=1731485976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFv/zMw2ngNH0YDOPU2osn55F7oJfnsaip/WAIG44tk=;
        b=msPW6bzXFr2+N5NCl+9JdiksoNiuGIdwPF2PIvCyqd2lfesf2EyRZTD861D31nbDyb
         AVQUw/Fx7aqLzhotMfepY1aJ6PFa2Qpdn2ar+gIesgaT/vENd+HIQfb08a3Ua5y9D1va
         iifu//+v1JrsK3oaWaeggkArPYSEUl4Z8qf3gA9pfhjZolKu7CXddRFsR9ezN/sUxV9W
         cMCpLivTtzjIRaMxqpbOd1vUvt69alhD7nPjtUZGz8WqJjeTQObXW8pEYDu9ggz7O5cQ
         IiGWugfWXno+uGvHqQ2/M5Z8z7MYos184IM262IroNphE7z9RrYe9XmBGkyh7FoMDnEp
         rf2g==
X-Forwarded-Encrypted: i=1; AJvYcCX5PrWd181Sw8kxrCYmIswU/R+draVh2iW+N9m6yKNRKdzJxz4KR9BHnqWYM7sFVwoL82c6rQENA6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwZ7M9BtJ0xySylQnk0ixPCru/W1dkxq/UdOJt6MmuTwMCgdC4
	LT4DYwPVpAM8D233D6HUrfBpmK7VVmiaIksf0JtcY+LJQ7v5lfaaTw56uuQ7rXU=
X-Google-Smtp-Source: AGHT+IFKB0K8OH1ZOQU/BJSNdtuylcOQtAaFCbihUNGMusqZyKofkGcmXslgeVNiqeM1QOLW0O4T7Q==
X-Received: by 2002:a17:907:7da0:b0:a99:f972:7544 with SMTP id a640c23a62f3a-a9de5f40788mr3481462366b.38.1730881176320;
        Wed, 06 Nov 2024 00:19:36 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:19:35 -0800 (PST)
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
Subject: [PATCH 10/31] ASoC: sh: rz-ssi: Remove the rz_ssi_get_dai() function
Date: Wed,  6 Nov 2024 10:18:05 +0200
Message-Id: <20241106081826.1211088-11-claudiu.beznea.uj@bp.renesas.com>
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

Remove the rz_ssi_get_dai() function as there are already helpers that
can give the same output that rz_ssi_get_dai() gives.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index a359235b55af..4c33663a0ae4 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -162,14 +162,6 @@ static void rz_ssi_reg_mask_setl(struct rz_ssi_priv *priv, uint reg,
 	writel(val, (priv->base + reg));
 }
 
-static inline struct snd_soc_dai *
-rz_ssi_get_dai(struct snd_pcm_substream *substream)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-
-	return snd_soc_rtd_to_cpu(rtd, 0);
-}
-
 static inline bool rz_ssi_stream_is_play(struct rz_ssi_priv *ssi,
 					 struct snd_pcm_substream *substream)
 {
@@ -243,15 +235,15 @@ static void rz_ssi_stream_init(struct rz_ssi_stream *strm,
 static void rz_ssi_stream_quit(struct rz_ssi_priv *ssi,
 			       struct rz_ssi_stream *strm)
 {
-	struct snd_soc_dai *dai = rz_ssi_get_dai(strm->substream);
+	struct device *dev = ssi->dev;
 
 	rz_ssi_set_substream(strm, NULL);
 
 	if (strm->oerr_num > 0)
-		dev_info(dai->dev, "overrun = %d\n", strm->oerr_num);
+		dev_info(dev, "overrun = %d\n", strm->oerr_num);
 
 	if (strm->uerr_num > 0)
-		dev_info(dai->dev, "underrun = %d\n", strm->uerr_num);
+		dev_info(dev, "underrun = %d\n", strm->uerr_num);
 }
 
 static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
@@ -988,7 +980,8 @@ static int rz_ssi_pcm_open(struct snd_soc_component *component,
 static snd_pcm_uframes_t rz_ssi_pcm_pointer(struct snd_soc_component *component,
 					    struct snd_pcm_substream *substream)
 {
-	struct snd_soc_dai *dai = rz_ssi_get_dai(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct rz_ssi_priv *ssi = snd_soc_dai_get_drvdata(dai);
 	struct rz_ssi_stream *strm = rz_ssi_stream_get(ssi, substream);
 
-- 
2.39.2

