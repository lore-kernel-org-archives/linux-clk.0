Return-Path: <miquel.raynal@bootlin.com>
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antoine Tenart <antoine.tenart@bootlin.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Nadav Haklai <nadavh@marvell.com>,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 1/2] clk: mvebu: armada-37xx-periph: save the IP base address in the driver data
Date: Sat, 21 Apr 2018 16:23:43 +0200
Message-Id: <20180421142344.25944-1-miquel.raynal@bootlin.com>
List-ID: <linux-clk.vger.kernel.org>

Prepare the introduction of suspend/resume hooks by having an easy way
to access all the registers in one go just from a device: add the IP
base address in the driver data.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/mvebu/armada-37xx-periph.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu/armada-37xx-periph.c
index 87213ea7fc84..723bb7f6cea1 100644
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
@@ -674,12 +669,16 @@ static int armada_3700_periph_clock_probe(struct platform_device *pdev)
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
