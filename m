Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] clk: fix false positive EPROBE_DEFER of __of_clk_get_hw_from_provider()
Date: Tue, 19 Jul 2016 18:21:37 +0900
Message-Id: <1468920098-8553-5-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1468920098-8553-1-git-send-email-yamada.masahiro@socionext.com>
References: <1468920098-8553-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

Currently, this function iterates over the whole list of OF clock
providers.  If the given node is found and __of_clk_get_hw_provider()
fails, it continues to search for the next node.  In the end, it will
reach the end of the list and return -EPROBE_DEFER.  This is odd.
An OF clock provider is already registered for the given node, so it
is not deferred probe at all.

Actually, I was hit by this case when a clock is queried with a too
large index against an already registered OF clock provider.  In this
case, of_clk_src_onecell_get() returns -EINVAL (this is correct), but
clk_get() returns -EPROBE_DEFER, so the driver is visited later,
where it never succeeds in getting the clock.

Another good thing is this function is much more readable now.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/clk/clk.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 60daf60..2207098 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3156,25 +3156,19 @@ struct clk *__of_clk_get_from_provider(struct of_phandle_args *clkspec,
 {
 	struct of_clk_provider *provider;
 	struct clk *clk = ERR_PTR(-EPROBE_DEFER);
-	struct clk_hw *hw = ERR_PTR(-EPROBE_DEFER);
+	struct clk_hw *hw;
 
 	if (!clkspec)
 		return ERR_PTR(-EINVAL);
 
-	/* Check if we have such a provider in our array */
 	mutex_lock(&of_clk_mutex);
-	list_for_each_entry(provider, &of_clk_providers, link) {
-		if (provider->node == clkspec->np)
-			hw = __of_clk_get_hw_from_provider(provider, clkspec);
-		if (!IS_ERR(hw)) {
-			clk = __clk_create_clk(hw, dev_id, con_id);
-
-			if (!IS_ERR(clk) && !__clk_get(clk)) {
-				__clk_free_clk(clk);
-				clk = ERR_PTR(-ENOENT);
-			}
-
-			break;
+	provider = __of_clk_find_provider(clkspec->np);
+	if (provider) {
+		hw = __of_clk_get_hw_from_provider(provider, clkspec);
+		clk = __clk_create_clk(hw, dev_id, con_id);
+		if (!IS_ERR(clk) && !__clk_get(clk)) {
+			__clk_free_clk(clk);
+			clk = ERR_PTR(-ENOENT);
 		}
 	}
 	mutex_unlock(&of_clk_mutex);
-- 
1.9.1
