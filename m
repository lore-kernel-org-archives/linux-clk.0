Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Michael Turquette <mturquette@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: sboyd@codeaurora.org, lee.jones@linaro.org,
	maxime.ripard@free-electrons.com, s.hauer@pengutronix.de,
	geert@linux-m68k.org, Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH RFC RFT 3/3] clk: introduce CLK_ENABLE_HAND_OFF flag
Date: Fri,  7 Aug 2015 12:09:30 -0700
Message-Id: <1438974570-20812-4-git-send-email-mturquette@baylibre.com>
In-Reply-To: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Some clocks are critical to system operation (e.g. cpu, memory, etc) and
should not be gated until a driver that knows best claims such a clock
and expressly gates that clock through the normal clk.h api.

The typical way to handle this is for the clk driver or some other early
code to call clk_prepare_enable on this important clock as soon as it is
registered and before the clk_disable_unused garbage collector kicks in.

This patch introduces a formal way to handle this scenario that is
provided by the clk framework. Clk driver authors can set the
CLK_ENABLE_HAND_OFF flag in their clk data, which will cause the clk to
be enabled in clk_register(). Then when the first clk consumer driver
comes along and calls clk_get() & clk_prepare_enable(), the reference
counts taken during clk registration are transfered (or handed off) to
the clk consumer.

At this point handling the clk is the same as any other clock which as
not set the new CLK_ENABLE_HAND_OFF flag. In fact no changes to any
clock consumer driver are needed for this to work.

Signed-off-by: Michael Turquette <mturquette@baylibre.com>
---
 drivers/clk/clk.c            | 61 +++++++++++++++++++++++++++++++++++++++++---
 include/linux/clk-provider.h |  3 +++
 2 files changed, 60 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 6ec0f77..a3fdeab 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -59,6 +59,8 @@ struct clk_core {
 	unsigned long		flags;
 	unsigned int		enable_count;
 	unsigned int		prepare_count;
+	bool			need_handoff_enable;
+	bool			need_handoff_prepare;
 	unsigned long		min_rate;
 	unsigned long		max_rate;
 	unsigned long		accuracy;
@@ -656,16 +658,31 @@ static int clk_core_prepare(struct clk_core *core)
  */
 int clk_prepare(struct clk *clk)
 {
-	int ret;
+	int ret = 0;
 
 	if (!clk)
 		return 0;
 
 	clk_prepare_lock();
 	clk->prepare_count++;
+
+	/*
+	 * setting CLK_ENABLE_HAND_OFF flag triggers this conditional
+	 *
+	 * need_handoff_prepare implies this clk was already prepared by
+	 * __clk_init. now we have a proper user, so unset the flag in our
+	 * internal bookkeeping. See CLK_ENABLE_HAND_OFF flag in clk-provider.h
+	 * for details.
+	 */
+	if (clk->core->need_handoff_prepare) {
+		clk->core->need_handoff_prepare = false;
+		goto out;
+	}
+
 	ret = clk_core_prepare(clk->core);
-	clk_prepare_unlock();
 
+out:
+	clk_prepare_unlock();
 	return ret;
 }
 EXPORT_SYMBOL_GPL(clk_prepare);
@@ -772,16 +789,31 @@ static int clk_core_enable(struct clk_core *core)
 int clk_enable(struct clk *clk)
 {
 	unsigned long flags;
-	int ret;
+	int ret = 0;
 
 	if (!clk)
 		return 0;
 
 	flags = clk_enable_lock();
 	clk->enable_count++;
+
+	/*
+	 * setting CLK_ENABLE_HAND_OFF flag triggers this conditional
+	 *
+	 * need_handoff_enable implies this clk was already enabled by
+	 * __clk_init. now we have a proper user, so unset the flag in our
+	 * internal bookkeeping. See CLK_ENABLE_HAND_OFF flag in clk-provider.h
+	 * for details.
+	 */
+	if (clk->core->need_handoff_enable) {
+		clk->core->need_handoff_enable = false;
+		goto out;
+	}
+
 	ret = clk_core_enable(clk->core);
-	clk_enable_unlock(flags);
 
+out:
+	clk_enable_unlock(flags);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(clk_enable);
@@ -2447,6 +2479,27 @@ static int __clk_init(struct device *dev, struct clk *clk_user)
 	if (core->ops->init)
 		core->ops->init(core->hw);
 
+	/*
+	 * enable clocks with the CLK_ENABLE_HAND_OFF flag set
+	 *
+	 * This flag causes the framework to enable the clock at registration
+	 * time, which is sometimes necessary for clocks that would cause a
+	 * system crash when gated (e.g. cpu, memory, etc). The prepare_count
+	 * is migrated over to the first clk consumer to call clk_prepare().
+	 * Similarly the clk's enable_count is migrated to the first consumer
+	 * to call clk_enable().
+	 */
+	if (core->flags & CLK_ENABLE_HAND_OFF) {
+		core->need_handoff_prepare = true;
+		core->need_handoff_enable = true;
+		ret = clk_core_prepare(core);
+		if (ret)
+			goto out;
+		clk_core_enable(core);
+		if (ret)
+			goto out;
+	}
+
 	kref_init(&core->ref);
 out:
 	clk_prepare_unlock();
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 06a56e5..0230900 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -31,6 +31,9 @@
 #define CLK_SET_RATE_NO_REPARENT BIT(7) /* don't re-parent on rate change */
 #define CLK_GET_ACCURACY_NOCACHE BIT(8) /* do not use the cached clk accuracy */
 #define CLK_RECALC_NEW_RATES	BIT(9) /* recalc rates after notifications */
+#define CLK_ENABLE_HAND_OFF	BIT(10) /* enable clock when registered.
+					   hand-off enable_count & prepare_count
+					   to first consumer that enables clk */
 
 struct clk;
 struct clk_hw;
-- 
1.9.1

