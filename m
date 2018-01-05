Return-Path: <david@lechnology.com>
From: David Lechner <david@lechnology.com>
To: linux-clk@vger.kernel.org
Cc: David Lechner <david@lechnology.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: fix reentrancy of clk_enable() on UP systems
Date: Thu,  4 Jan 2018 19:46:08 -0600
Message-Id: <1515116768-17089-1-git-send-email-david@lechnology.com>
List-ID: <linux-clk.vger.kernel.org>

Reentrant calls to clk_enable() are not working on UP systems. This is
caused by the fact spin_trylock_irqsave() always returns true when
CONFIG_SMP=n (and CONFIG_DEBUG_SPINLOCK=n) which causes the reference
counting to not work correctly when clk_enable_lock() is called twice
before clk_enable_unlock() is called (this happens when clk_enable()
is called from within another clk_enable()).

This fixes the problem by skipping the call to spin_trylock_irqsave() on UP
systems and relying solely on reference counting. We also make sure to set
flags in this case so that we are not returning an uninitialized value.

Suggested-by: Stephen Boyd <sboyd@codeaurora.org>
Signed-off-by: David Lechner <david@lechnology.com>
---

v2 changes:
* Use fix suggested by Stephen Boyd

 drivers/clk/clk.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 83c8df7..5add75b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -143,10 +143,18 @@ static unsigned long clk_enable_lock(void)
 {
 	unsigned long flags;
 
-	if (!spin_trylock_irqsave(&enable_lock, flags)) {
+	/*
+	 * On UP systems, spin_trylock_irqsave() always returns true, even if
+	 * we already hold the lock. So, in that case, we rely only on
+	 * reference counting.
+	 */
+	if (!IS_ENABLED(CONFIG_SMP) ||
+	    !spin_trylock_irqsave(&enable_lock, flags)) {
 		if (enable_owner == current) {
 			enable_refcnt++;
 			__acquire(enable_lock);
+			if (!IS_ENABLED(CONFIG_SMP))
+				local_save_flags(flags);
 			return flags;
 		}
 		spin_lock_irqsave(&enable_lock, flags);
-- 
2.7.4
