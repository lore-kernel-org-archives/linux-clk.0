Return-Path: <weiyongjun1@huawei.com>
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>, Kaihua Zhong <zhongkaihua@huawei.com>, Leo Yan
	<leo.yan@linaro.org>, Ruyi Wang <wangruyi@huawei.com>, Kai Zhao
	<zhaokai1@hisilicon.com>, Tao Wang <kevin.wangtao@hisilicon.com>
CC: Wei Yongjun <weiyongjun1@huawei.com>, <linux-clk@vger.kernel.org>
Subject: =?UTF-8?q?=5BPATCH=20-next=5D=20clk=3A=20hisilicon=3A=20hi3660=EF=BC=9AFix=20potential=20NULL=20dereference=20in=20hi3660=5Fstub=5Fclk=5Fprobe=28=29?=
Date: Thu, 4 Jan 2018 06:36:34 +0000
Message-ID: <1515047794-170174-1-git-send-email-weiyongjun1@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

platform_get_resource() may return NULL, add proper check to
avoid potential NULL dereferencing.

This is detected by Coccinelle semantic patch.

@@
expression pdev, res, n, t, e, e1, e2;
@@

res = platform_get_resource(pdev, t, n);
+ if (!res)
+   return -EINVAL;
... when != res == NULL
e = devm_ioremap(e1, res->start, e2);

Fixes: 4f16f7ff3bc0 ("clk: hisilicon: Add support for Hi3660 stub clocks")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/clk/hisilicon/clk-hi3660-stub.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/hisilicon/clk-hi3660-stub.c b/drivers/clk/hisilicon/clk-hi3660-stub.c
index 9b6c72b..e8b2c43 100644
--- a/drivers/clk/hisilicon/clk-hi3660-stub.c
+++ b/drivers/clk/hisilicon/clk-hi3660-stub.c
@@ -149,6 +149,8 @@ static int hi3660_stub_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(stub_clk_chan.mbox);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
 	freq_reg = devm_ioremap(dev, res->start, resource_size(res));
 	if (!freq_reg)
 		return -ENOMEM;
