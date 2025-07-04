Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8389D306DBE
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 13:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751636621; cv=none; b=pFk9PPPwe6l+yMWgcO4WqVSvzyObbIBFm6Qd46GlIfy7HnSqubFgJcw7PaceZU/WixejQbEa6ZYSle5NOXYdZVhHI3DM5iU6QWckE/RvGVeL6xL/jFoSXrI7/HV5VU2SXiB7DBX6N1B7Zd9fCqaoNuD36wasCUlppjB9bIb8l9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751636621; c=relaxed/simple;
	bh=363z4+ODj0eDk+G9J5eeG9fyE/Gsvi/bEcEURwyj2xE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SCXtoF+f3IQ1amDb/IL49GRF+05P6pzIuDFMWev1Ab80b+O1SL7yy3tL+wFUDtOmI2kvx3MehAqFJKjJrRWW08owTe/MATi5L7cdLQ9lkO2FloSLDEL2+xbZqk11flIYm+NQ4QhGU2uCrZvaQigk6qqABW1AcCPN9IXnRlShiWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fVN0YAzY; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fVN0YAzY"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60c01b983b6so1849101a12.0
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 06:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751636618; x=1752241418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mIne4IF+NV24EtqbVzae+4FXgTFIsmLWApAJYxm1q38=;
        b=fVN0YAzYgQy4Jyqu827zJly7kcPNPiFTx/DZlZzbw0oqswdsrwftnAvZOhrunItPus
         hUjZ6HEHCV9VRn6QkqhZ2C1Sl7sYDljplNK+GMX22YFK/e6BOESZMBSNSauc7cSZUCCD
         Yhsy9yd/VEpUCc9QOFl9C2FgWJHdkbrwfQHnVW8yDNQ+lpNQDnLpFPjQfk9C1eSy6qWe
         DS5F76n9OQg1zKipzd1ZBsbvvsJESt3Ew55ZE2/C8phTreLkZgja9yPZb/7SIJ4rKSOs
         j4Sj6ituTJnw7p4suurllbvbSbvJmBkL0JXe/yetbq7JnGB/SUayFqSU9hsfWf4St4YC
         01EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751636618; x=1752241418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mIne4IF+NV24EtqbVzae+4FXgTFIsmLWApAJYxm1q38=;
        b=PqbryfUbBv2oNTZqih1Lm6qC+4ntf+4PEgreJ+8/cwEo3vFwMhghkNAGupwu9qVsvn
         WxFnahmBSWfb5kRL+YIVuOUPXifQiWe6wv5xcIzp+iW701RrPmg7+fW1c1xM7JuqVCRs
         VkWU8fNa8r4WImd0cXjBzBPioewXkTI3ukBLCzOqn3XtAg2sta08U4rZxndgEY3TLoQO
         I7oEzDJDfT+OaJ0NxkR1MJL0h0ADnh5387zaGqVMio0Xe3sirNfMIgXT94/grE+VHRcY
         Mo+sJ3OicEu0wlG/fEY+9LyufS9Z7pZC5+AU36ioHYHUClAk+MUgetf23BQ3pDrqHegD
         bQzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm5lNXOPrRriJrJFlRcZVcCE55ndNyTGAAa1lbIAVyK9ureHqF0vEt9XJW60TAxp80ie0VaD5NXxw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9BpnqCxXEkPltb/UqBW3adX+AW3Z3csP5JN1GwwUQ95rhkCFX
	vJ+C0lRgq7UrJzYg3XQyiDIVSYRviXPJbIZ5c2UPnB9aCCQsg0W27Ea20hXq6HL8Pc3sABNQ7zQ
	xSuQD
X-Gm-Gg: ASbGnctO+Sj6matfRTeSC07fBwtYasRjtDAcr1wmt9bnjnQJLwH1BdIreLhf18mGZ+4
	kxib0zEzkvQ5lK9YDXS5MSoXJ3oSCZPuhHjKpMGhboGH/MZpOabODOXxkHTpCdItK6EZIeg/gkH
	SvxakvT6mrXJSDTRKEhWkmjm2iYR73U6CtZiyp+ruXgA0bGb744Bv0Z9B0uQ5pPI0pQWxu+qUsa
	3P/DfFCIkozxTyqI1c8TbCGWktAfyy/wb3jyMpKQNCJE7hA7pzPm2y6OYozh1FqIY1SHgqAyTzD
	1YxUwLyShv9PurB2P2+lH32YvMbbFzpFBlYEa9CeUDSNeSxt3at+AFmOZS/OSS1DozDwhg+sUTb
	WnLN2x4pWQtX6kiiuPXx1Tni8NA==
X-Google-Smtp-Source: AGHT+IErurtR/HbMkmE1efqwIH6hRoIPysAMhNCXkZd1cXgXHG1/n5Cc+xiZ3wxJ4DJBTssmCTipZA==
X-Received: by 2002:a05:6402:1ed3:b0:60c:5e47:3af5 with SMTP id 4fb4d7f45d1cf-60fcc62e4famr2920806a12.4.1751636616586;
        Fri, 04 Jul 2025 06:43:36 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fd3895ac7sm1084916a12.30.2025.07.04.06.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 06:43:36 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 1/3] clk: renesas: r9a08g045: Add MSTOP for coupled clocks as well
Date: Fri,  4 Jul 2025 16:43:26 +0300
Message-ID: <20250704134328.3614317-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704134328.3614317-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250704134328.3614317-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

If MSTOP is not added for both clocks in a coupled pair, and the clocks
are not disabled in the reverse order of their enable sequence, the MSTOP
may remain enabled when disabling the clocks.

This happens because rzg2l_mod_clock_endisable() executes for coupled
clocks only when a single clock from the pair is enabled. If one clock has
no MSTOP defined, it can result in the MSTOP configuration being left
active when the clocks are disabled out of order (i.e., not in the reverse
order of enabling).

Fixes: c49695952746 ("clk: renesas: r9a08g045: Drop power domain instantiation")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g045-cpg.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 405907925bb7..ed0661997928 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -256,11 +256,13 @@ static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
 					MSTOP(BUS_PERI_COM, BIT(4))),
 	DEF_COUPLED("eth0_axi",		R9A08G045_ETH0_CLK_AXI, R9A08G045_CLK_M0, 0x57c, 0,
 					MSTOP(BUS_PERI_COM, BIT(2))),
-	DEF_COUPLED("eth0_chi",		R9A08G045_ETH0_CLK_CHI, R9A08G045_CLK_ZT, 0x57c, 0, 0),
+	DEF_COUPLED("eth0_chi",		R9A08G045_ETH0_CLK_CHI, R9A08G045_CLK_ZT, 0x57c, 0,
+					MSTOP(BUS_PERI_COM, BIT(2))),
 	DEF_MOD("eth0_refclk",		R9A08G045_ETH0_REFCLK, R9A08G045_CLK_HP, 0x57c, 8, 0),
 	DEF_COUPLED("eth1_axi",		R9A08G045_ETH1_CLK_AXI, R9A08G045_CLK_M0, 0x57c, 1,
 					MSTOP(BUS_PERI_COM, BIT(3))),
-	DEF_COUPLED("eth1_chi",		R9A08G045_ETH1_CLK_CHI, R9A08G045_CLK_ZT, 0x57c, 1, 0),
+	DEF_COUPLED("eth1_chi",		R9A08G045_ETH1_CLK_CHI, R9A08G045_CLK_ZT, 0x57c, 1,
+					MSTOP(BUS_PERI_COM, BIT(3))),
 	DEF_MOD("eth1_refclk",		R9A08G045_ETH1_REFCLK, R9A08G045_CLK_HP, 0x57c, 9, 0),
 	DEF_MOD("i2c0_pclk",		R9A08G045_I2C0_PCLK, R9A08G045_CLK_P0, 0x580, 0,
 					MSTOP(BUS_MCPU2, BIT(10))),
-- 
2.43.0

