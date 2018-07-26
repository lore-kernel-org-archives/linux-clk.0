Return-Path: <anders.roxell@linaro.org>
Return-Path: <anders.roxell@linaro.org>
From: Anders Roxell <anders.roxell@linaro.org>
To: gregory.clement@bootlin.com,
	sboyd@kernel.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] clk: mvebu: armada-37xx-periph: Remove unused var num_parents
Date: Fri, 27 Jul 2018 00:27:21 +0200
Message-Id: <20180726222721.5787-1-anders.roxell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

When building armada-37xx-periph, num_parents isn't used in function
clk_pm_cpu_get_parent:
drivers/clk/mvebu/armada-37xx-periph.c: In function ‘clk_pm_cpu_get_parent’:
drivers/clk/mvebu/armada-37xx-periph.c:419:6: warning: unused variable ‘num_parents’ [-Wunused-variable]
  int num_parents = clk_hw_get_num_parents(hw);
      ^~~~~~~~~~~
Remove the declaration of num_parents to dispose the warning.

Fixes: 616bf80d381d ("clk: mvebu: armada-37xx-periph: Fix wrong return value in get_parent")
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/clk/mvebu/armada-37xx-periph.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu/armada-37xx-periph.c
index 287e98a7cff4..499f5962c8b0 100644
--- a/drivers/clk/mvebu/armada-37xx-periph.c
+++ b/drivers/clk/mvebu/armada-37xx-periph.c
@@ -416,7 +416,6 @@ static unsigned int armada_3700_pm_dvfs_get_cpu_parent(struct regmap *base)
 static u8 clk_pm_cpu_get_parent(struct clk_hw *hw)
 {
 	struct clk_pm_cpu *pm_cpu = to_clk_pm_cpu(hw);
-	int num_parents = clk_hw_get_num_parents(hw);
 	u32 val;
 
 	if (armada_3700_pm_dvfs_is_enabled(pm_cpu->nb_pm_base)) {
-- 
2.18.0
