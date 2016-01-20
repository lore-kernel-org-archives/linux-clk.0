Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.133]:33611 "EHLO
	regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753283AbcATIh2 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 20 Jan 2016 03:37:28 -0500
From: Xing Zheng <zhengxing@rock-chips.com>
To: linux-rockchip@lists.infradead.org
Cc: keescook@google.com, leozwang@google.com, heiko@sntech.de,
	Xing Zheng <zhengxing@rock-chips.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: rockchip: rk3036: Add apll as the critical clock
Date: Wed, 20 Jan 2016 16:37:17 +0800
Message-Id: <1453279037-23971-1-git-send-email-zhengxing@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The apll may be closed if there are some child clock nodes below
it when the device startup. Therefore, the apll should be keep
critical.

The apll tree like this:
    pll_apll
       apll
          armclk
             pclk_dbg
             aclk_core_pre
          aclk_hvec
          uart_pll_clk
             uart2_src
                uart2_frac
             uart1_src
                uart1_frac
             uart0_src
                uart0_frac

Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
---

 drivers/clk/rockchip/clk-rk3036.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3036.c b/drivers/clk/rockchip/clk-rk3036.c
index ebce980..483913b 100644
--- a/drivers/clk/rockchip/clk-rk3036.c
+++ b/drivers/clk/rockchip/clk-rk3036.c
@@ -425,6 +425,7 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 };
 
 static const char *const rk3036_critical_clocks[] __initconst = {
+	"apll",
 	"aclk_cpu",
 	"aclk_peri",
 	"hclk_peri",
-- 
1.7.9.5


