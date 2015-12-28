Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.138]:49802 "EHLO
	regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751184AbbL1JEO (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 28 Dec 2015 04:04:14 -0500
From: Xing Zheng <zhengxing@rock-chips.com>
To: heiko@sntech.de
Cc: keescook@google.com, leozwang@google.com,
	linux-rockchip@lists.infradead.org,
	Xing Zheng <zhengxing@rock-chips.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v1 2/4] clk: rockchip: rk3036: fix uarts clock error
Date: Mon, 28 Dec 2015 17:03:51 +0800
Message-Id: <1451293433-32392-3-git-send-email-zhengxing@rock-chips.com>
In-Reply-To: <1451293433-32392-1-git-send-email-zhengxing@rock-chips.com>
References: <1451293433-32392-1-git-send-email-zhengxing@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Due to a copy-paste error the uart1 and uart2 clock div set
incorrect, we should to fix it.

Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
---

 drivers/clk/rockchip/clk-rk3036.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3036.c b/drivers/clk/rockchip/clk-rk3036.c
index d4ea7b6..47fe35b 100644
--- a/drivers/clk/rockchip/clk-rk3036.c
+++ b/drivers/clk/rockchip/clk-rk3036.c
@@ -222,11 +222,11 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 			RK2928_CLKSEL_CON(13), 0, 7, DFLAGS,
 			RK2928_CLKGATE_CON(1), 8, GFLAGS),
 	COMPOSITE_NOMUX(0, "uart1_src", "uart_pll_clk", 0,
-			RK2928_CLKSEL_CON(13), 0, 7, DFLAGS,
-			RK2928_CLKGATE_CON(1), 8, GFLAGS),
+			RK2928_CLKSEL_CON(14), 0, 7, DFLAGS,
+			RK2928_CLKGATE_CON(1), 10, GFLAGS),
 	COMPOSITE_NOMUX(0, "uart2_src", "uart_pll_clk", 0,
-			RK2928_CLKSEL_CON(13), 0, 7, DFLAGS,
-			RK2928_CLKGATE_CON(1), 8, GFLAGS),
+			RK2928_CLKSEL_CON(15), 0, 7, DFLAGS,
+			RK2928_CLKGATE_CON(1), 12, GFLAGS),
 	COMPOSITE_FRAC(0, "uart0_frac", "uart0_src", CLK_SET_RATE_PARENT,
 			RK2928_CLKSEL_CON(17), 0,
 			RK2928_CLKGATE_CON(1), 9, GFLAGS),
-- 
1.7.9.5


