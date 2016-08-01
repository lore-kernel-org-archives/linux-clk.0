Return-Path: <zhengxing@rock-chips.com>
From: Xing Zheng <zhengxing@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	dianders@chromium.org,
	briannorris@chromium.org,
	huangtao@rock-chips.com,
	zhangqing@rock-chips.com,
	Xing Zheng <zhengxing@rock-chips.com>,
	frank.wang@rock-chips.com,
	wulf@rock-chips.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] clk: rockchip: rk3399: export 480M_SRC clock id for usbphy0/usbphy1
Date: Mon,  1 Aug 2016 17:33:31 +0800
Message-Id: <1470044016-29764-3-git-send-email-zhengxing@rock-chips.com>
In-Reply-To: <1470044016-29764-1-git-send-email-zhengxing@rock-chips.com>
References: <1470044016-29764-1-git-send-email-zhengxing@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

Export these source clocks for usbphy.

Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>

---

Changes in v2: None

 drivers/clk/rockchip/clk-rk3399.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk-rk3399.c
index 78e51cb..f55f967f 100644
--- a/drivers/clk/rockchip/clk-rk3399.c
+++ b/drivers/clk/rockchip/clk-rk3399.c
@@ -403,9 +403,9 @@ static struct rockchip_clk_branch rk3399_clk_branches[] __initdata = {
 	GATE(SCLK_USB2PHY1_REF, "clk_usb2phy1_ref", "xin24m", CLK_IGNORE_UNUSED,
 			RK3399_CLKGATE_CON(6), 6, GFLAGS),
 
-	GATE(0, "clk_usbphy0_480m_src", "clk_usbphy0_480m", CLK_IGNORE_UNUSED,
+	GATE(SCLK_USBPHY0_480M_SRC, "clk_usbphy0_480m_src", "clk_usbphy0_480m", CLK_IGNORE_UNUSED,
 			RK3399_CLKGATE_CON(13), 12, GFLAGS),
-	GATE(0, "clk_usbphy1_480m_src", "clk_usbphy1_480m", CLK_IGNORE_UNUSED,
+	GATE(SCLK_USBPHY1_480M_SRC, "clk_usbphy1_480m_src", "clk_usbphy1_480m", CLK_IGNORE_UNUSED,
 			RK3399_CLKGATE_CON(13), 12, GFLAGS),
 	MUX(0, "clk_usbphy_480m", mux_usbphy_480m_p, CLK_IGNORE_UNUSED,
 			RK3399_CLKSEL_CON(14), 6, 1, MFLAGS),
-- 
1.7.9.5
