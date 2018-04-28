Return-Path: <shawn.lin@rock-chips.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-clk@vger.kernel.org,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 2/2] clk: clk-conf: Convert to use clk_set_rate_safe()
Date: Sat, 28 Apr 2018 17:16:58 +0800
Message-Id: <1524907018-195819-2-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1524907018-195819-1-git-send-email-shawn.lin@rock-chips.com>
References: <1524907018-195819-1-git-send-email-shawn.lin@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

If assigning clock rate from firmware, make sure any assignment
is safety for the its children.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/clk/clk-conf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
index 49819b5..2dd0305 100644
--- a/drivers/clk/clk-conf.c
+++ b/drivers/clk/clk-conf.c
@@ -107,7 +107,7 @@ static int __set_clk_rates(struct device_node *node, bool clk_supplier)
 				return PTR_ERR(clk);
 			}
 
-			rc = clk_set_rate(clk, rate);
+			rc = clk_set_rate_safe(clk, rate);
 			if (rc < 0)
 				pr_err("clk: couldn't set %s clk rate to %u (%d), current rate: %lu\n",
 				       __clk_get_name(clk), rate, rc,
-- 
1.9.1
