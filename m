Return-Path: <bilhuang@nvidia.com>
From: Bill Huang <bilhuang@nvidia.com>
To: pdeschrijver@nvidia.com
CC: mturquette@linaro.org,
	swarren@wwwdotorg.org,
	thierry.reding@gmail.com,
	pwalmsley@nvidia.com,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bill Huang <bilhuang@nvidia.com>
Subject: [PATCH 1/1] clk: tegra: fix WARN_ON in PLL_RE registration
Date: Fri, 15 May 2015 20:07:33 +0800
Message-ID: <1431691653-17615-1-git-send-email-bilhuang@nvidia.com>
MIME-Version: 1.0
Return-Path: bilhuang@nvidia.com
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

This fixes two things.

- Read the correct IDDQ register
- Check the correct IDDQ bit position

Signed-off-by: Bill Huang <bilhuang@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 05c6d08..734340e 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -1630,7 +1630,8 @@ struct clk *tegra_clk_register_pllre(const char *name, const char *parent_name,
 
 	val = pll_readl_base(pll);
 	if (val & PLL_BASE_ENABLE)
-		WARN_ON(val & pll_params->iddq_bit_idx);
+		WARN_ON(readl_relaxed(clk_base + pll_params->iddq_reg) &
+				BIT(pll_params->iddq_bit_idx));
 	else {
 		int m;
 
-- 
1.9.1
