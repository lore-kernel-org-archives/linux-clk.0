Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Jens Kuske <jenskuske@gmail.com>,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Jean-Francois Moine <moinejf@free.fr>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v3 1/2] clk: sunxi: factors: Add missing recalc pointer copy
Date: Thu, 28 Jan 2016 20:22:37 +0100
Message-Id: <1454008958-12655-1-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

Commit 4a9b2abc213e ("clk: sunxi: factors: Support custom formulas") was
introducing a custom recalc function. However, the pointer was never
filled, which was making the whole thing unused.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/clk/sunxi/clk-factors.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/sunxi/clk-factors.c b/drivers/clk/sunxi/clk-factors.c
index e480a6bcf1f6..6e97f46c0c37 100644
--- a/drivers/clk/sunxi/clk-factors.c
+++ b/drivers/clk/sunxi/clk-factors.c
@@ -212,6 +212,7 @@ struct clk *sunxi_factors_register(struct device_node *node,
 	factors->reg = reg;
 	factors->config = data->table;
 	factors->get_factors = data->getter;
+	factors->recalc = data->recalc;
 	factors->lock = lock;
 
 	/* Add a gate if this factor clock can be gated */
-- 
2.6.4
