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
Subject: [PATCH 2/7] clk: mmp: Make reset_control_ops const
Date: Thu, 25 Feb 2016 10:45:07 +0100
Message-Id: <1456393512-26602-3-git-send-email-p.zabel@pengutronix.de>
In-Reply-To: <1456393512-26602-1-git-send-email-p.zabel@pengutronix.de>
References: <1456393512-26602-1-git-send-email-p.zabel@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

The mmp_clk_reset_ops structure is never modified. Make it const.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/clk/mmp/reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mmp/reset.c b/drivers/clk/mmp/reset.c
index b54da1f..b4e4d6a 100644
--- a/drivers/clk/mmp/reset.c
+++ b/drivers/clk/mmp/reset.c
@@ -74,7 +74,7 @@ static int mmp_clk_reset_deassert(struct reset_controller_dev *rcdev,
 	return 0;
 }
 
-static struct reset_control_ops mmp_clk_reset_ops = {
+static const struct reset_control_ops mmp_clk_reset_ops = {
 	.assert		= mmp_clk_reset_assert,
 	.deassert	= mmp_clk_reset_deassert,
 };
-- 
2.7.0
