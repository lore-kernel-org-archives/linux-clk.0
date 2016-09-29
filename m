Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tdas@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v3 10/11] clk: Add clk_hw_get_clk() helper API to be used by clk providers
Date: Thu, 29 Sep 2016 14:05:51 +0530
Message-Id: <1475138152-859-11-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1475138152-859-1-git-send-email-rnayak@codeaurora.org>
References: <1475138152-859-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Add a helper API that will allow clk providers to turn their clk_hw
structures into struct clk pointer.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/clk.c            | 6 ++++++
 include/linux/clk-provider.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 820a939..a084132 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -186,6 +186,12 @@ const char *clk_hw_get_name(const struct clk_hw *hw)
 }
 EXPORT_SYMBOL_GPL(clk_hw_get_name);
 
+struct clk *clk_hw_get_clk(const struct clk_hw *hw)
+{
+	return hw->clk;
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_clk);
+
 struct clk_hw *__clk_get_hw(struct clk *clk)
 {
 	return !clk ? NULL : clk->core->hw;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index a39c0c5..77d05f1 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -729,6 +729,7 @@ void devm_clk_hw_unregister(struct device *dev, struct clk_hw *hw);
 /* helper functions */
 const char *__clk_get_name(const struct clk *clk);
 const char *clk_hw_get_name(const struct clk_hw *hw);
+struct clk *clk_hw_get_clk(const struct clk_hw *hw);
 struct clk_hw *__clk_get_hw(struct clk *clk);
 unsigned int clk_hw_get_num_parents(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent(const struct clk_hw *hw);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
