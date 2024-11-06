Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C721D5147
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 08:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881206; cv=none; b=t+qpi6v7vcwFgbTndaN75gtZun3ShCQzL898m0OMXnnL3pmLJ79G/QrQ2sUQZhyv6Y1jANoIchiDabQdFeJx/6AKcrl3MDUddJwPgSWsaY8iWDnaxvCK7qlairdQJaWBdk76EKspEPshSbkHnfJ74/jh9fj3T8DI/PwSqNwEDhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881206; c=relaxed/simple;
	bh=PKvcYPeeVo6MZqcIj1y/OK2GcBrp7x8aZ87uUaLEPCc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kVA6vKIJmXP7f8zMAOJv+gh7/9KLCRP0AmzQB+UTTK1grVFkU+jblJhDxuVQ/f++ZHX+mH+CA8r5B3fJ/4/2LQK1VEhIm7fAhL3mFleTV4vI+QL9lVVXsJExNtQvB2T3JVFcggeruivMk8VZBrrqE/n1uRu+6vEu7HQy+h/Pk+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jowW9uYA; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jowW9uYA"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9a16b310f5so1003337366b.0
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2024 00:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881203; x=1731486003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMwxZ/wNh3EItJe4u6OrzzTY0ND8WF+5jNZAaFXL5oo=;
        b=jowW9uYA/ceVMsfp8/IdB6OfrLRtnPCjSMMpF+B2CpvUm2aDf2aYDPTdIIZeRo6IRi
         lDM8nlDhGEzWb+NmV4GpCWnKEx6M+2CkKSQfXOsXZQ35L5CqVOgZ+6szBBhGbdaIBTvg
         LMFMnqQmLyuq0GNEK1FXYmyeu+xvoJ+e9ODSnsiJyM9h0axiFnfdRZfUGFIRMSE8wrG8
         mdChC5CwCbDsnvVh+sUIVmmZ0o9I/vqWCODDPHTxQt0a/yJNns5qygZsn6aMfaeNLQuV
         m9JTWrlCugiqii88QL/73wmRXkPqLOz6sUKJn+S1+PH6lRFi/AoO0dVl3rtxujq9ojTu
         RMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881203; x=1731486003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lMwxZ/wNh3EItJe4u6OrzzTY0ND8WF+5jNZAaFXL5oo=;
        b=F8ZA47JoTjz29XrLUiU3YuxCCZj4iAmrdcjnUnwAZa8UyUEVx8NJsBtlOCyMnmk5Mo
         xuPikFEKEGXhtBdv0MNyshrDEa3pmP9asCIdL/+K59qGfqi7mlg9EntsM4fmVMz1qs2f
         1qI3lLeTvOc990qi4SKQl5oS8G7rpIfvn3TgF1Ye7EUAjfeaFNQ8Ffu5vweVf1asGIR9
         WcPNPsa1eRRk6E5qPe8Uxqe81cRpsFP5xNP8Rp0NwRWHKIN8u6jYrMbiiaHV/EnZcq1U
         fEsLpd8jZ2QZpc8t4RS47qPJmk3XwxwoPTo11wK/1wSZPkaecYL05d/5e19VXU+k4sij
         L56A==
X-Forwarded-Encrypted: i=1; AJvYcCUkPgPBfxzi3BkiSpWElMtdcQZQwWtGH92snNRy2KwEuQWWPuaW6c/vhuOEa5+gIME8BsMAYX+HUBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLMnx7bxfqDn6PoK1UgRNSM4TqSeu11vNdEv1aHRA+jHvLcJ1B
	4fzClRNIrDcoycKP4tmdZf7wAaGR96zRVG7xtV7jAsKK/OCcZQSkCgVZvGsLsaU=
X-Google-Smtp-Source: AGHT+IHza8wl50NzRTeIeafrsDLwtKSivG4FoOXk+uiSCYbSLBGMXVLloOn37+ovKQ5qgLhSm+JC7A==
X-Received: by 2002:a17:907:783:b0:a9e:b67f:cdf6 with SMTP id a640c23a62f3a-a9eb67fd1e7mr460745966b.38.1730881202577;
        Wed, 06 Nov 2024 00:20:02 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:20:02 -0800 (PST)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH 22/31] ASoC: da7213: Populate max_register to regmap_config
Date: Wed,  6 Nov 2024 10:18:17 +0200
Message-Id: <20241106081826.1211088-23-claudiu.beznea.uj@bp.renesas.com>
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

On the Renesas RZ/G3S SMARC Carrier II board having a DA7212 codec (using
da7213 driver) connected to one SSIF-2 available on the Renesas RZ/G3S SoC
it has been discovered that using the runtime PM API for suspend/resume
(as will be proposed in the following commits) leads to the codec not
being propertly initialized after resume. This is because w/o
max_register populated to regmap_config the regcache_rbtree_sync()
breaks on base_reg > max condition and the regcache_sync_block() call is
skipped.

Fixes: ef5c2eba2412 ("ASoC: codecs: Add da7213 codec")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/codecs/da7213.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index f3ef6fb55304..486db60bf2dd 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -2136,6 +2136,7 @@ static const struct regmap_config da7213_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 
+	.max_register = DA7213_TONE_GEN_OFF_PER,
 	.reg_defaults = da7213_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(da7213_reg_defaults),
 	.volatile_reg = da7213_volatile_register,
-- 
2.39.2

