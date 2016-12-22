Return-Path: <thomas.petazzoni@free-electrons.com>
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org
Cc: Nadav Haklai <nadavh@marvell.com>,
	Hanna Hawa <hannah@marvell.com>,
	Yehuda Yitschak <yehuday@marvell.com>,
	Jason Cooper <jason@lakedaemon.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH] clk: mvebu: adjust AP806 CPU clock frequencies to production chip
Date: Thu, 22 Dec 2016 13:08:14 +0100
Message-Id: <1482408494-7429-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

This commit adjusts the list of possible "Sample At Reset" values that
define the CPU clock frequency of the AP806 (part of Marvell Armada
7K/8K) to the values that have been validated with the production
chip. Earlier values were preliminary.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 drivers/clk/mvebu/ap806-system-controller.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mvebu/ap806-system-controller.c b/drivers/clk/mvebu/ap806-system-controller.c
index 02023ba..962e0c5 100644
--- a/drivers/clk/mvebu/ap806-system-controller.c
+++ b/drivers/clk/mvebu/ap806-system-controller.c
@@ -55,21 +55,39 @@ static int ap806_syscon_clk_probe(struct platform_device *pdev)
 
 	freq_mode = reg & AP806_SAR_CLKFREQ_MODE_MASK;
 	switch (freq_mode) {
-	case 0x0 ... 0x5:
+	case 0x0:
+	case 0x1:
 		cpuclk_freq = 2000;
 		break;
-	case 0x6 ... 0xB:
+	case 0x6:
+	case 0x7:
 		cpuclk_freq = 1800;
 		break;
-	case 0xC ... 0x11:
+	case 0x4:
+	case 0xB:
+	case 0xD:
 		cpuclk_freq = 1600;
 		break;
-	case 0x12 ... 0x16:
+	case 0x1a:
 		cpuclk_freq = 1400;
 		break;
-	case 0x17 ... 0x19:
+	case 0x14:
+	case 0x17:
 		cpuclk_freq = 1300;
 		break;
+	case 0x19:
+		cpuclk_freq = 1200;
+		break;
+	case 0x13:
+	case 0x1d:
+		cpuclk_freq = 1000;
+		break;
+	case 0x1c:
+		cpuclk_freq = 800;
+		break;
+	case 0x1b:
+		cpuclk_freq = 600;
+		break;
 	default:
 		dev_err(&pdev->dev, "invalid SAR value\n");
 		return -EINVAL;
-- 
2.7.4
