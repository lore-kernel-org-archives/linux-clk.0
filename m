Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Rhyland Klein <rklein@nvidia.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>
CC: Mike Turquette <mturquette@linaro.org>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Alexandre Courbot <gnurou@gmail.com>,
	Bill Huang <bilhuang@nvidia.com>, Jim Lin <jilin@nvidia.com>,
	Benson Leung <bleung@chromium.org>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v6 23/25] clk: tegra: fix WARN_ON in PLL_RE registration
Date: Thu, 18 Jun 2015 17:28:38 -0400
Message-ID: <1434662920-21469-24-git-send-email-rklein@nvidia.com>
In-Reply-To: <1434662920-21469-1-git-send-email-rklein@nvidia.com>
References: <1434662920-21469-1-git-send-email-rklein@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Bill Huang <bilhuang@nvidia.com>

This fixes two things.

- Read the correct IDDQ register
- Check the correct IDDQ bit position

Signed-off-by: Bill Huang <bilhuang@nvidia.com>
Reviewed-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 61bd15f9478d..932a18ce821f 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -1722,7 +1722,8 @@ struct clk *tegra_clk_register_pllre(const char *name, const char *parent_name,
 
 	val = pll_readl_base(pll);
 	if (val & PLL_BASE_ENABLE)
-		WARN_ON(val & pll_params->iddq_bit_idx);
+		WARN_ON(readl_relaxed(clk_base + pll_params->iddq_reg) &
+				BIT(pll_params->iddq_bit_idx));
 	else {
 		int m;
 
-- 
1.7.9.5

