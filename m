Return-Path: <mars.cheng@mediatek.com>
From: Mars Cheng <mars.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
CC: CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>, Jades Shih <jades.shih@mediatek.com>,
	Yingjoe Chen <yingjoe.chen@mediatek.com>, My Chuang <my.chuang@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <wsd_upstream@mediatek.com>,
	<linux-clk@vger.kernel.org>, Mars Cheng <mars.cheng@mediatek.com>
Subject: [PATCH v3 02/12] irqchip: mtk-sysirq: extend intpol base to arbitrary number
Date: Sun, 19 Mar 2017 23:26:23 +0800
Message-ID: <1489937193-2953-3-git-send-email-mars.cheng@mediatek.com>
In-Reply-To: <1489937193-2953-1-git-send-email-mars.cheng@mediatek.com>
References: <1489937193-2953-1-git-send-email-mars.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: mars.cheng@mediatek.com
List-ID: <linux-clk.vger.kernel.org>

Originally driver only supports one base. However, MT6797 has
more than one bases to configure interrupt polarity. To support
possible design change, here comes a solution to use arbitrary
number of bases.

Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
---
 drivers/irqchip/irq-mtk-sysirq.c |  116 +++++++++++++++++++++++++++++++-------
 1 file changed, 95 insertions(+), 21 deletions(-)

diff --git a/drivers/irqchip/irq-mtk-sysirq.c b/drivers/irqchip/irq-mtk-sysirq.c
index 63ac73b..9ba969c 100644
--- a/drivers/irqchip/irq-mtk-sysirq.c
+++ b/drivers/irqchip/irq-mtk-sysirq.c
@@ -24,22 +24,29 @@
 
 struct mtk_sysirq_chip_data {
 	spinlock_t lock;
-	void __iomem *intpol_base;
+	u32 nr_intpol_bases;
+	void __iomem **intpol_bases;
+	u32 *intpol_words;
+	u8 *intpol_idx;
+	u16 *which_word;
 };
 
 static int mtk_sysirq_set_type(struct irq_data *data, unsigned int type)
 {
 	irq_hw_number_t hwirq = data->hwirq;
 	struct mtk_sysirq_chip_data *chip_data = data->chip_data;
+	u8 intpol_idx = chip_data->intpol_idx[hwirq];
+	void __iomem *base;
 	u32 offset, reg_index, value;
 	unsigned long flags;
 	int ret;
 
+	base = chip_data->intpol_bases[intpol_idx];
+	reg_index = chip_data->which_word[hwirq];
 	offset = hwirq & 0x1f;
-	reg_index = hwirq >> 5;
 
 	spin_lock_irqsave(&chip_data->lock, flags);
-	value = readl_relaxed(chip_data->intpol_base + reg_index * 4);
+	value = readl_relaxed(base + reg_index * 4);
 	if (type == IRQ_TYPE_LEVEL_LOW || type == IRQ_TYPE_EDGE_FALLING) {
 		if (type == IRQ_TYPE_LEVEL_LOW)
 			type = IRQ_TYPE_LEVEL_HIGH;
@@ -49,7 +56,8 @@ static int mtk_sysirq_set_type(struct irq_data *data, unsigned int type)
 	} else {
 		value &= ~(1 << offset);
 	}
-	writel(value, chip_data->intpol_base + reg_index * 4);
+
+	writel(value, base + reg_index * 4);
 
 	data = data->parent_data;
 	ret = data->chip->irq_set_type(data, type);
@@ -124,8 +132,7 @@ static int __init mtk_sysirq_of_init(struct device_node *node,
 {
 	struct irq_domain *domain, *domain_parent;
 	struct mtk_sysirq_chip_data *chip_data;
-	int ret, size, intpol_num;
-	struct resource res;
+	int ret, size, intpol_num = 0, nr_intpol_bases = 0, i = 0;
 
 	domain_parent = irq_find_host(parent);
 	if (!domain_parent) {
@@ -133,36 +140,103 @@ static int __init mtk_sysirq_of_init(struct device_node *node,
 		return -EINVAL;
 	}
 
-	ret = of_address_to_resource(node, 0, &res);
-	if (ret)
-		return ret;
-
 	chip_data = kzalloc(sizeof(*chip_data), GFP_KERNEL);
 	if (!chip_data)
 		return -ENOMEM;
 
-	size = resource_size(&res);
-	intpol_num = size * 8;
-	chip_data->intpol_base = ioremap(res.start, size);
-	if (!chip_data->intpol_base) {
-		pr_err("mtk_sysirq: unable to map sysirq register\n");
-		ret = -ENXIO;
-		goto out_free;
+	while (of_get_address(node, i++, NULL, NULL))
+		nr_intpol_bases++;
+
+	if (nr_intpol_bases == 0) {
+		pr_err("mtk_sysirq: base address not specified\n");
+		ret = -EINVAL;
+		goto out_free_chip;
+	}
+
+	chip_data->intpol_words = kcalloc(nr_intpol_bases,
+					  sizeof(*chip_data->intpol_words),
+					  GFP_KERNEL);
+	if (!chip_data->intpol_words) {
+		ret = -ENOMEM;
+		goto out_free_chip;
+	}
+
+	chip_data->intpol_bases = kcalloc(nr_intpol_bases,
+					  sizeof(*chip_data->intpol_bases),
+					  GFP_KERNEL);
+	if (!chip_data->intpol_bases) {
+		ret = -ENOMEM;
+		goto out_free_intpol_words;
+	}
+
+	for (i = 0; i < nr_intpol_bases; i++) {
+		struct resource res;
+
+		ret = of_address_to_resource(node, i, &res);
+		size = resource_size(&res);
+		intpol_num += size * 8;
+		chip_data->intpol_words[i] = size / 4;
+		chip_data->intpol_bases[i] = of_iomap(node, i);
+		if (ret || !chip_data->intpol_bases[i]) {
+			pr_err("%s: couldn't map region %d\n",
+			       node->full_name, i);
+			ret = -ENODEV;
+			goto out_free_intpol;
+		}
+	}
+
+	chip_data->intpol_idx = kcalloc(intpol_num,
+					sizeof(*chip_data->intpol_idx),
+					GFP_KERNEL);
+	if (!chip_data->intpol_idx) {
+		ret = -ENOMEM;
+		goto out_free_intpol;
+	}
+
+	chip_data->which_word = kcalloc(intpol_num,
+					sizeof(*chip_data->which_word),
+					GFP_KERNEL);
+	if (!chip_data->which_word) {
+		ret = -ENOMEM;
+		goto out_free_intpol_idx;
+	}
+
+	/*
+	 * assign an index of the intpol_bases for each irq
+	 * to set it fast later
+	 */
+	for (i = 0; i < intpol_num ; i++) {
+		u32 word = i / 32, j;
+
+		for (j = 0; word >= chip_data->intpol_words[j] ; j++)
+			word -= chip_data->intpol_words[j];
+
+		chip_data->intpol_idx[i] = j;
+		chip_data->which_word[i] = word;
 	}
 
 	domain = irq_domain_add_hierarchy(domain_parent, 0, intpol_num, node,
 					  &sysirq_domain_ops, chip_data);
 	if (!domain) {
 		ret = -ENOMEM;
-		goto out_unmap;
+		goto out_free_which_word;
 	}
 	spin_lock_init(&chip_data->lock);
 
 	return 0;
 
-out_unmap:
-	iounmap(chip_data->intpol_base);
-out_free:
+out_free_which_word:
+	kfree(chip_data->which_word);
+out_free_intpol_idx:
+	kfree(chip_data->intpol_idx);
+out_free_intpol:
+	for (i = 0; i < nr_intpol_bases; i++)
+		if (chip_data->intpol_bases[i])
+			iounmap(chip_data->intpol_bases[i]);
+	kfree(chip_data->intpol_bases);
+out_free_intpol_words:
+	kfree(chip_data->intpol_words);
+out_free_chip:
 	kfree(chip_data);
 	return ret;
 }
-- 
1.7.9.5
