Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.132]:36776 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751033AbcFCAyx (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 2 Jun 2016 20:54:53 -0400
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
	Xing Zheng <zhengxing@rock-chips.com>,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 1/2] clk: rockchip: release io resource when failing to init clk
Date: Fri,  3 Jun 2016 08:54:18 +0800
Message-Id: <1464915258-10838-1-git-send-email-shawn.lin@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

We should call iounmap to relase reg_base since it's not going
to be used any more if failing to init clk.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/clk/rockchip/clk-rk3399.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk-rk3399.c
index b6742fa..37c74cb 100644
--- a/drivers/clk/rockchip/clk-rk3399.c
+++ b/drivers/clk/rockchip/clk-rk3399.c
@@ -1509,6 +1509,7 @@ static void __init rk3399_clk_init(struct device_node *np)
 	ctx = rockchip_clk_init(np, reg_base, CLK_NR_CLKS);
 	if (IS_ERR(ctx)) {
 		pr_err("%s: rockchip clk init failed\n", __func__);
+		iounmap(reg_base);
 		return;
 	}
 
@@ -1562,6 +1563,7 @@ static void __init rk3399_pmu_clk_init(struct device_node *np)
 	ctx = rockchip_clk_init(np, reg_base, CLKPMU_NR_CLKS);
 	if (IS_ERR(ctx)) {
 		pr_err("%s: rockchip pmu clk init failed\n", __func__);
+		iounmap(reg_base);
 		return;
 	}
 
-- 
2.3.7


