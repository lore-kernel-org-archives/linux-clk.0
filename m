Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BF32500CD
	for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 17:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850632; cv=none; b=XygNki3883xjmRicLfeliR0LtFsuBT56iF2UF6YReBs0/46JJUozvJCE736/OeO6HZX4jBsOOdsIwgK5R8WmnuLMisDXzbjpoEP3BFXKwBVyIb9Uyrzrw0keubS39Cj9Ly5q6S9JV0kruh0qKrIjqKU2ziV03roiVU3WDDHKZPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850632; c=relaxed/simple;
	bh=cnajpc59mzRLWDYn+TlQEWJ18Tzqm1CRjbROQ6JPtZs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DIhyDMC4ko6l9oPcag4mirtTBeQXvHmYeDmbokAHV9XZMc4O5mawJKA+lBrC4F89OG8crRdV0ffxalbT0ycojLDWATpnakIemmOpAxaHPbShASMpDNsbqXKgkVGfCkEZZ040uHz6LM4y/+WyqFQtvbfzTP2Sv+e48G3ir4ycSNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BY4gWM0a; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BY4gWM0a"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9a977d6cc7so856666166b.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 09:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850628; x=1734455428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3F8PzVf1JVHBMdfZjuuSPBsoTNCHuDc7mT2swoePkeA=;
        b=BY4gWM0aRKGmRPNfU/t17wSV6WCBMCbALqJIZ4xdnA62ORaysTgl0Mq1WJUkC/jvOe
         EtqPV8SeIsWUpXEHMdIo1c8ASje479H3/71wwqGhO3lmhIjeJ7y9U2kCThtRAxUGo+Y5
         9pl2SuPLNEF42r//twOOg5LRgNgar9DFo2waWQUjstF0PZZ8ZGD5IEaQga6RYBzS8aI4
         TuRFpVgkOT4HlZLzfo0mAsTMy5HkDY+bgcScK9oLG2PgCRL0EZphfkwVUSSU+n/Janrv
         ygBdWpp2fy6pVySIZmTqxnk1/CtHuq3Cc7tAAXkiQ9QZ28GURU+2nZltLA2fgy3btaMr
         0umw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850628; x=1734455428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3F8PzVf1JVHBMdfZjuuSPBsoTNCHuDc7mT2swoePkeA=;
        b=eW9gsPirba88wulYAUg/OVn2j3Z8XnK+QLZ+Pmmv/TcyaSscq8QrGLPa3UE9B+ZWro
         MaNVIY6F2Vs0/lqoeKvemliqpFIKaLIhFUL3FPHUar3HFk4E3EknnJDN2bDI5EI+WhcI
         E5GbJe2mp7J2W83Pa3Ed+fb0602jJCU1v5jvpuwec8Jf72MDmCyTG2b1093vqKp+LEt0
         J25G5NzFbJ48/4NhsZ0pUUhRSiw0iB24WHxmTDxnZqtfeJVEo6poefnsrRfuOAVceXAH
         mS+r6tTVr1h+4Z66unqRfS5AwriL2lmwxSsvP/wgWm3dRLmSziGtFXEcXNb766+S1ZZr
         zQ5A==
X-Forwarded-Encrypted: i=1; AJvYcCV5NRQHc1Tmj3KfPE7JTOglD2zUkYCI1zczdw/FkKqlULM7Gyk2TeSoZOpS93H4qD4wGlgL0ii9MwE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx+1PlhPbCdHyxmnEv2f2Ab2lTQQPamDXrw13Rm1M9FZyUqbJm
	87KuISk8+7wGXiW5bFVkFGBN6s8jnscDliqbx5T4ZUFilCQuI1xpicJ60dK07Og=
X-Gm-Gg: ASbGnctK0LyLKJbATXPpmzsSEwoReiiHngkCR40ubRyEhkK3ccwBJmBv2u7SzzBltYe
	pwLs+6lF4iVcH5Q+nhgxoslFB3OqN/cfuDf7vT2Jx88Mq7Wy5X9iAO3wTsGyhDVViB2c00JkAg2
	pRSoeTzXIoqUXFvQQ1PlJqtmBIVtNv3WoTI4t972sFUebXCHmRUdgj2rFsOlV6b4exgDTJzH987
	0X9FraObeSbpb0h+E2I/fX8e+E7yT9Ru0sTRUhp7QG8ZA6b8OQyoFJ6Y08Zv1BYUEiZuy+MmOs0
	+hDgZ464
X-Google-Smtp-Source: AGHT+IF6mILseNMfJmIB9ZOyimXPXPfxpdkmjbt3WuqKLQbtoG5tgiV9L7CF+aAEAjMF8dRgPTsU9A==
X-Received: by 2002:a05:6402:42c6:b0:5d0:ea4f:972f with SMTP id 4fb4d7f45d1cf-5d4185060b8mr11381588a12.8.1733850628448;
        Tue, 10 Dec 2024 09:10:28 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:27 -0800 (PST)
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
Subject: [PATCH v4 10/24] ASoC: renesas: rz-ssi: Use readl_poll_timeout_atomic()
Date: Tue, 10 Dec 2024 19:09:39 +0200
Message-Id: <20241210170953.2936724-11-claudiu.beznea.uj@bp.renesas.com>
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

Use readl_poll_timeout_atomic() instead of hardcoding something similar.
While at it replace dev_info() with dev_warn_ratelimited() as the
rz_ssi_set_idle() can also be called from IRQ context and if the SSI
idle is not properly set this is at least a warning for user.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 1a98f6b3e6a7..03d409d3070c 100644
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
 	rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_FIFO_RST);
-- 
2.39.2

