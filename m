Return-Path: <phil@raspberrypi.org>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, Eric Anholt <eric@anholt.net>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From: Phil Elwell <phil@raspberrypi.org>
Subject: [PATCH 2/2] clk: bcm2835: Minimise clock jitter for PCM clock
Message-ID: <b9208d9b-c7bb-49a3-85d9-231c8b41eb8c@raspberrypi.org>
Date: Tue, 30 May 2017 17:28:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Fractional clock dividers generate accurate average frequencies but
with jitter, particularly when the integer divisor is small.

Introduce a new metric of clock accuracy to penalise clocks with a good
average but worse jitter compared to clocks with an average which is no
better but with lower jitter. The metric is the ideal rate minus the
worse deviation from that ideal using the nearest integer divisors.

Use this metric for parent selection for clocks requiring low jitter
(currently just PCM).

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
---
 drivers/clk/bcm/clk-bcm2835.c | 39 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index facc346..e0ce5e7 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -530,6 +530,7 @@ struct bcm2835_clock_data {
 
 	bool is_vpu_clock;
 	bool is_mash_clock;
+	bool low_jitter;
 
 	u32 tcnt_mux;
 };
@@ -1124,7 +1125,8 @@ static unsigned long bcm2835_clock_choose_div_and_prate(struct clk_hw *hw,
 							int parent_idx,
 							unsigned long rate,
 							u32 *div,
-							unsigned long *prate)
+							unsigned long *prate,
+							unsigned long *avgrate)
 {
 	struct bcm2835_clock *clock = bcm2835_clock_from_hw(hw);
 	struct bcm2835_cprman *cprman = clock->cprman;
@@ -1136,11 +1138,33 @@ static unsigned long bcm2835_clock_choose_div_and_prate(struct clk_hw *hw,
 	parent = clk_hw_get_parent_by_index(hw, parent_idx);
 
 	if (!(BIT(parent_idx) & data->set_rate_parent)) {
+		unsigned long tmp_rate;
+
 		*prate = clk_hw_get_rate(parent);
 		*div = bcm2835_clock_choose_div(hw, rate, *prate, true);
 
-		return bcm2835_clock_rate_from_divisor(clock, *prate,
-						       *div);
+		tmp_rate = bcm2835_clock_rate_from_divisor(clock, *prate, *div);
+		*avgrate = tmp_rate;
+
+		if (data->low_jitter && (*div & CM_DIV_FRAC_MASK)) {
+			unsigned long high, low;
+			u32 idiv = *div & ~CM_DIV_FRAC_MASK;
+
+			high = bcm2835_clock_rate_from_divisor(clock, *prate,
+							       idiv);
+			idiv += CM_DIV_FRAC_MASK + 1;
+			low = bcm2835_clock_rate_from_divisor(clock, *prate,
+							      idiv);
+
+			/* Return a value which is the maximum deviation
+			 * below the ideal rate, for use as a metric.
+			 */
+			if ((tmp_rate - low) < (high - tmp_rate))
+				tmp_rate = low;
+			else
+				tmp_rate -= high - tmp_rate;
+		}
+		return tmp_rate;
 	}
 
 	if (data->frac_bits)
@@ -1167,6 +1191,7 @@ static unsigned long bcm2835_clock_choose_div_and_prate(struct clk_hw *hw,
 
 	*div = curdiv << CM_DIV_FRAC_BITS;
 	*prate = curdiv * best_rate;
+	*avgrate = best_rate;
 
 	return best_rate;
 }
@@ -1178,6 +1203,7 @@ static int bcm2835_clock_determine_rate(struct clk_hw *hw,
 	bool current_parent_is_pllc;
 	unsigned long rate, best_rate = 0;
 	unsigned long prate, best_prate = 0;
+	unsigned long avgrate, best_avgrate = 0;
 	size_t i;
 	u32 div;
 
@@ -1202,11 +1228,13 @@ static int bcm2835_clock_determine_rate(struct clk_hw *hw,
 			continue;
 
 		rate = bcm2835_clock_choose_div_and_prate(hw, i, req->rate,
-							  &div, &prate);
+							  &div, &prate,
+							  &avgrate);
 		if (rate > best_rate && rate <= req->rate) {
 			best_parent = parent;
 			best_prate = prate;
 			best_rate = rate;
+			best_avgrate = avgrate;
 		}
 	}
 
@@ -1216,7 +1244,7 @@ static int bcm2835_clock_determine_rate(struct clk_hw *hw,
 	req->best_parent_hw = best_parent;
 	req->best_parent_rate = best_prate;
 
-	req->rate = best_rate;
+	req->rate = best_avgrate;
 
 	return 0;
 }
@@ -2010,6 +2038,7 @@ struct bcm2835_clk_desc {
 		.int_bits = 12,
 		.frac_bits = 12,
 		.is_mash_clock = true,
+		.low_jitter = true,
 		.parents = bcm2835_pcm_per_parents,
 		.tcnt_mux = 23),
 	[BCM2835_CLOCK_PWM]	= REGISTER_PER_CLK(
-- 
1.9.1
