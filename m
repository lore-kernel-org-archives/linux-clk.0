Return-Path: <rklein@nvidia.com>
From: Rhyland Klein <rklein@nvidia.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
CC: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH] clk: clk_register: Correctly initialize enable_count
Date: Tue, 9 Feb 2016 17:48:40 -0500
Message-ID: <1455058120-7398-1-git-send-email-rklein@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: rklein@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

When clocks are registered, they could be enabled already in
hardware. As of now, the enable count will start at 0. When this
happens, it means a clock is enabled and the framework doesn't know
that, so it will always report it as disabled.

After the first call of clk_enable(), the enable_count will be
correct, as it will simply try to enable an already enabled clock.

However, in some instances, some clocks may be left on from the boot
logic and because of the enable_count is inaccurate, drivers won't be
able to simply use clk_disable() to turn it off.

This patch will correctly set the enable_count to 1 if the clk is
already on when it is registered. This allows clk_disable to work as
expected.

To prevent the situation where the enable_count is always 1 greater
than the number of calls to clk_enable() for that clk, we add a flag
which will prevent incrementing enable_count the first time someone
calls clk_enable() for a clk that was on at boot.

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
Perhaps this code should be something optional right now? I can't test
all boards that use this framework, and some boards may be using the
clocks that are on but thought off without realizing it.

 drivers/clk/clk.c            | 18 +++++++++++++++++-
 include/linux/clk-provider.h |  1 +
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index bb01ed6cc63e..70d5ae7dd7a5 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -682,6 +682,8 @@ static void clk_core_disable(struct clk_core *core)
 	if (--core->enable_count > 0)
 		return;
 
+	core->flags &= ~CLK_BOOT_ON_FIRST_ENABLE;
+
 	trace_clk_disable(core);
 
 	if (core->ops->disable)
@@ -729,7 +731,8 @@ static int clk_core_enable(struct clk_core *core)
 	if (WARN_ON(core->prepare_count == 0))
 		return -ESHUTDOWN;
 
-	if (core->enable_count == 0) {
+	if (core->enable_count == 0 ||
+	    (core->flags & CLK_BOOT_ON_FIRST_ENABLE)) {
 		ret = clk_core_enable(core->parent);
 
 		if (ret)
@@ -748,6 +751,10 @@ static int clk_core_enable(struct clk_core *core)
 		}
 	}
 
+	if (core->flags & CLK_BOOT_ON_FIRST_ENABLE) {
+		core->flags &= ~CLK_BOOT_ON_FIRST_ENABLE;
+		return 0;
+	}
 	core->enable_count++;
 	return 0;
 }
@@ -2513,6 +2520,15 @@ struct clk *clk_register(struct device *dev, struct clk_hw *hw)
 	core->max_rate = ULONG_MAX;
 	hw->core = core;
 
+	/* clocks can be enabled before being registered. This makes
+	 * their enable_count inherently incorrect. During register,
+	 * check to see if the clk is already enabled.
+	 */
+	if (clk_core_is_enabled(core)) {
+		core->enable_count++;
+		core->flags |= CLK_BOOT_ON_FIRST_ENABLE;
+	}
+
 	/* allocate local copy in case parent_names is __initdata */
 	core->parent_names = kcalloc(core->num_parents, sizeof(char *),
 					GFP_KERNEL);
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index fabe5bedbba6..dacc28ebbf96 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -32,6 +32,7 @@
 #define CLK_GET_ACCURACY_NOCACHE BIT(8) /* do not use the cached clk accuracy */
 #define CLK_RECALC_NEW_RATES	BIT(9) /* recalc rates after notifications */
 #define CLK_SET_RATE_UNGATE	BIT(10) /* clock needs to run to set rate */
+#define CLK_BOOT_ON_FIRST_ENABLE BIT(11) /* clk on at boot, skip 1st enable */
 
 struct clk;
 struct clk_hw;
-- 
1.9.1
