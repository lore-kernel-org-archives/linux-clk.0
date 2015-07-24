Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: Silence warnings about lock imbalances
Date: Fri, 24 Jul 2015 12:31:56 -0700
Message-Id: <1437766316-19587-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The recursive spinlock implementation trips up sparse and it
complains that these functions have lock imbalances. That isn't
really true though, so add some __acquires() and __releases()
information so that sparse is quiet.

drivers/clk/clk.c:116:22: warning: context imbalance in 'clk_enable_lock' - wrong count at exit
drivers/clk/clk.c:141:9: warning: context imbalance in 'clk_enable_unlock' - unexpected unlock

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 67f778bd093b..7bb975747a2c 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -114,12 +114,14 @@ static void clk_prepare_unlock(void)
 }
 
 static unsigned long clk_enable_lock(void)
+	__acquires(enable_lock)
 {
 	unsigned long flags;
 
 	if (!spin_trylock_irqsave(&enable_lock, flags)) {
 		if (enable_owner == current) {
 			enable_refcnt++;
+			__acquire(enable_lock);
 			return flags;
 		}
 		spin_lock_irqsave(&enable_lock, flags);
@@ -132,12 +134,15 @@ static unsigned long clk_enable_lock(void)
 }
 
 static void clk_enable_unlock(unsigned long flags)
+	__releases(enable_lock)
 {
 	WARN_ON_ONCE(enable_owner != current);
 	WARN_ON_ONCE(enable_refcnt == 0);
 
-	if (--enable_refcnt)
+	if (--enable_refcnt) {
+		__release(enable_lock);
 		return;
+	}
 	enable_owner = NULL;
 	spin_unlock_irqrestore(&enable_lock, flags);
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

