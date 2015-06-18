Return-Path: <rklein@nvidia.com>
From: Rhyland Klein <rklein@nvidia.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>
CC: Mike Turquette <mturquette@linaro.org>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Alexandre Courbot <gnurou@gmail.com>,
	Bill Huang <bilhuang@nvidia.com>,
	Jim Lin <jilin@nvidia.com>,
	Benson Leung <bleung@chromium.org>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v6 07/25] clk: tegra: pll-params: change misc_reg count from 3 -> 6
Date: Thu, 18 Jun 2015 17:28:22 -0400
Message-ID: <1434662920-21469-8-git-send-email-rklein@nvidia.com>
In-Reply-To: <1434662920-21469-1-git-send-email-rklein@nvidia.com>
References: <1434662920-21469-1-git-send-email-rklein@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: rklein@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

From: Bill Huang <bilhuang@nvidia.com>

New SoC's may have more then 3 MISC registers, so bump up the
array size and use a #define to be more informative about the value.

Reviewed-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Bill Huang <bilhuang@nvidia.com>
Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/clk/tegra/clk.h |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index eeb735e3fa72..e11951e5f846 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -156,6 +156,8 @@ struct div_nmp {
 	u8		override_divp_shift;
 };
 
+#define MAX_PLL_MISC_REG_COUNT	6
+
 /**
  * struct tegra_clk_pll_params - PLL parameters
  *
@@ -225,7 +227,7 @@ struct tegra_clk_pll_params {
 	u32		iddq_bit_idx;
 	u32		aux_reg;
 	u32		dyn_ramp_reg;
-	u32		ext_misc_reg[3];
+	u32		ext_misc_reg[MAX_PLL_MISC_REG_COUNT];
 	u32		pmc_divnm_reg;
 	u32		pmc_divp_reg;
 	u32		flags;
-- 
1.7.9.5
