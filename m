Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.bootlin.com ([62.4.15.54]:33457 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729634AbeGMNvZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 13 Jul 2018 09:51:25 -0400
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.co>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nadav Haklai <nadavh@marvell.com>, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 1/2] clk: mvebu: armada-37xx-periph: save the IP base address in the driver data
Date: Fri, 13 Jul 2018 15:36:38 +0200
Message-Id: <20180713133639.27558-1-miquel.raynal@bootlin.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Prepare the introduction of suspend/resume hooks by having an easy way
to access all the registers in one go just from a device: add the IP
base address in the driver data.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Changes since v2:
=================
* None

Changes since v1:
=================
* None

 drivers/clk/mvebu/armada-37xx-periph.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu/armada-37xx-periph.c
index 6860bd5a37c5..a9e3dcc50a7b 100644
--- a/drivers/clk/mvebu/armada-37xx-periph.c
+++ b/drivers/clk/mvebu/armada-37xx-periph.c
@@ -58,6 +58,7 @@
 struct clk_periph_driver_data {
 	struct clk_hw_onecell_data *hw_data;
 	spinlock_t lock;
+	void __iomem *reg;
 };
 
 struct clk_double_div {
@@ -649,7 +650,6 @@ static int armada_3700_periph_clock_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int num_periph = 0, i, ret;
 	struct resource *res;
-	void __iomem *reg;
 
 	data = of_device_get_match_data(dev);
 	if (!data)
@@ -658,11 +658,6 @@ static int armada_3700_periph_clock_probe(struct platform_device *pdev)
 	while (data[num_periph].name)
 		num_periph++;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg = devm_ioremap_resource(dev, res);
-	if (IS_ERR(reg))
-		return PTR_ERR(reg);
-
 	driver_data = devm_kzalloc(dev, sizeof(*driver_data), GFP_KERNEL);
 	if (!driver_data)
 		return -ENOMEM;
@@ -675,12 +670,16 @@ static int armada_3700_periph_clock_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	driver_data->hw_data->num = num_periph;
 
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	driver_data->reg = devm_ioremap_resource(dev, res);
+	if (IS_ERR(driver_data->reg))
+		return PTR_ERR(driver_data->reg);
+
 	spin_lock_init(&driver_data->lock);
 
 	for (i = 0; i < num_periph; i++) {
 		struct clk_hw **hw = &driver_data->hw_data->hws[i];
-
-		if (armada_3700_add_composite_clk(&data[i], reg,
+		if (armada_3700_add_composite_clk(&data[i], driver_data->reg,
 						  &driver_data->lock, dev, hw))
 			dev_err(dev, "Can't register periph clock %s\n",
 				data[i].name);
-- 
2.14.1

