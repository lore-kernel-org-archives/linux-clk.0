Return-Path: <k.kozlowski@samsung.com>
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
To: Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-pm@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2] clk: Provide notifier stubs when !COMMON_CLK
Date: Tue, 28 Jun 2016 13:25:04 +0200
Message-id: <1467113104-8650-1-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-clk.vger.kernel.org>

The clk notifier symbols are hidden by COMMON_CLK.  However on some
platforms HAVE_CLK might be set while COMMON_CLK not which leads to
compile test build errors like:

$ make.cross ARCH=sh
   drivers/devfreq/tegra-devfreq.c: In function 'tegra_actmon_rate_notify_cb':
>> drivers/devfreq/tegra-devfreq.c:391:16: error: 'POST_RATE_CHANGE' undeclared (first use in this function)
     if (action != POST_RATE_CHANGE)
                   ^
   drivers/devfreq/tegra-devfreq.c: In function 'tegra_devfreq_probe':
>> drivers/devfreq/tegra-devfreq.c:654:8: error: implicit declaration of function 'clk_notifier_register' [-Werror=implicit-function-declaration]
     err = clk_notifier_register(tegra->emc_clock, &tegra->rate_change_nb);
           ^

Export the macros and data type declarations outside of COMMON_CLK ifdef
and provide stubs to fix the compile testing.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

---

Reported when testing patch [1] on ARCH=sh. I don't have the sh cross
compile toolchain so I cannot verify whether this fixes reported issue.
Tested on similar configuration on MIPS (HAVE_CLK && !COMMON_CLK)

[1] http://www.gossamer-threads.com/lists/linux/kernel/2471798

Changes since v1:
1. The struct clk_notifier_data also has to be visible.
---
 include/linux/clk.h | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/linux/clk.h b/include/linux/clk.h
index 834179f3fa72..123c02788807 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -20,8 +20,6 @@ struct device;
 
 struct clk;
 
-#ifdef CONFIG_COMMON_CLK
-
 /**
  * DOC: clk notifier callback types
  *
@@ -78,6 +76,8 @@ struct clk_notifier_data {
 	unsigned long		new_rate;
 };
 
+#ifdef CONFIG_COMMON_CLK
+
 /**
  * clk_notifier_register: register a clock rate-change notifier callback
  * @clk: clock whose rate we are interested in
@@ -140,6 +140,18 @@ bool clk_is_match(const struct clk *p, const struct clk *q);
 
 #else
 
+static inline int clk_notifier_register(struct clk *clk,
+					struct notifier_block *nb)
+{
+	return -ENOTSUPP;
+}
+
+static inline int clk_notifier_unregister(struct clk *clk,
+					  struct notifier_block *nb)
+{
+	return -ENOTSUPP;
+}
+
 static inline long clk_get_accuracy(struct clk *clk)
 {
 	return -ENOTSUPP;
-- 
1.9.1
