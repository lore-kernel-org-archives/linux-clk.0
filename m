Return-Path: <bhumirks@gmail.com>
Return-Path: <bhumirks@gmail.com>
From: Bhumika Goyal <bhumirks@gmail.com>
To: julia.lawall@lip6.fr,
	pdeschrijver@nvidia.com,
	pgaikwad@nvidia.com,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: keescook@chromium.org,
	Bhumika Goyal <bhumirks@gmail.com>
Subject: [PATCH] clk: tegra30: make tegra_clk_pll_params __ro_after_init
Date: Tue,  3 Oct 2017 01:42:08 +0530
Message-Id: <1506975128-16514-1-git-send-email-bhumirks@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

These structures are only passed to the functions tegra_clk_register_pll,
tegra_clk_register_pll{e/u} or tegra_periph_clk_init during the init
phase. These functions modify the structures only during the init phase
and after that the structures are never modified. Therefore, make them
__ro_after_init.

Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
---
 drivers/clk/tegra/clk-tegra30.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index a2d163f..1ce7d76 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -359,7 +359,7 @@
 };
 
 /* PLL parameters */
-static struct tegra_clk_pll_params pll_c_params = {
+static struct tegra_clk_pll_params pll_c_params __ro_after_init = {
 	.input_min = 2000000,
 	.input_max = 31000000,
 	.cf_min = 1000000,
@@ -388,7 +388,7 @@
 	.override_divp_shift = 15,
 };
 
-static struct tegra_clk_pll_params pll_m_params = {
+static struct tegra_clk_pll_params pll_m_params __ro_after_init = {
 	.input_min = 2000000,
 	.input_max = 31000000,
 	.cf_min = 1000000,
@@ -409,7 +409,7 @@
 		 TEGRA_PLL_HAS_LOCK_ENABLE | TEGRA_PLL_FIXED,
 };
 
-static struct tegra_clk_pll_params pll_p_params = {
+static struct tegra_clk_pll_params pll_p_params __ro_after_init = {
 	.input_min = 2000000,
 	.input_max = 31000000,
 	.cf_min = 1000000,
@@ -444,7 +444,7 @@
 		 TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
-static struct tegra_clk_pll_params pll_d_params = {
+static struct tegra_clk_pll_params pll_d_params __ro_after_init = {
 	.input_min = 2000000,
 	.input_max = 40000000,
 	.cf_min = 1000000,
@@ -461,7 +461,7 @@
 		 TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
-static struct tegra_clk_pll_params pll_d2_params = {
+static struct tegra_clk_pll_params pll_d2_params __ro_after_init = {
 	.input_min = 2000000,
 	.input_max = 40000000,
 	.cf_min = 1000000,
@@ -478,7 +478,7 @@
 		 TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
-static struct tegra_clk_pll_params pll_u_params = {
+static struct tegra_clk_pll_params pll_u_params __ro_after_init = {
 	.input_min = 2000000,
 	.input_max = 40000000,
 	.cf_min = 1000000,
@@ -496,7 +496,7 @@
 		 TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
-static struct tegra_clk_pll_params pll_x_params = {
+static struct tegra_clk_pll_params pll_x_params __ro_after_init = {
 	.input_min = 2000000,
 	.input_max = 31000000,
 	.cf_min = 1000000,
@@ -513,7 +513,7 @@
 		 TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
-static struct tegra_clk_pll_params pll_e_params = {
+static struct tegra_clk_pll_params pll_e_params __ro_after_init = {
 	.input_min = 12000000,
 	.input_max = 216000000,
 	.cf_min = 12000000,
-- 
1.9.1
