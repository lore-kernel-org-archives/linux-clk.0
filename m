Return-Path: <miquel.raynal@bootlin.com>
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antoine Tenart <antoine.tenart@bootlin.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Nadav Haklai <nadavh@marvell.com>,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RESEND PATCH v3 2/2] clk: mvebu: armada-37xx-periph: add suspend/resume support
Date: Fri, 13 Jul 2018 15:44:46 +0200
Message-Id: <20180713134446.27882-2-miquel.raynal@bootlin.com>
In-Reply-To: <20180713134446.27882-1-miquel.raynal@bootlin.com>
References: <20180713134446.27882-1-miquel.raynal@bootlin.com>
List-ID: <linux-clk.vger.kernel.org>

Add suspend/resume hooks in Armada 37xx peripheral clocks driver to
handle S2RAM operations.

One can think that these hooks are useless by comparing the register
values before and after a suspend/resume cycle: they will look the same
anyway. This is because of some scripts executed by the Cortex-M3 core
during ATF operations to init both the clocks and the DDR. These values
could be modified by the BL33 stage or by Linux itself and should be
preserved.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Resend because I failed M. Turquette's address.

Changes since v2:
=================
* Removed the pre-processor conditionals #if defined()/#endif.
* Define the __maybe_unused attribute on the suspend/resume functions.
* Used SET_SYSTEM_SLEEP_PM_OPS in the dev_pm_ops structure.

Changes since v1:
=================
* Defined an ARMADA_3700_DEV_PM_OPS value for when CONFIG_PM is present
  or not and used it in the platform device structure to define '.pm'.

 drivers/clk/mvebu/armada-37xx-periph.c | 43 ++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu/armada-37xx-periph.c
index a9e3dcc50a7b..5e70fda9af38 100644
--- a/drivers/clk/mvebu/armada-37xx-periph.c
+++ b/drivers/clk/mvebu/armada-37xx-periph.c
@@ -59,6 +59,14 @@ struct clk_periph_driver_data {
 	struct clk_hw_onecell_data *hw_data;
 	spinlock_t lock;
 	void __iomem *reg;
+
+	/* Storage registers for suspend/resume operations */
+	u32 tbg_sel;
+	u32 div_sel0;
+	u32 div_sel1;
+	u32 div_sel2;
+	u32 clk_sel;
+	u32 clk_dis;
 };
 
 struct clk_double_div {
@@ -642,6 +650,40 @@ static int armada_3700_add_composite_clk(const struct clk_periph_data *data,
 	return PTR_ERR_OR_ZERO(*hw);
 }
 
+static int __maybe_unused armada_3700_periph_clock_suspend(struct device *dev)
+{
+	struct clk_periph_driver_data *data = dev_get_drvdata(dev);
+
+	data->tbg_sel = readl(data->reg + TBG_SEL);
+	data->div_sel0 = readl(data->reg + DIV_SEL0);
+	data->div_sel1 = readl(data->reg + DIV_SEL1);
+	data->div_sel2 = readl(data->reg + DIV_SEL2);
+	data->clk_sel = readl(data->reg + CLK_SEL);
+	data->clk_dis = readl(data->reg + CLK_DIS);
+
+	return 0;
+}
+
+static int __maybe_unused armada_3700_periph_clock_resume(struct device *dev)
+{
+	struct clk_periph_driver_data *data = dev_get_drvdata(dev);
+
+	/* Follow the same order than what the Cortex-M3 does (ATF code) */
+	writel(data->clk_dis, data->reg + CLK_DIS);
+	writel(data->div_sel0, data->reg + DIV_SEL0);
+	writel(data->div_sel1, data->reg + DIV_SEL1);
+	writel(data->div_sel2, data->reg + DIV_SEL2);
+	writel(data->tbg_sel, data->reg + TBG_SEL);
+	writel(data->clk_sel, data->reg + CLK_SEL);
+
+	return 0;
+}
+
+static const struct dev_pm_ops armada_3700_periph_clock_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(armada_3700_periph_clock_suspend,
+				armada_3700_periph_clock_resume)
+};
+
 static int armada_3700_periph_clock_probe(struct platform_device *pdev)
 {
 	struct clk_periph_driver_data *driver_data;
@@ -717,6 +759,7 @@ static struct platform_driver armada_3700_periph_clock_driver = {
 	.driver		= {
 		.name	= "marvell-armada-3700-periph-clock",
 		.of_match_table = armada_3700_periph_clock_of_match,
+		.pm	= &armada_3700_periph_clock_pm_ops,
 	},
 };
 
-- 
2.14.1
