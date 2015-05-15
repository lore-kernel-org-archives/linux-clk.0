Return-Path: <jim2101024@gmail.com>
From: Jim Quinlan <jim2101024@gmail.com>
To: <mturquette@linaro.org>, <linux-clk@vger.kernel.org>
CC: <bcm-kernel-feedback-list@broadcom.com>, Jim Quinlan
	<jim2101024@gmail.com>
Subject: [PATCH] clk: export function clk_disable_unused()
Date: Fri, 15 May 2015 18:22:36 -0400
Message-ID: <1431728556-620-1-git-send-email-jim2101024@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: jim2101024@gmail.com
List-ID: <linux-clk.vger.kernel.org>

For Broadcom STB chips, clocks may come up after resume in an "on"
state, so calling clk_disable_unused() again will turn off unused
clocks.  This commit exports clk_disable_unused() so it may be
called in such cases.

Signed-off-by: Jim Quinlan <jim2101024@gmail.com>
---
 drivers/clk/clk.c   | 2 +-
 include/linux/clk.h | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 459ce9d..4469f8b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -549,7 +549,7 @@ static int __init clk_ignore_unused_setup(char *__unused)
 }
 __setup("clk_ignore_unused", clk_ignore_unused_setup);
 
-static int clk_disable_unused(void)
+int clk_disable_unused(void)
 {
 	struct clk_core *clk;
 
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 68c16a6..c03822c 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -265,6 +265,14 @@ int clk_enable(struct clk *clk);
 void clk_disable(struct clk *clk);
 
 /**
+ * clk_disable_unused - turns off unused clocks.
+ *
+ * This is already called as a late initcall, but may be
+ * called again in special cases such as resuming from S3.
+ */
+int clk_disable_unused(void);
+
+/**
  * clk_get_rate - obtain the current clock rate (in Hz) for a clock source.
  *		  This is only valid once the clock source has been enabled.
  * @clk: clock source
-- 
1.9.0.138.g2de3478
