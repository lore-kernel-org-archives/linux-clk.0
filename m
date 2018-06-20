Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] clk: meson: stop rate propagation for audio clocks
Date: Wed, 20 Jun 2018 12:06:09 +0200
Message-Id: <20180620100610.29010-2-jbrunet@baylibre.com>
In-Reply-To: <20180620100610.29010-1-jbrunet@baylibre.com>
References: <20180620100610.29010-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

It is actually a lot easier to setup the PLL with carefully chosen rates
than relying on CCF clock propagation for this audio use case.
This way, we can make sure we will always be able to provide the common
audio clock rates, while having the PLL in the optimal operating range.

For this, we stop the rate propagation at the mux picking the
PLL and let it round to the closest matching PLL.

Doing so, we can use the generic divider for the i2s clock.
clk-audio-divider is no longer required. It was a (poor) attempt
to use CCF rate propagation while making sure the PLL rate would
be high enough to work with audio use cases.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 297ebc391475..894a6adaa17a 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -970,28 +970,26 @@ static struct clk_regmap gxbb_cts_amclk_sel = {
 		.mask = 0x3,
 		.shift = 9,
 		.table = (u32[]){ 1, 2, 3 },
+		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_amclk_sel",
 		.ops = &clk_regmap_mux_ops,
 		.parent_names = (const char *[]){ "mpll0", "mpll1", "mpll2" },
 		.num_parents = 3,
-		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
 static struct clk_regmap gxbb_cts_amclk_div = {
-	.data = &(struct meson_clk_audio_div_data){
-		.div = {
-			.reg_off = HHI_AUD_CLK_CNTL,
-			.shift   = 0,
-			.width   = 8,
-		},
+	.data = &(struct clk_regmap_div_data) {
+		.offset = HHI_AUD_CLK_CNTL,
+		.shift = 0,
+		.width = 8,
 		.flags = CLK_DIVIDER_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_amclk_div",
-		.ops = &meson_clk_audio_divider_ops,
+		.ops = &clk_regmap_divider_ops,
 		.parent_names = (const char *[]){ "cts_amclk_sel" },
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1018,13 +1016,13 @@ static struct clk_regmap gxbb_cts_mclk_i958_sel = {
 		.mask = 0x3,
 		.shift = 25,
 		.table = (u32[]){ 1, 2, 3 },
+		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data) {
 		.name = "cts_mclk_i958_sel",
 		.ops = &clk_regmap_mux_ops,
 		.parent_names = (const char *[]){ "mpll0", "mpll1", "mpll2" },
 		.num_parents = 3,
-		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-- 
2.14.3
