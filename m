Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: Remove CLK_IS_ROOT flag
Date: Wed,  1 Jun 2016 14:58:08 -0700
Message-Id: <20160601215808.31787-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Now that we've gotten rid of all the users of this flag we can
retire the number, leaving a slot open for a future flag user.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 include/linux/clk-provider.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 0c72204c75fc..fb39d5add173 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -25,7 +25,7 @@
 #define CLK_SET_PARENT_GATE	BIT(1) /* must be gated across re-parent */
 #define CLK_SET_RATE_PARENT	BIT(2) /* propagate rate change up one level */
 #define CLK_IGNORE_UNUSED	BIT(3) /* do not gate even if unused */
-#define CLK_IS_ROOT		BIT(4) /* Deprecated: Don't use */
+				/* unused */
 #define CLK_IS_BASIC		BIT(5) /* Basic clk, can't do a to_clk_foo() */
 #define CLK_GET_RATE_NOCACHE	BIT(6) /* do not use the cached clk rate */
 #define CLK_SET_RATE_NO_REPARENT BIT(7) /* don't re-parent on rate change */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
