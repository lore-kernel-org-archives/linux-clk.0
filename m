Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] clk: add a helper function __of_clk_find_provider()
Date: Tue, 19 Jul 2016 18:21:34 +0900
Message-Id: <1468920098-8553-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1468920098-8553-1-git-send-email-yamada.masahiro@socionext.com>
References: <1468920098-8553-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

This helper is useful to find an OF clock provider registered for a
device node.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/clk/clk.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 484acc2..e8c79a7 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3010,6 +3010,21 @@ of_clk_hw_onecell_get(struct of_phandle_args *clkspec, void *data)
 EXPORT_SYMBOL_GPL(of_clk_hw_onecell_get);
 
 /**
+ * __of_clk_find_provider - Find a clock provider associated with a device node
+ * @np: device node to obtain the clock provider for
+ */
+static struct of_clk_provider *__of_clk_find_provider(struct device_node *np)
+{
+	struct of_clk_provider *cp;
+
+	list_for_each_entry(cp, &of_clk_providers, link)
+		if (cp->node == np)
+			return cp;
+
+	return NULL;
+}
+
+/**
  * of_clk_add_provider() - Register a clock provider for a node
  * @np: Device node pointer associated with clock provider
  * @clk_src_get: callback for decoding clock
-- 
1.9.1
