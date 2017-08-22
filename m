Return-Path: <bhumirks@gmail.com>
Return-Path: <bhumirks@gmail.com>
From: Bhumika Goyal <bhumirks@gmail.com>
To: julia.lawall@lip6.fr,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>
Subject: [PATCH] clk: hisilicon: make clk_ops const
Date: Tue, 22 Aug 2017 19:12:07 +0530
Message-Id: <1503409327-20278-1-git-send-email-bhumirks@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Make these const as they are only stored in the const field of a
clk_init_data structure.

Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
---
 drivers/clk/hisilicon/clk-hi3620.c        | 2 +-
 drivers/clk/hisilicon/clk-hix5hd2.c       | 4 ++--
 drivers/clk/hisilicon/clkgate-separated.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/hisilicon/clk-hi3620.c b/drivers/clk/hisilicon/clk-hi3620.c
index fa0fba6..77072c7 100644
--- a/drivers/clk/hisilicon/clk-hi3620.c
+++ b/drivers/clk/hisilicon/clk-hi3620.c
@@ -415,7 +415,7 @@ static int mmc_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	return mmc_clk_set_timing(hw, rate);
 }
 
-static struct clk_ops clk_mmc_ops = {
+static const struct clk_ops clk_mmc_ops = {
 	.prepare = mmc_clk_prepare,
 	.determine_rate = mmc_clk_determine_rate,
 	.set_rate = mmc_clk_set_rate,
diff --git a/drivers/clk/hisilicon/clk-hix5hd2.c b/drivers/clk/hisilicon/clk-hix5hd2.c
index 14b05ef..9584f0c 100644
--- a/drivers/clk/hisilicon/clk-hix5hd2.c
+++ b/drivers/clk/hisilicon/clk-hix5hd2.c
@@ -208,7 +208,7 @@ static void clk_ether_unprepare(struct clk_hw *hw)
 	writel_relaxed(val, clk->ctrl_reg);
 }
 
-static struct clk_ops clk_ether_ops = {
+static const struct clk_ops clk_ether_ops = {
 	.prepare = clk_ether_prepare,
 	.unprepare = clk_ether_unprepare,
 };
@@ -247,7 +247,7 @@ static void clk_complex_disable(struct clk_hw *hw)
 	writel_relaxed(val, clk->phy_reg);
 }
 
-static struct clk_ops clk_complex_ops = {
+static const struct clk_ops clk_complex_ops = {
 	.enable = clk_complex_enable,
 	.disable = clk_complex_disable,
 };
diff --git a/drivers/clk/hisilicon/clkgate-separated.c b/drivers/clk/hisilicon/clkgate-separated.c
index 7908bc3..1172b09 100644
--- a/drivers/clk/hisilicon/clkgate-separated.c
+++ b/drivers/clk/hisilicon/clkgate-separated.c
@@ -88,7 +88,7 @@ static int clkgate_separated_is_enabled(struct clk_hw *hw)
 	return reg ? 1 : 0;
 }
 
-static struct clk_ops clkgate_separated_ops = {
+static const struct clk_ops clkgate_separated_ops = {
 	.enable		= clkgate_separated_enable,
 	.disable	= clkgate_separated_disable,
 	.is_enabled	= clkgate_separated_is_enabled,
-- 
1.9.1
