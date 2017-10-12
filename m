Return-Path: <wens@wens.csie.org>
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@googlegroups.com
Subject: [PATCH 1/9] clk: sunxi-ng: sun5i: Fix bit offset of audio PLL post-divider
Date: Thu, 12 Oct 2017 16:36:57 +0800
Message-Id: <20171012083705.24409-2-wens@csie.org>
In-Reply-To: <20171012083705.24409-1-wens@csie.org>
References: <20171012083705.24409-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

The post-divider for the audio PLL is in bits [29:26], as specified
in the user manual, not [19:16] as currently programmed in the code.
The post-divider has a default register value of 2, i.e. a divider
of 3. This means the clock rate fed to the audio codec would be off.

This was discovered when porting sigma-delta modulation for the PLL
to sun5i, which needs the post-divider to be 1.

Fix the bit offset, so we do actually force the post-divider to a
certain value.

Fixes: 5e73761786d6 ("clk: sunxi-ng: Add sun5i CCU driver")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu-sun5i.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun5i.c b/drivers/clk/sunxi-ng/ccu-sun5i.c
index ab9e850b3707..2f385a57cd91 100644
--- a/drivers/clk/sunxi-ng/ccu-sun5i.c
+++ b/drivers/clk/sunxi-ng/ccu-sun5i.c
@@ -982,8 +982,8 @@ static void __init sun5i_ccu_init(struct device_node *node,
 
 	/* Force the PLL-Audio-1x divider to 4 */
 	val = readl(reg + SUN5I_PLL_AUDIO_REG);
-	val &= ~GENMASK(19, 16);
-	writel(val | (3 << 16), reg + SUN5I_PLL_AUDIO_REG);
+	val &= ~GENMASK(29, 26);
+	writel(val | (3 << 26), reg + SUN5I_PLL_AUDIO_REG);
 
 	/*
 	 * Use the peripheral PLL as the AHB parent, instead of CPU /
-- 
2.14.2
