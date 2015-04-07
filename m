Return-Path: <jy0922.shim@samsung.com>
From: Joonyoung Shim <jy0922.shim@samsung.com>
To: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, mturquette@linaro.org, sboyd@codeaurora.org,
 haojian.zhuang@gmail.com, james.hogan@imgtec.com, jy0922.shim@samsung.com
Subject: [PATCH 1/2] clk: divider: don't set_rate with CLK_DIVIDER_READ_ONLY
 flag
Date: Tue, 07 Apr 2015 16:46:45 +0900
Message-id: <1428392806-14538-1-git-send-email-jy0922.shim@samsung.com>
List-ID: <linux-clk.vger.kernel.org>

Even if use CLK_DIVIDER_READ_ONLY flag, divider setting can be changed
by set_rate callback. Don't change divider setting from set_rate
callback of divider with CLK_DIVIDER_READ_ONLY flag.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
---
 drivers/clk/clk-divider.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 25006a8..ce34d29a 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -384,6 +384,9 @@ static int clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 	unsigned long flags = 0;
 	u32 val;
 
+	if (divider->flags & CLK_DIVIDER_READ_ONLY)
+		return 0;
+
 	value = divider_get_val(rate, parent_rate, divider->table,
 				divider->width, divider->flags);
 
-- 
1.9.1
