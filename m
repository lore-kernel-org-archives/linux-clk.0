Return-Path: <rklein@nvidia.com>
From: Rhyland Klein <rklein@nvidia.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>
CC: Mike Turquette <mturquette@linaro.org>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Alexandre Courbot <gnurou@gmail.com>,
	Bill Huang <bilhuang@nvidia.com>,
	Paul Walmsley <pwalmsley@nvidia.com>,
	Jim Lin <jilin@nvidia.com>,
	Benson Leung <bleung@chromium.org>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 15/21] clk: tegra: pll: Add dyn_ramp callback
Date: Tue, 12 May 2015 13:23:58 -0400
Message-ID: <1431451444-23155-17-git-send-email-rklein@nvidia.com>
In-Reply-To: <1431451444-23155-1-git-send-email-rklein@nvidia.com>
References: <1431451444-23155-1-git-send-email-rklein@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: rklein@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

From: Bill Huang <bilhuang@nvidia.com>

Add a callback to the pll_params for custom dynamic ramping
functions which can be specified per PLL.

Signed-off-by: Bill Huang <bilhuang@nvidia.com>
---
 drivers/clk/tegra/clk.h |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 330729a822cf..a61d388364b3 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -160,6 +160,8 @@ struct div_nmp {
 
 #define MAX_PLL_MISC_REG_COUNT	6
 
+struct tegra_clk_pll;
+
 /**
  * struct tegra_clk_pll_params - PLL parameters
  *
@@ -271,6 +273,8 @@ struct tegra_clk_pll_params {
 			unsigned long rate, unsigned long parent_rate);
 	unsigned long	(*adjust_vco)(struct tegra_clk_pll_params *pll_params,
 				unsigned long parent_rate);
+	int	(*dyn_ramp)(struct tegra_clk_pll *pll,
+			struct tegra_clk_pll_freq_table *cfg);
 };
 
 #define TEGRA_PLL_USE_LOCK BIT(0)
-- 
1.7.9.5
