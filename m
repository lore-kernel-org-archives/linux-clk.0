Return-Path: <axel.lin@ingics.com>
Return-Path: <axel.lin@ingics.com>
Message-ID: <1434785223.6159.3.camel@ingics.com>
Subject: [PATCH] clk: h8300: Fix signness bug
From: Axel Lin <axel.lin@ingics.com>
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd
 <sboyd@codeaurora.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
	uclinux-h8-devel@lists.sourceforge.jp, "linux-clk@vger.kernel.org"
	 <linux-clk@vger.kernel.org>
Date: Sat, 20 Jun 2015 15:27:03 +0800
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

of_clk_get_parent_count() may return negative error code, so num_parents
needs to be int rather than unsigned int.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/clk/h8300/clk-div.c     | 2 +-
 drivers/clk/h8300/clk-h8s2678.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/h8300/clk-div.c b/drivers/clk/h8300/clk-div.c
index 56f9eba..e13d5c3 100644
--- a/drivers/clk/h8300/clk-div.c
+++ b/drivers/clk/h8300/clk-div.c
@@ -15,7 +15,7 @@ static DEFINE_SPINLOCK(clklock);
 
 static void __init h8300_div_clk_setup(struct device_node *node)
 {
-	unsigned int num_parents;
+	int num_parents;
 	struct clk *clk;
 	const char *clk_name = node->name;
 	const char *parent_name;
diff --git a/drivers/clk/h8300/clk-h8s2678.c b/drivers/clk/h8300/clk-h8s2678.c
index 4701b093..26c07aa 100644
--- a/drivers/clk/h8300/clk-h8s2678.c
+++ b/drivers/clk/h8300/clk-h8s2678.c
@@ -84,7 +84,7 @@ static const struct clk_ops pll_ops = {
 
 static void __init h8s2678_pll_clk_setup(struct device_node *node)
 {
-	unsigned int num_parents;
+	int num_parents;
 	struct clk *clk;
 	const char *clk_name = node->name;
 	const char *parent_name;
-- 
2.1.0
