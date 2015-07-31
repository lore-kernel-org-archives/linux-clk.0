Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 04/26] clk: Add clk_hw_get_flags()
Date: Fri, 31 Jul 2015 10:03:44 -0700
Message-Id: <1438362246-6664-5-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk.c            | 6 ++++++
 include/linux/clk-provider.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 3e295f255913..e06e906315e1 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -418,6 +418,12 @@ unsigned long __clk_get_flags(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(__clk_get_flags);
 
+unsigned long clk_hw_get_flags(struct clk_hw *hw)
+{
+	return hw->core->flags;
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_flags);
+
 bool __clk_is_prepared(struct clk *clk)
 {
 	if (!clk)
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 8fe7dac77a0d..a0e7d626bc90 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -614,6 +614,7 @@ struct clk *clk_get_parent_by_index(struct clk *clk, u8 index);
 unsigned int __clk_get_enable_count(struct clk *clk);
 unsigned long __clk_get_rate(struct clk *clk);
 unsigned long __clk_get_flags(struct clk *clk);
+unsigned long clk_hw_get_flags(struct clk_hw *hw);
 bool __clk_is_prepared(struct clk *clk);
 bool __clk_is_enabled(struct clk *clk);
 struct clk *__clk_lookup(const char *name);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
