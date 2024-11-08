Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359261E4929
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 10:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063053; cv=none; b=k/bEBDDjTyvQRvppTCkQqNonctEmWaqw1mR9NmeIMwF4ABEU5kY/ls3umiqWIO56KO9SqDfg7I3TI3PeyxXQ9CBC8MYiGHOTYrHl7F9S/oNovHnqxukbxmoC07V1Q7boVS1/6ZCDYK95JgYfiTIJttnD7EZLcEmRbOsIVtpCjgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063053; c=relaxed/simple;
	bh=VonvejSvZtz2cWZ7EWWkpJ5UBzctxv952aKOBg6yZy8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K8/vZSNmBwl8O4UTKM9mTdRHHUnZLo8qrSiK7k7CWnmpTIX4oDTLw3/t7triBZLm4A/wBVmSWuFTgfwO6dNQqJppl2EjmCBiXYu8DXKGPqg+LK7EtmDvwxqRK8fym/PeUUc0hos2RQ6WD1v8tjngjvLch0O24WE+yB6JVafaisU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=V8j+OEBM; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="V8j+OEBM"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9a0c7abaa6so229281466b.2
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 02:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063049; x=1731667849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxD29TLdBIx0OFMI1iZi4DJrptnupP/yjljls2N0w4U=;
        b=V8j+OEBMF6WFGysv6HOLU7vp2a0ENEL/8q80spkfXN12CLjlPnIi83qYEcaU2vMLaq
         xBPdPxRAuaM9jYYDco/Dg3aaG9Y03jNhGCMGqavUmwacrHfwLajn5S0Q/rWTw4yv+ifP
         ZoWVcwveM0nKI5tdRK2HNrJZ2dS2y7vq4BuxjacNcMApNv9ulldYWSaZr8TXx3lJZB/i
         8ScpginyP8OOQznIB/eM+q/brvVJx5mZx+VeV9dqV7IA3fnzOzgQbT2nh0WBKae+tYUz
         trimE07bo6OjLRQhrWIvhrC/f/rYFCYYM8z1XlSMfhNFI8oJwazT2tGMiLFy1TE8yvkm
         gLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063050; x=1731667850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxD29TLdBIx0OFMI1iZi4DJrptnupP/yjljls2N0w4U=;
        b=EYoq+vJrET3z02pxpYSytHQjC95VGX+D04rUjaODlHDrG/bLuLduJu39JSSxv/ebDw
         Z2FrQb0qJz2Sp0Mz/XJuRWdkz3TC8cbZPHdkUsJmMN4h7w7Ci6SwHz3KHYApxAsKE7S6
         1GNhbf0Af68K/uRinWgFR4pdHBzcLKtY1c6SaQU7nRCiE7mP6Y+Q9YaLPabcF6EA6Q3T
         lat8VKtPZmIM98b8cpQYjJ+6zxszuz5RKm++DTOrF7IrZxYXy9qNjwnmBdDpzd7HqJ8q
         ynYrQWZiiY0Wm2HFVKQTZkj/MYRqE2FwS2r1z+2ZgpAfDusytX2klTv6xXMaDabXvqst
         PSXw==
X-Forwarded-Encrypted: i=1; AJvYcCXq7O/i3SPAi13/Th5ywvxeSHC5cvrn/pUF9clmIaUWOCeOkTra77N/RVtKCQ8SGiCNdyjRQRk/fPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK+8hgmiy0rV9qkNPq5aU9Z9sO1ztqZQ6/yKNfTvSdQ+WLmmA1
	zzY8/SEHkX9hgZHfOh013mSuYbaVpXsSByjDsi17eDmmIFqezNv0fuh2QlRgukM=
X-Google-Smtp-Source: AGHT+IHvN0EL1LXToTh6UC1+zMH3D9cZ2TY8Jb6+WnY25RpAHLyVeWrjFPA7b1je8e1yRCDrv5kzpQ==
X-Received: by 2002:a17:907:6d05:b0:a9a:19c8:740c with SMTP id a640c23a62f3a-a9eeffeeb1bmr219199566b.47.1731063049500;
        Fri, 08 Nov 2024 02:50:49 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:50:48 -0800 (PST)
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
Subject: [PATCH v2 15/25] ASoC: sh: rz-ssi: Rely on the ASoC subsystem to runtime resume/suspend the SSI
Date: Fri,  8 Nov 2024 12:49:48 +0200
Message-Id: <20241108104958.2931943-16-claudiu.beznea.uj@bp.renesas.com>
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

The ASoC subsystem takes care of runtime resume/suspend the audio
devices when needed. Just enable the runtime PM on the SSI driver and
let the subsystem runtime resume/suspend it. While at it use directly
the devm_pm_runtime_enable().

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 4af381f6d470..35172630be8b 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1140,11 +1140,10 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	}
 
 	reset_control_deassert(ssi->rstc);
-	pm_runtime_enable(dev);
-	ret = pm_runtime_resume_and_get(dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0) {
-		dev_err(dev, "pm_runtime_resume_and_get failed\n");
-		goto err_pm;
+		dev_err(dev, "Failed to enable runtime PM!\n");
+		goto err_reset;
 	}
 
 	ret = devm_snd_soc_register_component(dev, &rz_ssi_soc_component,
@@ -1152,15 +1151,12 @@ static int rz_ssi_probe(struct platform_device *pdev)
 					      ARRAY_SIZE(rz_ssi_soc_dai));
 	if (ret < 0) {
 		dev_err(dev, "failed to register snd component\n");
-		goto err_pm_put;
+		goto err_reset;
 	}
 
 	return 0;
 
-err_pm_put:
-	pm_runtime_put(dev);
-err_pm:
-	pm_runtime_disable(dev);
+err_reset:
 	reset_control_assert(ssi->rstc);
 err_release_dma_chs:
 	rz_ssi_release_dma_channels(ssi);
@@ -1174,8 +1170,6 @@ static void rz_ssi_remove(struct platform_device *pdev)
 
 	rz_ssi_release_dma_channels(ssi);
 
-	pm_runtime_put(ssi->dev);
-	pm_runtime_disable(ssi->dev);
 	reset_control_assert(ssi->rstc);
 }
 
-- 
2.39.2

