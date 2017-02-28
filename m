Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] clk: meson8b: put dividers and muxes in tables
Date: Tue, 28 Feb 2017 14:29:56 +0100
Message-Id: <20170228133002.17894-2-jbrunet@baylibre.com>
In-Reply-To: <20170228133002.17894-1-jbrunet@baylibre.com>
References: <20170228133002.17894-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Until now, there was only 1 divider and 1 mux declared for the meson8b
platform. With the ongoing work on various system, including audio, this
is about to change. Use the same approach as gates for dividers and muxes,
putting them in tables to fix the register address at runtime.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/meson8b.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 888494d4fb8a..44c24bf754cd 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -582,6 +582,15 @@ static struct clk_gate *meson8b_clk_gates[] = {
 	&meson8b_ao_iface,
 };
 
+static struct clk_mux *meson8b_clk_muxes[] = {
+	&meson8b_mpeg_clk_sel,
+};
+
+static struct clk_divider *meson8b_clk_dividers[] = {
+	&meson8b_mpeg_clk_div,
+};
+
+
 static int meson8b_clkc_probe(struct platform_device *pdev)
 {
 	void __iomem *clk_base;
@@ -604,15 +613,21 @@ static int meson8b_clkc_probe(struct platform_device *pdev)
 	/* Populate the base address for CPU clk */
 	meson8b_cpu_clk.base = clk_base;
 
-	/* Populate the base address for the MPEG clks */
-	meson8b_mpeg_clk_sel.reg = clk_base + (u32)meson8b_mpeg_clk_sel.reg;
-	meson8b_mpeg_clk_div.reg = clk_base + (u32)meson8b_mpeg_clk_div.reg;
-
 	/* Populate base address for gates */
 	for (i = 0; i < ARRAY_SIZE(meson8b_clk_gates); i++)
 		meson8b_clk_gates[i]->reg = clk_base +
 			(u32)meson8b_clk_gates[i]->reg;
 
+	/* Populate base address for muxes */
+	for (i = 0; i < ARRAY_SIZE(meson8b_clk_muxes); i++)
+		meson8b_clk_muxes[i]->reg = clk_base +
+			(u32)meson8b_clk_muxes[i]->reg;
+
+	/* Populate base address for dividers */
+	for (i = 0; i < ARRAY_SIZE(meson8b_clk_dividers); i++)
+		meson8b_clk_dividers[i]->reg = clk_base +
+			(u32)meson8b_clk_dividers[i]->reg;
+
 	/*
 	 * register all clks
 	 * CLKID_UNUSED = 0, so skip it and start with CLKID_XTAL = 1
-- 
2.9.3
