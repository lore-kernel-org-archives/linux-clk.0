Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DFD69E08
	for <linux-clk@vger.kernel.org>; Wed, 31 Jan 2024 10:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706696985; cv=none; b=IQ/Vfn6uweppUHed+wAaNNnl17N++CEjjnobeuAfkYWZqL/Goj5BLtb14fjGgMvFFP6dOtCfxgo3LKDj91sqDP4zQ2VE+S4bLB3pBLS2D80B4YoWFATiwFvd/GHazxAuKyzFjgbwSI42Qtp3COp4/a8OOHknpQE8R/CDNYLa0Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706696985; c=relaxed/simple;
	bh=p0l+lgLWjmzKz7GXbaFwccVzaKR/+3YxWU3+fBEg3To=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V2PJ0YDTx8fWS9/16kBt4bSGJtV88r56kObTWvRABgXTQPzlhUsFI6ESSKTMdzSxxilXMGfhzYnqfA61neCKCVcGf/xCFbhQSqMxtKPyYUyUVNFrLwFLtDUnqCRVggb5DJPfcqXr5Sn2wtG+byAovZGM5BGVQ4mt8Sxh4G69z7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FttZaTYi; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FttZaTYi"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-55a5e7fa471so5329865a12.1
        for <linux-clk@vger.kernel.org>; Wed, 31 Jan 2024 02:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706696981; x=1707301781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgKvFA/cFIibrDf0plTzRbx0APcUTA89+vLJXcU5S/c=;
        b=FttZaTYiN9H8bp9vK2cyoSoZVMnxLRqs7HVSjeUso/AklhGHyWyECrJeR+KFBK+So3
         ujKxhTThumq6808fR5Uyj85F4uZShX7YKOPDIafPQJJclZWRcYSbQ2o9LILoR8nUXKf1
         hWbE4o4NyvgerbFZkX2uFOsUbSkXFgdqyR/W3BpX3Jb5LFQ0x0+6aIumu2+Hf4zKwUSl
         x3XZZt/Q27jOgIBMbYdYxxFOnsVHexkXpssSwRaNvnPUGXKwxi5LdsWKNYKNJZa9WtiV
         pD5LYznGWytszacxqvlYx5ePTDED3A4tKeI9iHezC80GoyWsyBGt0+atklKL3C1m5Qmn
         c4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706696981; x=1707301781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GgKvFA/cFIibrDf0plTzRbx0APcUTA89+vLJXcU5S/c=;
        b=PP7wIPvvpwNauE8NEMNzfx9azI6iuWcin7g3723jAmBSOrfIz7EkLSlNtHgMPWjbuW
         BMrZE4C8dy9axQsbOM3hPo6Dp4lpOcY49efTQxuLVz2aIlHLtTqfleEiL6jDbQu89i5B
         rCfzYOQohsqJeTVpWVD2VaDypxllAJJcWFrK7aID6iiAMblgz+cIYv2MHMleceD/E6cu
         Jgwv6+Cho2ZuHUtro/BXvpYf7Qwe8Qtwc7MW4ce85g90E1cEjs9O94ri5EcKI6u4Zp1M
         cKsSQA2ocCyMyW4GOwC+Mv3UNzEmcnrl/y7NdxdOo1scNy1lF2jpuE5HWW7QdEJmQrxj
         BVfA==
X-Gm-Message-State: AOJu0YzkftyOwyiU/35gGmQeDtvdBd7MzAHat+Ad1HLzNCUk4iahO7rP
	Ug4gPPlN/URmPOcI9GxESOCfvE9DUvVRdrm6AM5c4QqGTRZmImotjR/+s1Q1W20=
X-Google-Smtp-Source: AGHT+IGZH/v/Bu5W2LKkI0EIu6OdXLnlN73qtxwIFIFlKMROs2Wq4UCb34rjO37iQLeNTqTv0mCbCg==
X-Received: by 2002:a05:6402:358b:b0:55e:d846:ab4b with SMTP id y11-20020a056402358b00b0055ed846ab4bmr945599edc.20.1706696980847;
        Wed, 31 Jan 2024 02:29:40 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWBmyi2eVTs4LrFvU5FzkykRNJbiE1M9TVGENQGFFbEvqR6chaoqj8TvClonEQWX7cE5KHLDZ5Ji14p/eNonSmbXlrz6PxQOZQMvmKHWM89lDX4XtBhlRgTM79vGVJPrFFwKyWQPg9U2SLaKGYfRCA0Pv9MIZThvOKt/KGYdvAg8jNiK+o/dHcDgWDJrfjEgyswrKSU8zx1L5wVpHcTMqNHCQpUabtLKcU49uwqQc6A3M8z3aa3GFy6Z3cQsNeCfJIsM9s++QNggENAPydECw==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id p16-20020aa7d310000000b0055f3b11d0adsm1618989edq.55.2024.01.31.02.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 02:29:40 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 2/2] clk: renesas: r9a07g04{3,4}: Fix typo for sel_shdi variable
Date: Wed, 31 Jan 2024 12:29:30 +0200
Message-Id: <20240131102930.1841901-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131102930.1841901-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240131102930.1841901-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Fix typo for sel_shdi variable.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g043-cpg.c | 6 +++---
 drivers/clk/renesas/r9a07g044-cpg.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index 075ade0925d4..60f6dfeb328c 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -87,7 +87,7 @@ static const struct clk_div_table dtable_1_32[] = {
 /* Mux clock tables */
 static const char * const sel_pll3_3[] = { ".pll3_533", ".pll3_400" };
 static const char * const sel_pll6_2[]	= { ".pll6_250", ".pll5_250" };
-static const char * const sel_shdi[] = { ".clk_533", ".clk_400", ".clk_266" };
+static const char * const sel_sdhi[] = { ".clk_533", ".clk_400", ".clk_266" };
 
 static const u32 mtable_sdhi[] = { 1, 2, 3 };
 
@@ -136,9 +136,9 @@ static const struct cpg_core_clk r9a07g043_core_clks[] __initconst = {
 	DEF_MUX("HP", R9A07G043_CLK_HP, SEL_PLL6_2, sel_pll6_2),
 	DEF_FIXED("SPI0", R9A07G043_CLK_SPI0, CLK_DIV_PLL3_C, 1, 2),
 	DEF_FIXED("SPI1", R9A07G043_CLK_SPI1, CLK_DIV_PLL3_C, 1, 4),
-	DEF_SD_MUX("SD0", R9A07G043_CLK_SD0, SEL_SDHI0, SEL_SDHI0_STS, sel_shdi,
+	DEF_SD_MUX("SD0", R9A07G043_CLK_SD0, SEL_SDHI0, SEL_SDHI0_STS, sel_sdhi,
 		   mtable_sdhi, 0, rzg2l_cpg_sd_clk_mux_notifier),
-	DEF_SD_MUX("SD1", R9A07G043_CLK_SD1, SEL_SDHI1, SEL_SDHI1_STS, sel_shdi,
+	DEF_SD_MUX("SD1", R9A07G043_CLK_SD1, SEL_SDHI1, SEL_SDHI1_STS, sel_sdhi,
 		   mtable_sdhi, 0, rzg2l_cpg_sd_clk_mux_notifier),
 	DEF_FIXED("SD0_DIV4", CLK_SD0_DIV4, R9A07G043_CLK_SD0, 1, 4),
 	DEF_FIXED("SD1_DIV4", CLK_SD1_DIV4, R9A07G043_CLK_SD1, 1, 4),
diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index bc822b9fd7ce..48404cafea3f 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -106,7 +106,7 @@ static const struct clk_div_table dtable_16_128[] = {
 static const char * const sel_pll3_3[] = { ".pll3_533", ".pll3_400" };
 static const char * const sel_pll5_4[] = { ".pll5_foutpostdiv", ".pll5_fout1ph0" };
 static const char * const sel_pll6_2[]	= { ".pll6_250", ".pll5_250" };
-static const char * const sel_shdi[] = { ".clk_533", ".clk_400", ".clk_266" };
+static const char * const sel_sdhi[] = { ".clk_533", ".clk_400", ".clk_266" };
 static const char * const sel_gpu2[] = { ".pll6", ".pll3_div2_2" };
 
 static const u32 mtable_sdhi[] = { 1, 2, 3 };
@@ -176,9 +176,9 @@ static const struct {
 		DEF_MUX("HP", R9A07G044_CLK_HP, SEL_PLL6_2, sel_pll6_2),
 		DEF_FIXED("SPI0", R9A07G044_CLK_SPI0, CLK_DIV_PLL3_C, 1, 2),
 		DEF_FIXED("SPI1", R9A07G044_CLK_SPI1, CLK_DIV_PLL3_C, 1, 4),
-		DEF_SD_MUX("SD0", R9A07G044_CLK_SD0, SEL_SDHI0, SEL_SDHI0_STS, sel_shdi,
+		DEF_SD_MUX("SD0", R9A07G044_CLK_SD0, SEL_SDHI0, SEL_SDHI0_STS, sel_sdhi,
 			   mtable_sdhi, 0, rzg2l_cpg_sd_clk_mux_notifier),
-		DEF_SD_MUX("SD1", R9A07G044_CLK_SD1, SEL_SDHI1, SEL_SDHI1_STS, sel_shdi,
+		DEF_SD_MUX("SD1", R9A07G044_CLK_SD1, SEL_SDHI1, SEL_SDHI1_STS, sel_sdhi,
 			   mtable_sdhi, 0, rzg2l_cpg_sd_clk_mux_notifier),
 		DEF_FIXED("SD0_DIV4", CLK_SD0_DIV4, R9A07G044_CLK_SD0, 1, 4),
 		DEF_FIXED("SD1_DIV4", CLK_SD1_DIV4, R9A07G044_CLK_SD1, 1, 4),
-- 
2.39.2

