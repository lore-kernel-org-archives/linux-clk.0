Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFEE2397AA
	for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 17:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850622; cv=none; b=TpwsI4LO5ibRTKe5sFmMZrtgyxXQlapCRWmayroT9vSUCj2coGTsIOzaGoNM2ByuiACdHA2+vY0uVAnkg/2KuF89Qtw+NEsxxwLGLxzG1XFwwcaBuR439qgOwXcA1Q5SbikmKgLwjxSIz0ks598Cd448ndlIGaKpfDA0iOl1g0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850622; c=relaxed/simple;
	bh=hgummav4gWlxydCCaiYlSrENU1T64Eunf3Cfp6+7rSU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e5h6EiATP504UMk4PKbSmenqR0ooNlUHh8ltN7H9Uwc+qo998/u3wBmNA/80bRACXELbYAVocEdyJ6+8+8+WxGQrzn5/Ln7KfuP6TFzZx0GmURFoGyjdOZZaweOulLFq6VKLmN3rsmHb1fPs9UMhRGWiJndpWzkPtH3WLHCLSJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=hDi+eEZM; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="hDi+eEZM"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d3d0205bd5so5071424a12.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 09:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850619; x=1734455419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFuKmapnbE9+QOXBiNESOVZ7AOkqywZ/u7IM8EV36Uw=;
        b=hDi+eEZMHKYaStvYGNqdq89LdNEds2TOOG3WmHMR2G5bGIw+1r7JQMrwNVZfDNGpQq
         67ciFOKnp7z+LRoH5r1a22banVTgRw05K7pEhUj7MyX/rloEGEncZE7eGcVfzXAEdjU1
         J+ZeOGFMmxO0i3FyoB/bHDuRHEfDrxwiSKLKu0JQXTDNFLSyeeI6ZceIYCG7hxfxoKQf
         ntMm/dLiPvrjDIk8TD+QvRLDjd53E6RhInc2wHnOa3GfkiWj5wCWA7ZL5aBMm9SZXWk8
         8TXzRDFkHHXW4WvzkIFKH0Ra45UICMoqR1uvMS9K3cBpe0uCRXP7uhuZepJJWNnMIWzL
         nt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850619; x=1734455419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFuKmapnbE9+QOXBiNESOVZ7AOkqywZ/u7IM8EV36Uw=;
        b=hsh8I9BbAHARwp4Q+kB6kppiJ68ictljQcKNlUu2mPT3A/HuYwaG+tSB/MxeyDPYYT
         moCx98Pg6YnF+T37/CpPu8EPYvY8YikP95PJ006ZRr4nXJs7ESJAaz2mbIlIn2JRdoIi
         4MRZap1laJTDiWPU9bBs7X6kDa5tSb2YJ73VqnIT2hQeFXgvsFqoNhuRZWNo43GQQ5qr
         iHcR7E7+Xa3O8qLIvyHZd+Gl5Xsg6LVgDrc0ZByRPzEgCdhs0r+CqyIGFUgKdz9Gb5hm
         e5rAUOKQ9yVrn7LnuaPgbtlSzZFs4QNjdnTwTVXh3jK6mmQ23hqdkB7EfpwaM6431Thf
         1/NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSbF5BjU6Y/8xHCyGd+SMWn+FuN9kzHPh8mirU5W2vIQU080yklvWrzcaU6zWJS7hZSrLp1jyZ+SE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxen1Bw5//oWlLN14eJK74pXjYrRwSpeGuoK2DIEdSXENHPYVE
	/IJhYWZEKPwJUZudLBcmAY0eFvFylUkIyJpIPSEaWIsxxp1p2n+bRlLjUBQ3Wu0=
X-Gm-Gg: ASbGncsHBXdQX0IDK/4CiZFciB9l8sD+VF31BoPcrxhK241YWM4w2T3WhYHHmSFUzRn
	7KqJOJnm+i7PGsOuvPVzpV6D8syv2DqxlNNMlQt8q+Kjs2RUElQvVGFz8M1gv0Tmxid8W0pJY1N
	XFE+9lnLpLJ+L1Oa6LdOdOjU9h6qLMCX6dgPPEFQlPm2D8YrWIetn/iGWVb909VWKeJQY+M8TwR
	XhIfbD2wQFlHkYz+ynh25suaExVA51NV/CiyANqysFpHsGmR3hL/q+AfkF4JmfIcnqt93YM3zbl
	ul/MCQok
X-Google-Smtp-Source: AGHT+IGIek6OPyyjZZjrXkuvdN81VR6DHl8mzdwNbzCCYx8cbaECzDZswIN2k+lpO7iWi6HMxuv6jA==
X-Received: by 2002:a05:6402:360f:b0:5d3:bab1:513f with SMTP id 4fb4d7f45d1cf-5d3be6c4046mr19223495a12.18.1733850618930;
        Tue, 10 Dec 2024 09:10:18 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:18 -0800 (PST)
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
Subject: [PATCH v4 06/24] ASoC: renesas: rz-ssi: Fix typo on SSI_RATES macro comment
Date: Tue, 10 Dec 2024 19:09:35 +0200
Message-Id: <20241210170953.2936724-7-claudiu.beznea.uj@bp.renesas.com>
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

The SSI_RATES macro covers 8KHz-48KHz audio frequencies. Update macro
comment to reflect it.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 178c915331e9..35929160a8a5 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -71,7 +71,7 @@
 #define PREALLOC_BUFFER		(SZ_32K)
 #define PREALLOC_BUFFER_MAX	(SZ_32K)
 
-#define SSI_RATES		SNDRV_PCM_RATE_8000_48000 /* 8k-44.1kHz */
+#define SSI_RATES		SNDRV_PCM_RATE_8000_48000 /* 8k-48kHz */
 #define SSI_FMTS		SNDRV_PCM_FMTBIT_S16_LE
 #define SSI_CHAN_MIN		2
 #define SSI_CHAN_MAX		2
-- 
2.39.2

