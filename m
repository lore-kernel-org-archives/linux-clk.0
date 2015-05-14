Return-Path: <Aisheng.Dong@freescale.com>
From: Dong Aisheng <aisheng.dong@freescale.com>
To: <linux-clk@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <sboyd@codeaurora.org>,
	<mturquette@linaro.org>, <shawn.guo@linaro.org>, <b29396@freescale.com>,
	<linux-arm-kernel@lists.infradead.org>, <Ranjani.Vaidyanathan@freescale.com>,
	<b20596@freescale.com>, <r64343@freescale.com>, <b20788@freescale.com>
Subject: [PATCH v2 4/5] clk: core: add CLK_OPS_PARENT_ON flags to support clocks require parent on
Date: Thu, 14 May 2015 21:29:02 +0800
Message-ID: <1431610143-21853-5-git-send-email-aisheng.dong@freescale.com>
In-Reply-To: <1431610143-21853-1-git-send-email-aisheng.dong@freescale.com>
References: <1431610143-21853-1-git-send-email-aisheng.dong@freescale.com>
Return-Path: aisheng.dong@freescale.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

On Freescale i.MX7D platform, all clocks operations, including
enable/disable, rate change and re-parent, requires its parent
clock on. Current clock core can not support it well.
This patch introduce a new flag CLK_OPS_PARENT_ON to handle this
special case in clock core that enable its parent clock firstly for
each operation and disable it later after operation complete.

This patch fixes disaling clocks while its parent is off.
This is a special case that is caused by a state mis-align between
HW and SW in clock tree during booting.
Usually in uboot, we may enable all clocks in HW by default.
And during kernel booting time, the parent clock could be disabled in its
driver probe due to calling clk_prepare_enable and clk_disable_unprepare.
Because it's child clock is only enabled in HW while its SW usecount
in clock tree is still 0, so clk_disable of parent clock will gate
the parent clock in both HW and SW usecount ultimately.
Then there will be a clock is on in HW while its parent is disabled.

Later when clock core does clk_disable_unused, this clock disable
will cause system hang due to the limitation of operation requiring
its parent clock on.

Cc: Mike Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Signed-off-by: Dong Aisheng <aisheng.dong@freescale.com>
---
 drivers/clk/clk.c            | 5 +++++
 include/linux/clk-provider.h | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 597d6d2..44a2f55 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -736,6 +736,9 @@ static void clk_disable_unused_subtree(struct clk_core *core)
 	hlist_for_each_entry(child, &core->children, child_node)
 		clk_disable_unused_subtree(child);
 
+	if (core->flags & CLK_OPS_PARENT_ON)
+		clk_core_prepare_enable(core->parent);
+
 	flags = clk_enable_lock();
 
 	if (core->enable_count)
@@ -760,6 +763,8 @@ static void clk_disable_unused_subtree(struct clk_core *core)
 
 unlock_out:
 	clk_enable_unlock(flags);
+	if (core->flags & CLK_OPS_PARENT_ON)
+		clk_core_disable_unprepare(core->parent);
 }
 
 static bool clk_ignore_unused;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 5378c2a..b37d9f3 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -31,6 +31,11 @@
 #define CLK_GET_RATE_NOCACHE	BIT(6) /* do not use the cached clk rate */
 #define CLK_SET_RATE_NO_REPARENT BIT(7) /* don't re-parent on rate change */
 #define CLK_GET_ACCURACY_NOCACHE BIT(8) /* do not use the cached clk accuracy */
+/*
+ * parent clock must be on across any operation including
+ * clock gate/ungate, rate change and re-parent
+ */
+#define CLK_OPS_PARENT_ON	BIT(9)
 
 struct clk_hw;
 struct clk_core;
-- 
1.9.1
