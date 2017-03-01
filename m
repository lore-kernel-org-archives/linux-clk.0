Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v3 2/2] clk: rockchip: Make uartpll a child of the gpll on rk3036
Date: Wed,  1 Mar 2017 22:00:42 +0100
Message-Id: <20170301210042.11352-3-heiko@sntech.de>
In-Reply-To: <20170301210042.11352-1-heiko@sntech.de>
References: <20170301210042.11352-1-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

The shared uart-pll is on boot a child of the apll that can get changed
by cpu frequency scaling. So move it away to the more stable gpll to
make sure the uart doesn't break on cpu frequency changes.

This turned up during the 4.11 merge-window when commit
6a171b299379 ("serial: 8250_dw: Allow hardware flow control to be used")
added general termios enablement making the uart on rk3036 change
frequency and thus making it susceptible for the frequency scaling issue.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3036.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rk3036.c b/drivers/clk/rockchip/clk-rk3036.c
index dcde70f4c105..00d4150e33c3 100644
--- a/drivers/clk/rockchip/clk-rk3036.c
+++ b/drivers/clk/rockchip/clk-rk3036.c
@@ -450,6 +450,13 @@ static void __init rk3036_clk_init(struct device_node *np)
 		return;
 	}
 
+	/*
+	 * Make uart_pll_clk a child of the gpll, as all other sources are
+	 * not that usable / stable.
+	 */
+	writel_relaxed(HIWORD_UPDATE(0x2, 0x3, 10),
+		       reg_base + RK2928_CLKSEL_CON(13));
+
 	ctx = rockchip_clk_init(np, reg_base, CLK_NR_CLKS);
 	if (IS_ERR(ctx)) {
 		pr_err("%s: rockchip clk init failed\n", __func__);
-- 
2.11.0
