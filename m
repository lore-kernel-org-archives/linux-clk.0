Return-Path: <boris.brezillon@bootlin.com>
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Stephen Warren <swarren@wwwdotorg.org>,
	Lee Jones <lee@kernel.org>,
	Eric Anholt <eric@anholt.net>,
	linux-rpi-kernel@lists.infradead.org,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
	stable@vger.kernel.org
Subject: [PATCH 4/4] clk: bcm2835: Make sure the PLL is gated before changing its rate
Date: Thu,  8 Feb 2018 14:43:38 +0100
Message-Id: <20180208134338.24590-4-boris.brezillon@bootlin.com>
In-Reply-To: <20180208134338.24590-1-boris.brezillon@bootlin.com>
References: <20180208134338.24590-1-boris.brezillon@bootlin.com>
List-ID: <linux-clk.vger.kernel.org>

All bcm2835 PLLs should be gated before their rate can be changed.
Setting CLK_SET_RATE_GATE will let the core enforce that, but this is
not enough to make the code work in all situations. Indeed, the
CLK_SET_RATE_GATE flag prevents a user from changing the rate while
the clock is enabled, but this check only guarantees there's no Linux
users. In our case, the clock might have been enabled by the
bootloader/FW, and, because we have CLK_IGNORE_UNUSED set, Linux never
disables the PLL. So we have to make sure the PLL is actually disabled
before changing the rate.

Fixes: 41691b8862e2 ("clk: bcm2835: Add support for programming the audio domain clocks")
Cc: <stable@vger.kernel.org>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/clk/bcm/clk-bcm2835.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 6c5d4a8e426c..051ce769c109 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -678,6 +678,18 @@ static int bcm2835_pll_set_rate(struct clk_hw *hw,
 	u32 ana[4];
 	int i;
 
+	/*
+	 * Normally, the CLK_SET_RATE_GATE flag prevents a user from changing
+	 * the rate while the clock is enabled, but this check only makes sure
+	 * there's no Linux users.
+	 * In our case, the clock might have been enabled by the bootloader/FW,
+	 * and, since CLK_IGNORE_UNUSED flag is set, Linux never disables it.
+	 * So we have to make sure the clk is actually disabled before changing
+	 * the rate.
+	 */
+	if (bcm2835_pll_is_on(hw))
+		bcm2835_pll_off(hw);
+
 	if (rate > data->max_fb_rate) {
 		use_fb_prediv = true;
 		rate /= 2;
@@ -1318,7 +1330,7 @@ static struct clk_hw *bcm2835_register_pll(struct bcm2835_cprman *cprman,
 	init.num_parents = 1;
 	init.name = data->name;
 	init.ops = &bcm2835_pll_clk_ops;
-	init.flags = CLK_IGNORE_UNUSED;
+	init.flags = CLK_IGNORE_UNUSED | CLK_SET_RATE_GATE;
 
 	pll = kzalloc(sizeof(*pll), GFP_KERNEL);
 	if (!pll)
-- 
2.14.1
