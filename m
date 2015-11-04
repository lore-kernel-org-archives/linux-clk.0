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
Subject: [PATCH 1/2] clk: bcm2835: Support for clock parent selection
Date: Thu,  5 Nov 2015 00:08:21 +0100
Message-Id: <1446678502-16243-2-git-send-email-repk@triplefau.lt>
In-Reply-To: <1446678502-16243-1-git-send-email-repk@triplefau.lt>
References: <1446678502-16243-1-git-send-email-repk@triplefau.lt>
List-ID: <linux-clk.vger.kernel.org>

Some bcm2835 clocks used by hardware (like "PWM" or "H264") can have multiple
parents. These clocks divide the rate of one parent which can be selected by
setting the proper bits in their clock control register.

Previously all these parents where handled by a mux clock. But a mux clock
cannot be used because updating clock control register to select parent needs a
password to be xor'd with the parent index.

This patch get rid of mux clock and make these clocks handle their own parent,
allowing them to select the one to use.

Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 drivers/clk/bcm/clk-bcm2835.c | 116 ++++++++++++++++++++++++++----------------
 1 file changed, 71 insertions(+), 45 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 39bf582..9469729 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -1197,16 +1197,6 @@ static long bcm2835_clock_rate_from_divisor(struct bcm2835_clock *clock,
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
@@ -1278,13 +1268,69 @@ static int bcm2835_clock_set_rate(struct clk_hw *hw,
 	return 0;
 }
 
+static int bcm2835_clock_determine_source(struct clk_hw *hw,
+		struct clk_rate_request *req)
+{
+	struct clk_hw *parent, *best_parent = NULL;
+	struct clk_rate_request parent_req;
+	unsigned long prate, best_rate = ULONG_MAX;
+	size_t i;
+
+	/*
+	 * Select parent clock that has the closest but higher rate
+	 */
+	for (i = 0; i < clk_hw_get_num_parents(hw); ++i) {
+		parent = clk_hw_get_parent_by_index(hw, i);
+		if (!parent)
+			continue;
+		parent_req = *req;
+		prate = clk_hw_get_rate(parent);
+		if (prate < best_rate && prate >= req->rate) {
+			best_parent = parent;
+			best_rate = prate;
+		}
+	}
+
+	if (!best_parent)
+		return -EINVAL;
+
+	req->best_parent_hw = best_parent;
+	req->best_parent_rate = best_rate;
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
+	.determine_rate = bcm2835_clock_determine_source,
+	.set_parent = bcm2835_clock_set_parent,
+	.get_parent = bcm2835_clock_get_parent,
 };
 
 static int bcm2835_vpu_clock_is_on(struct clk_hw *hw)
@@ -1300,7 +1346,9 @@ static const struct clk_ops bcm2835_vpu_clock_clk_ops = {
 	.is_prepared = bcm2835_vpu_clock_is_on,
 	.recalc_rate = bcm2835_clock_get_rate,
 	.set_rate = bcm2835_clock_set_rate,
-	.round_rate = bcm2835_clock_round_rate,
+	.determine_rate = bcm2835_clock_determine_source,
+	.set_parent = bcm2835_clock_set_parent,
+	.get_parent = bcm2835_clock_get_parent,
 };
 
 static struct clk *bcm2835_register_pll(struct bcm2835_cprman *cprman,
@@ -1394,45 +1442,23 @@ static struct clk *bcm2835_register_clock(struct bcm2835_cprman *cprman,
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
