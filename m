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
Subject: [PATCH 5/7] clk: sunxi: Make reset_control_ops const
Date: Thu, 25 Feb 2016 10:45:10 +0100
Message-Id: <1456393512-26602-6-git-send-email-p.zabel@pengutronix.de>
In-Reply-To: <1456393512-26602-1-git-send-email-p.zabel@pengutronix.de>
References: <1456393512-26602-1-git-send-email-p.zabel@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

The sunxi_ve_reset_ops, sun9i_mmc_reset_ops, and sunxi_usb_reset_ops
structures are never modified. Make them const.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/clk/sunxi/clk-a10-ve.c    | 2 +-
 drivers/clk/sunxi/clk-sun9i-mmc.c | 2 +-
 drivers/clk/sunxi/clk-usb.c       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi/clk-a10-ve.c b/drivers/clk/sunxi/clk-a10-ve.c
index 044c171..d9ea22e 100644
--- a/drivers/clk/sunxi/clk-a10-ve.c
+++ b/drivers/clk/sunxi/clk-a10-ve.c
@@ -85,7 +85,7 @@ static int sunxi_ve_of_xlate(struct reset_controller_dev *rcdev,
 	return 0;
 }
 
-static struct reset_control_ops sunxi_ve_reset_ops = {
+static const struct reset_control_ops sunxi_ve_reset_ops = {
 	.assert		= sunxi_ve_reset_assert,
 	.deassert	= sunxi_ve_reset_deassert,
 };
diff --git a/drivers/clk/sunxi/clk-sun9i-mmc.c b/drivers/clk/sunxi/clk-sun9i-mmc.c
index a9b1761..028dd83 100644
--- a/drivers/clk/sunxi/clk-sun9i-mmc.c
+++ b/drivers/clk/sunxi/clk-sun9i-mmc.c
@@ -83,7 +83,7 @@ static int sun9i_mmc_reset_deassert(struct reset_controller_dev *rcdev,
 	return 0;
 }
 
-static struct reset_control_ops sun9i_mmc_reset_ops = {
+static const struct reset_control_ops sun9i_mmc_reset_ops = {
 	.assert		= sun9i_mmc_reset_assert,
 	.deassert	= sun9i_mmc_reset_deassert,
 };
diff --git a/drivers/clk/sunxi/clk-usb.c b/drivers/clk/sunxi/clk-usb.c
index 67b8e38..4210260 100644
--- a/drivers/clk/sunxi/clk-usb.c
+++ b/drivers/clk/sunxi/clk-usb.c
@@ -76,7 +76,7 @@ static int sunxi_usb_reset_deassert(struct reset_controller_dev *rcdev,
 	return 0;
 }
 
-static struct reset_control_ops sunxi_usb_reset_ops = {
+static const struct reset_control_ops sunxi_usb_reset_ops = {
 	.assert		= sunxi_usb_reset_assert,
 	.deassert	= sunxi_usb_reset_deassert,
 };
-- 
2.7.0
