Return-Path: <aisheng.dong@nxp.com>
From: Dong Aisheng <aisheng.dong@nxp.com>
To: <linux-clk@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<sboyd@codeaurora.org>, <mturquette@baylibre.com>, Dong Aisheng
	<aisheng.dong@nxp.com>
Subject: [RFC PATCH V1 2/2] clk: add lock for clk_core_is_enabled
Date: Fri, 22 Dec 2017 17:46:05 +0800
Message-ID: <1513935965-12909-2-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1513935965-12909-1-git-send-email-aisheng.dong@nxp.com>
References: <1513935965-12909-1-git-send-email-aisheng.dong@nxp.com>
Return-Path: aisheng.dong@nxp.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

According to design doc, .is_enabled should be protected by enable lock.
Then users don't have to protect it against enable/disable operation
in clock drivers.

See: Documentation/clk.txt
"The enable lock is a spinlock and is held across calls to the .enable,
.disable and .is_enabled operations."

Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/clk.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index e24968f..d6e2d5c 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -198,14 +198,19 @@ static bool clk_core_is_prepared(struct clk_core *core)
 
 static bool clk_core_is_enabled(struct clk_core *core)
 {
+	unsigned long flags;
 	bool ret = false;
 
+	flags = clk_enable_lock();
+
 	/*
 	 * .is_enabled is only mandatory for clocks that gate
 	 * fall back to software usage counter if .is_enabled is missing
 	 */
-	if (!core->ops->is_enabled)
+	if (!core->ops->is_enabled) {
+		clk_enable_unlock(flags);
 		return core->enable_count;
+	}
 
 	/*
 	 * Check if clock controller's device is runtime active before
@@ -230,6 +235,8 @@ static bool clk_core_is_enabled(struct clk_core *core)
 	if (core->dev)
 		pm_runtime_put(core->dev);
 
+	clk_enable_unlock(flags);
+
 	return ret;
 }
 
-- 
2.7.4
