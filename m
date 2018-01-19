Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:57048 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755749AbeASPSb (ORCPT
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
Subject: [PATCH 3/3] soc/tegra: pmc: Use of_clk_get_parent_count() instead of open coding
Date: Fri, 19 Jan 2018 16:18:21 +0100
Message-Id: <1516375101-29836-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1516375101-29836-1-git-send-email-geert+renesas@glider.be>
References: <1516375101-29836-1-git-send-email-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

As of_clk_get_parent_count() returns zero on failure, while
of_count_phandle_with_args() might return a negative error code, this
also fixes the issue of possibly using a very big number in the
allocation below.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/tegra/pmc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index ce62a47a6647a817..4379e4d602bc5428 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -21,6 +21,7 @@
 
 #include <linux/kernel.h>
 #include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/clk/tegra.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
@@ -743,7 +744,7 @@ static int tegra_powergate_of_get_clks(struct tegra_powergate *pg,
 	unsigned int i, count;
 	int err;
 
-	count = of_count_phandle_with_args(np, "clocks", "#clock-cells");
+	count = of_clk_get_parent_count(np);
 	if (count == 0)
 		return -ENODEV;
 
-- 
2.7.4

