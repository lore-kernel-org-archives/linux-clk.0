Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491CE22068D
	for <linux-clk@vger.kernel.org>; Tue,  5 May 2026 07:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777965351; cv=none; b=OXAdarXjyQ3TCsWYW2QW/oniTDWAgPC9UjcFWiadE9L7lQuBwwTQdE1f3qvmdEbhLRatl5O7CFYCL9lR+R40T3XRnpILlq9oQpDUCCOyZxYopZUKZARXx0bOySnmxTcrWdAN9KB6qHfE7MiVe5hC4OBiiZyMV7rWqLlrUnVZO0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777965351; c=relaxed/simple;
	bh=kg2H1zsDbBhpEWAMj8Xbm2yreTBOEVzvnQl3Yt35QRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E2YZNmTWbh9nhzdzL4jwKCXIpheIzABm8Xh6JGytqiE+crJR+NI1TgHy6VphFRFWCVFKmjNDaA8K447yEUsi6iIhpbkITLB7Lv1NpBpospjdAPqS/+ZvLaeAVO4b99e/X/ileVtiiGr6I3/mUZM2otBidWF5fCHcEbGiudvmr0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NkUmOpY+; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NkUmOpY+"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so39053925e9.0
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 00:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777965348; x=1778570148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJ3hGspb01SZnjmgOSdfCYGLsArTRg3Em7vcTMPYqh8=;
        b=NkUmOpY+zSRf1AlVB5ykFLXxN5oZRYJdQoqsDVRr7/pjrlwfLDNY/RzMefq0TQ5pGu
         ZxWRpFjV371/+D5fFFvsvfgOMXjsPXeICxFepRe1AcYuupOXRxb0XX/ul6ZcH56nmtZq
         tykC8JgDKmGXSw2gDk15YwIL7T3xk9J/vETbYamiEsDVeooY+pWyiKXMIhacBtRwl1Ji
         4oNcSNxRJfLitZk0tnGvNRwRg9KbKtyVgOWiXM//TE3OAHL4GmzaLbV66nJx7PukZRo1
         BB6oHdUHK5LQPh4RmHOH6Jc9gqBdBqihYPMxV2xWT5Bqu3oLQZ/w2bpKAvQmle0eWd/o
         sc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777965348; x=1778570148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZJ3hGspb01SZnjmgOSdfCYGLsArTRg3Em7vcTMPYqh8=;
        b=eX/AoCS1TparzVl5cUnpvwhd0hNEHEnjQMeuIcC/aTpmwoH4BhlzVXn9QYG7NvF43X
         Be2Vqf+HBHIQJ+wKdPBxkrma8QIKSVLOze3kHEwUFLeGbU5P1CBs7SYkj9gno/sQI7Fq
         bFZfadNHqyrgSbsx4ZS7GRlZ9ojQo0ONxf2EPhBzQJcxHORciLNJkn1nboIwA44bxa/9
         w95UhUIFYQkq5r7xBTo8M8SUwnJdxr+eEarlMhOm9UVuaZP3S1GRzbybuxBph9efWJIm
         pPJEqOOIVriLqcakS8PrIqqUuPw/1pIYjS6dEOZ/U1zH6q6a0aUdNV3UtCdlfzQHoTpD
         QlpQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3gDZvDBnCp6H5TXDT+EO6Ox3A83JduZT3/GFFp6cEGHxaVdT7E+lQBwjAjLwiVn5TQwbOTTDjoHE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQNJiSt5lmwvBn9CDs7GJZ+MrRSKLjXSg6p32couZCay/Jls/b
	DbdW2mEW6uyz/qtyfMr8XwrEslS/31F6jN/GM8+yOdlfU8Voj0Um4+Xx
X-Gm-Gg: AeBDievQ8yC8wbMaaeg/Oz8UqwTFztqWRLOPWBpqoKo+DoHJ24b6vhTiQCtopdwG7Zg
	tdjWYDcL0ByThLjUA/AOeuiGwuzh4aZEfCbuzhn7rFZdShWRqrrYY0vTVwDj+lMWjILpn/tVCPl
	g94aMF28cRCD00w9n4Fd0HGztiZ2S01C0mNcA08sBFKICNgsyV7g4WPcTWSVM2/F9X0sRpbMB65
	DMfIXJlrENWhD486kwhEK9C3h3TkzWfk14UhzmWqMk9sX5DcFJDFaePOxyfe3TghPDQyH8FhOHL
	uAuVjFwRbVNRPzBS3fvXxkf+3nkOR40ALVvOYZ5WlUJP9+IesFlNbFOGIxywO/o7ehM00EEn//9
	SdjMNkE2vPiM6CJgx9WqwVT3NcWu6UcUTb1BBYrZXIJ92lLamneE9Gvy/xAFX7IEZD7XxqS0waZ
	WOYXy0KDBB8FH2Qe29Yvp9Rna5vI4CU12QIi50gJz6+zRbW0+/OFQzgr2qO+o=
X-Received: by 2002:a05:600c:c172:b0:488:bfc3:efc with SMTP id 5b1f17b1804b1-48d17fe027fmr24491375e9.0.1777965347461;
        Tue, 05 May 2026 00:15:47 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb694fcsm352005845e9.3.2026.05.05.00.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:15:47 -0700 (PDT)
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
Subject: [PATCH 1/3] clk: renesas: r9a08g046: Add clock and reset entries for the RSCI
Date: Tue,  5 May 2026 08:15:37 +0100
Message-ID: <20260505071544.8965-2-biju.das.jz@bp.renesas.com>
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

Add clock and reset entries for the Serial Communications Interface (RSCI)
found on the RZ/G3L SoC. This includes various dividers and mux clocks
needed for the four RSCI channels.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 71 +++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index 0657dc01ff8a..3a04db4196a6 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -18,8 +18,10 @@
 #define G3L_CPG_PL2_DDIV		(0x204)
 #define G3L_CPG_PL3_DDIV		(0x208)
 #define G3L_CPG_CA55CORE_DDIV		(0x234)
+#define G3L_CPG_RSCI_DDIV		(0x238)
 #define G3L_CLKDIVSTATUS		(0x280)
 #define G3L_CPG_ETH_SSEL		(0x410)
+#define G3L_CPG_RSCI_SSEL		(0x414)
 #define G3L_CPG_ETH_SDIV		(0x434)
 
 /* RZ/G3L Specific division configuration.  */
@@ -30,6 +32,10 @@
 #define G3L_DIV_CA55_CORE1	DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 4, 3)
 #define G3L_DIV_CA55_CORE2	DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 8, 3)
 #define G3L_DIV_CA55_CORE3	DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 12, 3)
+#define G3L_DIV_RSCI0		DDIV_PACK(G3L_CPG_RSCI_DDIV, 0, 2)
+#define G3L_DIV_RSCI1		DDIV_PACK(G3L_CPG_RSCI_DDIV, 2, 2)
+#define G3L_DIV_RSCI2		DDIV_PACK(G3L_CPG_RSCI_DDIV, 4, 2)
+#define G3L_DIV_RSCI3		DDIV_PACK(G3L_CPG_RSCI_DDIV, 6, 2)
 #define G3L_SDIV_ETH_A		DDIV_PACK(G3L_CPG_ETH_SDIV, 0, 2)
 #define G3L_SDIV_ETH_B		DDIV_PACK(G3L_CPG_ETH_SDIV, 4, 1)
 #define G3L_SDIV_ETH_C		DDIV_PACK(G3L_CPG_ETH_SDIV, 8, 2)
@@ -43,6 +49,10 @@
 #define G3L_DIV_CA55_CORE1_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 13, 1)
 #define G3L_DIV_CA55_CORE2_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 14, 1)
 #define G3L_DIV_CA55_CORE3_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 15, 1)
+#define G3L_DIV_RSCI0_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 16, 1)
+#define G3L_DIV_RSCI1_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 17, 1)
+#define G3L_DIV_RSCI2_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 18, 1)
+#define G3L_DIV_RSCI3_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 19, 1)
 
 /* RZ/G3L Specific clocks select. */
 #define G3L_SEL_ETH0_TX		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 0, 1)
@@ -55,6 +65,10 @@
 #define G3L_SEL_ETH1_RM		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 10, 1)
 #define G3L_SEL_ETH1_CLK_TX_I	SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 11, 1)
 #define G3L_SEL_ETH1_CLK_RX_I	SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 12, 1)
+#define G3L_SEL_RSCI0		SEL_PLL_PACK(G3L_CPG_RSCI_SSEL, 0, 2)
+#define G3L_SEL_RSCI1		SEL_PLL_PACK(G3L_CPG_RSCI_SSEL, 2, 2)
+#define G3L_SEL_RSCI2		SEL_PLL_PACK(G3L_CPG_RSCI_SSEL, 4, 2)
+#define G3L_SEL_RSCI3		SEL_PLL_PACK(G3L_CPG_RSCI_SSEL, 6, 2)
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
@@ -71,6 +85,10 @@ enum clk_ids {
 	CLK_PLL1,
 	CLK_PLL2,
 	CLK_PLL2_DIV2,
+	CLK_PLL2_DIV2_4,
+	CLK_PLL2_DIV5,
+	CLK_PLL2_DIV6,
+	CLK_PLL2_DIV7,
 	CLK_PLL3,
 	CLK_PLL3_DIV2,
 	CLK_PLL6,
@@ -81,6 +99,10 @@ enum clk_ids {
 	CLK_SEL_ETH1_TX,
 	CLK_SEL_ETH1_RX,
 	CLK_SEL_ETH1_RM,
+	CLK_SEL_RSCI0,
+	CLK_SEL_RSCI1,
+	CLK_SEL_RSCI2,
+	CLK_SEL_RSCI3,
 	CLK_ETH0_TR,
 	CLK_ETH0_RM,
 	CLK_ETH1_TR,
@@ -107,6 +129,14 @@ static const struct clk_div_table dtable_2_20[] = {
 	{ 0, 0 },
 };
 
+static const struct clk_div_table dtable_2_16[] = {
+	{ 0, 2 },
+	{ 1, 4 },
+	{ 2, 8 },
+	{ 3, 16 },
+	{ 0, 0 },
+};
+
 static const struct clk_div_table dtable_4_128[] = {
 	{ 0, 4 },
 	{ 1, 8 },
@@ -137,6 +167,7 @@ static const char * const sel_eth0_rm[] = { ".pll6_div10", "eth0_rxc_rx_clk" };
 static const char * const sel_eth1_tx[] = { ".div_eth1_tr", "eth1_txc_tx_clk" };
 static const char * const sel_eth1_rx[] = { ".div_eth1_tr", "eth1_rxc_rx_clk" };
 static const char * const sel_eth1_rm[] = { ".pll6_div10", "eth1_rxc_rx_clk" };
+static const char * const sel_rsci[] = { ".pll2_div5", ".pll2_div6", ".pll2_div7", ".pll2_div2_4" };
 static const char * const sel_eth0_clk_tx_i[] = { ".sel_eth0_tx", ".div_eth0_rm" };
 static const char * const sel_eth0_clk_rx_i[] = { ".sel_eth0_rx", ".div_eth0_rm" };
 static const char * const sel_eth1_clk_tx_i[] = { ".sel_eth1_tx", ".div_eth1_rm" };
@@ -158,8 +189,16 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_G3L_PLL(".pll6", CLK_PLL6, CLK_EXTAL, CPG_PLL_CONF(0x50, 0),
 		    500000000UL),
 	DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
+	DEF_FIXED(".pll2_div2_4", CLK_PLL2_DIV2_4, CLK_PLL2_DIV2, 1, 4),
+	DEF_FIXED(".pll2_div5", CLK_PLL2_DIV5, CLK_PLL2, 1, 5),
+	DEF_FIXED(".pll2_div6", CLK_PLL2_DIV6, CLK_PLL2, 1, 6),
+	DEF_FIXED(".pll2_div7", CLK_PLL2_DIV7, CLK_PLL2, 1, 7),
 	DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
 	DEF_FIXED(".pll6_div10", CLK_PLL6_DIV10, CLK_PLL6, 1, 10),
+	DEF_MUX(".sel_rsci0", CLK_SEL_RSCI0, G3L_SEL_RSCI0, sel_rsci),
+	DEF_MUX(".sel_rsci1", CLK_SEL_RSCI1, G3L_SEL_RSCI1, sel_rsci),
+	DEF_MUX(".sel_rsci2", CLK_SEL_RSCI2, G3L_SEL_RSCI2, sel_rsci),
+	DEF_MUX(".sel_rsci3", CLK_SEL_RSCI3, G3L_SEL_RSCI3, sel_rsci),
 	DEF_MUX(".sel_eth0_tx", CLK_SEL_ETH0_TX, G3L_SEL_ETH0_TX, sel_eth0_tx),
 	DEF_MUX(".sel_eth0_rx", CLK_SEL_ETH0_RX, G3L_SEL_ETH0_RX, sel_eth0_rx),
 	DEF_MUX(".sel_eth0_rm", CLK_SEL_ETH0_RM, G3L_SEL_ETH0_RM, sel_eth0_rm),
@@ -186,6 +225,14 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 		    dtable_4_128, 0, 0, 0, NULL),
 	DEF_G3S_DIV("P3", R9A08G046_CLK_P3, CLK_PLL2_DIV2, G3L_DIVPL2A, G3L_DIVPL2A_STS,
 		    dtable_4_128, 0, 0, 0, NULL),
+	DEF_G3S_DIV("P13", R9A08G046_CLK_P13, CLK_SEL_RSCI0, G3L_DIV_RSCI0, G3L_DIV_RSCI0_STS,
+		    dtable_2_16, 0, 100000000UL, 0, NULL),
+	DEF_G3S_DIV("P14", R9A08G046_CLK_P14, CLK_SEL_RSCI1, G3L_DIV_RSCI1, G3L_DIV_RSCI1_STS,
+		    dtable_2_16, 0, 100000000UL, 0, NULL),
+	DEF_G3S_DIV("P15", R9A08G046_CLK_P15, CLK_SEL_RSCI2, G3L_DIV_RSCI2, G3L_DIV_RSCI2_STS,
+		    dtable_2_16, 0, 100000000UL, 0, NULL),
+	DEF_G3S_DIV("P16", R9A08G046_CLK_P16, CLK_SEL_RSCI3, G3L_DIV_RSCI3, G3L_DIV_RSCI3_STS,
+		    dtable_2_16, 0, 100000000UL, 0, NULL),
 	DEF_FIXED("HP", R9A08G046_CLK_HP, CLK_PLL6_DIV10, 1, 1),
 	DEF_MUX_FLAGS("ETHTX01", R9A08G046_CLK_ETHTX01, G3L_SEL_ETH0_CLK_TX_I, sel_eth0_clk_tx_i,
 		      CLK_SET_RATE_PARENT),
@@ -281,6 +328,22 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_MCPU3, BIT(4))),
 	DEF_MOD("gpio_hclk",		R9A08G046_GPIO_HCLK, R9A08G046_OSCCLK, 0x598, 0,
 					MSTOP(BUS_PERI_CPU, BIT(6))),
+	DEF_MOD("rsci0_pclk",		R9A08G046_RSCI0_PCLK, R9A08G046_CLK_P0, 0x618, 0,
+					MSTOP(BUS_MCPU2, BIT(7))),
+	DEF_MOD("rsci1_pclk",		R9A08G046_RSCI1_PCLK, R9A08G046_CLK_P0, 0x618, 1,
+					MSTOP(BUS_MCPU2, BIT(8))),
+	DEF_MOD("rsci2_pclk",		R9A08G046_RSCI2_PCLK, R9A08G046_CLK_P0, 0x618, 2,
+					MSTOP(BUS_MCPU3, BIT(11))),
+	DEF_MOD("rsci3_pclk",		R9A08G046_RSCI3_PCLK, R9A08G046_CLK_P0, 0x618, 3,
+					MSTOP(BUS_MCPU3, BIT(12))),
+	DEF_MOD("rsci0_tclk",		R9A08G046_RSCI0_TCLK, R9A08G046_CLK_P13, 0x618, 8,
+					MSTOP(BUS_MCPU2, BIT(7))),
+	DEF_MOD("rsci1_tclk",		R9A08G046_RSCI1_TCLK, R9A08G046_CLK_P14, 0x618, 9,
+					MSTOP(BUS_MCPU2, BIT(8))),
+	DEF_MOD("rsci2_tclk",		R9A08G046_RSCI2_TCLK, R9A08G046_CLK_P15, 0x618, 10,
+					MSTOP(BUS_MCPU3, BIT(11))),
+	DEF_MOD("rsci3_tclk",		R9A08G046_RSCI3_TCLK, R9A08G046_CLK_P16, 0x618, 11,
+					MSTOP(BUS_MCPU3, BIT(12))),
 };
 
 static const struct rzg2l_reset r9a08g046_resets[] = {
@@ -305,6 +368,14 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_GPIO_RSTN, 0x898, 0),
 	DEF_RST(R9A08G046_GPIO_PORT_RESETN, 0x898, 1),
 	DEF_RST(R9A08G046_GPIO_SPARE_RESETN, 0x898, 2),
+	DEF_RST(R9A08G046_RSCI0_PRESETN, 0x918, 0),
+	DEF_RST(R9A08G046_RSCI1_PRESETN, 0x918, 1),
+	DEF_RST(R9A08G046_RSCI2_PRESETN, 0x918, 2),
+	DEF_RST(R9A08G046_RSCI3_PRESETN, 0x918, 3),
+	DEF_RST(R9A08G046_RSCI0_TRESETN, 0x918, 8),
+	DEF_RST(R9A08G046_RSCI1_TRESETN, 0x918, 9),
+	DEF_RST(R9A08G046_RSCI2_TRESETN, 0x918, 10),
+	DEF_RST(R9A08G046_RSCI3_TRESETN, 0x918, 11),
 };
 
 static const unsigned int r9a08g046_crit_mod_clks[] __initconst = {
-- 
2.43.0

