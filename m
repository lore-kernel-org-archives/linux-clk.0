Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.141]:48483 "EHLO
	regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753652AbcEZNtt (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 26 May 2016 09:49:49 -0400
From: Xing Zheng <zhengxing@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Xing Zheng <zhengxing@rock-chips.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: rockchip: fix cclk error handing
Date: Thu, 26 May 2016 21:49:08 +0800
Message-Id: <1464270549-12713-1-git-send-email-zhengxing@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

It maybe due to a copy-paste error the error handing should be
cclk not clk.

Reported-by: Lin Huang <lin.huang@rock-chips.com>
Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
---

 drivers/clk/rockchip/clk-cpu.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-cpu.c b/drivers/clk/rockchip/clk-cpu.c
index 4bb130c..05b3d73 100644
--- a/drivers/clk/rockchip/clk-cpu.c
+++ b/drivers/clk/rockchip/clk-cpu.c
@@ -321,9 +321,9 @@ struct clk *rockchip_clk_register_cpuclk(const char *name,
 	}
 
 	cclk = clk_register(NULL, &cpuclk->hw);
-	if (IS_ERR(clk)) {
+	if (IS_ERR(cclk)) {
 		pr_err("%s: could not register cpuclk %s\n", __func__,	name);
-		ret = PTR_ERR(clk);
+		ret = PTR_ERR(cclk);
 		goto free_rate_table;
 	}
 
-- 
1.7.9.5


