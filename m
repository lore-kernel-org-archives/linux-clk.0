Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from szxga05-in.huawei.com ([45.249.212.191]:6252 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750968AbeCTON4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 20 Mar 2018 10:13:56 -0400
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Markus Elfring <elfring@users.sourceforge.net>,
        "Jiancheng Xue" <xuejiancheng@hisilicon.com>,
        tianshuliang <tianshuliang@hisilicon.com>,
        Shawn Guo <shawn.guo@linaro.org>
CC: Wei Yongjun <weiyongjun1@huawei.com>, <linux-clk@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] clk: hisilicon: fix potential NULL dereference in hisi_clk_alloc()
Date: Tue, 20 Mar 2018 14:19:34 +0000
Message-ID: <1521555574-29189-1-git-send-email-weiyongjun1@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

platform_get_resource() may fail and return NULL, so we should
better check it's return value to avoid a NULL pointer dereference
a bit later in the code.

This is detected by Coccinelle semantic patch.

@@
expression pdev, res, n, t, e, e1, e2;
@@

res = platform_get_resource(pdev, t, n);
+ if (!res)
+   return -EINVAL;
... when != res == NULL
e = devm_ioremap(e1, res->start, e2);

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/clk/hisilicon/clk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/hisilicon/clk.c b/drivers/clk/hisilicon/clk.c
index 29046b8..a65beac 100644
--- a/drivers/clk/hisilicon/clk.c
+++ b/drivers/clk/hisilicon/clk.c
@@ -49,6 +49,8 @@ struct hisi_clock_data *hisi_clk_alloc(struct platform_device *pdev,
 		return NULL;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
 	clk_data->base = devm_ioremap(&pdev->dev,
 				res->start, resource_size(res));
 	if (!clk_data->base)

