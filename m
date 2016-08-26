Return-Path: <zajec5@gmail.com>
Return-Path: <zajec5@gmail.com>
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] clk: return unsigned int in dummy non-OF of_clk_get_parent_count()
Date: Fri, 26 Aug 2016 14:58:07 +0200
Message-Id: <20160826125811.26843-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

From: Rafał Miłecki <rafal@milecki.pl>

In the commit 929e7f3bc7b82 ("clk: Make of_clk_get_parent_count() return
unsigned ints") of_clk_get_parent_count has been modified to return
unsigned int. There is also a dummy implementation of the same function
for configs without CONFIG_OF. For the consistency it should be updated
as well.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 include/linux/clk-provider.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index f403b8a..37b8fdc 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -854,7 +854,7 @@ of_clk_hw_onecell_get(struct of_phandle_args *clkspec, void *data)
 {
 	return ERR_PTR(-ENOENT);
 }
-static inline int of_clk_get_parent_count(struct device_node *np)
+static inline unsigned int of_clk_get_parent_count(struct device_node *np)
 {
 	return 0;
 }
-- 
2.9.3
