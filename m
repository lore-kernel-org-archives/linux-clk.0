Return-Path: <vz@mleia.com>
From: Vladimir Zapolskiy <vz@mleia.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <kernel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Fabio Estevam <fabio.estevam@nxp.com>,
	Alexander Stein <alexander.stein@systec-electronic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: imx31: fix potential stack corruption on clock initialization
Date: Mon, 19 Sep 2016 04:48:28 +0300
Message-Id: <1474249708-11088-1-git-send-email-vz@mleia.com>
List-ID: <linux-clk.vger.kernel.org>

Function mx31_clocks_init() is called during clock intialization on
legacy boards with reference clock frequency passed as its input
argument, this can be verified by examination of the function
declaration found in arch/arm/mach-imx/common.h and actual function
users which include that header file.

Fixes: d9388c843237 ("clk: imx31: Do not call mxc_timer_init twice when booting with DT")
Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 drivers/clk/imx/clk-imx31.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/imx/clk-imx31.c b/drivers/clk/imx/clk-imx31.c
index 6a96414..6a49ba2 100644
--- a/drivers/clk/imx/clk-imx31.c
+++ b/drivers/clk/imx/clk-imx31.c
@@ -157,10 +157,8 @@ static void __init _mx31_clocks_init(unsigned long fref)
 	}
 }
 
-int __init mx31_clocks_init(void)
+int __init mx31_clocks_init(unsigned long fref)
 {
-	u32 fref = 26000000; /* default */
-
 	_mx31_clocks_init(fref);
 
 	clk_register_clkdev(clk[gpt_gate], "per", "imx-gpt.0");
-- 
2.8.1
