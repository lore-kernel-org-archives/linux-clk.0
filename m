Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] clk: meson: axg: let mpll clocks round closest
Date: Tue, 15 May 2018 18:36:52 +0200
Message-Id: <20180515163652.19980-3-jbrunet@baylibre.com>
In-Reply-To: <20180515163652.19980-1-jbrunet@baylibre.com>
References: <20180515163652.19980-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Let the mpll dividers achieve the closest rate possible, even if
it means rounding the requested rate up.

This is done to improve the accuracy of the rates provided by these
plls to the audio subsystem

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 5f5d468c1efe..bd4dbc696b88 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -461,6 +461,7 @@ static struct clk_regmap axg_mpll0_div = {
 			.width	 = 1,
 		},
 		.lock = &meson_clk_lock,
+		.flags = CLK_MESON_MPLL_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll0_div",
@@ -507,6 +508,7 @@ static struct clk_regmap axg_mpll1_div = {
 			.width	 = 1,
 		},
 		.lock = &meson_clk_lock,
+		.flags = CLK_MESON_MPLL_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll1_div",
@@ -553,6 +555,7 @@ static struct clk_regmap axg_mpll2_div = {
 			.width	 = 1,
 		},
 		.lock = &meson_clk_lock,
+		.flags = CLK_MESON_MPLL_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll2_div",
@@ -599,6 +602,7 @@ static struct clk_regmap axg_mpll3_div = {
 			.width	 = 1,
 		},
 		.lock = &meson_clk_lock,
+		.flags = CLK_MESON_MPLL_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll3_div",
-- 
2.14.3
