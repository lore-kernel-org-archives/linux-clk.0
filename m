Return-Path: <weiyongjun1@huawei.com>
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet
	<jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
	"Stephen Boyd" <sboyd@codeaurora.org>, Carlo Caione <carlo@caione.org>, Kevin
 Hilman <khilman@baylibre.com>
CC: Wei Yongjun <weiyongjun1@huawei.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH -next] clk: meson-axg: fix potential NULL dereference in axg_clkc_probe()
Date: Fri, 5 Jan 2018 01:50:59 +0000
Message-ID: <1515117059-176004-1-git-send-email-weiyongjun1@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

platform_get_resource() may return NULL, add proper
check to avoid potential NULL dereferencing.

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
 drivers/clk/meson/axg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index d883bef..1294f3a 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -879,6 +879,8 @@ static int axg_clkc_probe(struct platform_device *pdev)
 
 	/*  Generic clocks and PLLs */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
 	clk_base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
 	if (!clk_base) {
 		dev_err(&pdev->dev, "Unable to map clk base\n");
