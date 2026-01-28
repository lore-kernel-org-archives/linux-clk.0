Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31B32DD60E
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 11:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599846; cv=none; b=ui8EX6iR7t6+w9zGvPP3fB8fgg1JZMr/Y6OR9dzosMMZx0CK2ep0ibCqFKqg3P+mDGrBpFYyiBfVLuCNQUWz/xIuFaga3Nroq3o8cXzzFAvXVyqdnlZzFWNLY+/dnkSBiOPpLFvA48h1zrLxLZl2fc1fDVQ20Ki+5rgmLK9q/5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599846; c=relaxed/simple;
	bh=EhFceClCoLd1w8Nd2CY7TuXcYmIBrgMY0vNax6b2XIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FDz399p0NtI20i8D1PvCxUUJ6kS1vVzZ+4IfBg2yiAMJLmYWlPUK/xNgxLDnot9NBVIcVyrwb2uc7V8Iz+Vra/KtSRbi17EmGbVyA9Bd4j3pwsiT2daA+3VSau7tfjsrWvLXsEmSvHsQx9OznB5+Hcqm7XWX8F1pVgjHC0NFcoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OlQo3l8N; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OlQo3l8N"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b883787268fso1050507166b.3
        for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 03:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769599841; x=1770204641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4O6c6kFXAwovFddKurwv5bo+RrAEqJ8mAERUAXrzWgw=;
        b=OlQo3l8NmorPTWRubBgRydAhEtjJ3/CWkYkqoqQakK6+BllZUcuvNdVaJSwMhSXd8P
         dhz/HSc+7RihGhIWsdFnKmgLJzPNc9xbJrfQJPGeZLGkdMau6YK0G/+xr+tit5uj/KKm
         E0WYARM9fwGAMkEVc+vqQNvFOsHRJJ9VuHq86HFAbVblZOptWlbAMqn0FAvAqhMOyLwM
         LMIq20/rxKJtJdVzdfMeZ2TeIv2zgbDitCxVuAaxK9DuGF97SvwvVwEbuELoqdXSBch/
         WzEjYuUDmISaxvbircSyfew2DV4Qo7FjYeR5nv/y3ELksxRBpmypXCx9scFHx1ybAPck
         uVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599841; x=1770204641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4O6c6kFXAwovFddKurwv5bo+RrAEqJ8mAERUAXrzWgw=;
        b=NEDSuWlDfjojDCNxxzLPLY56N72f60WqtzF66PnLrTHJ3xwUtBSvtnCZLb6Kq2yzYC
         KkH5MSsN/Pf0/D4EH0+gSqfZcdaDHb6rXBJBlnnRvBAdGkZ+yeQ0cNRq8fZIc7ED8n4K
         fCUUXPJXTd7yBxAuhhSD3LuSpkzXW/4NNFUIy930B2pYHWbChjk8yGCBlfZkppUl63Df
         BztK+HZ9T5NuHbAJALyl/w4/7GM0kM7VGiK022y8Od/UnTUCXB8iABD6yY7x9Yh2J30C
         Sit+/G8oZf3+f3eTL88v/OaxBUPOx4g14dei03jNHjiBJ/cZASOcDuTxTbPue35CR0bk
         XRsA==
X-Forwarded-Encrypted: i=1; AJvYcCXou3NRwzJ6fEOEmN6jAGG8OZCGJOoRMXnfz4mpLDYtyfszcNFU8qduSZDHlExR4XVCCqSdw8/a7Ko=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpsztStj5B+CxxVc5X5EvwofrJPhnaJncMIVqcElILoU57iNTT
	6LN9vvM7YZoVXwNdahDzkzc6WS4a1I4BNj/1LRXDbnPu+Rj0aghWBaYt
X-Gm-Gg: AZuq6aIxgL4QJwhvjX9CvosC9yeBTedkEYQQv78MSQRk8SGg+nCH3Rh9vm+GkQAcHpO
	cmzBIxYQpilWeAR58470UJhQXjzrjydsNotklFmbhuyO6OMnIewNmg9lwjn6XYAFWyfepzPnAC6
	Woh0MsUgstODIt2EGSRIvtBSL6eq6pFrXym42swYqmbWwAkd8hldoa+kvJe42Y+5aWsjUxZqcSB
	EWeil2DYK2Xca4ldaFI6EyDj5BaW9gS/Wd2lvjhJ5goVx8OCTbyvOk7AwNmVyzJ3OemlEBKX+l9
	4wThuHLZgKCbyHV7bKQQQdjAOVuCIKCGnIY1mtGE35dWDX/53VPeFimzc7Hrnkt1YMXghwo4WTk
	bYG5zhvmxsJj5ZtQ5WlkHA/eZbkC/2tlMQcqgnSXeHvcQ0mZCbGhZi3gWH+rTc9BbPrGzQhn5YH
	Lz3Q3cWSB1dlhpBDycCnMHxK12aWPcmGrbrQA=
X-Received: by 2002:a17:907:2d26:b0:b87:7042:9aea with SMTP id a640c23a62f3a-b8dab1b52d7mr360295366b.18.1769599840785;
        Wed, 28 Jan 2026 03:30:40 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e29d:6e0e:72c1:d15d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1baa42sm114400366b.46.2026.01.28.03.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:30:40 -0800 (PST)
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
Subject: [PATCH v2 06/10] clk: renesas: Add support for RZ/G3L SoC
Date: Wed, 28 Jan 2026 11:30:25 +0000
Message-ID: <20260128113032.337231-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128113032.337231-1-biju.das.jz@bp.renesas.com>
References: <20260128113032.337231-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The clock structure for RZ/G3L is almost identical to RZ/G3S SoC with more
IP blocks such as LCDC, CRU, LVDS and GPU.

Add minimal clock and reset entries required to boot the system on Renesas
RZ/G3L SMARC EVK and binds it with the RZ/G2L CPG core driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Added CLK_ETH{0,1}_TXC_TX_CLK_IN and CLK_ETH{0,1}_RXC_RX_CLK_IN clocks.
 * Dropped R9A08G046_IA55_PCLK from critical clock list.
---
 drivers/clk/renesas/Kconfig         |   7 +-
 drivers/clk/renesas/Makefile        |   1 +
 drivers/clk/renesas/r9a08g046-cpg.c | 144 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.c     |   6 ++
 drivers/clk/renesas/rzg2l-cpg.h     |   1 +
 5 files changed, 158 insertions(+), 1 deletion(-)
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
index 000000000000..d77934872cf4
--- /dev/null
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -0,0 +1,144 @@
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
+	LAST_DT_CORE_CLK = R9A08G046_CLK_P4_DIV2,
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
+	{ 1, 2 },
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
+	.num_resets = R9A08G046_LVDS_RESET_N + 1, /* Last reset ID + 1 */
+
+	.has_clk_mon_regs = true,
+};
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index c0584bab58a3..f4deb5d3b837 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -2093,6 +2093,12 @@ static const struct of_device_id rzg2l_cpg_match[] = {
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
index 55e815be16c8..1db413bb433d 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -309,6 +309,7 @@ extern const struct rzg2l_cpg_info r9a07g043_cpg_info;
 extern const struct rzg2l_cpg_info r9a07g044_cpg_info;
 extern const struct rzg2l_cpg_info r9a07g054_cpg_info;
 extern const struct rzg2l_cpg_info r9a08g045_cpg_info;
+extern const struct rzg2l_cpg_info r9a08g046_cpg_info;
 extern const struct rzg2l_cpg_info r9a09g011_cpg_info;
 
 int rzg2l_cpg_sd_clk_mux_notifier(struct notifier_block *nb, unsigned long event, void *data);
-- 
2.43.0

