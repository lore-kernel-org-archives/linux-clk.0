Return-Path: <martin.blumenstingl@googlemail.com>
Return-Path: <martin.blumenstingl@googlemail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com,
	jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-clk@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH clk-fixes] clk: meson: meson8b: fix meson8b_fclk_div3_div clock name
Date: Sun, 22 Apr 2018 12:28:43 +0200
Message-Id: <20180422102843.31238-1-martin.blumenstingl@googlemail.com>
List-ID: <linux-clk.vger.kernel.org>

The names of all fclk divider gate clocks follow the naming schema
"fclk_divN" and the name of all fclk fixed dividers follow the naming
schema "fclk_divN_div".
There's one exception to this rule: meson8b_fclk_div3_div's name is
"fclk_div_div3". It's child clock meson8b_fclk_div3 however references
it as "fclk_div3_div" (following the naming schema explained above).

Fix the naming of the meson8b_fclk_div3_div clock to follow the naming
schema. This also fixes serial console on my Meson8m2 board because
"clk81" uses fclk_div3 as parent. However, since the hierarchy stops at
meson8b_fclk_div3 there's no known parent clock and the rate of "clk81"
and all of it's children (UART clock, SDIO MMC controller clock, ...)
are all 0.

Fixes: 05f814402d6174 ("clk: meson: add fdiv clock gates")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index cc2992493e0b..2c4ff6192852 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -253,7 +253,7 @@ static struct clk_fixed_factor meson8b_fclk_div3_div = {
 	.mult = 1,
 	.div = 3,
 	.hw.init = &(struct clk_init_data){
-		.name = "fclk_div_div3",
+		.name = "fclk_div3_div",
 		.ops = &clk_fixed_factor_ops,
 		.parent_names = (const char *[]){ "fixed_pll" },
 		.num_parents = 1,
-- 
2.17.0
