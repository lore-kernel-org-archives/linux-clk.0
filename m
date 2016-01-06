Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] clk: add clk_unregister_fixed_rate()
Date: Wed,  6 Jan 2016 13:25:10 +0900
Message-Id: <1452054310-12935-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1452054310-12935-1-git-send-email-yamada.masahiro@socionext.com>
References: <1452054310-12935-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

Allow to unregister fixed rate clock.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/clk/clk-fixed-rate.c | 13 +++++++++++++
 include/linux/clk-provider.h |  2 +-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-fixed-rate.c b/drivers/clk/clk-fixed-rate.c
index f85ec8d..a69a6db 100644
--- a/drivers/clk/clk-fixed-rate.c
+++ b/drivers/clk/clk-fixed-rate.c
@@ -106,6 +106,19 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
 }
 EXPORT_SYMBOL_GPL(clk_register_fixed_rate);
 
+void clk_unregister_fixed_rate(struct clk *clk)
+{
+	struct clk_hw *hw;
+
+	hw = __clk_get_hw(clk);
+	if (!hw)
+		return;
+
+	clk_unregister(clk);
+	kfree(to_clk_fixed_rate(hw));
+}
+EXPORT_SYMBOL_GPL(clk_unregister_fixed_rate);
+
 #ifdef CONFIG_OF
 /**
  * of_fixed_clk_setup() - Setup function for simple fixed rate clock
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 39edfd7..b6c6bfb 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -282,7 +282,7 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
 struct clk *clk_register_fixed_rate_with_accuracy(struct device *dev,
 		const char *name, const char *parent_name, unsigned long flags,
 		unsigned long fixed_rate, unsigned long fixed_accuracy);
-
+void clk_unregister_fixed_rate(struct clk *clk);
 void of_fixed_clk_setup(struct device_node *np);
 
 /**
-- 
1.9.1
