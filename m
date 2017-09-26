Return-Path: <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Leo Yan <leo.yan@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] clk: hisilicon: Delete an error message for a failed memory
 allocation in hisi_register_clkgate_sep()
Message-ID: <920f1461-2c2a-430f-28ef-18af18788889@users.sourceforge.net>
Date: Tue, 26 Sep 2017 22:05:59 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 26 Sep 2017 22:00:05 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/hisilicon/clkgate-separated.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/hisilicon/clkgate-separated.c b/drivers/clk/hisilicon/clkgate-separated.c
index 7908bc3c9ec7..f028bcffe12c 100644
--- a/drivers/clk/hisilicon/clkgate-separated.c
+++ b/drivers/clk/hisilicon/clkgate-separated.c
@@ -105,10 +105,8 @@ struct clk *hisi_register_clkgate_sep(struct device *dev, const char *name,
 	struct clk_init_data init;
 
 	sclk = kzalloc(sizeof(*sclk), GFP_KERNEL);
-	if (!sclk) {
-		pr_err("%s: fail to allocate separated gated clk\n", __func__);
+	if (!sclk)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	init.name = name;
 	init.ops = &clkgate_separated_ops;
-- 
2.14.1
