Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	uclinux-h8-devel@lists.sourceforge.jp
Subject: [PATCH 4/9] clk: h8300: Remove impossible check for of_clk_get_parent_count()
Date: Mon, 22 Feb 2016 12:54:42 -0800
Message-Id: <1456174487-28397-5-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456174487-28397-1-git-send-email-sboyd@codeaurora.org>
References: <1456174487-28397-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The checks for < 1 can be simplified now that
of_clk_get_parent_count() returns an unsigned int. Update the
code to reflect the int to unsigned int change.

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: <uclinux-h8-devel@lists.sourceforge.jp>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/h8300/clk-div.c     | 4 ++--
 drivers/clk/h8300/clk-h8s2678.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/h8300/clk-div.c b/drivers/clk/h8300/clk-div.c
index d71d01157dbb..5ecc0664e33c 100644
--- a/drivers/clk/h8300/clk-div.c
+++ b/drivers/clk/h8300/clk-div.c
@@ -13,7 +13,7 @@ static DEFINE_SPINLOCK(clklock);
 
 static void __init h8300_div_clk_setup(struct device_node *node)
 {
-	int num_parents;
+	unsigned int num_parents;
 	struct clk *clk;
 	const char *clk_name = node->name;
 	const char *parent_name;
@@ -22,7 +22,7 @@ static void __init h8300_div_clk_setup(struct device_node *node)
 	int offset;
 
 	num_parents = of_clk_get_parent_count(node);
-	if (num_parents < 1) {
+	if (!num_parents) {
 		pr_err("%s: no parent found", clk_name);
 		return;
 	}
diff --git a/drivers/clk/h8300/clk-h8s2678.c b/drivers/clk/h8300/clk-h8s2678.c
index 6cf38dc1c929..c9c2fd575ef7 100644
--- a/drivers/clk/h8300/clk-h8s2678.c
+++ b/drivers/clk/h8300/clk-h8s2678.c
@@ -83,7 +83,7 @@ static const struct clk_ops pll_ops = {
 
 static void __init h8s2678_pll_clk_setup(struct device_node *node)
 {
-	int num_parents;
+	unsigned int num_parents;
 	struct clk *clk;
 	const char *clk_name = node->name;
 	const char *parent_name;
@@ -91,7 +91,7 @@ static void __init h8s2678_pll_clk_setup(struct device_node *node)
 	struct clk_init_data init;
 
 	num_parents = of_clk_get_parent_count(node);
-	if (num_parents < 1) {
+	if (!num_parents) {
 		pr_err("%s: no parent found", clk_name);
 		return;
 	}
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
