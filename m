Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF2734AB19
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 19:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773777422; cv=none; b=qX+tGY49wqVf7Sty5h1+7H6H37z3O3TlugIJbsovaxHeLE7tOcSVKohEqibtsR74ivGnC9TvPnXQsfzrFlAuK1xn4PObf6PdrnEsiSNZ+gU9tFLRIqorwp7ZfkW7WR7skcxy0+co/7TGlLXHgc/ucNM8bqcgQOFgNaCCL+vm+qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773777422; c=relaxed/simple;
	bh=XstAG9JcIpHVuJ3CxWCI9LPe3SUBo0gnlWANq4vT4KY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BsOLimk1Sq09TTHdV1ZoGhq4XAJWn7ou87zU2661sT7ADk9cb6vOXrZWeb6Anuz/g27wb2TLqt+KauAKt0MTf9l8pfVZk3HZKbZtaWiaNA5gR9DZSLvMbroEjVkvgn9e+nRWc0J6VEa3bqisiqnLXoFaCVYuszJWCgxvZCnP1m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QuHjByW+; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuHjByW+"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439b2965d4bso4347754f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 12:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773777419; x=1774382219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgVL5zSL+LKHL6L/J0FmPuhD0VD4xEblVX9XJ0lM5+o=;
        b=QuHjByW+JgnxiqT1ny4Pq0eRtGPgKdIqPZFcYHJaVoPVzicNem4POnMdHqW9hwr4eb
         V15Nk3cdz7CGkNSL2NFEc5XMM5TLCylPNN933TXn9U88/ca5TDr+w1AImn9E9csskcXt
         vew5MV26xZVTW+6Qz/QD2hOkNtH+1lKRaT6M+j+Z9wn9iE04BLBgGVbUdUunku1Q1dAv
         btpW9PB4txafBSZeHzqC25gyId7MhWO8lXE88bAO7sSRSkLRl1Pd8pj1lh2GdfAvB427
         jEaNTFeuXZy6aOqvCuefmBWXmbSzGgiUdWHLWX/IV+B/0mH9x7fsCzxZN+l1MudOJsLl
         ODMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773777419; x=1774382219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AgVL5zSL+LKHL6L/J0FmPuhD0VD4xEblVX9XJ0lM5+o=;
        b=UyYm+aX0p2J4dgJQun+nchJr/HJiPPlOWykjqg+5OgmuEBPKRNVfzoAgIGOaV0Nl6K
         x4UAD28tVF181jDhImbgOmBwQiwBa9VlQZiM3Eb/G/BTL14Ye0bCjoAhlqMdFxMaphaL
         xNhy55ICD2zuRh9ozVMZZjHZWqIpr3GyyzcqPYnNDGDT+p1wOKmrWiw/j/dH05M/nJA+
         +dfwifvFBdTW/6+v3JZxhD4i+nD5FI63nWwl7yxJ/pHYterEEu24I1YhsrjCprsVli7w
         0woeQ0zvIY/ex8W2XFfJsE+eFZcY4aJZ/wMmjdUGE2pCgvhLf/foTtDtiUe/oj3k2NzE
         vF3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwG3Z38di3rKiKWJpWcxtPsCsP25lFOs2kkRZUOuFS1fCyhrHA70L223eoS+ZuMdLWBnGz6FMKRA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdB0hYU4b54Cy9XRyCNyz49pAVl/zxFKN0pIonGKvgkcwLi2Nu
	oKpU9phtzNzhKkxcPe4ayjerzxPAdOB8ESI9UFMf2E7Sroq192hk/w0Q
X-Gm-Gg: ATEYQzxVpp+ffWVybgif2W1fIUi0YCm5IU0nndcNvZRjN9C1fNuFprkPyET0M+K1Pqh
	fA34hc9SX/6DVEl8xvi92SOyjtugaOSfw3lIpIe164Qf0FifbKg9KXw8Kwg2uh/DFHMAc368qIW
	5pwSyWwQraQlFjxnmBB0zJ+0xChgRkIRjarXB5Q5pvwqBabS2dmG2jQHnFIGz3l9Qr2BLcr0Jo9
	FVsM5cgwNKlhKu805cq5WBkCHducPILYqQW9r4vjW1GslHSGFtKBb7Hw91x919i56+QISpWtLtE
	MbUs3panEjNC6FshvKD0nMuE2Gp7TCQNbI7rjAn94SHPPup8vBqC+fOLTEQ1XCfkER/ouCXQVcW
	6Xv6bLDg8mKB/cnbDtmXz+wIrVdkQ6TP0VKeTYelUftRCnTTDqirOmBurtdI9c9hn/AmuofFa/c
	x5W+3Aq1Cx5ORTF50xIa4DONfkQZLrHgPkp/HCKKcij/0tp7VY
X-Received: by 2002:a5d:5d13:0:b0:43b:509c:51fe with SMTP id ffacd0b85a97d-43b527a9e13mr937458f8f.13.1773777418984;
        Tue, 17 Mar 2026 12:56:58 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5189221dsm1339217f8f.23.2026.03.17.12.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:56:58 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 5/9] clk: renesas: Add support for RZ/G3L SoC
Date: Tue, 17 Mar 2026 19:56:34 +0000
Message-ID: <20260317195650.468330-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317195650.468330-1-biju.das.jz@bp.renesas.com>
References: <20260317195650.468330-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The clock structure for RZ/G3L is almost identical to that of the RZ/G3S
SoC with more IP blocks such as LCDC, CRU, LVDS, and GPU.

Add minimal clock and reset entries required to boot the system on Renesas
RZ/G3L SMARC EVK and bind it with the RZ/G2L CPG core driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Updated commit description
 * Updated LAST_DT_CORE_CLK with R9A08G046_USB_SCLK
 * Fixed typo 2->8 in dtable_4_128[].
 * Added critical reset table r9a08g046_critical_resets[]
 * Updated num_resets
 * Added crit_resets and num_crit_resets to r9a08g046_cpg_info.
v2->v3:
 * No change.
v1->v2:
 * Added CLK_ETH{0,1}_TXC_TX_CLK_IN and CLK_ETH{0,1}_RXC_RX_CLK_IN clocks.
 * Dropped R9A08G046_IA55_PCLK from critical clock list.
---
 drivers/clk/renesas/Kconfig         |   7 +-
 drivers/clk/renesas/Makefile        |   1 +
 drivers/clk/renesas/r9a08g046-cpg.c | 153 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.c     |   6 ++
 drivers/clk/renesas/rzg2l-cpg.h     |   1 +
 5 files changed, 167 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/renesas/r9a08g046-cpg.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 6a5a04664990..0203ecbb3882 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -39,6 +39,7 @@ config CLK_RENESAS
 	select CLK_R9A07G044 if ARCH_R9A07G044
 	select CLK_R9A07G054 if ARCH_R9A07G054
 	select CLK_R9A08G045 if ARCH_R9A08G045
+	select CLK_R9A08G046 if ARCH_R9A08G046
 	select CLK_R9A09G011 if ARCH_R9A09G011
 	select CLK_R9A09G047 if ARCH_R9A09G047
 	select CLK_R9A09G056 if ARCH_R9A09G056
@@ -194,6 +195,10 @@ config CLK_R9A08G045
 	bool "RZ/G3S clock support" if COMPILE_TEST
 	select CLK_RZG2L
 
+config CLK_R9A08G046
+	bool "RZ/G3L clock support" if COMPILE_TEST
+	select CLK_RZG2L
+
 config CLK_R9A09G011
 	bool "RZ/V2M clock support" if COMPILE_TEST
 	select CLK_RZG2L
@@ -250,7 +255,7 @@ config CLK_RCAR_USB2_CLOCK_SEL
 	  This is a driver for R-Car USB2 clock selector
 
 config CLK_RZG2L
-	bool "RZ/{G2L,G2UL,G3S,V2L} family clock support" if COMPILE_TEST
+	bool "RZ/{G2{L,UL},G3{S,L},V2L} family clock support" if COMPILE_TEST
 	select RESET_CONTROLLER
 
 config CLK_RZV2H
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index d28eb276a153..bd2bed91ab29 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_CLK_R9A07G043)		+= r9a07g043-cpg.o
 obj-$(CONFIG_CLK_R9A07G044)		+= r9a07g044-cpg.o
 obj-$(CONFIG_CLK_R9A07G054)		+= r9a07g044-cpg.o
 obj-$(CONFIG_CLK_R9A08G045)		+= r9a08g045-cpg.o
+obj-$(CONFIG_CLK_R9A08G046)		+= r9a08g046-cpg.o
 obj-$(CONFIG_CLK_R9A09G011)		+= r9a09g011-cpg.o
 obj-$(CONFIG_CLK_R9A09G047)		+= r9a09g047-cpg.o
 obj-$(CONFIG_CLK_R9A09G056)		+= r9a09g056-cpg.o
diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
new file mode 100644
index 000000000000..38a5204ab904
--- /dev/null
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RZ/G3L CPG driver
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+
+#include <dt-bindings/clock/r9a08g046-cpg.h>
+
+#include "rzg2l-cpg.h"
+
+/* RZ/G3L Specific registers. */
+#define G3L_CPG_PL2_DDIV		(0x204)
+#define G3L_CPG_PL3_DDIV		(0x208)
+#define G3L_CLKDIVSTATUS		(0x280)
+
+/* RZ/G3L Specific division configuration.  */
+#define G3L_DIVPL2A		DDIV_PACK(G3L_CPG_PL2_DDIV, 0, 2)
+#define G3L_DIVPL2B		DDIV_PACK(G3L_CPG_PL2_DDIV, 4, 2)
+#define G3L_DIVPL3A		DDIV_PACK(G3L_CPG_PL3_DDIV, 0, 2)
+
+/* RZ/G3L Clock status configuration. */
+#define G3L_DIVPL2A_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 4, 1)
+#define G3L_DIVPL2B_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 5, 1)
+#define G3L_DIVPL3A_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 8, 1)
+
+enum clk_ids {
+	/* Core Clock Outputs exported to DT */
+	LAST_DT_CORE_CLK = R9A08G046_USB_SCLK,
+
+	/* External Input Clocks */
+	CLK_EXTAL,
+	CLK_ETH0_TXC_TX_CLK_IN,
+	CLK_ETH0_RXC_RX_CLK_IN,
+	CLK_ETH1_TXC_TX_CLK_IN,
+	CLK_ETH1_RXC_RX_CLK_IN,
+
+	/* Internal Core Clocks */
+	CLK_PLL2,
+	CLK_PLL2_DIV2,
+	CLK_PLL3,
+	CLK_PLL3_DIV2,
+
+	/* Module Clocks */
+	MOD_CLK_BASE,
+};
+
+/* Divider tables */
+static const struct clk_div_table dtable_4_128[] = {
+	{ 0, 4 },
+	{ 1, 8 },
+	{ 2, 16 },
+	{ 3, 128 },
+	{ 0, 0 },
+};
+
+static const struct clk_div_table dtable_8_256[] = {
+	{ 0, 8 },
+	{ 1, 16 },
+	{ 2, 32 },
+	{ 3, 256 },
+	{ 0, 0 },
+};
+
+static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
+	/* External Clock Inputs */
+	DEF_INPUT("extal", CLK_EXTAL),
+	DEF_INPUT("eth0_txc_tx_clk", CLK_ETH0_TXC_TX_CLK_IN),
+	DEF_INPUT("eth0_rxc_rx_clk", CLK_ETH0_RXC_RX_CLK_IN),
+	DEF_INPUT("eth1_txc_tx_clk", CLK_ETH1_TXC_TX_CLK_IN),
+	DEF_INPUT("eth1_rxc_rx_clk", CLK_ETH1_RXC_RX_CLK_IN),
+
+	/* Internal Core Clocks */
+	DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 200, 3),
+	DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 200, 3),
+	DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
+	DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
+
+	/* Core output clk */
+	DEF_G3S_DIV("P0", R9A08G046_CLK_P0, CLK_PLL2_DIV2, G3L_DIVPL2B, G3L_DIVPL2B_STS,
+		    dtable_8_256, 0, 0, 0, NULL),
+	DEF_G3S_DIV("P1", R9A08G046_CLK_P1, CLK_PLL3_DIV2, G3L_DIVPL3A, G3L_DIVPL3A_STS,
+		    dtable_4_128, 0, 0, 0, NULL),
+	DEF_G3S_DIV("P3", R9A08G046_CLK_P3, CLK_PLL2_DIV2, G3L_DIVPL2A, G3L_DIVPL2A_STS,
+		    dtable_4_128, 0, 0, 0, NULL),
+};
+
+static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
+	DEF_MOD("gic_gicclk",		R9A08G046_GIC600_GICCLK, R9A08G046_CLK_P1, 0x514, 0,
+					MSTOP(BUS_PERI_COM, BIT(12))),
+	DEF_MOD("ia55_pclk",		R9A08G046_IA55_PCLK, R9A08G046_CLK_P0, 0x518, 0,
+					MSTOP(BUS_PERI_CPU, BIT(13))),
+	DEF_MOD("ia55_clk",		R9A08G046_IA55_CLK, R9A08G046_CLK_P1, 0x518, 1,
+					MSTOP(BUS_PERI_CPU, BIT(13))),
+	DEF_MOD("dmac_aclk",		R9A08G046_DMAC_ACLK, R9A08G046_CLK_P3, 0x52c, 0,
+					MSTOP(BUS_REG1, BIT(2))),
+	DEF_MOD("dmac_pclk",		R9A08G046_DMAC_PCLK, R9A08G046_CLK_P3, 0x52c, 1,
+					MSTOP(BUS_REG1, BIT(3))),
+	DEF_MOD("scif0_clk_pck",	R9A08G046_SCIF0_CLK_PCK, R9A08G046_CLK_P0, 0x584, 0,
+					MSTOP(BUS_MCPU2, BIT(1))),
+};
+
+static const struct rzg2l_reset r9a08g046_resets[] = {
+	DEF_RST(R9A08G046_GIC600_GICRESET_N, 0x814, 0),
+	DEF_RST(R9A08G046_GIC600_DBG_GICRESET_N, 0x814, 1),
+	DEF_RST(R9A08G046_IA55_RESETN, 0x818, 0),
+	DEF_RST(R9A08G046_DMAC_ARESETN, 0x82c, 0),
+	DEF_RST(R9A08G046_DMAC_RST_ASYNC, 0x82c, 1),
+	DEF_RST(R9A08G046_SCIF0_RST_SYSTEM_N, 0x884, 0),
+};
+
+static const unsigned int r9a08g046_crit_mod_clks[] __initconst = {
+	MOD_CLK_BASE + R9A08G046_GIC600_GICCLK,
+	MOD_CLK_BASE + R9A08G046_IA55_CLK,
+	MOD_CLK_BASE + R9A08G046_DMAC_ACLK,
+};
+
+static const unsigned int r9a08g046_critical_resets[] = {
+	R9A08G046_DMAC_ARESETN,
+	R9A08G046_DMAC_RST_ASYNC,
+};
+
+const struct rzg2l_cpg_info r9a08g046_cpg_info = {
+	/* Core Clocks */
+	.core_clks = r9a08g046_core_clks,
+	.num_core_clks = ARRAY_SIZE(r9a08g046_core_clks),
+	.last_dt_core_clk = LAST_DT_CORE_CLK,
+	.num_total_core_clks = MOD_CLK_BASE,
+
+	/* Critical Module Clocks */
+	.crit_mod_clks = r9a08g046_crit_mod_clks,
+	.num_crit_mod_clks = ARRAY_SIZE(r9a08g046_crit_mod_clks),
+
+	/* Module Clocks */
+	.mod_clks = r9a08g046_mod_clks,
+	.num_mod_clks = ARRAY_SIZE(r9a08g046_mod_clks),
+	.num_hw_mod_clks = R9A08G046_BSC_X_BCK_BSC + 1,
+
+	/* Resets */
+	.resets = r9a08g046_resets,
+	.num_resets = R9A08G046_BSC_X_PRESET_BSC + 1, /* Last reset ID + 1 */
+
+	/* Critical Resets */
+	.crit_resets = r9a08g046_critical_resets,
+	.num_crit_resets = ARRAY_SIZE(r9a08g046_critical_resets),
+
+	.has_clk_mon_regs = true,
+};
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index c2d31b93f62b..3baadb14567d 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -2167,6 +2167,12 @@ static const struct of_device_id rzg2l_cpg_match[] = {
 		.data = &r9a08g045_cpg_info,
 	},
 #endif
+#ifdef CONFIG_CLK_R9A08G046
+	{
+		.compatible = "renesas,r9a08g046-cpg",
+		.data = &r9a08g046_cpg_info,
+	},
+#endif
 #ifdef CONFIG_CLK_R9A09G011
 	{
 		.compatible = "renesas,r9a09g011-cpg",
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index af0a003d93f7..10baf9e71a6e 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -316,6 +316,7 @@ extern const struct rzg2l_cpg_info r9a07g043_cpg_info;
 extern const struct rzg2l_cpg_info r9a07g044_cpg_info;
 extern const struct rzg2l_cpg_info r9a07g054_cpg_info;
 extern const struct rzg2l_cpg_info r9a08g045_cpg_info;
+extern const struct rzg2l_cpg_info r9a08g046_cpg_info;
 extern const struct rzg2l_cpg_info r9a09g011_cpg_info;
 
 int rzg2l_cpg_sd_clk_mux_notifier(struct notifier_block *nb, unsigned long event, void *data);
-- 
2.43.0

