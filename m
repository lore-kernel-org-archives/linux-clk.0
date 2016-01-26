Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-lb0-f195.google.com ([209.85.217.195]:36657 "EHLO
	mail-lb0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965414AbcAZNeM (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jan 2016 08:34:12 -0500
From: Alexander Kochetkov <al.kochet@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: stable@vger.kernel.org, Alexander Kochetkov <al.kochet@gmail.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: rockchip: add hclk_cpubus to the list of rk3188 critical clocks
Date: Tue, 26 Jan 2016 16:34:00 +0300
Message-Id: <1453815240-15354-1-git-send-email-al.kochet@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

hclk_cpubus needs to keep running because it is needed for devices like
the rom, i2s0 or spdif to be accessible via cpu. Without that all
accesses to devices (readl/writel) return wrong data. So add it
to the list of critical clocks.

Fixes: 78eaf6095cc763c ("clk: rockchip: disable unused clocks")

Signed-off-by: Alexander Kochetkov <al.kochet@gmail.com>

CC: linux-clk@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: stable@vger.kernel.org # 4.1.x-
---
 drivers/clk/rockchip/clk-rk3188.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3188.c b/drivers/clk/rockchip/clk-rk3188.c
index abb4760..fe728f8 100644
--- a/drivers/clk/rockchip/clk-rk3188.c
+++ b/drivers/clk/rockchip/clk-rk3188.c
@@ -718,6 +718,7 @@ static const char *const rk3188_critical_clocks[] __initconst = {
 	"hclk_peri",
 	"pclk_cpu",
 	"pclk_peri",
+	"hclk_cpubus"
 };
 
 static void __init rk3188_common_clk_init(struct device_node *np)
-- 
1.7.9.5

