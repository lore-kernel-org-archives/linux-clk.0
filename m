Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341A139448A
	for <linux-clk@vger.kernel.org>; Fri,  6 Feb 2026 10:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770375198; cv=none; b=tGf7q5jCp/by+SjGGwIXzEQ79T2PLwkV5J4uSTCG/ixCxLdXvmQ/GNwijgA8XjG6veVvY3vsvOPEvnyjz9Ld1CTdEELmWKoym7qVJv4QrVBL2IiFpcss/kEKQ4HDSN2UsWzO403xezoJKyyy6Q6Dwi+lMdEvS4h2xanRZTWn/bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770375198; c=relaxed/simple;
	bh=E9ZSHnXD9X7MjILgNxfvajPskWPb1at5SAQIVrXREt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bDOI2SN67tOceErgr/yAMx773IAJEcxRJyaPdIBRc+F//54sVCe73+FTItY/VIo4KzWdSqwMPbR+VdH4L6SNHHnLzVdyeKPpiKFpCH1Z+vFqwtWotGhyVyhZwz03ynvi+6/b8zBMZG87+TtVqCKYCJVTwIVtua/W7dBKQDKuvDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcl0nEUy; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcl0nEUy"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4359a316d89so1626766f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 06 Feb 2026 02:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770375197; x=1770979997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEkRY/D1XR9iy/Ym0Sp3clSObcwfcfjO4JrebWZ4vME=;
        b=gcl0nEUyf7HZ9QSgztKABmncZh13GM2hR7Zoo2PpmdivFTPTwQKkQCZNQJ7LvlzFLz
         PveI7J5bcRcAI5hjeOYljX9cV9ogPBIH+GpBQBWFDMKOBSxKFWYU2hKHIOjGAkyvKxXT
         FFoch5BioU44byuawUHva9qcjgkFzlfGL8LCvrSmqSaM34i2ZQbQsgKhwm9RTvJ2eNZG
         kjuOgDS5LcZHvaWM5wcDUKpui8o0hx+CubsBE9WH9N9Hbr819wrU3HuvL4gSadNCuWux
         meRstyqo2QioNN+I4+igWqFyxglz0fgzS5MNiYhBMhYjuX986SAiZMBtmIXfwpTPO/ny
         5Q+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770375197; x=1770979997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gEkRY/D1XR9iy/Ym0Sp3clSObcwfcfjO4JrebWZ4vME=;
        b=j5OwA7os7WSLfRthSp/R3UXEZ4AZv66J95g+eGT1eISY/58Th++x5l0MhEQF3D4qpx
         5atYTEY8bUbmaLpO6qOf2qbIS2IV7PXd1KoPKB4lfKzqHuxQ7u9I9Kiz1NQKHSeBsIG5
         kMOXyn+2wIr2b59iS0NEagCwecfDK1et1jmGYmUdGM+MoaazSnYNr+q5XhUsqSgaabv1
         MgAY+1mBlVXaP4GLdqWYaYljLNaWrStS/efhJIc207cedPObsDFOdxiF6xfx5nLG0RsG
         a8pzvzjqUxCEQDtJVlCpvtaRIXzIqFwBT4Et/el5Pawq8kBYDxJ1jim9LCrQoy5Zy1MQ
         hvqw==
X-Forwarded-Encrypted: i=1; AJvYcCXvwKPLOs0Ori8gE/USx+rFXUbMZT2BTUhW4wyR6EE/qPSWDA8Jk4nPSV6VIM++52sioZK1VEXWhYo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCcr73owh4C5u/5oAndZdb1NaEgCue5AxWTl/gpDbQX7Hy5v1b
	yd+M+26AeOcRWWpQqRizIwEJ5+MOi/lKeoC3jnXRi1Kp+BywD7+kfEoy
X-Gm-Gg: AZuq6aLR6hBuOc9criYrnznw+J7mLlQHHbITYLdEx9jF+lvUqEBP8Jkr5iFhgs7oyYf
	xf5fnIDgQybkyAk4Emt2vIWKtHKKn+Tr/PeBc1ZGCPNJIHfcpl0Dg3jKuSpffVFMYVvLNSEFqlg
	9/Q5eTldC9p45/FwWDCweD4w2dSOy5ZbyZvkAnwNv+V0wuc+3nh7mtPSigeRqRZXhDPSBmYf+b3
	Q999aixFYbWZwFMILwAcw4xZ0pp0GBDkdyHkouhyfwThb0tp90Fwx4SCxPX5ZUJi3lDmrRuDcnY
	kEluDeVH8bsNVLX4/MRpV/n/5RwGiXoVzNW7Y9ct+GH+p+yHcyoiLUVmJBDgw9PhZUXGK8krLCi
	ziRC/TPZpgKqifpR/3JMDzZoqBM3eZVk6MKg95cYFxy1ra3a/Dxw9XdvPTkhL0PH9kcE0/g+Tfa
	VyjO7tuOJLadqAcJ0tXg==
X-Received: by 2002:a05:6000:2c08:b0:435:a48a:123f with SMTP id ffacd0b85a97d-4362937b167mr3949418f8f.42.1770375196522;
        Fri, 06 Feb 2026 02:53:16 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:1e64:f8d5:9d7a:19d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629730992sm4519611f8f.21.2026.02.06.02.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 02:53:16 -0800 (PST)
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
Subject: [PATCH v4 4/4] clk: renesas: r9a08g046: Add clock and reset signals for the GBETH IPs
Date: Fri,  6 Feb 2026 10:53:04 +0000
Message-ID: <20260206105312.231015-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206105312.231015-1-biju.das.jz@bp.renesas.com>
References: <20260206105312.231015-1-biju.das.jz@bp.renesas.com>
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
and mux clocks needed by these two GBETH IPs. Also add tx, tx-180, rx,
rx-180, rmii, rmii-tx and rmii-rx clocks to r9a08g046_no_pm_mod_clk
table to avoid enabling both normal and rmii clocks by the PM framework.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Updated commit description
 * Fixed mstop bit for eth1_clk_chi and eth0_{tx,rx}_i_rmii clocks
 * Added r9a08g046_no_pm_mod_clks to avoid PM framework enabling both
   rgmii and rmii clocks together as they are mutually exclusive.
 * Fixed checkpatch warning for more than 100 columns
v2->v3:
 * Added eth{0,1}_{tx,rx}_i_rmii clocks.
v1->v2:
 * No change
---
 drivers/clk/renesas/r9a08g046-cpg.c | 147 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h     |   6 ++
 2 files changed, 153 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index cc7d3872e9e4..4819da66199f 100644
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
@@ -107,6 +187,50 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
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
+					MSTOP(BUS_PERI_COM, BIT(3))),
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
+	DEF_COUPLED("eth0_tx_i_rmii",
+				R9A08G046_ETH0_CLK_TX_I_RMII, R9A08G046_CLK_ETHTX01, 0x57c, 12,
+					MSTOP(BUS_PERI_COM, BIT(2))),
+	DEF_COUPLED("eth0_rx_i_rmii",
+				R9A08G046_ETH0_CLK_RX_I_RMII, R9A08G046_CLK_ETHRX01, 0x57c, 12,
+					MSTOP(BUS_PERI_COM, BIT(2))),
+	DEF_COUPLED("eth1_tx_i_rmii",
+				R9A08G046_ETH1_CLK_TX_I_RMII, R9A08G046_CLK_ETHTX11, 0x57c, 13,
+					MSTOP(BUS_PERI_COM, BIT(3))),
+	DEF_COUPLED("eth1_rx_i_rmii",
+				R9A08G046_ETH1_CLK_RX_I_RMII, R9A08G046_CLK_ETHRX11, 0x57c, 13,
+					MSTOP(BUS_PERI_COM, BIT(3))),
 	DEF_MOD("scif0_clk_pck",	R9A08G046_SCIF0_CLK_PCK, R9A08G046_CLK_P0, 0x584, 0,
 					MSTOP(BUS_MCPU2, BIT(1))),
 };
@@ -117,6 +241,8 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_IA55_RESETN, 0x818, 0),
 	DEF_RST(R9A08G046_DMAC_ARESETN, 0x82c, 0),
 	DEF_RST(R9A08G046_DMAC_RST_ASYNC, 0x82c, 1),
+	DEF_RST(R9A08G046_ETH0_ARESET_N, 0x87c, 0),
+	DEF_RST(R9A08G046_ETH1_ARESET_N, 0x87c, 1),
 	DEF_RST(R9A08G046_SCIF0_RST_SYSTEM_N, 0x884, 0),
 };
 
@@ -126,6 +252,23 @@ static const unsigned int r9a08g046_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A08G046_DMAC_ACLK,
 };
 
+static const unsigned int r9a08g046_no_pm_mod_clks[] = {
+	MOD_CLK_BASE + R9A08G046_ETH0_CLK_TX_I,
+	MOD_CLK_BASE + R9A08G046_ETH0_CLK_TX_180_I,
+	MOD_CLK_BASE + R9A08G046_ETH0_CLK_RX_I,
+	MOD_CLK_BASE + R9A08G046_ETH0_CLK_RX_180_I,
+	MOD_CLK_BASE + R9A08G046_ETH0_CLK_RMII_I,
+	MOD_CLK_BASE + R9A08G046_ETH0_CLK_TX_I_RMII,
+	MOD_CLK_BASE + R9A08G046_ETH0_CLK_RX_I_RMII,
+	MOD_CLK_BASE + R9A08G046_ETH1_CLK_TX_I,
+	MOD_CLK_BASE + R9A08G046_ETH1_CLK_TX_180_I,
+	MOD_CLK_BASE + R9A08G046_ETH1_CLK_RX_I,
+	MOD_CLK_BASE + R9A08G046_ETH1_CLK_RX_180_I,
+	MOD_CLK_BASE + R9A08G046_ETH1_CLK_RMII_I,
+	MOD_CLK_BASE + R9A08G046_ETH1_CLK_TX_I_RMII,
+	MOD_CLK_BASE + R9A08G046_ETH1_CLK_RX_I_RMII,
+};
+
 const struct rzg2l_cpg_info r9a08g046_cpg_info = {
 	/* Core Clocks */
 	.core_clks = r9a08g046_core_clks,
@@ -142,6 +285,10 @@ const struct rzg2l_cpg_info r9a08g046_cpg_info = {
 	.num_mod_clks = ARRAY_SIZE(r9a08g046_mod_clks),
 	.num_hw_mod_clks = R9A08G046_BSC_X_BCK_BSC + 1,
 
+	/* No PM modules Clocks */
+	.no_pm_mod_clks = r9a08g046_no_pm_mod_clks,
+	.num_no_pm_mod_clks = ARRAY_SIZE(r9a08g046_no_pm_mod_clks),
+
 	/* Resets */
 	.resets = r9a08g046_resets,
 	.num_resets = R9A08G046_LVDS_RESET_N + 1, /* Last reset ID + 1 */
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

