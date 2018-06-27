Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Paul Cercueil <paul@crapouillou.net>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/2] clk: ingenic: Add missing flag for UDC clock
Date: Wed, 27 Jun 2018 14:14:59 +0200
Message-Id: <20180627121459.13987-2-paul@crapouillou.net>
In-Reply-To: <20180627121459.13987-1-paul@crapouillou.net>
References: <20180627121459.13987-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The UDC clock of the JZ4740 SoC can be gated, but the data structure
representing it was missing the CGU_CLK_GATE flag to make it work.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/clk/ingenic/jz4740-cgu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ingenic/jz4740-cgu.c b/drivers/clk/ingenic/jz4740-cgu.c
index bc073dd4470d..4479c102e899 100644
--- a/drivers/clk/ingenic/jz4740-cgu.c
+++ b/drivers/clk/ingenic/jz4740-cgu.c
@@ -161,7 +161,7 @@ static const struct ingenic_cgu_clk_info jz4740_cgu_clocks[] = {
 	},
 
 	[JZ4740_CLK_UDC] = {
-		"udc", CGU_CLK_MUX | CGU_CLK_DIV,
+		"udc", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
 		.parents = { JZ4740_CLK_EXT, JZ4740_CLK_PLL_HALF, -1, -1 },
 		.mux = { CGU_REG_CPCCR, 29, 1 },
 		.div = { CGU_REG_CPCCR, 23, 1, 6, -1, -1, -1 },
-- 
2.11.0
