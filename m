Return-Path: <ralph.sennhauser@gmail.com>
Return-Path: <ralph.sennhauser@gmail.com>
From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory CLEMENT <gregory.clement@free-electrons.com>,
	Ralph Sennhauser <ralph.sennhauser@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: mvebu: add support for 1866MHz variants
Date: Tue, 23 May 2017 23:01:06 +0200
Message-Id: <20170523210106.16307-1-ralph.sennhauser@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

The Linksys WRT3200ACM CPU is clocked at 1866MHz. Add 1866MHz to the
list of supported CPU frequencies. Also update multiplier and divisor
for the l2clk and ddrclk.

Noticed by the following warning:
[    0.000000] Selected CPU frequency (16) unsupported

Signed-off-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>
---

Hi everyone,

This patch was part of a series adding support for the Linksys WRT3200ACM which
got mostly merged already. So this one comes as a stand-alone patch intended
for 4.13.

Thanks
Ralph
---

Changes since v1:

  - Update multipliers for and divisors for l2clk and ddrclk
---
 drivers/clk/mvebu/armada-38x.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mvebu/armada-38x.c b/drivers/clk/mvebu/armada-38x.c
index 8bccf4e..394aa6f 100644
--- a/drivers/clk/mvebu/armada-38x.c
+++ b/drivers/clk/mvebu/armada-38x.c
@@ -49,7 +49,8 @@ static const u32 armada_38x_cpu_frequencies[] __initconst = {
 	0, 0, 0, 0,
 	1066 * 1000 * 1000, 0, 0, 0,
 	1332 * 1000 * 1000, 0, 0, 0,
-	1600 * 1000 * 1000,
+	1600 * 1000 * 1000, 0, 0, 0,
+	1866 * 1000 * 1000,
 };
 
 static u32 __init armada_38x_get_cpu_freq(void __iomem *sar)
@@ -79,7 +80,7 @@ static const int armada_38x_cpu_l2_ratios[32][2] __initconst = {
 	{1, 2}, {0, 1}, {0, 1}, {0, 1},
 	{1, 2}, {0, 1}, {0, 1}, {0, 1},
 	{1, 2}, {0, 1}, {0, 1}, {0, 1},
-	{0, 1}, {0, 1}, {0, 1}, {0, 1},
+	{1, 2}, {0, 1}, {0, 1}, {0, 1},
 	{0, 1}, {0, 1}, {0, 1}, {0, 1},
 	{0, 1}, {0, 1}, {0, 1}, {0, 1},
 	{0, 1}, {0, 1}, {0, 1}, {0, 1},
@@ -90,7 +91,7 @@ static const int armada_38x_cpu_ddr_ratios[32][2] __initconst = {
 	{1, 2}, {0, 1}, {0, 1}, {0, 1},
 	{1, 2}, {0, 1}, {0, 1}, {0, 1},
 	{1, 2}, {0, 1}, {0, 1}, {0, 1},
-	{0, 1}, {0, 1}, {0, 1}, {0, 1},
+	{1, 2}, {0, 1}, {0, 1}, {0, 1},
 	{0, 1}, {0, 1}, {0, 1}, {0, 1},
 	{0, 1}, {0, 1}, {0, 1}, {0, 1},
 	{0, 1}, {0, 1}, {0, 1}, {0, 1},
-- 
2.10.2
