Return-Path: <mars.cheng@mediatek.com>
From: Mars Cheng <mars.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland
	<mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@codeaurora.org>, Erin Lo <erin.lo@mediatek.com>, James Liao
	<jamesjj.liao@mediatek.com>
CC: <linux-clk@vger.kernel.org>, CC Hwang <cc.hwang@mediatek.com>, Loda Choui
	<loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Scott Shu
	<scott.shu@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Yingjoe Chen
	<yingjoe.chen@mediatek.com>, My Chuang <my.chuang@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <wsd_upstream@mediatek.com>, Mars Cheng
	<mars.cheng@mediatek.com>
Subject: [PATCH 2/4] irqchip: mtk-sysirq: support second intpol base
Date: Thu, 8 Sep 2016 18:49:51 +0800
Message-ID: <1473331794-27542-3-git-send-email-mars.cheng@mediatek.com>
In-Reply-To: <1473331794-27542-1-git-send-email-mars.cheng@mediatek.com>
References: <1473331794-27542-1-git-send-email-mars.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: mars.cheng@mediatek.com
List-ID: <linux-clk.vger.kernel.org>

Original mtk-sysirq does not support multiple intpol bases. However,
there are some mtk chips need it.

Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
---
 drivers/irqchip/irq-mtk-sysirq.c |   42 +++++++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-mtk-sysirq.c b/drivers/irqchip/irq-mtk-sysirq.c
index 63ac73b..20f488a 100644
--- a/drivers/irqchip/irq-mtk-sysirq.c
+++ b/drivers/irqchip/irq-mtk-sysirq.c
@@ -24,7 +24,10 @@
 
 struct mtk_sysirq_chip_data {
 	spinlock_t lock;
+	unsigned int intpol_num;
+	unsigned int intpol_num_ex;
 	void __iomem *intpol_base;
+	void __iomem *intpol_base_ex;
 };
 
 static int mtk_sysirq_set_type(struct irq_data *data, unsigned int type)
@@ -32,14 +35,22 @@ static int mtk_sysirq_set_type(struct irq_data *data, unsigned int type)
 	irq_hw_number_t hwirq = data->hwirq;
 	struct mtk_sysirq_chip_data *chip_data = data->chip_data;
 	u32 offset, reg_index, value;
+	void __iomem *intpol_base;
 	unsigned long flags;
 	int ret;
 
+	if (hwirq >= (chip_data->intpol_num)) {
+		intpol_base = chip_data->intpol_base_ex;
+		reg_index = (hwirq - chip_data->intpol_num) >> 5;
+	} else {
+		intpol_base = chip_data->intpol_base;
+		reg_index = hwirq >> 5;
+	}
+
 	offset = hwirq & 0x1f;
-	reg_index = hwirq >> 5;
 
 	spin_lock_irqsave(&chip_data->lock, flags);
-	value = readl_relaxed(chip_data->intpol_base + reg_index * 4);
+	value = readl_relaxed(intpol_base + reg_index * 4);
 	if (type == IRQ_TYPE_LEVEL_LOW || type == IRQ_TYPE_EDGE_FALLING) {
 		if (type == IRQ_TYPE_LEVEL_LOW)
 			type = IRQ_TYPE_LEVEL_HIGH;
@@ -49,7 +60,7 @@ static int mtk_sysirq_set_type(struct irq_data *data, unsigned int type)
 	} else {
 		value &= ~(1 << offset);
 	}
-	writel(value, chip_data->intpol_base + reg_index * 4);
+	writel(value, intpol_base + reg_index * 4);
 
 	data = data->parent_data;
 	ret = data->chip->irq_set_type(data, type);
@@ -124,7 +135,7 @@ static int __init mtk_sysirq_of_init(struct device_node *node,
 {
 	struct irq_domain *domain, *domain_parent;
 	struct mtk_sysirq_chip_data *chip_data;
-	int ret, size, intpol_num;
+	int ret, size, total_intpol_num;
 	struct resource res;
 
 	domain_parent = irq_find_host(parent);
@@ -142,7 +153,8 @@ static int __init mtk_sysirq_of_init(struct device_node *node,
 		return -ENOMEM;
 
 	size = resource_size(&res);
-	intpol_num = size * 8;
+	chip_data->intpol_num = size * 8;
+	total_intpol_num = chip_data->intpol_num;
 	chip_data->intpol_base = ioremap(res.start, size);
 	if (!chip_data->intpol_base) {
 		pr_err("mtk_sysirq: unable to map sysirq register\n");
@@ -150,8 +162,22 @@ static int __init mtk_sysirq_of_init(struct device_node *node,
 		goto out_free;
 	}
 
-	domain = irq_domain_add_hierarchy(domain_parent, 0, intpol_num, node,
-					  &sysirq_domain_ops, chip_data);
+	/* if we get the second base, handle it, or just go on */
+	ret = of_address_to_resource(node, 1, &res);
+	if (!ret) { /* if we get the second base, handle it */
+		size = resource_size(&res);
+		chip_data->intpol_num_ex = size * 8;
+		total_intpol_num += chip_data->intpol_num_ex;
+		chip_data->intpol_base_ex = ioremap(res.start, size);
+		if (!chip_data->intpol_base_ex) {
+			pr_err("mtk_sysirq: unable to map sysirq register\n");
+			ret = -ENXIO;
+			goto out_free_ex;
+		}
+	}
+
+	domain = irq_domain_add_hierarchy(domain_parent, 0, total_intpol_num,
+					  node, &sysirq_domain_ops, chip_data);
 	if (!domain) {
 		ret = -ENOMEM;
 		goto out_unmap;
@@ -161,6 +187,8 @@ static int __init mtk_sysirq_of_init(struct device_node *node,
 	return 0;
 
 out_unmap:
+	iounmap(chip_data->intpol_base_ex);
+out_free_ex:
 	iounmap(chip_data->intpol_base);
 out_free:
 	kfree(chip_data);
-- 
1.7.9.5
