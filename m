Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6371D23EBFC
	for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 17:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850648; cv=none; b=pIaPjL3nzYvlG/sdsLAHjEDVt9hg6bD3blpLA4p+8h7uO3zLxgES6LaxHf9xm6wDBMV1FB80hfUhxGBYktRzVWr0Mku9kk5ImDQfYjJoMjN1VRv4Yv95AuuD3CKeJVT/NctZTtnL/Sp56+1zL2ErtiaR+ZHsBtI2KG6hSrHO20Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850648; c=relaxed/simple;
	bh=JQNGPZYkGQRQ2sTS79lFZ6me2mcLImriGT7BK3n9sx8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G7nLpF8V/6+45Sa82IBq3GFYkDPSsHd438X/eTIhl6XdmeZNnSMj9LDkOxk2rhJAScNjpXd6zl30JfzOvXlf6O3uHMI4GcXpePBt8b9T011yZYIHPS0rAAvpTuz42hkWhsZXu702pDsVjKMlAN6QnaXwEgk/fVptJRfEjoyCqFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=RxkgtaoU; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="RxkgtaoU"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d122cf8dd1so9452248a12.2
        for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 09:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850645; x=1734455445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdorf6J6oUWOvTlM/ckHP3yguOeZKUZzy/Da078XD3Q=;
        b=RxkgtaoUMawCkOLuYSCT0LaqBXe0bXBvLgBy/pgjEtbXQNA8Vqy5k636ofhxNKac5Z
         euouPsNyepl84zZmi1DHJ57gUxsm4a4ZMnOXZnO5n9tTgpmC1IjGud8k5RQvqfer6dl6
         5BlooiNDCoggtL79AHgEC9LkU8fE7fo+U7sVSwvu8w2URX970dpGlgGJ1xW7RJOdAf2e
         c/m0Jd+uARwv2JQ7MTVqrHJDjU3lwWw1Z0wlgEZm+04vghaA3jzfQdhpI+ZkjHV01CA3
         ZqPWHBXF6RkDUQGeLYHOdYHrJUG6MIz9WwYtVRaMFWn8NPC0K6pyL2PSOL8iah+PegfE
         2IWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850645; x=1734455445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdorf6J6oUWOvTlM/ckHP3yguOeZKUZzy/Da078XD3Q=;
        b=B1edaWeKIe7MymgJiR89woi6b4w/HKZa53nUAPjNR0rQ3yFQcwz/7DMfAUMUTACjbS
         AqtaVm/i52JDREfy4fuimC4DclzoQdVPk/S3jtncVDNJ2TIQy0iTbMyzgV63CESVW6wx
         iPujAUYbLa5lY9MCHE1aLDnzSabCFpeSguLH+e7k2bS4+KfH1XBZo3noxGjgGQ0W0XNC
         qCDM9aQKOzq26rPwg7SS5DmxWvUhGyofj9jYywMv6Ki7LK/xjNU/ReDM33e4FioBzBUb
         esMO6eWcCLcnoBGmQrbCuQkNh19vZNyQI/7Cm/30w/POuFQw9iUWHUVxg3RMYGxVzvUv
         9c6A==
X-Forwarded-Encrypted: i=1; AJvYcCXZGblRaRN9mi7IdgjQ2G3tUPfUw8tSn3IVz+2AP4sF4gls+Oo3cBr1eHjw3MXYVffqAP49oMTlHi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwheOQT59Eu9+LT7fNInpO8QtAFcM+X98GVcR/YmwOclY+Ka7G+
	G/CJUJc6vzh3u1ysqraFcRNNgTKiqBwAS3go5qO8Wot60ydveqjeRdwCcJUZZLs=
X-Gm-Gg: ASbGncsHx4Ch+39bVrmAN/ulolopXWnYVcBTPgg0xxjF7Vz5nBUXyqKtrQSsa95JXFF
	o3N2nzsxrdUd2NW3vVdmdWMuakthwpva93UeD+pd76cYy97pu/xG8lEmBauQrqNg8Ckqe4EgJSc
	98aoG8pBrg7o3Ecxa2PuR3zeTDthCUq1dhW1YhNMgHeQZ5H7NCYb7DCUj6etPe+7ta7eM/Gcz4m
	52+KFtJU9Xzeg5y27z8wDJz2Aoc2J2auflKO8bOhiMtL/lC6BZUnXcDAaqW2ikBWOUZiViPmvw1
	eldMWG6a
X-Google-Smtp-Source: AGHT+IG0YYavl8GoEPcOWdjWdvPZujuBgG2HJ16HofI4S8uWOgmyS/RSRLDoRpiWfKoP6RlhHB13MA==
X-Received: by 2002:a05:6402:3493:b0:5d3:e9fd:9a15 with SMTP id 4fb4d7f45d1cf-5d3e9fd9b71mr12243945a12.32.1733850644830;
        Tue, 10 Dec 2024 09:10:44 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:43 -0800 (PST)
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
Subject: [PATCH v4 17/24] ASoC: renesas: rz-ssi: Add suspend to RAM support
Date: Tue, 10 Dec 2024 19:09:46 +0200
Message-Id: <20241210170953.2936724-18-claudiu.beznea.uj@bp.renesas.com>
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

The SSIF-2 IP is available on the Renesas RZ/G3S SoC. The Renesas RZ/G3S
SoC supports a power-saving mode where power to most of the SoC
components is turned off. Add suspend/resume support to the SSIF-2 driver
to support this power-saving mode.

On SNDRV_PCM_TRIGGER_SUSPEND trigger the SSI is stopped (the stream
user pointer is left untouched to avoid breaking user space and the dma
buffer pointer is set to zero), on SNDRV_PCM_TRIGGER_RESUME software reset
is issued for the SSIF-2 IP and the clocks are re-configured.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 46 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 486822d79458..d48e2e7356b6 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -782,6 +782,32 @@ static int rz_ssi_dma_request(struct rz_ssi_priv *ssi, struct device *dev)
 	return -ENODEV;
 }
 
+static int rz_ssi_trigger_resume(struct rz_ssi_priv *ssi)
+{
+	int ret;
+
+	if (rz_ssi_is_stream_running(&ssi->playback) ||
+	    rz_ssi_is_stream_running(&ssi->capture))
+		return 0;
+
+	ret = rz_ssi_swreset(ssi);
+	if (ret)
+		return ret;
+
+	return rz_ssi_clk_setup(ssi, ssi->hw_params_cache.rate,
+				ssi->hw_params_cache.channels);
+}
+
+static void rz_ssi_streams_suspend(struct rz_ssi_priv *ssi)
+{
+	if (rz_ssi_is_stream_running(&ssi->playback) ||
+	    rz_ssi_is_stream_running(&ssi->capture))
+		return;
+
+	ssi->playback.dma_buffer_pos = 0;
+	ssi->capture.dma_buffer_pos = 0;
+}
+
 static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 			      struct snd_soc_dai *dai)
 {
@@ -790,8 +816,16 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 	int ret = 0, i, num_transfer = 1;
 
 	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_RESUME:
+		ret = rz_ssi_trigger_resume(ssi);
+		if (ret)
+			return ret;
+
+		fallthrough;
+
 	case SNDRV_PCM_TRIGGER_START:
-		rz_ssi_stream_init(strm, substream);
+		if (cmd == SNDRV_PCM_TRIGGER_START)
+			rz_ssi_stream_init(strm, substream);
 
 		if (ssi->dma_rt) {
 			bool is_playback;
@@ -819,6 +853,12 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 
 		ret = rz_ssi_start(ssi, strm);
 		break;
+
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		rz_ssi_stop(ssi, strm);
+		rz_ssi_streams_suspend(ssi);
+		break;
+
 	case SNDRV_PCM_TRIGGER_STOP:
 		rz_ssi_stop(ssi, strm);
 		rz_ssi_stream_quit(ssi, strm);
@@ -958,7 +998,8 @@ static const struct snd_soc_dai_ops rz_ssi_dai_ops = {
 static const struct snd_pcm_hardware rz_ssi_pcm_hardware = {
 	.info			= SNDRV_PCM_INFO_INTERLEAVED	|
 				  SNDRV_PCM_INFO_MMAP		|
-				  SNDRV_PCM_INFO_MMAP_VALID,
+				  SNDRV_PCM_INFO_MMAP_VALID	|
+				  SNDRV_PCM_INFO_RESUME,
 	.buffer_bytes_max	= PREALLOC_BUFFER,
 	.period_bytes_min	= 32,
 	.period_bytes_max	= 8192,
@@ -1201,6 +1242,7 @@ static int rz_ssi_runtime_resume(struct device *dev)
 
 static const struct dev_pm_ops rz_ssi_pm_ops = {
 	RUNTIME_PM_OPS(rz_ssi_runtime_suspend, rz_ssi_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver rz_ssi_driver = {
-- 
2.39.2

