Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01ACB1FBE81
	for <linux-clk@vger.kernel.org>; Fri,  6 Dec 2024 11:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733483639; cv=none; b=nkFswedmeE3ygiMwn4iRQVNt7G3ecuRcBdeYbyBoViUEoJ6oVrk+7kcwaoA4HM+xwCmJSVJJCMEBCdYgaJmtjAVbp9qD6pXjcaINESTHr9CECj/gVMsrds85w8V8hpcL9Or/WyW/viVKsjuBQE/N5bf8nYnPYOEdsmWqrhMT7l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733483639; c=relaxed/simple;
	bh=wtbhFgAIjwtZ+tw8WU+bfOrzW74Jy0OL371+f4t8O5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aI8R36mFTS4KTd4emQWDqGhaqClY6vRhzhCvh8X/grDmaUzulP8tOg3h9BNQ7t5+Ib9xKZsA7vphGUjuwSwXvp26lz4dztItnvfZdFgFsf0auTHXw2psdZWgJD0paAwSnC+omej3SIpfo05x3Yb/hFskklUZMz8+qclGJ5KNaoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=nhgkgWl2; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="nhgkgWl2"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385d7b4da2bso1681833f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 06 Dec 2024 03:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733483635; x=1734088435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4ybOWdThQduxVTLLkmT3I5G8o7KcPOKxk8AzY6bhhc=;
        b=nhgkgWl2txX1NYdiqSvofStwXS/hGamQ9x6DhLLxxpoh2kuNXnqJLGBxrp29/4O6nU
         gvpW/3MzW4XpgKirPdSDbbgmIa64lDqZzYTilYpoaorKkmRqlm1z1aMg+WEonNTZ/YiW
         xyarKDj66tKX6HFKphTPMDMvUdUvb8EhE5ayAnu0NpzeH0w0OD4cfbB/19zT2U+0wHw5
         5/GVKk4eu+LtAH9MWaFzHw3MFX6Ws7QPfeLIUXZ0xwSXW7koYvDAFHXm59PrB9mLF2Jl
         zrDCwyiQ+pv7wMiLW4TULwd/AkMuI2NnD1gV2wieeX1dZOL30rF/KfD41QerOKDIJDzD
         8uBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733483635; x=1734088435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4ybOWdThQduxVTLLkmT3I5G8o7KcPOKxk8AzY6bhhc=;
        b=h8bd2PUwuEwuePjLHnRBX1ziUynX/Q6uw6ZS5CK7zwdYG5F5lYeph4eq6NBwuVdB5N
         j6cNTcIk+4MjzmUYuFc+QLfKGz94anKXPIflkgIBW04thn5QgNbnxdRXd3MWrj+QBCVx
         /dKgkOKgFj3K6+jJu0GbgaI/tSTk53Wdwg0z9B/NVmVkIJQWlRJhiy00XYl4HBACBdyW
         8vHRbi4nZ1+Ydg+0N6O4xseb4lHDmr7ZZGMdXEfwg2BfGu9D2uX3oVhAQAG6dPGpJFZo
         QZrvNC7ca6NEpYV5bTtM+kxeMfSo7nlPAYOEDh0labJZNR5jyMO3l6+6p1FnRS3N6yAs
         nR+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKyxtM9RKQx/ap12DoJAhQG0fUmIE+AuXmw//VoBGh/fv17zgrw1g8T3tReJQ+6XKMIJhnULgMrI4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5n/6uGB0MHQ8+F7gz0DajD5HVnkm9mQK0AGK/CxIJOzI1ugUS
	8KwjZbwQUyAR8CCnKsNJqXpRlaFZBBq426/jLSoiAbTVOku/LcffYujCs8w4RlA=
X-Gm-Gg: ASbGnculLEXm62FsEq/lyV4xMrr6HKYncRrhZzK2SSVdd7z7AREoGe8kovfCdhJU3Be
	Wh0YNnPfSJoaNB4RQYavBGEJiz+jVkuGFwNroi4Jkz7ZH9I87k5nyXgqG+hiNqI2Grmi+4TU4XB
	xU0VDgYxs6cKa2GxKYU8Sp4/qchuv1fOTcPU2eFmFGZ4Cd4vMCluf6xBFwqumktxC9paa/3gkqg
	C32gGB6ciiobfBjXKcQrL9LBGcV6yBeBHioLB6yOTIYKJHjV1+v3YWjmi60h2o6P9ytuaaTCi17
	Pg60
X-Google-Smtp-Source: AGHT+IHD5gzyn6ySUv1/2CzhUdrsHWqA+utF/YjxqIPk/7oKZhHl7nuoqefyXJDNZSNZZHnZZAiGvg==
X-Received: by 2002:a5d:5f8c:0:b0:385:fd24:3317 with SMTP id ffacd0b85a97d-3862b33cfbemr2189732f8f.1.1733483635216;
        Fri, 06 Dec 2024 03:13:55 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eee2a6sm226877866b.90.2024.12.06.03.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:13:54 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com,
	jic23@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 01/15] clk: renesas: r9a08g045: Add clocks, resets and power domain support for the ADC IP
Date: Fri,  6 Dec 2024 13:13:23 +0200
Message-Id: <20241206111337.726244-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241206111337.726244-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241206111337.726244-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add clocks, resets and power domains for ADC IP available on the Renesas
RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- rebased on top of the latest r9a08g045-cpg version

 drivers/clk/renesas/r9a08g045-cpg.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 559afc417c6c..0e7e3bf05b52 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -187,6 +187,7 @@ static const struct cpg_core_clk r9a08g045_core_clks[] __initconst = {
 	DEF_FIXED("OSC", R9A08G045_OSCCLK, CLK_EXTAL, 1, 1),
 	DEF_FIXED("OSC2", R9A08G045_OSCCLK2, CLK_EXTAL, 1, 3),
 	DEF_FIXED("HP", R9A08G045_CLK_HP, CLK_PLL6, 1, 2),
+	DEF_FIXED("TSU", R9A08G045_CLK_TSU, CLK_PLL2_DIV2, 1, 8),
 };
 
 static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
@@ -238,6 +239,8 @@ static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
 	DEF_MOD("scif4_clk_pck",	R9A08G045_SCIF4_CLK_PCK, R9A08G045_CLK_P0, 0x584, 4),
 	DEF_MOD("scif5_clk_pck",	R9A08G045_SCIF5_CLK_PCK, R9A08G045_CLK_P0, 0x584, 5),
 	DEF_MOD("gpio_hclk",		R9A08G045_GPIO_HCLK, R9A08G045_OSCCLK, 0x598, 0),
+	DEF_MOD("adc_adclk",		R9A08G045_ADC_ADCLK, R9A08G045_CLK_TSU, 0x5a8, 0),
+	DEF_MOD("adc_pclk",		R9A08G045_ADC_PCLK, R9A08G045_CLK_TSU, 0x5a8, 1),
 	DEF_MOD("vbat_bclk",		R9A08G045_VBAT_BCLK, R9A08G045_OSCCLK, 0x614, 0),
 };
 
@@ -274,6 +277,8 @@ static const struct rzg2l_reset r9a08g045_resets[] = {
 	DEF_RST(R9A08G045_GPIO_RSTN, 0x898, 0),
 	DEF_RST(R9A08G045_GPIO_PORT_RESETN, 0x898, 1),
 	DEF_RST(R9A08G045_GPIO_SPARE_RESETN, 0x898, 2),
+	DEF_RST(R9A08G045_ADC_PRESETN, 0x8a8, 0),
+	DEF_RST(R9A08G045_ADC_ADRST_N, 0x8a8, 1),
 	DEF_RST(R9A08G045_VBAT_BRESETN, 0x914, 0),
 };
 
@@ -346,6 +351,8 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
 				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(5)), 0),
 	DEF_PD("scif5",		R9A08G045_PD_SCIF5,
 				DEF_REG_CONF(CPG_BUS_MCPU3_MSTOP, BIT(4)), 0),
+	DEF_PD("adc",		R9A08G045_PD_ADC,
+				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(14)), 0),
 	DEF_PD("vbat",		R9A08G045_PD_VBAT,
 				DEF_REG_CONF(CPG_BUS_MCPU3_MSTOP, BIT(8)),
 				GENPD_FLAG_ALWAYS_ON),
-- 
2.39.2

