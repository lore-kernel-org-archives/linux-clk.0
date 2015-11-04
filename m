Return-Path: <nicolas.pitre@linaro.org>
Return-Path: <nicolas.pitre@linaro.org>
Date: Tue, 3 Nov 2015 21:49:15 -0500 (EST)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
To: Peter De Schrijver <pdeschrijver@nvidia.com>,
    Prashant Gaikwad <pgaikwad@nvidia.com>,
    Michael Turquette <mturquette@baylibre.com>
cc: linux-clk@vger.kernel.org
Subject: [PATCH] tegra/clk-divider: fix wrong do_div() usage
Message-ID: <alpine.LFD.2.20.1511032144380.630@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

do_div() is meant to be used with an unsigned dividend.

Signed-off-by: Nicolas Pitre <nico@linaro.org>

diff --git a/drivers/clk/tegra/clk-divider.c b/drivers/clk/tegra/clk-divider.c
index 48c83efda4..16e0aee147 100644
--- a/drivers/clk/tegra/clk-divider.c
+++ b/drivers/clk/tegra/clk-divider.c
@@ -32,7 +32,7 @@
 static int get_div(struct tegra_clk_frac_div *divider, unsigned long rate,
 		   unsigned long parent_rate)
 {
-	s64 divider_ux1 = parent_rate;
+	u64 divider_ux1 = parent_rate;
 	u8 flags = divider->flags;
 	int mul;
 
@@ -54,7 +54,7 @@ static int get_div(struct tegra_clk_frac_div *divider, unsigned long rate,
 
 	divider_ux1 -= mul;
 
-	if (divider_ux1 < 0)
+	if ((s64)divider_ux1 < 0)
 		return 0;
 
 	if (divider_ux1 > get_max_div(divider))
