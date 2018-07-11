Return-Path: <mperttunen@nvidia.com>
From: Mikko Perttunen <mperttunen@nvidia.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <leonard.crestez@nxp.com>, <cyndis@kapsi.fi>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH] clk: core: Potentially free connection id
Date: Wed, 11 Jul 2018 11:21:04 +0300
Message-ID: <20180711082104.27955-1-mperttunen@nvidia.com>
Return-Path: mperttunen@nvidia.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Patch "clk: core: Copy connection id" made it so that the connector
id (con_id) is kstrdup_const'ed to cater to drivers that pass non-
constant connection ids. The patch added the corresponding kfree_const
to __clk_free_clk, but struct clk's can be freed also via __clk_put.
Add the kfree_const call to __clk_put and add comments to both
functions to remind that the logic in them should be kept in sync.

Fixes: 253160a8ad06 ("clk: core: Copy connection id")
Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/clk/clk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ac96caab0523..d31055ae6ec6 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3132,6 +3132,7 @@ struct clk *__clk_create_clk(struct clk_hw *hw, const char *dev_id,
 	return clk;
 }
 
+/* keep in sync with __clk_put */
 void __clk_free_clk(struct clk *clk)
 {
 	clk_prepare_lock();
@@ -3511,6 +3512,7 @@ int __clk_get(struct clk *clk)
 	return 1;
 }
 
+/* keep in sync with __clk_free_clk */
 void __clk_put(struct clk *clk)
 {
 	struct module *owner;
@@ -3544,6 +3546,7 @@ void __clk_put(struct clk *clk)
 
 	module_put(owner);
 
+	kfree_const(clk->con_id);
 	kfree(clk);
 }
 
-- 
2.16.1
