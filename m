Return-Path: <elfring@users.sourceforge.net>
Subject: [PATCH 2/3] clk/mmp: Use common error handling code in
 mmp_clk_register_mix()
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Chao Xie <chao.xie@marvell.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <051d7ba6-e3cc-8354-8315-93fe039dd2ce@users.sourceforge.net>
Message-ID: <4dbb54c0-e2f9-b021-fe0a-35b39bff8865@users.sourceforge.net>
Date: Wed, 27 Sep 2017 09:26:23 +0200
MIME-Version: 1.0
In-Reply-To: <051d7ba6-e3cc-8354-8315-93fe039dd2ce@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 26 Sep 2017 22:33:18 +0200

Add a jump target so that a bit of exception handling can be better reused
at the end of this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/mmp/clk-mix.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/mmp/clk-mix.c b/drivers/clk/mmp/clk-mix.c
index 1ae532df20f7..b2471fb369f1 100644
--- a/drivers/clk/mmp/clk-mix.c
+++ b/drivers/clk/mmp/clk-mix.c
@@ -464,10 +464,9 @@ struct clk *mmp_clk_register_mix(struct device *dev,
 	if (config->table) {
 		table_bytes = sizeof(*config->table) * config->table_size;
 		mix->table = kmemdup(config->table, table_bytes, GFP_KERNEL);
-		if (!mix->table) {
-			kfree(mix);
-			return ERR_PTR(-ENOMEM);
-		}
+		if (!mix->table)
+			goto free_mix;
+
 		mix->table_size = config->table_size;
 	}
 
@@ -477,8 +476,7 @@ struct clk *mmp_clk_register_mix(struct device *dev,
 					 GFP_KERNEL);
 		if (!mix->mux_table) {
 			kfree(mix->table);
-			kfree(mix);
-			return ERR_PTR(-ENOMEM);
+			goto free_mix;
 		}
 	}
 
@@ -502,4 +500,8 @@ struct clk *mmp_clk_register_mix(struct device *dev,
 	}
 
 	return clk;
+
+free_mix:
+	kfree(mix);
+	return ERR_PTR(-ENOMEM);
 }
-- 
2.14.1
