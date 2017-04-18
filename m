Return-Path: <elfring@users.sourceforge.net>
Subject: [PATCH 1/6] clk: hisilicon: Use kcalloc() in hisi_clk_init()
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Jiancheng Xue <xuejiancheng@hisilicon.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <7a649967-8ff1-8682-2f87-43871172fc28@users.sourceforge.net>
Message-ID: <26e4342d-2292-adbf-5eb1-9ee172685498@users.sourceforge.net>
Date: Tue, 18 Apr 2017 11:37:26 +0200
MIME-Version: 1.0
In-Reply-To: <7a649967-8ff1-8682-2f87-43871172fc28@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 18 Apr 2017 09:25:47 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kcalloc".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data type by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/hisilicon/clk.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/hisilicon/clk.c b/drivers/clk/hisilicon/clk.c
index 9ba2d91f4d3a..9268e80b7566 100644
--- a/drivers/clk/hisilicon/clk.c
+++ b/drivers/clk/hisilicon/clk.c
@@ -85,8 +85,7 @@ struct hisi_clock_data *hisi_clk_init(struct device_node *np,
 		goto err;
 	}
 	clk_data->base = base;
-
-	clk_table = kzalloc(sizeof(struct clk *) * nr_clks, GFP_KERNEL);
+	clk_table = kcalloc(nr_clks, sizeof(*clk_table), GFP_KERNEL);
 	if (!clk_table) {
 		pr_err("%s: could not allocate clock lookup table\n", __func__);
 		goto err_data;
-- 
2.12.2
