Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CD237105B
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 11:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769774338; cv=none; b=VHcizAWKc12Tg2r2agbWb8ULjPaG/rBefuwpA0PblP23ijeDgDSdEARL2YWFTA4SiwUKw6C8rFz7tGMBANZ87QwAVlfdYRZQEQcNnbjWhq2ZOzNpk8Ux+7Oz4nV6Kyhh4IfCksxy+exOpfL+jjQgoG1PFBPqWefH0pN3AwUpW08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769774338; c=relaxed/simple;
	bh=Wt36PN5bHjGIsRQN727yxFJttOtyQJFgvRYzNsGZ+a8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SpL8dP11u4PvReZ1N0HH/7C/pCgF01t9k/wWuhpV9OO9vuuUTNLN6DGUggT6tkm9fsvIIMx1aYjfxQfAPqfrz7H7nht0kSVjqKFhc8mVsb8s1+tWjILmYGiJs/YfpmgwOkDgfQ3qzQzPDNzC10lzM8cu3FGUkUJv9RHuae2r9wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bo6JAlP/; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bo6JAlP/"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-658b6757f7fso3926701a12.1
        for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 03:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769774334; x=1770379134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=na+ZDw0eAD/iSJmU7KFtSfYJdxr1nTFE8Fh4OeAd1ss=;
        b=bo6JAlP/ry7dpAEeJEZAviKVOtOi8llSR60XOIIJ0EGyrnWcJo4joG6BL+BAGdIqW/
         a60Ps/K1HtXREqjiJO7eNopTOpAOkhj/CBS7mNx7fr9ad+OjHKKu3cOG7511uJDaiNIl
         UtWsyiDMGKryyB5X+BBbXSBF+aKJ8du1oikSmnUxPVFLPjigwHhBhSVAhdfjFYaH+WZu
         5hy+wCGpVf6swijZ3OMqJXfc7Awd/ou/eF/6mleMHzg7Lo3sjuytHHgBNizQ1AMiS45A
         /W0jkmHoafvjxQAV2YsoxcyN/m2OMTrSEirmYIu276v5S+EREn6riW7ZTLGoGpH9G1nb
         7h+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769774334; x=1770379134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=na+ZDw0eAD/iSJmU7KFtSfYJdxr1nTFE8Fh4OeAd1ss=;
        b=ijHnjIOQAe0G5oVEYOp44GTE1bsyahrkEZ/DsJJDtcz34rcIj6hFAAo8asZ1+DMuie
         rUqobTtMf8m9CfO0rAxk/kXrXbtHbnRxWYB/1aa/bXYbEgEo4htKX6HbbaXnQ64ORMII
         Fmd2rECzaQr5HagETKKbovcSA8cSfMCDjilwJSEZCohKIa6ZNOTS4sE+9u5+7urUONAh
         5B4HfLLO9lgoYcADOPsTjlly8cQYpRQtypelL1DQ4/kAAE5ZEgikDZ4yTfzbcMAsvXyJ
         oAaZlB93rneYgD+JH0vCOUNqqKdZf14BTRrBbl0VGjp0qYJxsxd4+w6asiWFEQXpUJV/
         7/5g==
X-Forwarded-Encrypted: i=1; AJvYcCWDABIP5nPuGc1NBeMkAYhagptugZ5sX6Bm4eEVcZhzzf+EblPN7NRkROVJOFMq+BuysVGIAlZn4Zc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/QhPCC9whSqBHB7GcmT5yZ/2A2nP9o1h1jz9+MXyLuq3GVlaY
	U6rP/Ssp/Letz8LQT+am2qO7RyZa+n3SWJfkqnve8g6Hw6FF+Wfo9hUd
X-Gm-Gg: AZuq6aKHeyf0is+l7y2RQyq6wWSjL4cXPmAGhiPmrCyRvQ7wOSp3wh0mfWfOzaFXYa6
	XHkOL2CpZZOwN4UyjuFqxn27zP7tdbnUpDK1nGv7V8A5mbJ1k5ftpfogUhAy9ALb27KtBVPn05I
	y36ZJ3YiFaYjYFLYaFpX8YDdfY0ayV1TN4bsIpyXAzlIfPFw4pzWVo7uutbBKS3IDvg6twSOzrq
	uf/AbqsxC0uqKI45XzIatjgGBpV6MQX6YMbt3Wqhya+QftJAyfysqFYudVhX+7bMPf4KaaZeP+F
	uLivy2sMSIzHjHYHvZAUOCKnX/DcmJGfiQUtc+u8g12C22MZoASDMtQ/9euOMPuHFXPmQXDAMez
	pz0MaNLfaeybsyVxw7s4JkFRumPQVi3LSNZ5qrlsHjIUbTxj5eZdsWOFICTuHN25XXd/qojBQrd
	ZdAq4aUPN7ixIprfREkMZ+eHfkD7Og5knpRjU=
X-Received: by 2002:a17:907:2d0e:b0:b88:1e2:ed49 with SMTP id a640c23a62f3a-b8dff22f549mr177830866b.8.1769774334208;
        Fri, 30 Jan 2026 03:58:54 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:bd64:2984:fe71:7633])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbeffed15sm404671566b.31.2026.01.30.03.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 03:58:53 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 4/4] clk: renesas: r9a08g046: Add clock and reset signals for the GBETH IPs
Date: Fri, 30 Jan 2026 11:58:45 +0000
Message-ID: <20260130115850.253555-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260130115850.253555-1-biju.das.jz@bp.renesas.com>
References: <20260130115850.253555-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add clock and reset entries for the Gigabit Ethernet Interfaces
(GBETH 0-1) IPs found on the RZ/G3L SoC. This includes various dividers
and mux clocks needed by these two GBETH IPs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change
---
 drivers/clk/renesas/r9a08g046-cpg.c | 114 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h     |   6 ++
 2 files changed, 120 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index cc7d3872e9e4..e74bab2df29a 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -18,17 +18,35 @@
 #define G3L_CPG_PL2_DDIV		(0x204)
 #define G3L_CPG_PL3_DDIV		(0x208)
 #define G3L_CLKDIVSTATUS		(0x280)
+#define G3L_CPG_ETH_SSEL		(0x410)
+#define G3L_CPG_ETH_SDIV		(0x434)
 
 /* RZ/G3L Specific division configuration.  */
 #define G3L_DIVPL2A		DDIV_PACK(G3L_CPG_PL2_DDIV, 0, 2)
 #define G3L_DIVPL2B		DDIV_PACK(G3L_CPG_PL2_DDIV, 4, 2)
 #define G3L_DIVPL3A		DDIV_PACK(G3L_CPG_PL3_DDIV, 0, 2)
+#define G3L_SDIV_ETH_A		DDIV_PACK(G3L_CPG_ETH_SDIV, 0, 2)
+#define G3L_SDIV_ETH_B		DDIV_PACK(G3L_CPG_ETH_SDIV, 4, 1)
+#define G3L_SDIV_ETH_C		DDIV_PACK(G3L_CPG_ETH_SDIV, 8, 2)
+#define G3L_SDIV_ETH_D		DDIV_PACK(G3L_CPG_ETH_SDIV, 12, 1)
 
 /* RZ/G3L Clock status configuration. */
 #define G3L_DIVPL2A_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 4, 1)
 #define G3L_DIVPL2B_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 5, 1)
 #define G3L_DIVPL3A_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 8, 1)
 
+/* RZ/G3L Specific clocks select. */
+#define G3L_SEL_ETH0_TX		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 0, 1)
+#define G3L_SEL_ETH0_RX		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 1, 1)
+#define G3L_SEL_ETH0_RM		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 2, 1)
+#define G3L_SEL_ETH0_CLK_TX_I	SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 3, 1)
+#define G3L_SEL_ETH0_CLK_RX_I	SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 4, 1)
+#define G3L_SEL_ETH1_TX		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 8, 1)
+#define G3L_SEL_ETH1_RX		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 9, 1)
+#define G3L_SEL_ETH1_RM		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 10, 1)
+#define G3L_SEL_ETH1_CLK_TX_I	SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 11, 1)
+#define G3L_SEL_ETH1_CLK_RX_I	SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 12, 1)
+
 /* PLL 1/4/6/7 configuration registers macro. */
 #define G3L_PLL1467_CONF(clk1, clk2, setting)	((clk1) << 22 | (clk2) << 12 | (setting))
 
@@ -49,12 +67,29 @@ enum clk_ids {
 	CLK_PLL3,
 	CLK_PLL3_DIV2,
 	CLK_PLL6,
+	CLK_PLL6_DIV10,
+	CLK_SEL_ETH0_TX,
+	CLK_SEL_ETH0_RX,
+	CLK_SEL_ETH0_RM,
+	CLK_SEL_ETH1_TX,
+	CLK_SEL_ETH1_RX,
+	CLK_SEL_ETH1_RM,
+	CLK_ETH0_TR,
+	CLK_ETH0_RM,
+	CLK_ETH1_TR,
+	CLK_ETH1_RM,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
 };
 
 /* Divider tables */
+static const struct clk_div_table dtable_2_20[] = {
+	{ 0, 2 },
+	{ 1, 20 },
+	{ 0, 0 },
+};
+
 static const struct clk_div_table dtable_4_128[] = {
 	{ 0, 4 },
 	{ 1, 2 },
@@ -63,6 +98,13 @@ static const struct clk_div_table dtable_4_128[] = {
 	{ 0, 0 },
 };
 
+static const struct clk_div_table dtable_4_200[] = {
+	{ 0, 4 },
+	{ 1, 20 },
+	{ 2, 200 },
+	{ 0, 0 },
+};
+
 static const struct clk_div_table dtable_8_256[] = {
 	{ 0, 8 },
 	{ 1, 16 },
@@ -71,6 +113,18 @@ static const struct clk_div_table dtable_8_256[] = {
 	{ 0, 0 },
 };
 
+/* Mux clock names tables. */
+static const char * const sel_eth0_tx[] = { ".div_eth0_tr", "eth0_txc_tx_clk" };
+static const char * const sel_eth0_rx[] = { ".div_eth0_tr", "eth0_rxc_rx_clk" };
+static const char * const sel_eth0_rm[] = { ".pll6_div10", "eth0_rxc_rx_clk" };
+static const char * const sel_eth1_tx[] = { ".div_eth1_tr", "eth1_txc_tx_clk" };
+static const char * const sel_eth1_rx[] = { ".div_eth1_tr", "eth1_rxc_rx_clk" };
+static const char * const sel_eth1_rm[] = { ".pll6_div10", "eth1_rxc_rx_clk" };
+static const char * const sel_eth0_clk_tx_i[] = { ".sel_eth0_tx", ".div_eth0_rm" };
+static const char * const sel_eth0_clk_rx_i[] = { ".sel_eth0_rx", ".div_eth0_rm" };
+static const char * const sel_eth1_clk_tx_i[] = { ".sel_eth1_tx", ".div_eth1_rm" };
+static const char * const sel_eth1_clk_rx_i[] = { ".sel_eth1_rx", ".div_eth1_rm" };
+
 static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	/* External Clock Inputs */
 	DEF_INPUT("extal", CLK_EXTAL),
@@ -86,6 +140,17 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 		    500000000UL),
 	DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
 	DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
+	DEF_FIXED(".pll6_div10", CLK_PLL6_DIV10, CLK_PLL6, 1, 10),
+	DEF_MUX(".sel_eth0_tx", CLK_SEL_ETH0_TX, G3L_SEL_ETH0_TX, sel_eth0_tx),
+	DEF_MUX(".sel_eth0_rx", CLK_SEL_ETH0_RX, G3L_SEL_ETH0_RX, sel_eth0_rx),
+	DEF_MUX(".sel_eth0_rm", CLK_SEL_ETH0_RM, G3L_SEL_ETH0_RM, sel_eth0_rm),
+	DEF_MUX(".sel_eth1_tx", CLK_SEL_ETH1_TX, G3L_SEL_ETH1_TX, sel_eth1_tx),
+	DEF_MUX(".sel_eth1_rx", CLK_SEL_ETH1_RX, G3L_SEL_ETH1_RX, sel_eth1_rx),
+	DEF_MUX(".sel_eth1_rm", CLK_SEL_ETH1_RM, G3L_SEL_ETH1_RM, sel_eth1_rm),
+	DEF_DIV(".div_eth0_tr", CLK_ETH0_TR, CLK_PLL6, G3L_SDIV_ETH_A, dtable_4_200),
+	DEF_DIV(".div_eth1_tr", CLK_ETH1_TR, CLK_PLL6, G3L_SDIV_ETH_C, dtable_4_200),
+	DEF_DIV(".div_eth0_rm", CLK_ETH0_RM, CLK_SEL_ETH0_RM, G3L_SDIV_ETH_B, dtable_2_20),
+	DEF_DIV(".div_eth1_rm", CLK_ETH1_RM, CLK_SEL_ETH1_RM, G3L_SDIV_ETH_D, dtable_2_20),
 
 	/* Core output clk */
 	DEF_G3S_DIV("P0", R9A08G046_CLK_P0, CLK_PLL2_DIV2, G3L_DIVPL2B, G3L_DIVPL2B_STS,
@@ -94,6 +159,21 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 		    dtable_4_128, 0, 0, 0, NULL),
 	DEF_G3S_DIV("P3", R9A08G046_CLK_P3, CLK_PLL2_DIV2, G3L_DIVPL2A, G3L_DIVPL2A_STS,
 		    dtable_4_128, 0, 0, 0, NULL),
+	DEF_FIXED("HP", R9A08G046_CLK_HP, CLK_PLL6_DIV10, 1, 1),
+	DEF_MUX_FLAGS("ETHTX01", R9A08G046_CLK_ETHTX01, G3L_SEL_ETH0_CLK_TX_I, sel_eth0_clk_tx_i,
+		      CLK_SET_RATE_PARENT),
+	DEF_MUX_FLAGS("ETHRX01", R9A08G046_CLK_ETHRX01, G3L_SEL_ETH0_CLK_RX_I, sel_eth0_clk_rx_i,
+		      CLK_SET_RATE_PARENT),
+	DEF_MUX_FLAGS("ETHTX11", R9A08G046_CLK_ETHTX11, G3L_SEL_ETH1_CLK_TX_I, sel_eth1_clk_tx_i,
+		      CLK_SET_RATE_PARENT),
+	DEF_MUX_FLAGS("ETHRX11", R9A08G046_CLK_ETHRX11, G3L_SEL_ETH1_CLK_RX_I, sel_eth1_clk_rx_i,
+		      CLK_SET_RATE_PARENT),
+	DEF_FIXED("ETHRM0", R9A08G046_CLK_ETHRM0, CLK_ETH0_RM, 1, 1),
+	DEF_FIXED("ETHTX02", R9A08G046_CLK_ETHTX02, CLK_SEL_ETH0_TX, 1, 1),
+	DEF_FIXED("ETHRX02", R9A08G046_CLK_ETHRX02, CLK_SEL_ETH0_RX, 1, 1),
+	DEF_FIXED("ETHRM1", R9A08G046_CLK_ETHRM1, CLK_ETH1_RM, 1, 1),
+	DEF_FIXED("ETHTX12", R9A08G046_CLK_ETHTX12, CLK_SEL_ETH1_TX, 1, 1),
+	DEF_FIXED("ETHRX12", R9A08G046_CLK_ETHRX12, CLK_SEL_ETH1_RX, 1, 1),
 };
 
 static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
@@ -107,6 +187,38 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_REG1, BIT(2))),
 	DEF_MOD("dmac_pclk",		R9A08G046_DMAC_PCLK, R9A08G046_CLK_P3, 0x52c, 1,
 					MSTOP(BUS_REG1, BIT(3))),
+	DEF_MOD("eth0_clk_axi",		R9A08G046_ETH0_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 0,
+					MSTOP(BUS_PERI_COM, BIT(2))),
+	DEF_MOD("eth1_clk_axi",		R9A08G046_ETH1_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 1,
+					MSTOP(BUS_PERI_COM, BIT(3))),
+	DEF_MOD("eth0_clk_chi",		R9A08G046_ETH0_CLK_CHI, R9A08G046_CLK_P1, 0x57c, 2,
+					MSTOP(BUS_PERI_COM, BIT(2))),
+	DEF_MOD("eth1_clk_chi",		R9A08G046_ETH1_CLK_CHI, R9A08G046_CLK_P1, 0x57c, 3,
+					MSTOP(BUS_PERI_COM, BIT(2))),
+	DEF_COUPLED("eth0_tx_i",	R9A08G046_ETH0_CLK_TX_I, R9A08G046_CLK_ETHTX01, 0x57c, 4,
+					MSTOP(BUS_PERI_COM, BIT(2))),
+	DEF_COUPLED("eth0_tx_180_i", R9A08G046_ETH0_CLK_TX_180_I, R9A08G046_CLK_ETHTX02, 0x57c, 4,
+					MSTOP(BUS_PERI_COM, BIT(2))),
+	DEF_COUPLED("eth1_tx_i",	R9A08G046_ETH1_CLK_TX_I, R9A08G046_CLK_ETHTX11, 0x57c, 5,
+					MSTOP(BUS_PERI_COM, BIT(3))),
+	DEF_COUPLED("eth1_tx_180_i", R9A08G046_ETH1_CLK_TX_180_I, R9A08G046_CLK_ETHTX12, 0x57c, 5,
+					MSTOP(BUS_PERI_COM, BIT(3))),
+	DEF_COUPLED("eth0_rx_i",	R9A08G046_ETH0_CLK_RX_I, R9A08G046_CLK_ETHRX01, 0x57c, 6,
+					MSTOP(BUS_PERI_COM, BIT(2))),
+	DEF_COUPLED("eth0_rx_180_i", R9A08G046_ETH0_CLK_RX_180_I, R9A08G046_CLK_ETHRX02, 0x57c, 6,
+					MSTOP(BUS_PERI_COM, BIT(2))),
+	DEF_COUPLED("eth1_rx_i",	R9A08G046_ETH1_CLK_RX_I, R9A08G046_CLK_ETHRX11, 0x57c, 7,
+					MSTOP(BUS_PERI_COM, BIT(3))),
+	DEF_COUPLED("eth1_rx_180_i", R9A08G046_ETH1_CLK_RX_180_I, R9A08G046_CLK_ETHRX12, 0x57c, 7,
+					MSTOP(BUS_PERI_COM, BIT(3))),
+	DEF_MOD("eth0_ptp_ref_i",	R9A08G046_ETH0_CLK_PTP_REF_I, R9A08G046_CLK_HP, 0x57c, 8,
+					MSTOP(BUS_PERI_COM, BIT(2))),
+	DEF_MOD("eth1_ptp_ref_i",	R9A08G046_ETH1_CLK_PTP_REF_I, R9A08G046_CLK_HP, 0x57c, 9,
+					MSTOP(BUS_PERI_COM, BIT(3))),
+	DEF_MOD("eth0_rmii_i",		R9A08G046_ETH0_CLK_RMII_I, R9A08G046_CLK_ETHRM0, 0x57c, 10,
+					MSTOP(BUS_PERI_COM, BIT(2))),
+	DEF_MOD("eth1_rmii_i",		R9A08G046_ETH1_CLK_RMII_I, R9A08G046_CLK_ETHRM1, 0x57c, 11,
+					MSTOP(BUS_PERI_COM, BIT(3))),
 	DEF_MOD("scif0_clk_pck",	R9A08G046_SCIF0_CLK_PCK, R9A08G046_CLK_P0, 0x584, 0,
 					MSTOP(BUS_MCPU2, BIT(1))),
 };
@@ -117,6 +229,8 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_IA55_RESETN, 0x818, 0),
 	DEF_RST(R9A08G046_DMAC_ARESETN, 0x82c, 0),
 	DEF_RST(R9A08G046_DMAC_RST_ASYNC, 0x82c, 1),
+	DEF_RST(R9A08G046_ETH0_ARESET_N, 0x87c, 0),
+	DEF_RST(R9A08G046_ETH1_ARESET_N, 0x87c, 1),
 	DEF_RST(R9A08G046_SCIF0_RST_SYSTEM_N, 0x884, 0),
 };
 
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 7de4cb7af1cc..9abb53483759 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -188,6 +188,12 @@ enum clk_types {
 		 .parent_names = _parent_names, \
 		 .num_parents = ARRAY_SIZE(_parent_names), \
 		 .mux_flags = CLK_MUX_READ_ONLY)
+#define DEF_MUX_FLAGS(_name, _id, _conf, _parent_names, _flag) \
+	DEF_TYPE(_name, _id, CLK_TYPE_MUX, .conf = _conf, \
+		 .parent_names = _parent_names, \
+		 .num_parents = ARRAY_SIZE(_parent_names), \
+		 .mux_flags = CLK_MUX_HIWORD_MASK, \
+		 .flag = _flag)
 #define DEF_SD_MUX(_name, _id, _conf, _sconf, _parent_names, _mtable, _clk_flags, _notifier) \
 	DEF_TYPE(_name, _id, CLK_TYPE_SD_MUX, .conf = _conf, .sconf = _sconf, \
 		 .parent_names = _parent_names, \
-- 
2.43.0

