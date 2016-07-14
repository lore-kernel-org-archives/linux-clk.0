Return-Path: <wens@wens.csie.org>
From: Chen-Yu Tsai <wens@csie.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: sunxi-ng: Fix inverted test condition in ccu_helper_wait_for_lock
Date: Thu, 14 Jul 2016 10:42:35 +0800
Message-Id: <1468464155-11888-1-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

The condition passed to read*_poll_timeout() is the break condition,
i.e. wait for this condition to happen and return success.

The original code assumed the opposite, resulting in a warning when
the PLL clock rate was changed but never lost it's lock as far as
the readout indicated. This was verified by checking the read out
register value.

Fixes: 1d80c14248d6 ("clk: sunxi-ng: Add common infrastructure")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu_common.c b/drivers/clk/sunxi-ng/ccu_common.c
index fc17b5295e16..51d4bac97ab3 100644
--- a/drivers/clk/sunxi-ng/ccu_common.c
+++ b/drivers/clk/sunxi-ng/ccu_common.c
@@ -31,7 +31,7 @@ void ccu_helper_wait_for_lock(struct ccu_common *common, u32 lock)
 		return;
 
 	WARN_ON(readl_relaxed_poll_timeout(common->base + common->reg, reg,
-					   !(reg & lock), 100, 70000));
+					   reg & lock, 100, 70000));
 }
 
 int sunxi_ccu_probe(struct device_node *node, void __iomem *reg,
-- 
2.8.1
