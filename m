Return-Path: <paul@crapouillou.net>
From: Paul Cercueil <paul@crapouillou.net>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Paul Burton <paul.burton@mips.com>,
	James Hogan <jhogan@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/2] clk: ingenic: Fix incorrect data for the i2s clock
Date: Wed, 27 Jun 2018 14:14:58 +0200
Message-Id: <20180627121459.13987-1-paul@crapouillou.net>
List-ID: <linux-clk.vger.kernel.org>

The register field for configuring the divider for the i2s clock
occupies the bits [8-0], which means 9 bits and not 8.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/clk/ingenic/jz4740-cgu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ingenic/jz4740-cgu.c b/drivers/clk/ingenic/jz4740-cgu.c
index 32fcc75f6f77..bc073dd4470d 100644
--- a/drivers/clk/ingenic/jz4740-cgu.c
+++ b/drivers/clk/ingenic/jz4740-cgu.c
@@ -134,7 +134,7 @@ static const struct ingenic_cgu_clk_info jz4740_cgu_clocks[] = {
 		"i2s", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
 		.parents = { JZ4740_CLK_EXT, JZ4740_CLK_PLL_HALF, -1, -1 },
 		.mux = { CGU_REG_CPCCR, 31, 1 },
-		.div = { CGU_REG_I2SCDR, 0, 1, 8, -1, -1, -1 },
+		.div = { CGU_REG_I2SCDR, 0, 1, 9, -1, -1, -1 },
 		.gate = { CGU_REG_CLKGR, 6 },
 	},
 
-- 
2.11.0
