Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD561F6694
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 10:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063062; cv=none; b=bCmtXqd9UQD7AAqMYDxj6tVD//mFpvfj1Nqw92n8yOP52r7XXfZaTsm9gXGoZ/QpeZFJJaANDAq6tupV9mZyyW8D6zcJaWwc/JyGsIqG7s+J0qsBskIBIQwPzlJ3vEk8JTaCs9ODbfPjeVrZNlhUiYtYHSlmqBm7DTlAOPWJz0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063062; c=relaxed/simple;
	bh=Nfd4gDEK7GpGxcCuhGzfaZ7psjmgyb5HQdhVpDmwzn0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kT3LJyKgg4gmuNnnJk4nfw2v+Ofz4D44FzkuIhur9ShRc2yXwMrYptwOR9gqh+8Edfoydxs29BR/sRDGtDSdYXc52UT3cCURDbEhqTItYpe1uV/IAu2ci3GpqB1gQq0mzRUccQYlTpmeoIQAkKL7hDA4oXgB4KuKHCnuWw4P41Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JUXWhKzF; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JUXWhKzF"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a99e3b3a411so522274066b.0
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 02:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063058; x=1731667858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsddwLgoaUC21DisQKymp7RX967qcBXHNoEIK2XIDWs=;
        b=JUXWhKzFd16CctZn7e8jQG3M61+vTk0J2aQx4QS/3YD9zCiXw8MSVqUsUo1j5XBISO
         KyG7nuy05aZY0sIWvr0Vc+uMJxOxK64wrAlYDWk4IQu8X9P7gl9qjSfN6ApK+mZe+C8B
         0syfeLty2qA5CEBwYzDU6cf66a2yU6qWQioaXSuibqAUJkXYx/Tc6h3hRxdTlAJ5dRsL
         TQSVNVK2kC9YEqCbvdJs474pxk7UHnD5/OJj5GHhl/y5sQ8aEUsb7ZapPz2F/v9VnaWK
         wuwX8X9/EWL98KtbaMWmIXxPEQ+zEz+K+AGOglk9jHVlzwkikSb//+zVyLGOqAgSJzeD
         ph4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063058; x=1731667858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsddwLgoaUC21DisQKymp7RX967qcBXHNoEIK2XIDWs=;
        b=dp4OBpOKlqpOzkKrPnTmFPJkSsw8AVJNDBBmPKuG0KkThMAskjGHwjhlx393uWQZzw
         1Xx2N9SznexDx+2F7XAM3kCyHV519xtwZvw/wYDixrQIXH6ihdvX4GGg0AUEPGdSEa9j
         VuNyqr71YPPq36g4wwX7SsBiPoYWN9dwQ/b2jbyjKvqTbP3RQAmtdfWE+gRCWneDkYTu
         OwxD4pSBJpFzZ6G+QC5Uik2BMsrwzZvf1hYkX75c+2FvK6V91h3MsG9iEiRMSax9YrIw
         8aXuzvO24G4bro35JitK86hc1MBqpDp4zriZlmJDV/1YMBxx7sYA6l5Pht6RdayzwVdK
         aYFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1x86Df1YCOgPa6g/LQkdv6bl/+gNUpNf5KEt3b0T11lus+F1JXJwvbtshhxYPKPWDG1UlzZ66ZwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCpvgjAtSyjfOLnvk5xXXXZfJ2hccJdC9QOC8Qu0xUpx6hk+7f
	liRF8Lg4TNlWSrg3j3ForxTdKZcrTcj2VXhUviMr6QueJ+Jxk0btCzV0DlnvXfs=
X-Google-Smtp-Source: AGHT+IEJg8K3pdmbEY8dCNi7XCNAbif69J5o4laKl4Sk/PK5iN8hqJH5aC5WbhvZFA416qHorGkEjg==
X-Received: by 2002:a17:907:7e83:b0:a9a:170d:67b2 with SMTP id a640c23a62f3a-a9eeffe72a4mr197003166b.29.1731063057752;
        Fri, 08 Nov 2024 02:50:57 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:50:57 -0800 (PST)
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
Subject: [PATCH v2 18/25] ASoC: sh: rz-ssi: Issue software reset in hw_params API
Date: Fri,  8 Nov 2024 12:49:51 +0200
Message-Id: <20241108104958.2931943-19-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The code initially issued software reset on SNDRV_PCM_TRIGGER_START
action only before starting the first stream. This can be easily moved to
hw_params() as the action is similar to setting the clocks. Moreover,
according to the hardware manual (Table 35.7 Bits Initialized by Software
Reset of the SSIFCR.SSIRST Bit) the software reset action acts also on the
clock dividers bits. Due to this issue the software reset in hw_params()
before configuring the clock dividers. This also simplifies the code in
trigger API.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index d0e2665ec830..10dd973a1c85 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -388,6 +388,15 @@ static int rz_ssi_start(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 	return 0;
 }
 
+static int rz_ssi_swreset(struct rz_ssi_priv *ssi)
+{
+	u32 tmp;
+
+	rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_SSIRST, SSIFCR_SSIRST);
+	rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_SSIRST, 0);
+	return readl_poll_timeout_atomic(ssi->base + SSIFCR, tmp, !(tmp & SSIFCR_SSIRST), 1, 5);
+}
+
 static int rz_ssi_stop(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 {
 	strm->running = 0;
@@ -782,14 +791,6 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
-		/* Soft Reset */
-		if (!rz_ssi_is_stream_running(&ssi->playback) &&
-		    !rz_ssi_is_stream_running(&ssi->capture)) {
-			rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_SSIRST);
-			rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_SSIRST, 0);
-			udelay(5);
-		}
-
 		rz_ssi_stream_init(strm, substream);
 
 		if (ssi->dma_rt) {
@@ -914,6 +915,7 @@ static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
 					SNDRV_PCM_HW_PARAM_SAMPLE_BITS)->min;
 	unsigned int channels = params_channels(params);
 	unsigned int rate = params_rate(params);
+	int ret;
 
 	if (sample_bits != 16) {
 		dev_err(ssi->dev, "Unsupported sample width: %d\n",
@@ -940,6 +942,10 @@ static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
 	rz_ssi_cache_hw_params(ssi, rate, channels, strm->sample_width,
 			       sample_bits);
 
+	ret = rz_ssi_swreset(ssi);
+	if (ret)
+		return ret;
+
 	return rz_ssi_clk_setup(ssi, rate, channels);
 }
 
-- 
2.39.2

