Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/9] clk: meson: gxbb: mpll: use rw operation
Date: Thu,  9 Mar 2017 11:41:51 +0100
Message-Id: <20170309104154.28295-7-jbrunet@baylibre.com>
In-Reply-To: <20170309104154.28295-1-jbrunet@baylibre.com>
References: <20170309104154.28295-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Use read/write operations for the mpll clocks instead of the
read-only ones.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 79fb8989f8dd..5059c7bbdbb3 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -459,7 +459,7 @@ static struct meson_clk_mpll gxbb_mpll0 = {
 	.lock = &clk_lock,
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll0",
-		.ops = &meson_clk_mpll_ro_ops,
+		.ops = &meson_clk_mpll_ops,
 		.parent_names = (const char *[]){ "fixed_pll" },
 		.num_parents = 1,
 	},
@@ -489,7 +489,7 @@ static struct meson_clk_mpll gxbb_mpll1 = {
 	.lock = &clk_lock,
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll1",
-		.ops = &meson_clk_mpll_ro_ops,
+		.ops = &meson_clk_mpll_ops,
 		.parent_names = (const char *[]){ "fixed_pll" },
 		.num_parents = 1,
 	},
@@ -519,7 +519,7 @@ static struct meson_clk_mpll gxbb_mpll2 = {
 	.lock = &clk_lock,
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll2",
-		.ops = &meson_clk_mpll_ro_ops,
+		.ops = &meson_clk_mpll_ops,
 		.parent_names = (const char *[]){ "fixed_pll" },
 		.num_parents = 1,
 	},
-- 
2.9.3
