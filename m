Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4941DDA24
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 08:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881186; cv=none; b=kBYEeUczABwhDcSKAzC7Dcbv4cAKzK1REm26K3Ia3hhdneClz8gPR3x7bBjPBHGXSpi+/BGWUB6LDo9fFDn5JSwrBCHEL77mxRNmcJW6/J04Qx0mjnExdVQ/5RzeFlQ210t47bXNX6Ynkyb+N7BSY7MiHLEktQp6QD7X1U7QGPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881186; c=relaxed/simple;
	bh=6zsnUxSYKp1CaHE5aCUM6dFjvDbABs3X9HX/f33Y/kY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mvXSXwGxHNIMoqLYF1rEJ7bZreMbS0d656eyCVsUOG7fGYeAlhqRLwE6rTOEosU11nWKN0OXFj8sIHdZrXY/cNYc2X8o1wjNj5jxZRL4VNugxZIC22SFmR6Bv31Znk7vaOxE4qjUch+8ri86pQKPB0MPrYpnB4GPh8cSQDgIrH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FDzcQ/iO; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FDzcQ/iO"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9a6b4ca29bso812900266b.3
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2024 00:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881183; x=1731485983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVeD83iYkyS0FEe3667snnbzghOUUmW96GqGfRItNjo=;
        b=FDzcQ/iOuSqeErffVMon15CZOFH1E0zedl7AyLmyYZHELuaIvo6ktSkhLbk/dIQYYt
         n0m1PTvSEnPyV33toG+T1vSIyga09yi8zRVTsWX9ei5yeEtw2dOaNOJmt4DjiPYvm2BX
         VtIcewXbxKpWvg0v36iXVm665CEEOXBsP8l6gDXQ55bHuD/sESkzyc5ymykKyLNj/c98
         ZiFAruSGAzM3KBWvc+MFxW1+zlgaX4WPRrhv/1jtVG438k7gTskQHE290fHIZp4QXQP9
         EggAAKmP3CexLKG8ODnPZaQ8w0RwQynpzFgx7RD+G4ts1GfDbLtEFSduLgESglVmAx0L
         CVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881183; x=1731485983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVeD83iYkyS0FEe3667snnbzghOUUmW96GqGfRItNjo=;
        b=gG5zZ2twVU8YqwNpuiDHx16XVHm5rBIBe2leYAKTKlFk5e1AltPkP3E/2mrMrTktMS
         u7DFEgZ/qyBD35emHMwPLGX6loHiqfxgK5wKBYDKItWSOTdzkBVTfzEtAncluEPMN2T+
         HQWsdZ0XcVCjhrTysVTcUl5N5xMpsGap+qsiGDMm4SFE/Nmasgk8L/OZeVDzCIUixqKq
         H+hGBg3rqq0U0iSI0k5TbvJRy7I2aeVK+Gre/xCAKX7Ed0m20NjTJyKAVvqVb0Frbslt
         aqDerD09gvmftGWbbFRuwyWUA/KKXwAQE8NcTM6TDk+xqUyFed18ju1AuxLhNs48N3pY
         7cUw==
X-Forwarded-Encrypted: i=1; AJvYcCUJOgAyL/Pop+UewE8J07EuSByx4PEW3gv4oH4N9i/zWN20Pm+/LcPqBZRUFgR9R7p0ij5Nd1rsgwM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTY3GTS30Pduuu2rzGrYTMZr0PTfbpm2CDGymwYCIMSMbUU6NF
	B31ysX1v4LWmjtW6zDdiLHwFM2yDmA5ppq+o3AqgKlKfJrKBuLpK0tzCJpBIbq0=
X-Google-Smtp-Source: AGHT+IFHoE3pwazDx8B7UaCg0uzFJmbGifNHvIHNA59h4tWY69aWJr1VbGxezG1RaS/c+8FOH4/G1Q==
X-Received: by 2002:a17:907:7ba7:b0:a9a:46f5:d6d7 with SMTP id a640c23a62f3a-a9e508a0631mr2127784466b.5.1730881182914;
        Wed, 06 Nov 2024 00:19:42 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:19:42 -0800 (PST)
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
Subject: [PATCH 13/31] ASoC: sh: rz-ssi: Use readl_poll_timeout_atomic()
Date: Wed,  6 Nov 2024 10:18:08 +0200
Message-Id: <20241106081826.1211088-14-claudiu.beznea.uj@bp.renesas.com>
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

Use readl_poll_timeout_atomic() instead of hardcoding something similar.
While at it replace dev_info() with dev_warn_ratelimited() as the
rz_ssi_set_idle() can also be called from IRQ context and if the SSI
idle is not properly set this is at least a warning for user.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 47b82fe549ac..14d1edac6c34 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -9,6 +9,7 @@
 #include <linux/clk.h>
 #include <linux/dmaengine.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
@@ -307,7 +308,8 @@ static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
 
 static void rz_ssi_set_idle(struct rz_ssi_priv *ssi)
 {
-	int timeout;
+	u32 tmp;
+	int ret;
 
 	/* Disable irqs */
 	rz_ssi_reg_mask_setl(ssi, SSICR, SSICR_TUIEN | SSICR_TOIEN |
@@ -320,15 +322,9 @@ static void rz_ssi_set_idle(struct rz_ssi_priv *ssi)
 			      SSISR_RUIRQ), 0);
 
 	/* Wait for idle */
-	timeout = 100;
-	while (--timeout) {
-		if (rz_ssi_reg_readl(ssi, SSISR) & SSISR_IIRQ)
-			break;
-		udelay(1);
-	}
-
-	if (!timeout)
-		dev_info(ssi->dev, "timeout waiting for SSI idle\n");
+	ret = readl_poll_timeout_atomic(ssi->base + SSISR, tmp, (tmp & SSISR_IIRQ), 1, 100);
+	if (ret)
+		dev_warn_ratelimited(ssi->dev, "timeout waiting for SSI idle\n");
 
 	/* Hold FIFOs in reset */
 	rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_FIFO_RST, SSIFCR_FIFO_RST);
-- 
2.39.2

