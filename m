Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] clk: meson: check pll rate param table before using it
Date: Thu, 18 Jan 2018 19:45:24 +0100
Message-Id: <20180118184532.6856-2-jbrunet@baylibre.com>
In-Reply-To: <20180118184532.6856-1-jbrunet@baylibre.com>
References: <20180118184532.6856-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Make sure the rate param table is available before using it.
Some read-only pll don't provide it, which is ok because the
table is not used by read-only clock. R/W clock are supposed
to provide it, but it does not hurt check it.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/clk-pll.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 01341553f50b..2614341fc4ad 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -94,6 +94,13 @@ static long meson_clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	const struct pll_rate_table *rate_table = pll->rate_table;
 	int i;
 
+	/*
+	 * if the table is missing, just return the current rate
+	 * since we don't have the other available frequencies
+	 */
+	if (!rate_table)
+		return meson_clk_pll_recalc_rate(hw, *parent_rate);
+
 	for (i = 0; i < pll->rate_count; i++) {
 		if (rate <= rate_table[i].rate)
 			return rate_table[i].rate;
@@ -109,6 +116,9 @@ static const struct pll_rate_table *meson_clk_get_pll_settings(struct meson_clk_
 	const struct pll_rate_table *rate_table = pll->rate_table;
 	int i;
 
+	if (!rate_table)
+		return NULL;
+
 	for (i = 0; i < pll->rate_count; i++) {
 		if (rate == rate_table[i].rate)
 			return &rate_table[i];
-- 
2.14.3
