Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Andrzej Hajda <a.hajda@samsung.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 10/31] clk/mmp: use kmemdup rather than duplicating its
 implementation
Date: Fri, 07 Aug 2015 09:59:16 +0200
Message-id: <1438934377-4922-11-git-send-email-a.hajda@samsung.com>
In-reply-to: <1438934377-4922-1-git-send-email-a.hajda@samsung.com>
References: <1438934377-4922-1-git-send-email-a.hajda@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The patch was generated using fixed coccinelle semantic patch
scripts/coccinelle/api/memdup.cocci [1].

[1]: http://permalink.gmane.org/gmane.linux.kernel/2014320

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/clk/mmp/clk-mix.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mmp/clk-mix.c b/drivers/clk/mmp/clk-mix.c
index 665cb67..3383410 100644
--- a/drivers/clk/mmp/clk-mix.c
+++ b/drivers/clk/mmp/clk-mix.c
@@ -469,20 +469,20 @@ struct clk *mmp_clk_register_mix(struct device *dev,
 	memcpy(&mix->reg_info, &config->reg_info, sizeof(config->reg_info));
 	if (config->table) {
 		table_bytes = sizeof(*config->table) * config->table_size;
-		mix->table = kzalloc(table_bytes, GFP_KERNEL);
+		mix->table = kmemdup(config->table, table_bytes, GFP_KERNEL);
 		if (!mix->table) {
 			pr_err("%s:%s: could not allocate mmp mix table\n",
 				__func__, name);
 			kfree(mix);
 			return ERR_PTR(-ENOMEM);
 		}
-		memcpy(mix->table, config->table, table_bytes);
 		mix->table_size = config->table_size;
 	}
 
 	if (config->mux_table) {
 		table_bytes = sizeof(u32) * num_parents;
-		mix->mux_table = kzalloc(table_bytes, GFP_KERNEL);
+		mix->mux_table = kmemdup(config->mux_table, table_bytes,
+					 GFP_KERNEL);
 		if (!mix->mux_table) {
 			pr_err("%s:%s: could not allocate mmp mix mux-table\n",
 				__func__, name);
@@ -490,7 +490,6 @@ struct clk *mmp_clk_register_mix(struct device *dev,
 			kfree(mix);
 			return ERR_PTR(-ENOMEM);
 		}
-		memcpy(mix->mux_table, config->mux_table, table_bytes);
 	}
 
 	mix->div_flags = config->div_flags;
-- 
1.9.1

