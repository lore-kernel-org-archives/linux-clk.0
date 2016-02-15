Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.130]:47329 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751949AbcBODiO (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Sun, 14 Feb 2016 22:38:14 -0500
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 5/6] clk: rockchip: fix coding style for clk-cpu.c
Date: Mon, 15 Feb 2016 11:33:50 +0800
Message-Id: <1455507230-13120-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1455507153-12914-1-git-send-email-shawn.lin@rock-chips.com>
References: <1455507153-12914-1-git-send-email-shawn.lin@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Fix the issue reported by checkpatch:
ERROR: space prohibited before that ',' (ctx:WxW)
+               writel(clksel->val , cpuclk->reg_base + clksel->reg);

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/clk/rockchip/clk-cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-cpu.c b/drivers/clk/rockchip/clk-cpu.c
index 68a2a87..4e73ed5 100644
--- a/drivers/clk/rockchip/clk-cpu.c
+++ b/drivers/clk/rockchip/clk-cpu.c
@@ -116,7 +116,7 @@ static void rockchip_cpuclk_set_dividers(struct rockchip_cpuclk *cpuclk,
 
 		pr_debug("%s: setting reg 0x%x to 0x%x\n",
 			 __func__, clksel->reg, clksel->val);
-		writel(clksel->val , cpuclk->reg_base + clksel->reg);
+		writel(clksel->val, cpuclk->reg_base + clksel->reg);
 	}
 }
 
-- 
2.3.7


