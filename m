Return-Path: <elfring@users.sourceforge.net>
Subject: [PATCH 3/6] clk: hisilicon: Use devm_kmalloc_array() in
 hisi_clk_alloc()
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Jiancheng Xue <xuejiancheng@hisilicon.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <7a649967-8ff1-8682-2f87-43871172fc28@users.sourceforge.net>
Message-ID: <bb46c386-99d2-b96f-a513-35a0d1f87fc2@users.sourceforge.net>
Date: Tue, 18 Apr 2017 11:40:22 +0200
MIME-Version: 1.0
In-Reply-To: <7a649967-8ff1-8682-2f87-43871172fc28@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 18 Apr 2017 10:15:19 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "devm_kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data type by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/hisilicon/clk.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/hisilicon/clk.c b/drivers/clk/hisilicon/clk.c
index eca4c66e316c..b73c1dfae7f1 100644
--- a/drivers/clk/hisilicon/clk.c
+++ b/drivers/clk/hisilicon/clk.c
@@ -54,8 +54,9 @@ struct hisi_clock_data *hisi_clk_alloc(struct platform_device *pdev,
 	if (!clk_data->base)
 		return NULL;
 
-	clk_table = devm_kmalloc(&pdev->dev, sizeof(struct clk *) * nr_clks,
-				GFP_KERNEL);
+	clk_table = devm_kmalloc_array(&pdev->dev, nr_clks,
+				       sizeof(*clk_table),
+				       GFP_KERNEL);
 	if (!clk_table)
 		return NULL;
 
-- 
2.12.2
