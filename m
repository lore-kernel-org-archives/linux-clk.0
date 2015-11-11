Return-Path: <repk@triplefau.lt>
From: Remi Pommarel <repk@triplefau.lt>
To: Stephen Warren <swarren@wwwdotorg.org>,
	Lee Jones <lee@kernel.org>,
	Eric Anholt <eric@anholt.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Remi Pommarel <repk@triplefau.lt>
Subject: [PATCH v2 2/3] clk: bcm2835: Support for clock parent selection
Date: Wed, 11 Nov 2015 15:22:44 +0100
Message-Id: <1447251765-16297-3-git-send-email-repk@triplefau.lt>
In-Reply-To: <1447251765-16297-1-git-send-email-repk@triplefau.lt>
References: <1447251765-16297-1-git-send-email-repk@triplefau.lt>
List-ID: <linux-clk.vger.kernel.org>

Some bcm2835 clocks used by hardware (like "PWM" or "H264") can have multiple
parent clocks. These clocks divide the rate of a parent which can be selected by
setting the proper bits in the clock control register.

Previously all these parents where handled by a mux clock. But a mux clock
cannot be used because updating clock control register to select parent needs a
password to be xor'd with the parent index.

This patch get rid of mux clock and make these clocks handle their own parent,
allowing them to select the one to use.

Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 drivers/clk/bcm/clk-bcm2835.c | 122 ++++++++++++++++++++++++++----------------
 1 file changed, 77 insertions(+), 45 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 1237716..2b01a53 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -1198,16 +1198,6 @@ static long bcm2835_clock_rate_from_divisor(struct bcm2835_clock *clock,
 	return temp;
 }
 
-static long bcm2835_clock_round_rate(struct clk_hw *hw,
-				     unsigned long rate,
-				     unsigned long *parent_rate)
-{
-	struct bcm2835_clock *clock = bcm2835_clock_from_hw(hw);
-	u32 div = bcm2835_clock_choose_div(hw, rate, *parent_rate);
-
-	return bcm2835_clock_rate_from_divisor(clock, *parent_rate, div);
-}
-
 static unsigned long bcm2835_clock_get_rate(struct clk_hw *hw,
 					    unsigned long parent_rate)
 {
@@ -1279,13 +1269,75 @@ static int bcm2835_clock_set_rate(struct clk_hw *hw,
 	return 0;
 }
 
+static int bcm2835_clock_determine_rate(struct clk_hw *hw,
+		struct clk_rate_request *req)
+{
+	struct bcm2835_clock *clock = bcm2835_clock_from_hw(hw);
+	struct clk_hw *parent, *best_parent = NULL;
+	struct clk_rate_request parent_req;
+	unsigned long rate, best_rate = 0;
+	unsigned long prate, best_prate = 0;
+	size_t i;
+	u32 div;
+
+	/*
+	 * Select parent clock that results in the closest but lower rate
+	 */
+	for (i = 0; i < clk_hw_get_num_parents(hw); ++i) {
+		parent = clk_hw_get_parent_by_index(hw, i);
+		if (!parent)
+			continue;
+		parent_req = *req;
+		prate = clk_hw_get_rate(parent);
+		div = bcm2835_clock_choose_div(hw, req->rate, prate);
+		rate = bcm2835_clock_rate_from_divisor(clock, prate, div);
+		if (rate > best_rate && rate <= req->rate) {
+			best_parent = parent;
+			best_prate = prate;
+			best_rate = rate;
+		}
+	}
+
+	if (!best_parent)
+		return -EINVAL;
+
+	req->best_parent_hw = best_parent;
+	req->best_parent_rate = best_prate;
+
+	return 0;
+}
+
+static int bcm2835_clock_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct bcm2835_clock *clock = bcm2835_clock_from_hw(hw);
+	struct bcm2835_cprman *cprman = clock->cprman;
+	const struct bcm2835_clock_data *data = clock->data;
+	u8 src = (index << CM_SRC_SHIFT) & CM_SRC_MASK;
+
+	cprman_write(cprman, data->ctl_reg, src);
+	return 0;
+}
+
+static u8 bcm2835_clock_get_parent(struct clk_hw *hw)
+{
+	struct bcm2835_clock *clock = bcm2835_clock_from_hw(hw);
+	struct bcm2835_cprman *cprman = clock->cprman;
+	const struct bcm2835_clock_data *data = clock->data;
+	u32 src = cprman_read(cprman, data->ctl_reg);
+
+	return (src & CM_SRC_MASK) >> CM_SRC_SHIFT;
+}
+
+
 static const struct clk_ops bcm2835_clock_clk_ops = {
 	.is_prepared = bcm2835_clock_is_on,
 	.prepare = bcm2835_clock_on,
 	.unprepare = bcm2835_clock_off,
 	.recalc_rate = bcm2835_clock_get_rate,
 	.set_rate = bcm2835_clock_set_rate,
-	.round_rate = bcm2835_clock_round_rate,
+	.determine_rate = bcm2835_clock_determine_rate,
+	.set_parent = bcm2835_clock_set_parent,
+	.get_parent = bcm2835_clock_get_parent,
 };
 
 static int bcm2835_vpu_clock_is_on(struct clk_hw *hw)
@@ -1301,7 +1353,9 @@ static const struct clk_ops bcm2835_vpu_clock_clk_ops = {
 	.is_prepared = bcm2835_vpu_clock_is_on,
 	.recalc_rate = bcm2835_clock_get_rate,
 	.set_rate = bcm2835_clock_set_rate,
-	.round_rate = bcm2835_clock_round_rate,
+	.determine_rate = bcm2835_clock_determine_rate,
+	.set_parent = bcm2835_clock_set_parent,
+	.get_parent = bcm2835_clock_get_parent,
 };
 
 static struct clk *bcm2835_register_pll(struct bcm2835_cprman *cprman,
@@ -1395,45 +1449,23 @@ static struct clk *bcm2835_register_clock(struct bcm2835_cprman *cprman,
 {
 	struct bcm2835_clock *clock;
 	struct clk_init_data init;
-	const char *parent;
+	const char *parents[1 << CM_SRC_BITS];
+	size_t i;
 
 	/*
-	 * Most of the clock generators have a mux field, so we
-	 * instantiate a generic mux as our parent to handle it.
+	 * Replace our "xosc" references with the oscillator's
+	 * actual name.
 	 */
-	if (data->num_mux_parents) {
-		const char *parents[1 << CM_SRC_BITS];
-		int i;
-
-		parent = devm_kasprintf(cprman->dev, GFP_KERNEL,
-					"mux_%s", data->name);
-		if (!parent)
-			return NULL;
-
-		/*
-		 * Replace our "xosc" references with the oscillator's
-		 * actual name.
-		 */
-		for (i = 0; i < data->num_mux_parents; i++) {
-			if (strcmp(data->parents[i], "xosc") == 0)
-				parents[i] = cprman->osc_name;
-			else
-				parents[i] = data->parents[i];
-		}
-
-		clk_register_mux(cprman->dev, parent,
-				 parents, data->num_mux_parents,
-				 CLK_SET_RATE_PARENT,
-				 cprman->regs + data->ctl_reg,
-				 CM_SRC_SHIFT, CM_SRC_BITS,
-				 0, &cprman->regs_lock);
-	} else {
-		parent = data->parents[0];
+	for (i = 0; i < data->num_mux_parents; i++) {
+		if (strcmp(data->parents[i], "xosc") == 0)
+			parents[i] = cprman->osc_name;
+		else
+			parents[i] = data->parents[i];
 	}
 
 	memset(&init, 0, sizeof(init));
-	init.parent_names = &parent;
-	init.num_parents = 1;
+	init.parent_names = parents;
+	init.num_parents = data->num_mux_parents;
 	init.name = data->name;
 	init.flags = CLK_IGNORE_UNUSED;
 
-- 
2.0.1
