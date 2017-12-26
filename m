Return-Path: <david@lechnology.com>
From: David Lechner <david@lechnology.com>
To: linux-clk@vger.kernel.org
Cc: David Lechner <david@lechnology.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: fix reentrancy of clk_enable() on UP systems
Date: Tue, 26 Dec 2017 11:24:22 -0600
Message-Id: <1514309062-1768-1-git-send-email-david@lechnology.com>
List-ID: <linux-clk.vger.kernel.org>

Reentrant calls to clk_enable() are not working on UP systems. This is
caused by the fact spin_trylock_irqsave() always returns true when
CONFIG_SMP=n (and CONFIG_DEBUG_SPINLOCK=n) which causes the reference
counting to not work correctly when clk_enable_lock() is called twice
before clk_enable_unlock() is called (this happens when clk_enable()
is called from within another clk_enable()).

This introduces a new set of clk_enable_lock() and clk_enable_unlock()
functions for UP systems that doesn't use spinlocks but effectively does
the same thing as the SMP version of the functions.

Signed-off-by: David Lechner <david@lechnology.com>
---

Previous discussion of this issue for reference:
* https://patchwork.kernel.org/patch/10108437/
* https://patchwork.kernel.org/patch/10115483/


 drivers/clk/clk.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index bb1b1f9..259a77f 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -136,6 +136,8 @@ static void clk_prepare_unlock(void)
 	mutex_unlock(&prepare_lock);
 }
 
+#ifdef CONFIG_SMP
+
 static unsigned long clk_enable_lock(void)
 	__acquires(enable_lock)
 {
@@ -170,6 +172,43 @@ static void clk_enable_unlock(unsigned long flags)
 	spin_unlock_irqrestore(&enable_lock, flags);
 }
 
+#else
+
+static unsigned long clk_enable_lock(void)
+	__acquires(enable_lock)
+{
+	unsigned long flags;
+
+	local_irq_save(flags);
+	preempt_disable();
+	__acquire(enable_lock);
+
+	if (enable_refcnt++ == 0) {
+		WARN_ON_ONCE(enable_owner != NULL);
+		enable_owner = current;
+	} else {
+		WARN_ON_ONCE(enable_owner != current);
+	}
+
+	return flags;
+}
+
+static void clk_enable_unlock(unsigned long flags)
+	__releases(enable_lock)
+{
+	WARN_ON_ONCE(enable_owner != current);
+	WARN_ON_ONCE(enable_refcnt == 0);
+
+	if (--enable_refcnt == 0)
+		enable_owner = NULL;
+
+	__release(enable_lock);
+	local_irq_restore(flags);
+	preempt_enable();
+}
+
+#endif
+
 static bool clk_core_is_prepared(struct clk_core *core)
 {
 	bool ret = false;
-- 
2.7.4
