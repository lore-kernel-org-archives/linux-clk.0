Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Jiancheng Xue <xuejiancheng@hisilicon.com>
To: <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
	<p.zabel@pengutronix.de>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<yanhaifeng@hisilicon.com>, <yanghongwei@hisilicon.com>,
	Jiancheng Xue <xuejiancheng@hisilicon.com>
Subject: [PATCH v2 1/5] reset: hisilicon: change the definition of hisi_reset_init
Date: Wed, 15 Jun 2016 14:26:34 +0800
Message-ID: <1465971998-29619-2-git-send-email-xuejiancheng@hisilicon.com>
In-Reply-To: <1465971998-29619-1-git-send-email-xuejiancheng@hisilicon.com>
References: <1465971998-29619-1-git-send-email-xuejiancheng@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Change the input arguments type to struct platform_device pointer.

Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
---
 drivers/clk/hisilicon/clk-hi3519.c |  2 +-
 drivers/clk/hisilicon/reset.c      | 19 +++++++++----------
 drivers/clk/hisilicon/reset.h      |  5 +++--
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/hisilicon/clk-hi3519.c b/drivers/clk/hisilicon/clk-hi3519.c
index 715c730..8d12700 100644
--- a/drivers/clk/hisilicon/clk-hi3519.c
+++ b/drivers/clk/hisilicon/clk-hi3519.c
@@ -86,7 +86,7 @@ static int hi3519_clk_probe(struct platform_device *pdev)
 	struct hisi_clock_data *clk_data;
 	struct hisi_reset_controller *rstc;
 
-	rstc = hisi_reset_init(np);
+	rstc = hisi_reset_init(pdev);
 	if (!rstc)
 		return -ENOMEM;
 
diff --git a/drivers/clk/hisilicon/reset.c b/drivers/clk/hisilicon/reset.c
index 6aa49c2..2a5015c 100644
--- a/drivers/clk/hisilicon/reset.c
+++ b/drivers/clk/hisilicon/reset.c
@@ -19,6 +19,7 @@
 
 #include <linux/io.h>
 #include <linux/of_address.h>
+#include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
@@ -98,25 +99,25 @@ static const struct reset_control_ops hisi_reset_ops = {
 	.deassert	= hisi_reset_deassert,
 };
 
-struct hisi_reset_controller *hisi_reset_init(struct device_node *np)
+struct hisi_reset_controller *hisi_reset_init(struct platform_device *pdev)
 {
 	struct hisi_reset_controller *rstc;
+	struct resource *res;
 
-	rstc = kzalloc(sizeof(*rstc), GFP_KERNEL);
+	rstc = devm_kmalloc(&pdev->dev, sizeof(*rstc), GFP_KERNEL);
 	if (!rstc)
 		return NULL;
 
-	rstc->membase = of_iomap(np, 0);
-	if (!rstc->membase) {
-		kfree(rstc);
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	rstc->membase = devm_ioremap(&pdev->dev,
+				res->start, resource_size(res));
+	if (!rstc->membase)
 		return NULL;
-	}
 
 	spin_lock_init(&rstc->lock);
-
 	rstc->rcdev.owner = THIS_MODULE;
 	rstc->rcdev.ops = &hisi_reset_ops;
-	rstc->rcdev.of_node = np;
+	rstc->rcdev.of_node = pdev->dev.of_node;
 	rstc->rcdev.of_reset_n_cells = 2;
 	rstc->rcdev.of_xlate = hisi_reset_of_xlate;
 	reset_controller_register(&rstc->rcdev);
@@ -128,7 +129,5 @@ EXPORT_SYMBOL_GPL(hisi_reset_init);
 void hisi_reset_exit(struct hisi_reset_controller *rstc)
 {
 	reset_controller_unregister(&rstc->rcdev);
-	iounmap(rstc->membase);
-	kfree(rstc);
 }
 EXPORT_SYMBOL_GPL(hisi_reset_exit);
diff --git a/drivers/clk/hisilicon/reset.h b/drivers/clk/hisilicon/reset.h
index 677d773..9a69374 100644
--- a/drivers/clk/hisilicon/reset.h
+++ b/drivers/clk/hisilicon/reset.h
@@ -22,10 +22,11 @@ struct device_node;
 struct hisi_reset_controller;
 
 #ifdef CONFIG_RESET_CONTROLLER
-struct hisi_reset_controller *hisi_reset_init(struct device_node *np);
+struct hisi_reset_controller *hisi_reset_init(struct platform_device *pdev);
 void hisi_reset_exit(struct hisi_reset_controller *rstc);
 #else
-static inline hisi_reset_controller *hisi_reset_init(struct device_node *np)
+static inline
+struct hisi_reset_controller *hisi_reset_init(struct platform_device *pdev)
 {
 	return 0;
 }
-- 
1.9.1
