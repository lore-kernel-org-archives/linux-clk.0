Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] clk: add clk_unregister_fixed_factor()
Date: Wed,  6 Jan 2016 13:25:09 +0900
Message-Id: <1452054310-12935-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1452054310-12935-1-git-send-email-yamada.masahiro@socionext.com>
References: <1452054310-12935-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

Allow to unregister fixed factor clock.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/clk/clk-fixed-factor.c | 13 +++++++++++++
 include/linux/clk-provider.h   |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 83de57a..f9c80e3 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -102,6 +102,19 @@ struct clk *clk_register_fixed_factor(struct device *dev, const char *name,
 }
 EXPORT_SYMBOL_GPL(clk_register_fixed_factor);
 
+void clk_unregister_fixed_factor(struct clk *clk)
+{
+	struct clk_hw *hw;
+
+	hw = __clk_get_hw(clk);
+	if (!hw)
+		return;
+
+	clk_unregister(clk);
+	kfree(to_clk_fixed_factor(hw));
+}
+EXPORT_SYMBOL_GPL(clk_unregister_fixed_factor);
+
 #ifdef CONFIG_OF
 /**
  * of_fixed_factor_clk_setup() - Setup function for simple fixed factor clock
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index e7bd710..39edfd7 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -486,6 +486,7 @@ extern const struct clk_ops clk_fixed_factor_ops;
 struct clk *clk_register_fixed_factor(struct device *dev, const char *name,
 		const char *parent_name, unsigned long flags,
 		unsigned int mult, unsigned int div);
+void clk_unregister_fixed_factor(struct clk *clk);
 
 /**
  * struct clk_fractional_divider - adjustable fractional divider clock
-- 
1.9.1
