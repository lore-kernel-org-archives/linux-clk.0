Return-Path: <bhumirks@gmail.com>
Return-Path: <bhumirks@gmail.com>
From: Bhumika Goyal <bhumirks@gmail.com>
To: julia.lawall@lip6.fr,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>
Subject: [PATCH] clk: mmp: make clk_ops const
Date: Tue, 22 Aug 2017 19:05:55 +0530
Message-Id: <1503408955-18824-1-git-send-email-bhumirks@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Make these const as they are only stored in the const field of a
clk_init_data structure.

Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
---
 drivers/clk/mmp/clk-apbc.c | 2 +-
 drivers/clk/mmp/clk-apmu.c | 2 +-
 drivers/clk/mmp/clk-frac.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mmp/clk-apbc.c b/drivers/clk/mmp/clk-apbc.c
index 4c717db..fb294ad 100644
--- a/drivers/clk/mmp/clk-apbc.c
+++ b/drivers/clk/mmp/clk-apbc.c
@@ -114,7 +114,7 @@ static void clk_apbc_unprepare(struct clk_hw *hw)
 		spin_unlock_irqrestore(apbc->lock, flags);
 }
 
-static struct clk_ops clk_apbc_ops = {
+static const struct clk_ops clk_apbc_ops = {
 	.prepare = clk_apbc_prepare,
 	.unprepare = clk_apbc_unprepare,
 };
diff --git a/drivers/clk/mmp/clk-apmu.c b/drivers/clk/mmp/clk-apmu.c
index 47b5542..b7ce8f5 100644
--- a/drivers/clk/mmp/clk-apmu.c
+++ b/drivers/clk/mmp/clk-apmu.c
@@ -60,7 +60,7 @@ static void clk_apmu_disable(struct clk_hw *hw)
 		spin_unlock_irqrestore(apmu->lock, flags);
 }
 
-static struct clk_ops clk_apmu_ops = {
+static const struct clk_ops clk_apmu_ops = {
 	.enable = clk_apmu_enable,
 	.disable = clk_apmu_disable,
 };
diff --git a/drivers/clk/mmp/clk-frac.c b/drivers/clk/mmp/clk-frac.c
index 584a992..ea47a96 100644
--- a/drivers/clk/mmp/clk-frac.c
+++ b/drivers/clk/mmp/clk-frac.c
@@ -149,7 +149,7 @@ static void clk_factor_init(struct clk_hw *hw)
 		spin_unlock_irqrestore(factor->lock, flags);
 }
 
-static struct clk_ops clk_factor_ops = {
+static const struct clk_ops clk_factor_ops = {
 	.recalc_rate = clk_factor_recalc_rate,
 	.round_rate = clk_factor_round_rate,
 	.set_rate = clk_factor_set_rate,
-- 
1.9.1
