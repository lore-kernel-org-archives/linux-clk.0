Return-Path: <wens@wens.csie.org>
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: [PATCH 3/3] clk: sunxi-ng: a80: Fix audio PLL comment not matching actual code
Date: Fri, 24 Mar 2017 16:33:07 +0800
Message-Id: <20170324083307.18338-4-wens@csie.org>
In-Reply-To: <20170324083307.18338-1-wens@csie.org>
References: <20170324083307.18338-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

We ignore the d1 and d2 dividers in the audio PLL, and force them to
1 (register value 0) at probe time. However the comment preceding the
audio PLL definition says we enforce the default value, which is not
the same.

Fix the preceding comment to match what we do in code.

Fixes: b8eb71dcdd08 ("clk: sunxi-ng: Add A80 CCU")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu-sun9i-a80.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun9i-a80.c b/drivers/clk/sunxi-ng/ccu-sun9i-a80.c
index e13e313ce4f5..a031beefa5b5 100644
--- a/drivers/clk/sunxi-ng/ccu-sun9i-a80.c
+++ b/drivers/clk/sunxi-ng/ccu-sun9i-a80.c
@@ -70,8 +70,7 @@ static struct ccu_nm pll_c1cpux_clk = {
 /*
  * The Audio PLL has d1, d2 dividers in addition to the usual N, M
  * factors. Since we only need 2 frequencies from this PLL: 22.5792 MHz
- * and 24.576 MHz, ignore them for now. Enforce the default for them,
- * which is d1 = 0, d2 = 1.
+ * and 24.576 MHz, ignore them for now. Enforce d1 = 0 and d2 = 0.
  */
 #define SUN9I_A80_PLL_AUDIO_REG	0x008
 
-- 
2.11.0
