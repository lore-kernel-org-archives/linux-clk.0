Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Quentin Schulz <quentin.schulz@free-electrons.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v5 08/10] clk: fix CLK_SET_RATE_GATE with clock rate protection
Date: Fri,  1 Dec 2017 22:51:58 +0100
Message-Id: <20171201215200.23523-9-jbrunet@baylibre.com>
In-Reply-To: <20171201215200.23523-1-jbrunet@baylibre.com>
References: <20171201215200.23523-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Using clock rate protection, we can now enforce CLK_SET_RATE_GATE along the
clock tree

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: Quentin Schulz <quentin.schulz@free-electrons.com>
Tested-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Acked-by: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f6fe5e5595ca..1af843ae20ff 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -605,6 +605,9 @@ static void clk_core_unprepare(struct clk_core *core)
 	if (WARN_ON(core->prepare_count == 1 && core->flags & CLK_IS_CRITICAL))
 		return;
 
+	if (core->flags & CLK_SET_RATE_GATE)
+		clk_core_rate_unprotect(core);
+
 	if (--core->prepare_count > 0)
 		return;
 
@@ -679,6 +682,16 @@ static int clk_core_prepare(struct clk_core *core)
 
 	core->prepare_count++;
 
+	/*
+	 * CLK_SET_RATE_GATE is a special case of clock protection
+	 * Instead of a consumer claiming exclusive rate control, it is
+	 * actually the provider which prevents any consumer from making any
+	 * operation which could result in a rate change or rate glitch while
+	 * the clock is prepared.
+	 */
+	if (core->flags & CLK_SET_RATE_GATE)
+		clk_core_rate_protect(core);
+
 	return 0;
 unprepare:
 	clk_core_unprepare(core->parent);
@@ -1780,9 +1793,6 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 	if (clk_core_rate_is_protected(core))
 		return -EBUSY;
 
-	if ((core->flags & CLK_SET_RATE_GATE) && core->prepare_count)
-		return -EBUSY;
-
 	/* calculate new rates and get the topmost changed clock */
 	top = clk_calc_new_rates(core, req_rate);
 	if (!top)
-- 
2.14.3
