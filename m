Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.140]:53998 "EHLO
	regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751904AbbL1JEP (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 28 Dec 2015 04:04:15 -0500
From: Xing Zheng <zhengxing@rock-chips.com>
To: heiko@sntech.de
Cc: keescook@google.com, leozwang@google.com,
	linux-rockchip@lists.infradead.org,
	Xing Zheng <zhengxing@rock-chips.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v1 3/4] clk: rockchip: rk3036: rename emac ext source clock
Date: Mon, 28 Dec 2015 17:03:52 +0800
Message-Id: <1451293433-32392-4-git-send-email-zhengxing@rock-chips.com>
In-Reply-To: <1451293433-32392-1-git-send-email-zhengxing@rock-chips.com>
References: <1451293433-32392-1-git-send-email-zhengxing@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

There is only support rmii in the RK3036, so we should use the correct
ext clock name.

Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
---

 drivers/clk/rockchip/clk-rk3036.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3036.c b/drivers/clk/rockchip/clk-rk3036.c
index 47fe35b..7420cbe 100644
--- a/drivers/clk/rockchip/clk-rk3036.c
+++ b/drivers/clk/rockchip/clk-rk3036.c
@@ -133,7 +133,7 @@ PNAME(mux_spdif_p)	= { "spdif_src", "spdif_frac", "xin12m" };
 PNAME(mux_uart0_p)	= { "uart0_src", "uart0_frac", "xin24m" };
 PNAME(mux_uart1_p)	= { "uart1_src", "uart1_frac", "xin24m" };
 PNAME(mux_uart2_p)	= { "uart2_src", "uart2_frac", "xin24m" };
-PNAME(mux_mac_p)	= { "mac_pll_src", "ext_gmac" };
+PNAME(mux_mac_p)	= { "mac_pll_src", "rmii_clkin" };
 PNAME(mux_dclk_p)	= { "dclk_lcdc", "dclk_cru" };
 
 static struct rockchip_pll_clock rk3036_pll_clks[] __initdata = {
-- 
1.7.9.5


