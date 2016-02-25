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
Subject: [PATCH 7/7] clk: qcom: Make reset_control_ops const
Date: Thu, 25 Feb 2016 10:45:12 +0100
Message-Id: <1456393512-26602-8-git-send-email-p.zabel@pengutronix.de>
In-Reply-To: <1456393512-26602-1-git-send-email-p.zabel@pengutronix.de>
References: <1456393512-26602-1-git-send-email-p.zabel@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

The qcom_reset_ops structure is never modified. Make it const.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/clk/qcom/reset.c | 2 +-
 drivers/clk/qcom/reset.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/reset.c b/drivers/clk/qcom/reset.c
index 6c977d3..0324d8d 100644
--- a/drivers/clk/qcom/reset.c
+++ b/drivers/clk/qcom/reset.c
@@ -55,7 +55,7 @@ qcom_reset_deassert(struct reset_controller_dev *rcdev, unsigned long id)
 	return regmap_update_bits(rst->regmap, map->reg, mask, 0);
 }
 
-struct reset_control_ops qcom_reset_ops = {
+const struct reset_control_ops qcom_reset_ops = {
 	.reset = qcom_reset,
 	.assert = qcom_reset_assert,
 	.deassert = qcom_reset_deassert,
diff --git a/drivers/clk/qcom/reset.h b/drivers/clk/qcom/reset.h
index 0e11e21..cda8779 100644
--- a/drivers/clk/qcom/reset.h
+++ b/drivers/clk/qcom/reset.h
@@ -32,6 +32,6 @@ struct qcom_reset_controller {
 #define to_qcom_reset_controller(r) \
 	container_of(r, struct qcom_reset_controller, rcdev);
 
-extern struct reset_control_ops qcom_reset_ops;
+extern const struct reset_control_ops qcom_reset_ops;
 
 #endif
-- 
2.7.0
