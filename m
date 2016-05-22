Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: fixed-rate: add clk_hw_unregister_fixed_rate()
Date: Sun, 22 May 2016 14:33:35 +0900
Message-Id: <1463895215-28754-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

This will be used to migrate to the clk_hw APIs.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/clk/clk-fixed-rate.c | 11 +++++++++++
 include/linux/clk-provider.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/clk/clk-fixed-rate.c b/drivers/clk/clk-fixed-rate.c
index 8e4453e..2edb393 100644
--- a/drivers/clk/clk-fixed-rate.c
+++ b/drivers/clk/clk-fixed-rate.c
@@ -145,6 +145,17 @@ void clk_unregister_fixed_rate(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(clk_unregister_fixed_rate);
 
+void clk_hw_unregister_fixed_rate(struct clk_hw *hw)
+{
+	struct clk_fixed_rate *fixed;
+
+	fixed = to_clk_fixed_rate(hw);
+
+	clk_hw_unregister(hw);
+	kfree(fixed);
+}
+EXPORT_SYMBOL_GPL(clk_hw_unregister_fixed_rate);
+
 #ifdef CONFIG_OF
 /**
  * of_fixed_clk_setup() - Setup function for simple fixed rate clock
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 0c72204..94e00fe 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -293,6 +293,7 @@ void clk_unregister_fixed_rate(struct clk *clk);
 struct clk_hw *clk_hw_register_fixed_rate_with_accuracy(struct device *dev,
 		const char *name, const char *parent_name, unsigned long flags,
 		unsigned long fixed_rate, unsigned long fixed_accuracy);
+void clk_hw_unregister_fixed_rate(struct clk_hw *hw);
 
 void of_fixed_clk_setup(struct device_node *np);
 
-- 
1.9.1
