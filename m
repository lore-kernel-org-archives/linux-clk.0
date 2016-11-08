Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] clk: pxa: fix pxa2xx_determine_rate return
Date: Tue,  8 Nov 2016 15:49:31 +0100
Message-Id: <20161108144950.3472058-2-arnd@arndb.de>
In-Reply-To: <20161108144950.3472058-1-arnd@arndb.de>
References: <20161108144950.3472058-1-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>

The new pxa2xx_determine_rate() function seems lacking in a few
regards:

- For an exact match or no match at all, the rate is uninitialized
  as reported by gcc -Wmaybe-unintialized:
   drivers/clk/pxa/clk-pxa.c: In function 'pxa2xx_determine_rate':
   drivers/clk/pxa/clk-pxa.c:243:5: error: 'rate' may be used uninitialized in this function

- If we get a non-exact match, the req->rate output is never set
  to the actual rate but remains at the requested rate.

- We should not attempt to print a rate if none could be found

This rewrites the logic accordingly.

Fixes: 9fe694295098 ("clk: pxa: transfer CPU clock setting from pxa2xx-cpufreq")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/pxa/clk-pxa.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/pxa/clk-pxa.c b/drivers/clk/pxa/clk-pxa.c
index 50fb9d0ea58d..c423b064c753 100644
--- a/drivers/clk/pxa/clk-pxa.c
+++ b/drivers/clk/pxa/clk-pxa.c
@@ -211,7 +211,7 @@ void pxa2xx_cpll_change(struct pxa2xx_freq *freq,
 int pxa2xx_determine_rate(struct clk_rate_request *req,
 			  struct pxa2xx_freq *freqs, int nb_freqs)
 {
-	int i, closest_below = -1, closest_above = -1, ret = 0;
+	int i, closest_below = -1, closest_above = -1;
 	unsigned long rate;
 
 	for (i = 0; i < nb_freqs; i++) {
@@ -230,18 +230,19 @@ int pxa2xx_determine_rate(struct clk_rate_request *req,
 
 	req->best_parent_hw = NULL;
 
-	if (i < nb_freqs)
-		ret = 0;
-	else if (closest_below >= 0)
+	if (i < nb_freqs) {
+		rate = req->rate;
+	} else if (closest_below >= 0) {
 		rate = freqs[closest_below].cpll;
-	else if (closest_above >= 0)
+	} else if (closest_above >= 0) {
 		rate = freqs[closest_above].cpll;
-	else
-		ret = -EINVAL;
+	} else {
+		pr_debug("%s(rate=%lu) no match\n", __func__, req->rate);
+		return -EINVAL;
+	}
 
-	pr_debug("%s(rate=%lu) rate=%lu: %d\n", __func__, req->rate, rate, ret);
-	if (!rate)
-		req->rate = rate;
+	pr_debug("%s(rate=%lu) rate=%lu\n", __func__, req->rate, rate);
+	req->rate = rate;
 
-	return ret;
+	return 0;
 }
-- 
2.9.0
