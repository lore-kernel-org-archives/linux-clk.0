Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:32776 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755773AbeASPSb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Jan 2018 10:18:31 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>, Heiko Stuebner <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] pinctrl: sunxi: Use of_clk_get_parent_count() instead of open coding
Date: Fri, 19 Jan 2018 16:18:19 +0100
Message-Id: <1516375101-29836-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1516375101-29836-1-git-send-email-geert+renesas@glider.be>
References: <1516375101-29836-1-git-send-email-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 4b6cb25bc796f86d..ab425eb45bf5e0f4 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -12,6 +12,7 @@
 
 #include <linux/io.h>
 #include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/gpio/driver.h>
 #include <linux/irqdomain.h>
 #include <linux/irqchip/chained_irq.h>
@@ -1185,7 +1186,7 @@ static int sunxi_pinctrl_setup_debounce(struct sunxi_pinctrl *pctl,
 	int i, ret;
 
 	/* Deal with old DTs that didn't have the oscillators */
-	if (of_count_phandle_with_args(node, "clocks", "#clock-cells") != 3)
+	if (of_clk_get_parent_count(node) != 3)
 		return 0;
 
 	/* If we don't have any setup, bail out */
-- 
2.7.4

