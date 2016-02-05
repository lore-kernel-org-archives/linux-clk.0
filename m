Return-Path: <jonathanh@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
To: Rhyland Klein <rklein@nvidia.com>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Alexandre Courbot <gnurou@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org ,
	linux-tegra@vger.kernel.org ,
	linux-kernel@vger.kernel.org ,
	Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] clk: tegra: Fix divider settings for Tegra210 pll_a
Date: Fri, 5 Feb 2016 14:01:37 +0000
Message-ID: <1454680897-9464-1-git-send-email-jonathanh@nvidia.com>
MIME-Version: 1.0
Return-Path: jonathanh@nvidia.com
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

When setting the pll_a frequency, to what should be 368639844 Hz, the
actual output frequency of the pll is 737279687 Hz (as reported by the
debugfs clk_summary entry), which is double the expect frequency. The
calculations for the pll frequency appear to be correct and the problem
is caused by incorrect divider settings for the pll_a in the look-up
table of multipliers and dividers. The P dividers for all entries in the
table are all one less than they should be. Fix this by increasing the
value of the P dividers by 1 to get the expected rates.

The rates in the table have been verified using the following equations:

1. Integer NDIV (SDM_DIN = 0)
   fout = (fref * n) / (m * p)

2. Fractional NDIV
   fout = (fref * (n + 0.5 + (SDM_DIN/8192))) / (m * p)

Where SDM_DIN is a signed 16-bit value between 0xf000 and 0x1000.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---

Thierry, Rhyland, please note that after this change, the pll_a settings
match those in the nvidia downstream 3.18 kernel for Tegra210.

 drivers/clk/tegra/clk-tegra210.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 637041fd53ad..5e0652d4876b 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -1761,15 +1761,15 @@ static struct div_nmp plla_nmp = {
 };
 
 static struct tegra_clk_pll_freq_table pll_a_freq_table[] = {
-	{ 12000000, 282240000, 47, 1, 1, 1, 0xf148 }, /* actual: 282240234 */
-	{ 12000000, 368640000, 61, 1, 1, 1, 0xfe15 }, /* actual: 368640381 */
-	{ 12000000, 240000000, 60, 1, 2, 1,      0 },
-	{ 13000000, 282240000, 43, 1, 1, 1, 0xfd7d }, /* actual: 282239807 */
-	{ 13000000, 368640000, 56, 1, 1, 1, 0x06d8 }, /* actual: 368640137 */
-	{ 13000000, 240000000, 55, 1, 2, 1,      0 }, /* actual: 238.3 MHz */
-	{ 38400000, 282240000, 44, 3, 1, 1, 0xf333 }, /* actual: 282239844 */
-	{ 38400000, 368640000, 57, 3, 1, 1, 0x0333 }, /* actual: 368639844 */
-	{ 38400000, 240000000, 75, 3, 3, 1,      0 },
+	{ 12000000, 282240000, 47, 1, 2, 1, 0xf148 }, /* actual: 282240234 */
+	{ 12000000, 368640000, 61, 1, 2, 1, 0xfe15 }, /* actual: 368640381 */
+	{ 12000000, 240000000, 60, 1, 3, 1,      0 },
+	{ 13000000, 282240000, 43, 1, 2, 1, 0xfd7d }, /* actual: 282239807 */
+	{ 13000000, 368640000, 56, 1, 2, 1, 0x06d8 }, /* actual: 368640137 */
+	{ 13000000, 240000000, 55, 1, 3, 1,      0 }, /* actual: 238.3 MHz */
+	{ 38400000, 282240000, 44, 3, 2, 1, 0xf333 }, /* actual: 282239844 */
+	{ 38400000, 368640000, 57, 3, 2, 1, 0x0333 }, /* actual: 368639844 */
+	{ 38400000, 240000000, 75, 3, 4, 1,      0 },
 	{        0,         0,  0, 0, 0, 0,      0 },
 };
 
-- 
2.1.4
