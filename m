Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.131]:45435 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752435AbcCMENl (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Sat, 12 Mar 2016 23:13:41 -0500
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Xing Zheng <zhengxing@rock-chips.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH] clk: rockchip: release io resource when failing to init clk
Date: Sun, 13 Mar 2016 12:13:22 +0800
Message-Id: <1457842402-23765-1-git-send-email-shawn.lin@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

We should call iounmap to relase reg_base since it's not going
to be used any more if failing to init clk.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/clk/rockchip/clk-rk3036.c | 1 +
 drivers/clk/rockchip/clk-rk3188.c | 1 +
 drivers/clk/rockchip/clk-rk3228.c | 1 +
 drivers/clk/rockchip/clk-rk3288.c | 1 +
 drivers/clk/rockchip/clk-rk3368.c | 1 +
 5 files changed, 5 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rk3036.c b/drivers/clk/rockchip/clk-rk3036.c
index 8c683cc..284c36f 100644
--- a/drivers/clk/rockchip/clk-rk3036.c
+++ b/drivers/clk/rockchip/clk-rk3036.c
@@ -453,6 +453,7 @@ static void __init rk3036_clk_init(struct device_node *np)
 	ctx = rockchip_clk_init(np, reg_base, CLK_NR_CLKS);
 	if (IS_ERR(ctx)) {
 		pr_err("%s: rockchip clk init failed\n", __func__);
+		iounmap(reg_base);
 		return;
 	}
 
diff --git a/drivers/clk/rockchip/clk-rk3188.c b/drivers/clk/rockchip/clk-rk3188.c
index 0fcce22..d0e722a 100644
--- a/drivers/clk/rockchip/clk-rk3188.c
+++ b/drivers/clk/rockchip/clk-rk3188.c
@@ -773,6 +773,7 @@ static struct rockchip_clk_provider *__init rk3188_common_clk_init(struct device
 	ctx = rockchip_clk_init(np, reg_base, CLK_NR_CLKS);
 	if (IS_ERR(ctx)) {
 		pr_err("%s: rockchip clk init failed\n", __func__);
+		iounmap(reg_base);
 		return ERR_PTR(-ENOMEM);
 	}
 
diff --git a/drivers/clk/rockchip/clk-rk3228.c b/drivers/clk/rockchip/clk-rk3228.c
index c112b2f..016bdb0 100644
--- a/drivers/clk/rockchip/clk-rk3228.c
+++ b/drivers/clk/rockchip/clk-rk3228.c
@@ -640,6 +640,7 @@ static void __init rk3228_clk_init(struct device_node *np)
 	ctx = rockchip_clk_init(np, reg_base, CLK_NR_CLKS);
 	if (IS_ERR(ctx)) {
 		pr_err("%s: rockchip clk init failed\n", __func__);
+		iounmap(reg_base);
 		return;
 	}
 
diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip/clk-rk3288.c
index d1031d1..39af05a 100644
--- a/drivers/clk/rockchip/clk-rk3288.c
+++ b/drivers/clk/rockchip/clk-rk3288.c
@@ -893,6 +893,7 @@ static void __init rk3288_clk_init(struct device_node *np)
 	ctx = rockchip_clk_init(np, rk3288_cru_base, CLK_NR_CLKS);
 	if (IS_ERR(ctx)) {
 		pr_err("%s: rockchip clk init failed\n", __func__);
+		iounmap(rk3288_cru_base);
 		return;
 	}
 
diff --git a/drivers/clk/rockchip/clk-rk3368.c b/drivers/clk/rockchip/clk-rk3368.c
index 58690f2..3437289 100644
--- a/drivers/clk/rockchip/clk-rk3368.c
+++ b/drivers/clk/rockchip/clk-rk3368.c
@@ -875,6 +875,7 @@ static void __init rk3368_clk_init(struct device_node *np)
 	ctx = rockchip_clk_init(np, reg_base, CLK_NR_CLKS);
 	if (IS_ERR(ctx)) {
 		pr_err("%s: rockchip clk init failed\n", __func__);
+		iounmap(reg_base);
 		return;
 	}
 
-- 
2.3.7


