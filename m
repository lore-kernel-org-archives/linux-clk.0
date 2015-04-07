Return-Path: <jy0922.shim@samsung.com>
From: Joonyoung Shim <jy0922.shim@samsung.com>
To: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, mturquette@linaro.org, sboyd@codeaurora.org,
 haojian.zhuang@gmail.com, james.hogan@imgtec.com, jy0922.shim@samsung.com
Subject: [PATCH 2/2] clk: divider: fix to set parent rate from
 CLK_DIVIDER_READ_ONLY flag
Date: Tue, 07 Apr 2015 16:46:46 +0900
Message-id: <1428392806-14538-2-git-send-email-jy0922.shim@samsung.com>
In-reply-to: <1428392806-14538-1-git-send-email-jy0922.shim@samsung.com>
References: <1428392806-14538-1-git-send-email-jy0922.shim@samsung.com>
List-ID: <linux-clk.vger.kernel.org>

The round_rate callback function will returns alway same parent clk rate
of divider with CLK_DIVIDER_READ_ONLY flag. If be used
CLK_SET_RATE_PARENT flag with CLK_DIVIDER_READ_ONLY flag, then never
change parent clk rate anymore.

>From this case, this patch allows to change parent clk rate.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
---
 drivers/clk/clk-divider.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index ce34d29a..37e285e 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -352,6 +352,11 @@ static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
 		bestdiv = readl(divider->reg) >> divider->shift;
 		bestdiv &= div_mask(divider->width);
 		bestdiv = _get_div(divider->table, bestdiv, divider->flags);
+
+		if ((__clk_get_flags(hw->clk) & CLK_SET_RATE_PARENT))
+			*prate = __clk_round_rate(__clk_get_parent(hw->clk),
+						  rate);
+
 		return DIV_ROUND_UP(*prate, bestdiv);
 	}
 
-- 
1.9.1
