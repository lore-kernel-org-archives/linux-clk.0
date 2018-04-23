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
Subject: [PATCH clk-fixes] clk: meson: meson8b: fix meson8b_cpu_clk parent clock name
Date: Mon, 23 Apr 2018 21:30:29 +0200
Message-Id: <20180423193029.29428-1-martin.blumenstingl@googlemail.com>
List-ID: <linux-clk.vger.kernel.org>

meson8b_cpu_clk has two parent clocks:
- meson8b_xtal
- meson8b_cpu_scale_out_sel

The name of the "xtal" clock parent is specified correctly. However,
there is a typo in the name of the second parent clock. The
meson8b_cpu_scale_out_sel definition uses the name "cpu_scale_out_sel"
(which matches the name from the datasheet). However, the mux parent
definition uses the name "cpu_out_sel" which does not match any existing
clock.

Fixes: 251b6fd38bcb9c ("clk: meson: rework meson8b cpu clock")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 2c4ff6192852..d0524ec71aad 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -632,7 +632,8 @@ static struct clk_regmap meson8b_cpu_clk = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk",
 		.ops = &clk_regmap_mux_ro_ops,
-		.parent_names = (const char *[]){ "xtal", "cpu_out_sel" },
+		.parent_names = (const char *[]){ "xtal",
+						  "cpu_scale_out_sel" },
 		.num_parents = 2,
 		.flags = (CLK_SET_RATE_PARENT |
 			  CLK_SET_RATE_NO_REPARENT),
-- 
2.17.0
