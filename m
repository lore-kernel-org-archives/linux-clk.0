Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: Add some more lockdep assertions
Date: Wed,  6 May 2015 18:26:38 -0700
Message-Id: <1430961998-28805-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

We don't check to make sure the enable_lock is held across
enable/disable and we don't check if the prepare_lock is held
across prepare/unprepare. Add some asserts to catch any future
locking problems.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---

Based on clk-next

 drivers/clk/clk.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 8cea0ec7179b..bbc04eae3b92 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -544,6 +544,8 @@ EXPORT_SYMBOL_GPL(__clk_mux_determine_rate_closest);
 
 static void clk_core_unprepare(struct clk_core *core)
 {
+	lockdep_assert_held(&prepare_lock);
+
 	if (!core)
 		return;
 
@@ -590,6 +592,8 @@ static int clk_core_prepare(struct clk_core *core)
 {
 	int ret = 0;
 
+	lockdep_assert_held(&prepare_lock);
+
 	if (!core)
 		return 0;
 
@@ -645,6 +649,8 @@ EXPORT_SYMBOL_GPL(clk_prepare);
 
 static void clk_core_disable(struct clk_core *core)
 {
+	lockdep_assert_held(&enable_lock);
+
 	if (!core)
 		return;
 
@@ -693,6 +699,8 @@ static int clk_core_enable(struct clk_core *core)
 {
 	int ret = 0;
 
+	lockdep_assert_held(&enable_lock);
+
 	if (!core)
 		return 0;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
