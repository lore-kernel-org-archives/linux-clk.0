Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from fllnx210.ext.ti.com ([198.47.19.17]:37307 "EHLO
        fllnx210.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932770AbeFUIPb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Jun 2018 04:15:31 -0400
From: Keerthy <j-keerthy@ti.com>
To: <t-kristo@ti.com>, <sboyd@kernel.org>, <tony@atomide.com>
CC: <linux-clk@vger.kernel.org>, <d-gerlach@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <j-keerthy@ti.com>
Subject: [PATCH v3 2/4] clk: clk: Add clk_gate_restore_context function
Date: Thu, 21 Jun 2018 13:45:05 +0530
Message-ID: <1529568907-19930-3-git-send-email-j-keerthy@ti.com>
In-Reply-To: <1529568907-19930-1-git-send-email-j-keerthy@ti.com>
References: <1529568907-19930-1-git-send-email-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The clock gate restore context function enables or disables
the gate clocks based on the enable_count. This is done in cases
where the clock context is lost and based on the enable_count
the clock either needs to be enabled/disabled.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---

Changes in v2:

	* Renamed clk_dflt_restore to clk_gate_restore_context

 drivers/clk/clk.c            | 19 +++++++++++++++++++
 include/linux/clk-provider.h |  2 ++
 2 files changed, 21 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 7347e06..c201b8b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -910,6 +910,25 @@ static int clk_core_enable_lock(struct clk_core *core)
 	return ret;
 }
 
+/**
+ * clk_gate_restore_context - restore context for poweroff
+ * @hw: the clk_hw pointer of clock whose state is to be restored
+ *
+ * The clock gate restore context function enables or disables
+ * the gate clocks based on the enable_count. This is done in cases
+ * where the clock context is lost and based on the enable_count
+ * the clock either needs to be enabled/disabled. This
+ * helps restore the state of gate clocks.
+ */
+void clk_gate_restore_context(struct clk_hw *hw)
+{
+	if (hw->clk->core->enable_count)
+		hw->clk->core->ops->enable(hw);
+	else
+		hw->clk->core->ops->disable(hw);
+}
+EXPORT_SYMBOL_GPL(clk_gate_restore_context);
+
 static int _clk_save_context(struct clk_core *clk)
 {
 	struct clk_core *child;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 7f30d62..3e0c61a 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -992,5 +992,7 @@ static inline void clk_writel(u32 val, u32 __iomem *reg)
 
 #endif	/* platform dependent I/O accessors */
 
+void clk_gate_restore_context(struct clk_hw *hw);
+
 #endif /* CONFIG_COMMON_CLK */
 #endif /* CLK_PROVIDER_H */
-- 
1.9.1

