Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: [PATCH 5/6] clk: hi3620: Delete error messages for a failed memory
 allocation in two functions
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org,
        Jiancheng Xue <xuejiancheng@hisilicon.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
References: <7a649967-8ff1-8682-2f87-43871172fc28@users.sourceforge.net>
Message-ID: <fa6898a1-8068-2b46-24c2-995329831358@users.sourceforge.net>
Date: Tue, 18 Apr 2017 11:43:21 +0200
MIME-Version: 1.0
In-Reply-To: <7a649967-8ff1-8682-2f87-43871172fc28@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 18 Apr 2017 10:50:53 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: Possible unnecessary 'out of memory' message

Thus remove such statements here.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/hisilicon/clk-hi3620.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/hisilicon/clk-hi3620.c b/drivers/clk/hisilicon/clk-hi3620.c
index f6dd971c9d3c..33a713ac8fe6 100644
--- a/drivers/clk/hisilicon/clk-hi3620.c
+++ b/drivers/clk/hisilicon/clk-hi3620.c
@@ -430,10 +430,8 @@ static struct clk *hisi_register_clk_mmc(struct hisi_mmc_clock *mmc_clk,
 	struct clk_init_data init;
 
 	mclk = kzalloc(sizeof(*mclk), GFP_KERNEL);
-	if (!mclk) {
-		pr_err("%s: fail to allocate mmc clk\n", __func__);
+	if (!mclk)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	init.name = mmc_clk->name;
 	init.ops = &clk_mmc_ops;
@@ -483,10 +481,8 @@ static void __init hi3620_mmc_clk_init(struct device_node *node)
 		return;
 
 	clk_data->clks = kcalloc(num, sizeof(*clk_data->clks), GFP_KERNEL);
-	if (!clk_data->clks) {
-		pr_err("%s: fail to allocate mmc clk\n", __func__);
+	if (!clk_data->clks)
 		return;
-	}
 
 	for (i = 0; i < num; i++) {
 		struct hisi_mmc_clock *mmc_clk = &hi3620_mmc_clks[i];
-- 
2.12.2
