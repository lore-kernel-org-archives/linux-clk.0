Return-Path: <megous@megous.com>
From: megous@megous.com
To: dev@linux-sunxi.org
Cc: Ondrej Jirman <megous@megous.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] clk: sunxi-ng: a83t: Fix invalid csi-mclk mux offset
Date: Thu,  5 Oct 2017 04:33:14 +0200
Message-Id: <20171005023314.21663-1-megous@megous.com>
List-ID: <linux-clk.vger.kernel.org>

From: Ondrej Jirman <megous@megous.com>

Datasheet specified that parent MUX settings are at bits [10:8],
but current implementation specifies incorrect offset at [10:12].
Fix this.

Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c b/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
index b0fbdaea76de..d7938ab57429 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
@@ -534,7 +534,7 @@ static SUNXI_CCU_M_WITH_MUX_TABLE_GATE(csi_mclk_clk, "csi-mclk",
 				       csi_mclk_parents, csi_mclk_table,
 				       0x134,
 				       0, 5,	/* M */
-				       10, 3,	/* mux */
+				       8, 3,	/* mux */
 				       BIT(15),	/* gate */
 				       0);
 
-- 
2.14.2
