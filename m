Return-Path: <xuejiancheng@hisilicon.com>
From: Jiancheng Xue <xuejiancheng@hisilicon.com>
To: <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
        <p.zabel@pengutronix.de>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <yanhaifeng@hisilicon.com>, <haojian.zhuang@linaro.org>,
        <zhangfei.gao@linaro.org>, <xuwei5@hisilicon.com>,
        <yanghongwei@hisilicon.com>,
        Jiancheng Xue <xuejiancheng@hisilicon.com>
Subject: [PATCH v2 2/5] clk: hisilicon: add hisi_clk_alloc function.
Date: Fri, 13 May 2016 10:05:52 +0800
Message-ID: <1463105155-20385-3-git-send-email-xuejiancheng@hisilicon.com>
In-Reply-To: <1463105155-20385-1-git-send-email-xuejiancheng@hisilicon.com>
References: <1463105155-20385-1-git-send-email-xuejiancheng@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Before, there was an ordering issue that the clock provider
had been published in hisi_clk_init before it could provide
valid clocks to consumers. hisi_clk_alloc is just used to
allocate memory space for struct hisi_clock_data. It makes
it possible to publish the provider after the clocks are ready.

Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
---
 drivers/clk/hisilicon/clk.c | 29 +++++++++++++++++++++++++++++
 drivers/clk/hisilicon/clk.h |  3 +++
 2 files changed, 32 insertions(+)

diff --git a/drivers/clk/hisilicon/clk.c b/drivers/clk/hisilicon/clk.c
index 9b15adb..78675d1 100644
--- a/drivers/clk/hisilicon/clk.c
+++ b/drivers/clk/hisilicon/clk.c
@@ -37,6 +37,35 @@
 
 static DEFINE_SPINLOCK(hisi_clk_lock);
 
+struct hisi_clock_data *hisi_clk_alloc(struct platform_device *pdev,
+						int nr_clks)
+{
+	struct hisi_clock_data *clk_data;
+	struct resource *res;
+	struct clk **clk_table;
+
+	clk_data = devm_kmalloc(&pdev->dev, sizeof(*clk_data), GFP_KERNEL);
+	if (!clk_data)
+		return NULL;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	clk_data->base = devm_ioremap(&pdev->dev,
+				res->start, resource_size(res));
+	if (!clk_data->base)
+		return NULL;
+
+	clk_table = devm_kmalloc(&pdev->dev, sizeof(struct clk *) * nr_clks,
+				GFP_KERNEL);
+	if (!clk_table)
+		return NULL;
+
+	clk_data->clk_data.clks = clk_table;
+	clk_data->clk_data.clk_num = nr_clks;
+
+	return clk_data;
+}
+EXPORT_SYMBOL_GPL(hisi_clk_alloc);
+
 struct hisi_clock_data *hisi_clk_init(struct device_node *np,
 					     int nr_clks)
 {
diff --git a/drivers/clk/hisilicon/clk.h b/drivers/clk/hisilicon/clk.h
index 20d64af..5fc644f 100644
--- a/drivers/clk/hisilicon/clk.h
+++ b/drivers/clk/hisilicon/clk.h
@@ -30,6 +30,8 @@
 #include <linux/io.h>
 #include <linux/spinlock.h>
 
+struct platform_device;
+
 struct hisi_clock_data {
 	struct clk_onecell_data	clk_data;
 	void __iomem		*base;
@@ -110,6 +112,7 @@ struct clk *hi6220_register_clkdiv(struct device *dev, const char *name,
 	const char *parent_name, unsigned long flags, void __iomem *reg,
 	u8 shift, u8 width, u32 mask_bit, spinlock_t *lock);
 
+struct hisi_clock_data *hisi_clk_alloc(struct platform_device *, int);
 struct hisi_clock_data *hisi_clk_init(struct device_node *, int);
 void hisi_clk_register_fixed_rate(const struct hisi_fixed_rate_clock *,
 				int, struct hisi_clock_data *);
-- 
1.9.1
