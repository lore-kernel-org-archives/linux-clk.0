Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: [PATCH 2/6] clk: hisilicon: Delete error messages for failed memory
 allocations in hisi_clk_init()
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org,
        Jiancheng Xue <xuejiancheng@hisilicon.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
References: <7a649967-8ff1-8682-2f87-43871172fc28@users.sourceforge.net>
Message-ID: <362845e2-00da-9631-a049-1a53749a1fcf@users.sourceforge.net>
Date: Tue, 18 Apr 2017 11:39:16 +0200
MIME-Version: 1.0
In-Reply-To: <7a649967-8ff1-8682-2f87-43871172fc28@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 18 Apr 2017 10:12:32 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: Possible unnecessary 'out of memory' message

Thus remove such statements here.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/hisilicon/clk.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/hisilicon/clk.c b/drivers/clk/hisilicon/clk.c
index 9268e80b7566..eca4c66e316c 100644
--- a/drivers/clk/hisilicon/clk.c
+++ b/drivers/clk/hisilicon/clk.c
@@ -80,16 +80,14 @@ struct hisi_clock_data *hisi_clk_init(struct device_node *np,
 	}
 
 	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
-	if (!clk_data) {
-		pr_err("%s: could not allocate clock data\n", __func__);
+	if (!clk_data)
 		goto err;
-	}
+
 	clk_data->base = base;
 	clk_table = kcalloc(nr_clks, sizeof(*clk_table), GFP_KERNEL);
-	if (!clk_table) {
-		pr_err("%s: could not allocate clock lookup table\n", __func__);
+	if (!clk_table)
 		goto err_data;
-	}
+
 	clk_data->clk_data.clks = clk_table;
 	clk_data->clk_data.clk_num = nr_clks;
 	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data->clk_data);
-- 
2.12.2
