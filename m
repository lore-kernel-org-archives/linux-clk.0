Return-Path: <elfring@users.sourceforge.net>
Subject: [PATCH 1/3] clk/mmp: Delete an error message for a failed memory
 allocation in three functions
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Chao Xie <chao.xie@marvell.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <051d7ba6-e3cc-8354-8315-93fe039dd2ce@users.sourceforge.net>
Message-ID: <5a3e0b55-1eda-87a4-c4e3-d142d64830a5@users.sourceforge.net>
Date: Wed, 27 Sep 2017 09:25:03 +0200
MIME-Version: 1.0
In-Reply-To: <051d7ba6-e3cc-8354-8315-93fe039dd2ce@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 26 Sep 2017 22:25:38 +0200

Omit extra messages for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/mmp/clk-frac.c | 4 +---
 drivers/clk/mmp/clk-gate.c | 4 +---
 drivers/clk/mmp/clk-mix.c  | 9 +--------
 3 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/mmp/clk-frac.c b/drivers/clk/mmp/clk-frac.c
index 584a9927993b..98dfb9568d4f 100644
--- a/drivers/clk/mmp/clk-frac.c
+++ b/drivers/clk/mmp/clk-frac.c
@@ -172,10 +172,8 @@ struct clk *mmp_clk_register_factor(const char *name, const char *parent_name,
 	}
 
 	factor = kzalloc(sizeof(*factor), GFP_KERNEL);
-	if (!factor) {
-		pr_err("%s: could not allocate factor  clk\n", __func__);
+	if (!factor)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	/* struct clk_aux assignments */
 	factor->base = base;
diff --git a/drivers/clk/mmp/clk-gate.c b/drivers/clk/mmp/clk-gate.c
index d20cd3431ac2..7355595c42e2 100644
--- a/drivers/clk/mmp/clk-gate.c
+++ b/drivers/clk/mmp/clk-gate.c
@@ -103,10 +103,8 @@ struct clk *mmp_clk_register_gate(struct device *dev, const char *name,
 
 	/* allocate the gate */
 	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
-	if (!gate) {
-		pr_err("%s:%s could not allocate gate clk\n", __func__, name);
+	if (!gate)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	init.name = name;
 	init.ops = &mmp_clk_gate_ops;
diff --git a/drivers/clk/mmp/clk-mix.c b/drivers/clk/mmp/clk-mix.c
index c554833cffc5..1ae532df20f7 100644
--- a/drivers/clk/mmp/clk-mix.c
+++ b/drivers/clk/mmp/clk-mix.c
@@ -451,11 +451,8 @@ struct clk *mmp_clk_register_mix(struct device *dev,
 	size_t table_bytes;
 
 	mix = kzalloc(sizeof(*mix), GFP_KERNEL);
-	if (!mix) {
-		pr_err("%s:%s: could not allocate mmp mix clk\n",
-			__func__, name);
+	if (!mix)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	init.name = name;
 	init.flags = flags | CLK_GET_RATE_NOCACHE;
@@ -468,8 +465,6 @@ struct clk *mmp_clk_register_mix(struct device *dev,
 		table_bytes = sizeof(*config->table) * config->table_size;
 		mix->table = kmemdup(config->table, table_bytes, GFP_KERNEL);
 		if (!mix->table) {
-			pr_err("%s:%s: could not allocate mmp mix table\n",
-				__func__, name);
 			kfree(mix);
 			return ERR_PTR(-ENOMEM);
 		}
@@ -481,8 +476,6 @@ struct clk *mmp_clk_register_mix(struct device *dev,
 		mix->mux_table = kmemdup(config->mux_table, table_bytes,
 					 GFP_KERNEL);
 		if (!mix->mux_table) {
-			pr_err("%s:%s: could not allocate mmp mix mux-table\n",
-				__func__, name);
 			kfree(mix->table);
 			kfree(mix);
 			return ERR_PTR(-ENOMEM);
-- 
2.14.1
