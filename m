Return-Path: <shawn.lin@rock-chips.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [RFC PATCH 2/3] clk: add clk_hw_set_phase_range support
Date: Fri, 26 Feb 2016 13:08:57 +0800
Message-Id: <1456463337-3666-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1456463290-3581-1-git-send-email-shawn.lin@rock-chips.com>
References: <1456463290-3581-1-git-send-email-shawn.lin@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

clk_hw_set_phase_range can be used by clk-driver to
set the supported phase range for a specific clk.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/clk/clk.c            | 9 +++++++++
 include/linux/clk-provider.h | 3 ++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 3a8407c..55be863 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -555,6 +555,15 @@ void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
 }
 EXPORT_SYMBOL_GPL(clk_hw_set_rate_range);
 
+void clk_hw_set_phase_range(struct clk_hw *hw, unsigned long min_phase,
+			   unsigned long max_phase)
+{
+	hw->core->min_phase = min_phase;
+	hw->core->max_phase = max_phase;
+}
+EXPORT_SYMBOL_GPL(clk_hw_set_phase_range);
+
+
 /*
  * Helper for finding best parent to provide a given frequency. This can be used
  * directly as a determine_rate callback (e.g. for a mux), or from a more
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index f7e58ae..e871690 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -686,7 +686,8 @@ int __clk_mux_determine_rate_closest(struct clk_hw *hw,
 void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent);
 void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
 			   unsigned long max_rate);
-
+void clk_hw_set_phase_range(struct clk_hw *hw, unsigned long min_phase,
+			   unsigned long max_phase);
 static inline void __clk_hw_set_clk(struct clk_hw *dst, struct clk_hw *src)
 {
 	dst->clk = src->clk;
-- 
2.3.7
