Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from szxga05-in.huawei.com ([45.249.212.191]:3727 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751202AbeAEI7J (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 5 Jan 2018 03:59:09 -0500
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Kaihua Zhong <zhongkaihua@huawei.com>,
        Leo Yan <leo.yan@linaro.org>, Ruyi Wang <wangruyi@huawei.com>,
        Kai Zhao <zhaokai1@hisilicon.com>,
        Tao Wang <kevin.wangtao@hisilicon.com>
CC: Wei Yongjun <weiyongjun1@huawei.com>, <linux-clk@vger.kernel.org>
Subject: [PATCH -next v2] clk: hisilicon: Using devm_ioremap_resource() instead of devm_ioremap()
Date: Fri, 5 Jan 2018 09:04:36 +0000
Message-ID: <1515143076-179272-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1515047794-170174-1-git-send-email-weiyongjun1@huawei.com>
References: <1515047794-170174-1-git-send-email-weiyongjun1@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Using devm_ioremap_resource() which can handle NULL res instead of
devm_ioremap().

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
v1 -> v2: using devm_ioremap_resource instead of devm_ioremap
---
 drivers/clk/hisilicon/clk-hi3660-stub.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/hisilicon/clk-hi3660-stub.c b/drivers/clk/hisilicon/clk-hi3660-stub.c
index 9b6c72b..e8dde4f 100644
--- a/drivers/clk/hisilicon/clk-hi3660-stub.c
+++ b/drivers/clk/hisilicon/clk-hi3660-stub.c
@@ -149,9 +149,9 @@ static int hi3660_stub_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(stub_clk_chan.mbox);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	freq_reg = devm_ioremap(dev, res->start, resource_size(res));
-	if (!freq_reg)
-		return -ENOMEM;
+	freq_reg = devm_ioremap_resource(dev, res);
+	if (IS_ERR(freq_reg))
+		return PTR_ERR(freq_reg);
 
 	freq_reg += HI3660_STUB_CLOCK_DATA;

