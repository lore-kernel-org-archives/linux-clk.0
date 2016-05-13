Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH] clk: fix critical clock locking
Date: Fri, 13 May 2016 10:00:31 +0200
Message-Id: <1463126431-29071-1-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

The critical clock handling in __clk_core_init isn't taking the enable lock
before calling clk_core_enable, which in turns triggers the warning in the
lockdep_assert_held call in that function when lockep is enabled.

Add the calls to clk_enable_lock/unlock to make sure it doesn't happen.

Fixes: 32b9b1096186 ("clk: Allow clocks to be marked as CRITICAL")
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

---
Changes from v1:
  - Removed the redundant prepare lock

 drivers/clk/clk.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ce39add5a258..d584004f7af7 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2404,8 +2404,13 @@ static int __clk_core_init(struct clk_core *core)
 		core->ops->init(core->hw);
 
 	if (core->flags & CLK_IS_CRITICAL) {
+		unsigned long flags;
+
 		clk_core_prepare(core);
+
+		flags = clk_enable_lock();
 		clk_core_enable(core);
+		clk_enable_unlock(flags);
 	}
 
 	kref_init(&core->ref);
-- 
2.8.2
