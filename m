Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Rob Herring <robh+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 02/20] clk: multiplier: Prevent the multiplier from under / over flowing
Date: Mon, 16 May 2016 14:47:02 +0200
Message-Id: <1463402840-17062-3-git-send-email-maxime.ripard@free-electrons.com>
In-Reply-To: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

In the current multiplier base clock implementation, if the
CLK_SET_RATE_PARENT flag isn't set, the code will not make sure that the
multiplier computed remains within the boundaries of our clock.

This means that if the clock we want to reach is below the parent rate,
or if the multiplier is above the maximum that we can reach, we will end up
with a completely bogus one that the clock cannot achieve.

Fixes: f2e0a53271a4 ("clk: Add a basic multiplier clock")
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/clk/clk-multiplier.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-multiplier.c b/drivers/clk/clk-multiplier.c
index 9e449c7b751c..dc037c957acd 100644
--- a/drivers/clk/clk-multiplier.c
+++ b/drivers/clk/clk-multiplier.c
@@ -52,14 +52,28 @@ static unsigned long __bestmult(struct clk_hw *hw, unsigned long rate,
 				unsigned long *best_parent_rate,
 				u8 width, unsigned long flags)
 {
+	struct clk_multiplier *mult = to_clk_multiplier(hw);
 	unsigned long orig_parent_rate = *best_parent_rate;
 	unsigned long parent_rate, current_rate, best_rate = ~0;
 	unsigned int i, bestmult = 0;
+	unsigned int maxmult = (1 << width) - 1;
+
+	if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)) {
+		bestmult = rate / orig_parent_rate;
+
+		/* Make sure we don't end up with a 0 multiplier */
+		if ((bestmult == 0) &&
+		    !(mult->flags & CLK_MULTIPLIER_ZERO_BYPASS))
+			bestmult = 1;
 
-	if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT))
-		return rate / *best_parent_rate;
+		/* Make sure we don't overflow the multiplier */
+		if (bestmult > maxmult)
+			bestmult = maxmult;
+
+		return bestmult;
+	}
 
-	for (i = 1; i < ((1 << width) - 1); i++) {
+	for (i = 1; i < maxmult; i++) {
 		if (rate == orig_parent_rate * i) {
 			/*
 			 * This is the best case for us if we have a
-- 
2.8.2
