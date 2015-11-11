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
Subject: [PATCH v2 1/3] clk: bcm2835: Always round up clock divisor
Date: Wed, 11 Nov 2015 15:22:43 +0100
Message-Id: <1447251765-16297-2-git-send-email-repk@triplefau.lt>
In-Reply-To: <1447251765-16297-1-git-send-email-repk@triplefau.lt>
References: <1447251765-16297-1-git-send-email-repk@triplefau.lt>
List-ID: <linux-clk.vger.kernel.org>

Make bcm2835_clock_choose_div always round up the chosen MASH divisor so that
the resulting average rate will not be higher than the requested one.

Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 drivers/clk/bcm/clk-bcm2835.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 39bf582..1237716 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -1152,18 +1152,19 @@ static u32 bcm2835_clock_choose_div(struct clk_hw *hw,
 {
 	struct bcm2835_clock *clock = bcm2835_clock_from_hw(hw);
 	const struct bcm2835_clock_data *data = clock->data;
-	u32 unused_frac_mask = GENMASK(CM_DIV_FRAC_BITS - data->frac_bits, 0);
+	u32 unused_frac_mask =
+		GENMASK(CM_DIV_FRAC_BITS - data->frac_bits, 0) >> 1;
 	u64 temp = (u64)parent_rate << CM_DIV_FRAC_BITS;
+	u64 rem;
 	u32 div;
 
-	do_div(temp, rate);
+	rem = do_div(temp, rate);
 	div = temp;
 
-	/* Round and mask off the unused bits */
-	if (unused_frac_mask != 0) {
-		div += unused_frac_mask >> 1;
-		div &= ~unused_frac_mask;
-	}
+	/* Round up and mask off the unused bits */
+	if ((div & unused_frac_mask) != 0 || rem != 0)
+		div += unused_frac_mask + 1;
+	div &= ~unused_frac_mask;
 
 	/* Clamp to the limits. */
 	div = max(div, unused_frac_mask + 1);
-- 
2.0.1
