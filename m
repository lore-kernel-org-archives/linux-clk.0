Return-Path: <p.zabel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Barry Song <baohua@kernel.org>,
	=?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Alexandre Courbot <gnurou@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-clk@vger.kernel.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 6/7] clk: tegra: Make reset_control_ops const
Date: Thu, 25 Feb 2016 10:45:11 +0100
Message-Id: <1456393512-26602-7-git-send-email-p.zabel@pengutronix.de>
In-Reply-To: <1456393512-26602-1-git-send-email-p.zabel@pengutronix.de>
References: <1456393512-26602-1-git-send-email-p.zabel@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

The rst_ops structure is never modified. Make it const.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/clk/tegra/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
index 2a3a4fe..f60fe2e 100644
--- a/drivers/clk/tegra/clk.c
+++ b/drivers/clk/tegra/clk.c
@@ -271,7 +271,7 @@ void __init tegra_init_from_table(struct tegra_clk_init_table *tbl,
 	}
 }
 
-static struct reset_control_ops rst_ops = {
+static const struct reset_control_ops rst_ops = {
 	.assert = tegra_clk_rst_assert,
 	.deassert = tegra_clk_rst_deassert,
 };
-- 
2.7.0
