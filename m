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
Subject: [PATCH 1/7] clk: mediatek: Make reset_control_ops const
Date: Thu, 25 Feb 2016 10:45:06 +0100
Message-Id: <1456393512-26602-2-git-send-email-p.zabel@pengutronix.de>
In-Reply-To: <1456393512-26602-1-git-send-email-p.zabel@pengutronix.de>
References: <1456393512-26602-1-git-send-email-p.zabel@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

The mtk_reset_ops structure is never modified. Make it const.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/clk/mediatek/reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index 9e9fe4b..309049d 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -57,7 +57,7 @@ static int mtk_reset(struct reset_controller_dev *rcdev,
 	return mtk_reset_deassert(rcdev, id);
 }
 
-static struct reset_control_ops mtk_reset_ops = {
+static const struct reset_control_ops mtk_reset_ops = {
 	.assert = mtk_reset_assert,
 	.deassert = mtk_reset_deassert,
 	.reset = mtk_reset,
-- 
2.7.0
