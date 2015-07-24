Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:59013 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752539AbbGXTaJ (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jul 2015 15:30:09 -0400
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH] clk: basic-type: Silence warnings about lock imbalances
Date: Fri, 24 Jul 2015 12:30:06 -0700
Message-Id: <1437766206-17176-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The basic clock types use conditional locking for the register
accessor spinlocks. Add __acquire() and __release() markings in
the right locations so that sparse isn't tripped up on the
conditional locking.

drivers/clk/clk-mux.c:68:12: warning: context imbalance in 'clk_mux_set_parent' - different lock contexts for basic block
drivers/clk/clk-divider.c:379:12: warning: context imbalance in 'clk_divider_set_rate' - different lock contexts for basic block
drivers/clk/clk-gate.c:71:9: warning: context imbalance in 'clk_gate_endisable' - different lock contexts for basic block
drivers/clk/clk-fractional-divider.c:36:9: warning: context imbalance in 'clk_fd_recalc_rate' - different lock contexts for basic block
drivers/clk/clk-fractional-divider.c:68:12: warning: context imbalance in 'clk_fd_set_rate' - different lock contexts for basic block

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com> 
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-divider.c            | 4 ++++
 drivers/clk/clk-fractional-divider.c | 8 ++++++++
 drivers/clk/clk-gate.c               | 4 ++++
 drivers/clk/clk-mux.c                | 4 ++++
 4 files changed, 20 insertions(+)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 2cab88b9c1a8..a417162537b8 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -395,6 +395,8 @@ static int clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	if (divider->lock)
 		spin_lock_irqsave(divider->lock, flags);
+	else
+		__acquire(divider->lock);
 
 	if (divider->flags & CLK_DIVIDER_HIWORD_MASK) {
 		val = div_mask(divider->width) << (divider->shift + 16);
@@ -407,6 +409,8 @@ static int clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	if (divider->lock)
 		spin_unlock_irqrestore(divider->lock, flags);
+	else
+		__release(divider->lock);
 
 	return 0;
 }
diff --git a/drivers/clk/clk-fractional-divider.c b/drivers/clk/clk-fractional-divider.c
index 140eb5844dc4..e85f856b8592 100644
--- a/drivers/clk/clk-fractional-divider.c
+++ b/drivers/clk/clk-fractional-divider.c
@@ -27,11 +27,15 @@ static unsigned long clk_fd_recalc_rate(struct clk_hw *hw,
 
 	if (fd->lock)
 		spin_lock_irqsave(fd->lock, flags);
+	else
+		__acquire(fd->lock);
 
 	val = clk_readl(fd->reg);
 
 	if (fd->lock)
 		spin_unlock_irqrestore(fd->lock, flags);
+	else
+		__release(fd->lock);
 
 	m = (val & fd->mmask) >> fd->mshift;
 	n = (val & fd->nmask) >> fd->nshift;
@@ -80,6 +84,8 @@ static int clk_fd_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	if (fd->lock)
 		spin_lock_irqsave(fd->lock, flags);
+	else
+		__acquire(fd->lock);
 
 	val = clk_readl(fd->reg);
 	val &= ~(fd->mmask | fd->nmask);
@@ -88,6 +94,8 @@ static int clk_fd_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	if (fd->lock)
 		spin_unlock_irqrestore(fd->lock, flags);
+	else
+		__release(fd->lock);
 
 	return 0;
 }
diff --git a/drivers/clk/clk-gate.c b/drivers/clk/clk-gate.c
index 551dd0672794..de0b322f5f58 100644
--- a/drivers/clk/clk-gate.c
+++ b/drivers/clk/clk-gate.c
@@ -52,6 +52,8 @@ static void clk_gate_endisable(struct clk_hw *hw, int enable)
 
 	if (gate->lock)
 		spin_lock_irqsave(gate->lock, flags);
+	else
+		__acquire(gate->lock);
 
 	if (gate->flags & CLK_GATE_HIWORD_MASK) {
 		reg = BIT(gate->bit_idx + 16);
@@ -70,6 +72,8 @@ static void clk_gate_endisable(struct clk_hw *hw, int enable)
 
 	if (gate->lock)
 		spin_unlock_irqrestore(gate->lock, flags);
+	else
+		__release(gate->lock);
 }
 
 static int clk_gate_enable(struct clk_hw *hw)
diff --git a/drivers/clk/clk-mux.c b/drivers/clk/clk-mux.c
index c705cf573569..33c09a3bfa51 100644
--- a/drivers/clk/clk-mux.c
+++ b/drivers/clk/clk-mux.c
@@ -84,6 +84,8 @@ static int clk_mux_set_parent(struct clk_hw *hw, u8 index)
 
 	if (mux->lock)
 		spin_lock_irqsave(mux->lock, flags);
+	else
+		__acquire(mux->lock);
 
 	if (mux->flags & CLK_MUX_HIWORD_MASK) {
 		val = mux->mask << (mux->shift + 16);
@@ -96,6 +98,8 @@ static int clk_mux_set_parent(struct clk_hw *hw, u8 index)
 
 	if (mux->lock)
 		spin_unlock_irqrestore(mux->lock, flags);
+	else
+		__release(mux->lock);
 
 	return 0;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

