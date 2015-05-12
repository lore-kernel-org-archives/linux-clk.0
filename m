Return-Path: <rklein@nvidia.com>
From: Rhyland Klein <rklein@nvidia.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>
CC: Mike Turquette <mturquette@linaro.org>, Stephen Warren
	<swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding
	<thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Bill Huang
	<bilhuang@nvidia.com>, Paul Walmsley <pwalmsley@nvidia.com>, Jim Lin
	<jilin@nvidia.com>, Benson Leung <bleung@chromium.org>,
	<linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Thierry Reding <treding@nvidia.com>
Subject: [PATCH v5 01/21] FROMLIST: clk: tegra: Update struct tegra_clk_pll_params kerneldoc
Date: Tue, 12 May 2015 13:23:44 -0400
Message-ID: <1431451444-23155-3-git-send-email-rklein@nvidia.com>
In-Reply-To: <1431451444-23155-1-git-send-email-rklein@nvidia.com>
References: <1431451444-23155-1-git-send-email-rklein@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: rklein@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

From: Thierry Reding <treding@nvidia.com>

Benson Leung pointed out that the kerneldoc for this structure has
become stale. Update the field descriptions to match the structure
content.

Reported-by: Benson Leung <bleung@chromium.org>
Acked-by: Rhyland Klein <rklein@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Reviewed-by: Benson Leung <bleung@chromium.org>
---
 drivers/clk/tegra/clk.h |   18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 9da799849e04..a4e6c8180968 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -157,7 +157,7 @@ struct div_nmp {
 };
 
 /**
- * struct clk_pll_params - PLL parameters
+ * struct tegra_clk_pll_params - PLL parameters
  *
  * @input_min:			Minimum input frequency
  * @input_max:			Maximum input frequency
@@ -168,12 +168,24 @@ struct div_nmp {
  * @base_reg:			PLL base reg offset
  * @misc_reg:			PLL misc reg offset
  * @lock_reg:			PLL lock reg offset
- * @lock_bit_idx:		Bit index for PLL lock status
+ * @lock_mask:			Bitmask for PLL lock status
  * @lock_enable_bit_idx:	Bit index to enable PLL lock
+ * @iddq_reg:			PLL IDDQ register offset
+ * @iddq_bit_idx:		Bit index to enable PLL IDDQ
+ * @aux_reg:			AUX register offset
+ * @dyn_ramp_reg:		Dynamic ramp control register offset
+ * @ext_misc_reg:		Miscellaneous control register offsets
+ * @pmc_divnm_reg:		n, m divider PMC override register offset (PLLM)
+ * @pmc_divp_reg:		p divider PMC override register offset (PLLM)
+ * @flags:			PLL flags
+ * @stepa_shift:		Dynamic ramp step A field shift
+ * @stepb_shift:		Dynamic ramp step B field shift
  * @lock_delay:			Delay in us if PLL lock is not used
+ * @max_p:			maximum value for the p divider
+ * @pdiv_tohw:			mapping of p divider to register values
+ * @div_nmp:			offsets and widths on n, m and p fields
  * @freq_table:			array of frequencies supported by PLL
  * @fixed_rate:			PLL rate if it is fixed
- * @flags:			PLL flags
  *
  * Flags:
  * TEGRA_PLL_USE_LOCK - This flag indicated to use lock bits for
-- 
1.7.9.5
