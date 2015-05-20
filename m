Return-Path: <shailendra.capricorn@gmail.com>
Return-Path: <shailendra.capricorn@gmail.com>
From: Shailendra Verma <shailendra.capricorn@gmail.com>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Shailendra Verma <shailendra.capricorn@gmail.com>
Subject: [PATCH] clk:clk - Fix typo in comment.
Date: Thu, 21 May 2015 00:06:48 +0530
Message-Id: <1432147008-3702-1-git-send-email-shailendra.capricorn@gmail.com>
List-ID: <linux-clk.vger.kernel.org>


Signed-off-by: Shailendra Verma <shailendra.capricorn@gmail.com>
---
 drivers/clk/clk.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 459ce9d..2b2859f 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2478,7 +2478,7 @@ void __clk_free_clk(struct clk *clk)
  *
  * clk_register is the primary interface for populating the clock tree with new
  * clock nodes.  It returns a pointer to the newly allocated struct clk which
- * cannot be dereferenced by driver code but may be used in conjuction with the
+ * cannot be dereferenced by driver code but may be used in conjunction with the
  * rest of the clock API.  In the event of an error clk_register will return an
  * error code; drivers must test for an error code after calling clk_register.
  */
-- 
1.7.9.5
