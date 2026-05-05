Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F663DA7CF
	for <linux-clk@vger.kernel.org>; Tue,  5 May 2026 07:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777965352; cv=none; b=DggbHCi1c0S+ia9cEoAlVtauyoVD8kJ+EioNVdhv4p+qJSjIp9BJY92Zo7gLlSVyaAObDLWU2o1VttQCO10YJMT8e+sf3MR68imVUB3MEdOgw/17y+7yOei+K9ZED+TFIPVUBF/RSkcwjtZOaYD48hS1KK6q6cbLkYIaAeSlNik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777965352; c=relaxed/simple;
	bh=I8W31WgigRN/6bjSE8y2Fb1SfEfu9VSMaoepkFuDn9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IaoRGWzDKtyZRMnsgI1lcuiDB28QExoQrSa6zXDqab0R7swexweoJUcGSe/HCEbaApBGo1xlhk/Q1SfsJphgsDR6oVxz2ZwMnPXv312JShFKHTVcCu8ZzRXQwHqDG3gCAGkykGthaAAO0jodCfsBHbvuyYyyGYOB2zQvo2lxHWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ozmHzlqS; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ozmHzlqS"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso24808375e9.3
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 00:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777965349; x=1778570149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Ze+hCH6l7h3yY1sFZLeBkLCotjZyqMVrWvmS9n6Skk=;
        b=ozmHzlqSjJc2atKtC2vJbLICNBHhUuwGBe5XkHdVBHY/JsBz6nZ4HaX55qxu/TG360
         bVr3FXyxFQA99agjXjoVR3OV5QZNVLiH4anKTI9EWRFbOL4G89rZj67B/uyW5+fAvhQM
         M7d3LbiPc1FiPR+i2AYf+Cr2Q+v0M2yd6i66C6oHBT6T3mTmxpAd3ClTbQrxTgeoE9RT
         KB/FxAXzy/ku1vq8jsmxMW/hoL3ulB5my2tyrPnCcVKFC1c4UrlsU7VbNnYLKbKalcxv
         xuz0Ps7GEnTLQxFNzHQBeB7UcDdy2Y4Tm1FpNmeWDqZN9REGj9cH6O/mCQZnpMPR4kDj
         R89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777965349; x=1778570149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Ze+hCH6l7h3yY1sFZLeBkLCotjZyqMVrWvmS9n6Skk=;
        b=gn+gzhVlj8bU5nVnEQoBYo8yf/wfX99cfQEGawn4ha4p1ZJMSHHP9DUEIkjLQmuQEI
         akCejNAkTIDnpQw2N7gFOPKeuP13ScOGfd7IlZ+n5b8Fb4XV4PWyYgkdHzyutUfjvuda
         Q6294j1LayM8rrvqU+kGsyLdpQgs1kKyTA+f/kA3VLEz36dUD2u/nsUWhlXtWMwU5zIH
         hyLC2VtNvUo4ZWOkOTICyM9xF81stnY/0U6W0KFp4Djaremi9pVcCwY+B6g2hJCXpvT1
         XYpOHC6yqLw9gbxCQJCGEJlvyqQMHxO605FWCR2AGi2uam8LBCL+q2hYnEHsnjjVOIWG
         NWtA==
X-Forwarded-Encrypted: i=1; AFNElJ/GS2I+C1aE7T0a0jbKvEzjJAYC+M+NqE2yvntznwIFTxKDe9itoAIeJlDunCI19K/wXe9wm3ihtOo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8x/UzlfJ3/NoHk2JeEyUefEgwYzFaxgCo/TMeOK0yGgPgcP8e
	U4yAwAE741d4QvaHURewpH2hzA5oiXtfaSOHakzq8y+JR2I9mwzN1An2
X-Gm-Gg: AeBDietBfres9/wljexwZ0wwo6RML2SyddKyA6F7ZeksaNfWyLqtahFpduI5oKTR6k/
	dgFltY4xJZH7qFstA/XYPqF9Uv/Vt1OztxslfDcoP+urxZ3UplsgRFhkrbPkeItu6a/4K6dLazr
	sMxesY7wCDBOqojY8JEj9YbnxvQVKrOS4BF/I3HMCftYm01mCD99SgrmeqRHmS+9CxHVnepXknb
	wOpeduTEkRzTJGDXzXn3XFU+5V7nCCGmSTql02uSXvetVhS98xnGwlhtd4METjHYo9A56KUt00U
	lTRXrAOq948QWwmPlgn+WuB8UwKdtlcTPSOHvq3Jjvp8FMtttf35mw8OWaXZOC3tEDM9eOCI/M4
	hNY5nTV5PtcEKW6dTKwWpgXkOz7x6+oU8ZOZqF/6OS3rATA2f72EBs0QnPEC/cnNA7zWjARK+E0
	FUEMmspVjBmditRJgCzQZjIWs4HHTxZH21sFrsdUf7bvPvT6yBEcFMlQoFTBM=
X-Received: by 2002:a05:600d:8496:10b0:48a:5970:1fe1 with SMTP id 5b1f17b1804b1-48a9887166emr125289515e9.4.1777965349059;
        Tue, 05 May 2026 00:15:49 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb694fcsm352005845e9.3.2026.05.05.00.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:15:48 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 3/3] clk: renesas: r9a08g046: Add RSPI clock and reset support
Date: Tue,  5 May 2026 08:15:39 +0100
Message-ID: <20260505071544.8965-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505071544.8965-1-biju.das.jz@bp.renesas.com>
References: <20260505071544.8965-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add clock and reset definitions for the three RSPI (Serial
Peripheral Interface) channels on the RZ/G3L (R9A08G046) SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 50 +++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index d843629ffe47..f5952c9f73c2 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -19,9 +19,11 @@
 #define G3L_CPG_PL3_DDIV		(0x208)
 #define G3L_CPG_CA55CORE_DDIV		(0x234)
 #define G3L_CPG_RSCI_DDIV		(0x238)
+#define G3L_CPG_RSPI_DDIV		(0x23c)
 #define G3L_CLKDIVSTATUS		(0x280)
 #define G3L_CPG_ETH_SSEL		(0x410)
 #define G3L_CPG_RSCI_SSEL		(0x414)
+#define G3L_CPG_RSPI_SSEL		(0x418)
 #define G3L_CPG_ETH_SDIV		(0x434)
 
 /* RZ/G3L Specific division configuration.  */
@@ -36,6 +38,9 @@
 #define G3L_DIV_RSCI1		DDIV_PACK(G3L_CPG_RSCI_DDIV, 2, 2)
 #define G3L_DIV_RSCI2		DDIV_PACK(G3L_CPG_RSCI_DDIV, 4, 2)
 #define G3L_DIV_RSCI3		DDIV_PACK(G3L_CPG_RSCI_DDIV, 6, 2)
+#define G3L_DIV_RSPI0		DDIV_PACK(G3L_CPG_RSPI_DDIV, 0, 2)
+#define G3L_DIV_RSPI1		DDIV_PACK(G3L_CPG_RSPI_DDIV, 2, 2)
+#define G3L_DIV_RSPI2		DDIV_PACK(G3L_CPG_RSPI_DDIV, 4, 2)
 #define G3L_SDIV_ETH_A		DDIV_PACK(G3L_CPG_ETH_SDIV, 0, 2)
 #define G3L_SDIV_ETH_B		DDIV_PACK(G3L_CPG_ETH_SDIV, 4, 1)
 #define G3L_SDIV_ETH_C		DDIV_PACK(G3L_CPG_ETH_SDIV, 8, 2)
@@ -53,6 +58,9 @@
 #define G3L_DIV_RSCI1_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 17, 1)
 #define G3L_DIV_RSCI2_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 18, 1)
 #define G3L_DIV_RSCI3_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 19, 1)
+#define G3L_DIV_RSPI0_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 20, 1)
+#define G3L_DIV_RSPI1_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 21, 1)
+#define G3L_DIV_RSPI2_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 22, 1)
 
 /* RZ/G3L Specific clocks select. */
 #define G3L_SEL_ETH0_TX		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 0, 1)
@@ -69,6 +77,9 @@
 #define G3L_SEL_RSCI1		SEL_PLL_PACK(G3L_CPG_RSCI_SSEL, 2, 2)
 #define G3L_SEL_RSCI2		SEL_PLL_PACK(G3L_CPG_RSCI_SSEL, 4, 2)
 #define G3L_SEL_RSCI3		SEL_PLL_PACK(G3L_CPG_RSCI_SSEL, 6, 2)
+#define G3L_SEL_RSPI0		SEL_PLL_PACK(G3L_CPG_RSPI_SSEL, 0, 2)
+#define G3L_SEL_RSPI1		SEL_PLL_PACK(G3L_CPG_RSPI_SSEL, 2, 2)
+#define G3L_SEL_RSPI2		SEL_PLL_PACK(G3L_CPG_RSPI_SSEL, 4, 2)
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
@@ -103,6 +114,9 @@ enum clk_ids {
 	CLK_SEL_RSCI1,
 	CLK_SEL_RSCI2,
 	CLK_SEL_RSCI3,
+	CLK_SEL_RSPI0,
+	CLK_SEL_RSPI1,
+	CLK_SEL_RSPI2,
 	CLK_ETH0_TR,
 	CLK_ETH0_RM,
 	CLK_ETH1_TR,
@@ -113,6 +127,14 @@ enum clk_ids {
 };
 
 /* Divider tables */
+static const struct clk_div_table dtable_1_8[] = {
+	{ 0, 1 },
+	{ 1, 2 },
+	{ 2, 4 },
+	{ 3, 8 },
+	{ 0, 0 },
+};
+
 static const struct clk_div_table dtable_1_32[] = {
 	{ 0, 1 },
 	{ 1, 2 },
@@ -168,6 +190,7 @@ static const char * const sel_eth1_tx[] = { ".div_eth1_tr", "eth1_txc_tx_clk" };
 static const char * const sel_eth1_rx[] = { ".div_eth1_tr", "eth1_rxc_rx_clk" };
 static const char * const sel_eth1_rm[] = { ".pll6_div10", "eth1_rxc_rx_clk" };
 static const char * const sel_rsci[] = { ".pll2_div5", ".pll2_div6", ".pll2_div7", ".pll2_div2_4" };
+static const char * const sel_rspi[] = { ".pll2_div5", ".pll2_div6", ".pll2_div7", ".pll2_div2_4" };
 static const char * const sel_eth0_clk_tx_i[] = { ".sel_eth0_tx", ".div_eth0_rm" };
 static const char * const sel_eth0_clk_rx_i[] = { ".sel_eth0_rx", ".div_eth0_rm" };
 static const char * const sel_eth1_clk_tx_i[] = { ".sel_eth1_tx", ".div_eth1_rm" };
@@ -199,6 +222,9 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_MUX(".sel_rsci1", CLK_SEL_RSCI1, G3L_SEL_RSCI1, sel_rsci),
 	DEF_MUX(".sel_rsci2", CLK_SEL_RSCI2, G3L_SEL_RSCI2, sel_rsci),
 	DEF_MUX(".sel_rsci3", CLK_SEL_RSCI3, G3L_SEL_RSCI3, sel_rsci),
+	DEF_MUX(".sel_rspi0", CLK_SEL_RSPI0, G3L_SEL_RSPI0, sel_rspi),
+	DEF_MUX(".sel_rspi1", CLK_SEL_RSPI1, G3L_SEL_RSPI1, sel_rspi),
+	DEF_MUX(".sel_rspi2", CLK_SEL_RSPI2, G3L_SEL_RSPI2, sel_rspi),
 	DEF_MUX(".sel_eth0_tx", CLK_SEL_ETH0_TX, G3L_SEL_ETH0_TX, sel_eth0_tx),
 	DEF_MUX(".sel_eth0_rx", CLK_SEL_ETH0_RX, G3L_SEL_ETH0_RX, sel_eth0_rx),
 	DEF_MUX(".sel_eth0_rm", CLK_SEL_ETH0_RM, G3L_SEL_ETH0_RM, sel_eth0_rm),
@@ -233,6 +259,12 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 		    dtable_2_16, 0, 100000000UL, 0, NULL),
 	DEF_G3S_DIV("P16", R9A08G046_CLK_P16, CLK_SEL_RSCI3, G3L_DIV_RSCI3, G3L_DIV_RSCI3_STS,
 		    dtable_2_16, 0, 100000000UL, 0, NULL),
+	DEF_G3S_DIV("P17", R9A08G046_CLK_P17, CLK_SEL_RSPI0, G3L_DIV_RSPI0, G3L_DIV_RSPI0_STS,
+		    dtable_1_8, 0, 200000000UL, 0, NULL),
+	DEF_G3S_DIV("P18", R9A08G046_CLK_P18, CLK_SEL_RSPI1, G3L_DIV_RSPI1, G3L_DIV_RSPI1_STS,
+		    dtable_1_8, 0, 200000000UL, 0, NULL),
+	DEF_G3S_DIV("P19", R9A08G046_CLK_P19, CLK_SEL_RSPI2, G3L_DIV_RSPI2, G3L_DIV_RSPI2_STS,
+		    dtable_1_8, 0, 200000000UL, 0, NULL),
 	DEF_FIXED("HP", R9A08G046_CLK_HP, CLK_PLL6_DIV10, 1, 1),
 	DEF_MUX_FLAGS("ETHTX01", R9A08G046_CLK_ETHTX01, G3L_SEL_ETH0_CLK_TX_I, sel_eth0_clk_tx_i,
 		      CLK_SET_RATE_PARENT),
@@ -342,6 +374,18 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_MCPU2, BIT(5))),
 	DEF_MOD("scif5_clk_pck",	R9A08G046_SCIF5_CLK_PCK, R9A08G046_CLK_P0, 0x584, 5,
 					MSTOP(BUS_MCPU3, BIT(4))),
+	DEF_MOD("rspi0_pclk",		R9A08G046_RSPI0_PCLK, R9A08G046_CLK_P3, 0x590, 0,
+					MSTOP(BUS_MCPU1, BIT(14))),
+	DEF_MOD("rspi1_pclk",		R9A08G046_RSPI1_PCLK, R9A08G046_CLK_P3, 0x590, 1,
+					MSTOP(BUS_MCPU1, BIT(15))),
+	DEF_MOD("rspi2_pclk",		R9A08G046_RSPI2_PCLK, R9A08G046_CLK_P3, 0x590, 2,
+					MSTOP(BUS_MCPU2, BIT(0))),
+	DEF_MOD("rspi0_tclk",		R9A08G046_RSPI0_TCLK, R9A08G046_CLK_P17, 0x590, 8,
+					MSTOP(BUS_MCPU1, BIT(14))),
+	DEF_MOD("rspi1_tclk",		R9A08G046_RSPI1_TCLK, R9A08G046_CLK_P18, 0x590, 9,
+					MSTOP(BUS_MCPU1, BIT(15))),
+	DEF_MOD("rspi2_tclk",		R9A08G046_RSPI2_TCLK, R9A08G046_CLK_P19, 0x590, 10,
+					MSTOP(BUS_MCPU2, BIT(0))),
 	DEF_MOD("gpio_hclk",		R9A08G046_GPIO_HCLK, R9A08G046_OSCCLK, 0x598, 0,
 					MSTOP(BUS_PERI_CPU, BIT(6))),
 	DEF_MOD("rsci0_pclk",		R9A08G046_RSCI0_PCLK, R9A08G046_CLK_P0, 0x618, 0,
@@ -385,6 +429,12 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_SCIF3_RST_SYSTEM_N, 0x884, 3),
 	DEF_RST(R9A08G046_SCIF4_RST_SYSTEM_N, 0x884, 4),
 	DEF_RST(R9A08G046_SCIF5_RST_SYSTEM_N, 0x884, 5),
+	DEF_RST(R9A08G046_RSPI0_PRESETN, 0x890, 0),
+	DEF_RST(R9A08G046_RSPI1_PRESETN, 0x890, 1),
+	DEF_RST(R9A08G046_RSPI2_PRESETN, 0x890, 2),
+	DEF_RST(R9A08G046_RSPI0_TRESETN, 0x890, 8),
+	DEF_RST(R9A08G046_RSPI1_TRESETN, 0x890, 9),
+	DEF_RST(R9A08G046_RSPI2_TRESETN, 0x890, 10),
 	DEF_RST(R9A08G046_GPIO_RSTN, 0x898, 0),
 	DEF_RST(R9A08G046_GPIO_PORT_RESETN, 0x898, 1),
 	DEF_RST(R9A08G046_GPIO_SPARE_RESETN, 0x898, 2),
-- 
2.43.0

