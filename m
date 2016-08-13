Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: mturquette@baylibre.com, sboyd@codeaurora.org, heiko@sntech.de
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [v.1] clk:clk-rockchip:-of_iomap failed to remap then abort clock initialization.
Date: Sat, 13 Aug 2016 20:56:18 +0530
Message-Id: <1471101978-1881-1-git-send-email-arvind.yadav.cs@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

-check return of 'of_iomap'.if It's falied to remap then abort.

-Unmap a region obtained by remap. iounmap frees the mapping when failed
to allocate the memory.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/clk/rockchip/clk-rockchip.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rockchip.c b/drivers/clk/rockchip/clk-rockchip.c
index 4cf838d5..2c9bb81 100644
--- a/drivers/clk/rockchip/clk-rockchip.c
+++ b/drivers/clk/rockchip/clk-rockchip.c
@@ -49,14 +49,19 @@ static void __init rk2928_gate_clk_init(struct device_node *node)
 	}
 
 	reg = of_iomap(node, 0);
+	if (!reg)
+		return;
 
 	clk_data = kzalloc(sizeof(struct clk_onecell_data), GFP_KERNEL);
-	if (!clk_data)
+	if (!clk_data) {
+		iounmap(reg);
 		return;
+	}
 
 	clk_data->clks = kzalloc(qty * sizeof(struct clk *), GFP_KERNEL);
 	if (!clk_data->clks) {
 		kfree(clk_data);
+		iounmap(reg);
 		return;
 	}
 
-- 
2.7.4
