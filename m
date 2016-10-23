Return-Path: <robert.jarzmik@free.fr>
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH v2 0/5] Make pxa core clocks settable
Date: Sun, 23 Oct 2016 14:19:25 +0200
Message-Id: <1477225170-19019-1-git-send-email-robert.jarzmik@free.fr>
List-ID: <linux-clk.vger.kernel.org>

>From v1, this has been kept  :
 - a set of fixes, patches 1 to 4
 - a patch with transfers most of core clock handling from pxa2xx-cpufreq into
   clk-pxa*, ie. patch 5
   This is the main change, and is providing control over CPU clocks for both
   pxa25x and pxa27x through the clock API.

The patches have been tested on lubbock (pxa25x) and mainstone (pxa27x) boards,
with a cpu-burn and different scaling max frequencies.

It should be noticed that not _all_ possible cpll frequencies are implemented,
but only a subset of what was in pxa2xx-cpufreq. The enveloppe can be improved
later, especially when the "run" clock will become settable as well, but that's
another work which is not necessary today.

As for quicker review, the diff with the former submission in drivers/clk/pxa is in [1].

Cheers.

--
Robert

Robert Jarzmik (5):
  clk: pxa: remove unused variables
  clk: pxa: core pll is not affected by t bit
  clk: pxa: b bit of clkcfg means fast bus
  clk: pxa: export core clocks
  clk: pxa: transfer CPU clock setting from pxa2xx-cpufreq

 drivers/clk/pxa/clk-pxa.c    | 128 +++++++++++++++++++++++++++++++++
 drivers/clk/pxa/clk-pxa.h    |  56 ++++++++++++++-
 drivers/clk/pxa/clk-pxa25x.c | 114 ++++++++++++++++++++++++++---
 drivers/clk/pxa/clk-pxa27x.c | 168 ++++++++++++++++++++++++++++++++++---------
 4 files changed, 421 insertions(+), 45 deletions(-)

-- 
2.1.4

[1] Diff with former submission
diff --git a/drivers/clk/pxa/clk-pxa.c b/drivers/clk/pxa/clk-pxa.c
index 5c59ca9074c0..7184819b7415 100644
--- a/drivers/clk/pxa/clk-pxa.c
+++ b/drivers/clk/pxa/clk-pxa.c
@@ -200,11 +200,11 @@ void pxa2xx_cpll_change(struct pxa2xx_freq *freq,
 int pxa2xx_determine_rate(struct clk_rate_request *req,
 			  struct pxa2xx_freq *freqs, int nb_freqs)
 {
-	int i, closest_below = -1, closest_above = -1;
+	int i, closest_below = -1, closest_above = -1, ret = 0;
 	unsigned long rate;
 
 	for (i = 0; i < nb_freqs; i++) {
-		rate = freqs[i].cpll_khz * KHz;
+		rate = freqs[i].cpll;
 		if (rate == req->rate)
 			break;
 		if (rate < req->min_rate)
@@ -220,17 +220,17 @@ int pxa2xx_determine_rate(struct clk_rate_request *req,
 	req->best_parent_hw = NULL;
 
 	if (i < nb_freqs)
-		return 0;
-
-	if (closest_below >= 0) {
-		req->rate = freqs[closest_below].cpll_khz * KHz;
-		return 0;
-	}
+		ret = 0;
+	else if (closest_below >= 0)
+		rate = freqs[closest_below].cpll;
+	else if (closest_above >= 0)
+		rate = freqs[closest_above].cpll;
+	else
+		ret = -EINVAL;
 
-	if (closest_above >= 0) {
-		req->rate = freqs[closest_above].cpll_khz * KHz;
-		return 0;
-	}
+	pr_debug("%s(rate=%lu) rate=%lu: %d\n", __func__, req->rate, rate, ret);
+	if (!rate)
+		req->rate = rate;
 
-	return -EINVAL;
+	return ret;
 }
diff --git a/drivers/clk/pxa/clk-pxa.h b/drivers/clk/pxa/clk-pxa.h
index 068092605955..417cae77f6bc 100644
--- a/drivers/clk/pxa/clk-pxa.h
+++ b/drivers/clk/pxa/clk-pxa.h
@@ -136,7 +136,7 @@ struct desc_clk_cken {
 		 NULL, cken_reg, cken_bit, flag)
 
 struct pxa2xx_freq {
-	unsigned int cpll_khz;
+	unsigned long cpll;
 	unsigned int membus_khz;
 	unsigned int cccr;
 	unsigned int div2;
diff --git a/drivers/clk/pxa/clk-pxa25x.c b/drivers/clk/pxa/clk-pxa25x.c
index 22f89d2f35cc..20fd87b36560 100644
--- a/drivers/clk/pxa/clk-pxa25x.c
+++ b/drivers/clk/pxa/clk-pxa25x.c
@@ -179,13 +179,19 @@ static struct desc_clk_cken pxa25x_clocks[] __initdata = {
 			     clk_pxa25x_memory_parents, 0),
 };
 
+/*
+ * In this table, PXA25x_CCCR(N2, M, L) has the following meaning, where :
+ *   - freq_cpll = n * m * L * 3.6864 MHz
+ *   - n = N2 / 2
+ *   - m = 2^(M - 1), where 1 <= M <= 3
+ *   - l = L_clk_mult[L], ie. { 0, 27, 32, 36, 40, 45, 0, }[L]
+ */
 static struct pxa2xx_freq pxa25x_freqs[] = {
 	/* CPU  MEMBUS  CCCR                  DIV2 CCLKCFG      */
-	{ 99500, 99500, PXA25x_CCCR(2,  1, 1),  1, PXA25x_CLKCFG(1)},
-	{199100, 99500, PXA25x_CCCR(4,  1, 1),  0, PXA25x_CLKCFG(1)},
-	{298500, 99500, PXA25x_CCCR(6,  1, 1),  0, PXA25x_CLKCFG(1)},
-	{298600, 99500, PXA25x_CCCR(2,  1, 16), 0, PXA25x_CLKCFG(1)},
-	{398100, 99500, PXA25x_CCCR(4,  2, 1),  0, PXA25x_CLKCFG(1)},
+	{ 99532800, 99500, PXA25x_CCCR(2,  1, 1),  1, PXA25x_CLKCFG(1)},
+	{199065600, 99500, PXA25x_CCCR(4,  1, 1),  0, PXA25x_CLKCFG(1)},
+	{298598400, 99500, PXA25x_CCCR(3,  2, 1),  0, PXA25x_CLKCFG(1)},
+	{398131200, 99500, PXA25x_CCCR(4,  2, 1),  0, PXA25x_CLKCFG(1)},
 };
 
 static u8 clk_pxa25x_core_get_parent(struct clk_hw *hw)
@@ -257,8 +263,9 @@ static int clk_pxa25x_cpll_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	int i;
 
+	pr_debug("%s(rate=%lu parent_rate=%lu)\n", __func__, rate, parent_rate);
 	for (i = 0; i < ARRAY_SIZE(pxa25x_freqs); i++)
-		if (pxa25x_freqs[i].cpll_khz * KHz == rate)
+		if (pxa25x_freqs[i].cpll == rate)
 			break;
 
 	if (i >= ARRAY_SIZE(pxa25x_freqs))
diff --git a/drivers/clk/pxa/clk-pxa27x.c b/drivers/clk/pxa/clk-pxa27x.c
index 2bf450bbdc5a..ec5abe98e177 100644
--- a/drivers/clk/pxa/clk-pxa27x.c
+++ b/drivers/clk/pxa/clk-pxa27x.c
@@ -215,13 +215,13 @@ static struct desc_clk_cken pxa27x_clocks[] __initdata = {
  * change sequences.
  */
 static struct pxa2xx_freq pxa27x_freqs[] = {
-	{104000, 104000, PXA27x_CCCR(1,  8, 2), 0, PXA27x_CLKCFG(1, 0, 1) },
-	{156000, 104000, PXA27x_CCCR(1,  8, 3), 0, PXA27x_CLKCFG(1, 0, 1) },
-	{208000, 208000, PXA27x_CCCR(0, 16, 2), 1, PXA27x_CLKCFG(0, 0, 1) },
-	{312000, 208000, PXA27x_CCCR(1, 16, 3), 1, PXA27x_CLKCFG(1, 0, 1) },
-	{416000, 208000, PXA27x_CCCR(1, 16, 4), 1, PXA27x_CLKCFG(1, 0, 1) },
-	{520000, 208000, PXA27x_CCCR(1, 16, 5), 1, PXA27x_CLKCFG(1, 0, 1) },
-	{624000, 208000, PXA27x_CCCR(1, 16, 6), 1, PXA27x_CLKCFG(1, 0, 1) },
+	{104000000, 104000, PXA27x_CCCR(1,  8, 2), 0, PXA27x_CLKCFG(1, 0, 1) },
+	{156000000, 104000, PXA27x_CCCR(1,  8, 3), 0, PXA27x_CLKCFG(1, 0, 1) },
+	{208000000, 208000, PXA27x_CCCR(0, 16, 2), 1, PXA27x_CLKCFG(0, 0, 1) },
+	{312000000, 208000, PXA27x_CCCR(1, 16, 3), 1, PXA27x_CLKCFG(1, 0, 1) },
+	{416000000, 208000, PXA27x_CCCR(1, 16, 4), 1, PXA27x_CLKCFG(1, 0, 1) },
+	{520000000, 208000, PXA27x_CCCR(1, 16, 5), 1, PXA27x_CLKCFG(1, 0, 1) },
+	{624000000, 208000, PXA27x_CCCR(1, 16, 6), 1, PXA27x_CLKCFG(1, 0, 1) },
 };
 
 static unsigned long clk_pxa27x_cpll_get_rate(struct clk_hw *hw,
@@ -244,7 +244,6 @@ static unsigned long clk_pxa27x_cpll_get_rate(struct clk_hw *hw,
 	return N;
 }
 
-
 static int clk_pxa27x_cpll_determine_rate(struct clk_hw *hw,
 					  struct clk_rate_request *req)
 {
@@ -257,8 +256,9 @@ static int clk_pxa27x_cpll_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	int i;
 
+	pr_debug("%s(rate=%lu parent_rate=%lu)\n", __func__, rate, parent_rate);
 	for (i = 0; i < ARRAY_SIZE(pxa27x_freqs); i++)
-		if (pxa27x_freqs[i].cpll_khz * KHz == rate)
+		if (pxa27x_freqs[i].cpll == rate)
 			break;
 
 	if (i >= ARRAY_SIZE(pxa27x_freqs))
