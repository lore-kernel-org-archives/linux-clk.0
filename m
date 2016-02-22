Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:51458 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752980AbcBVUyu (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 22 Feb 2016 15:54:50 -0500
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 1/9] clk: Make of_clk_get_parent_count() return unsigned ints
Date: Mon, 22 Feb 2016 12:54:39 -0800
Message-Id: <1456174487-28397-2-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456174487-28397-1-git-send-email-sboyd@codeaurora.org>
References: <1456174487-28397-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Russell King recently pointed out a bug in the clk-gpio code
where it fails to register the clk if of_clk_get_parent_count()
returns an error because the "clocks" property isn't present in
the DT node. If we're trying to count parents from DT we'd like
to know the count, not if there is a "clocks" property or not.
Furthermore, some drivers are assigning the return value to their
clk_init_data::num_parents member which is unsigned, leading to
potentially large numbers of parents when the property isn't
present.

Let's change the API to return an unsigned int instead of an int.
All the callers just want to know the count anyway, and this
avoids the bug that was in the clk-gpio driver.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk.c            | 16 ++++++++++++++--
 include/linux/clk-provider.h |  2 +-
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 58ef3dab894a..0e7206761d27 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3021,9 +3021,21 @@ struct clk *of_clk_get_from_provider(struct of_phandle_args *clkspec)
 }
 EXPORT_SYMBOL_GPL(of_clk_get_from_provider);
 
-int of_clk_get_parent_count(struct device_node *np)
+/**
+ * of_clk_get_parent_count() - Count the number of clocks a device node has
+ * @np: device node to count
+ *
+ * Returns: The number of clocks that are possible parents of this node
+ */
+unsigned int of_clk_get_parent_count(struct device_node *np)
 {
-	return of_count_phandle_with_args(np, "clocks", "#clock-cells");
+	int count;
+
+	count = of_count_phandle_with_args(np, "clocks", "#clock-cells");
+	if (count < 0)
+		return 0;
+
+	return count;
 }
 EXPORT_SYMBOL_GPL(of_clk_get_parent_count);
 
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index fce7f027f8a7..da95258127aa 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -716,7 +716,7 @@ void of_clk_del_provider(struct device_node *np);
 struct clk *of_clk_src_simple_get(struct of_phandle_args *clkspec,
 				  void *data);
 struct clk *of_clk_src_onecell_get(struct of_phandle_args *clkspec, void *data);
-int of_clk_get_parent_count(struct device_node *np);
+unsigned int of_clk_get_parent_count(struct device_node *np);
 int of_clk_parent_fill(struct device_node *np, const char **parents,
 		       unsigned int size);
 const char *of_clk_get_parent_name(struct device_node *np, int index);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

