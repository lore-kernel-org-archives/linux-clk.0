Return-Path: <lars@metafoo.de>
From: Lars-Peter Clausen <lars@metafoo.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 2/2] clk: axi-clkgen: Add multi-parent support
Date: Mon, 30 Nov 2015 17:54:56 +0100
Message-Id: <1448902496-21218-2-git-send-email-lars@metafoo.de>
In-Reply-To: <1448902496-21218-1-git-send-email-lars@metafoo.de>
References: <1448902496-21218-1-git-send-email-lars@metafoo.de>
List-ID: <linux-clk.vger.kernel.org>

The clock generator has two clock inputs that can be used as the reference
clock. Add support for switching between them at runtime.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 .../devicetree/bindings/clock/axi-clkgen.txt       |  5 ++-
 drivers/clk/clk-axi-clkgen.c                       | 40 ++++++++++++++++++----
 2 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/axi-clkgen.txt b/Documentation/devicetree/bindings/clock/axi-clkgen.txt
index 20e1704..fb40da3 100644
--- a/Documentation/devicetree/bindings/clock/axi-clkgen.txt
+++ b/Documentation/devicetree/bindings/clock/axi-clkgen.txt
@@ -8,7 +8,10 @@ Required properties:
 - compatible : shall be "adi,axi-clkgen-1.00.a" or "adi,axi-clkgen-2.00.a".
 - #clock-cells : from common clock binding; Should always be set to 0.
 - reg : Address and length of the axi-clkgen register set.
-- clocks : Phandle and clock specifier for the parent clock.
+- clocks : Phandle and clock specifier for the parent clock(s). This must
+	either reference one clock if only the first clock input is connected or two
+	if both clock inputs are connected. For the later case the clock connected
+	to the first input must be specified first.
 
 Optional properties:
 - clock-output-names : From common clock binding.
diff --git a/drivers/clk/clk-axi-clkgen.c b/drivers/clk/clk-axi-clkgen.c
index 8dedc60..9a0744c 100644
--- a/drivers/clk/clk-axi-clkgen.c
+++ b/drivers/clk/clk-axi-clkgen.c
@@ -17,6 +17,7 @@
 #include <linux/err.h>
 
 #define AXI_CLKGEN_V2_REG_RESET		0x40
+#define AXI_CLKGEN_V2_REG_CLKSEL	0x44
 #define AXI_CLKGEN_V2_REG_DRP_CNTRL	0x70
 #define AXI_CLKGEN_V2_REG_DRP_STATUS	0x74
 
@@ -349,12 +350,33 @@ static void axi_clkgen_disable(struct clk_hw *clk_hw)
 	axi_clkgen_mmcm_enable(axi_clkgen, false);
 }
 
+static int axi_clkgen_set_parent(struct clk_hw *clk_hw, u8 index)
+{
+	struct axi_clkgen *axi_clkgen = clk_hw_to_axi_clkgen(clk_hw);
+
+	axi_clkgen_write(axi_clkgen, AXI_CLKGEN_V2_REG_CLKSEL, index);
+
+	return 0;
+}
+
+static u8 axi_clkgen_get_parent(struct clk_hw *clk_hw)
+{
+	struct axi_clkgen *axi_clkgen = clk_hw_to_axi_clkgen(clk_hw);
+	unsigned int parent;
+
+	axi_clkgen_read(axi_clkgen, AXI_CLKGEN_V2_REG_CLKSEL, &parent);
+
+	return parent;
+}
+
 static const struct clk_ops axi_clkgen_ops = {
 	.recalc_rate = axi_clkgen_recalc_rate,
 	.round_rate = axi_clkgen_round_rate,
 	.set_rate = axi_clkgen_set_rate,
 	.enable = axi_clkgen_enable,
 	.disable = axi_clkgen_disable,
+	.set_parent = axi_clkgen_set_parent,
+	.get_parent = axi_clkgen_get_parent,
 };
 
 static const struct of_device_id axi_clkgen_ids[] = {
@@ -370,10 +392,11 @@ static int axi_clkgen_probe(struct platform_device *pdev)
 	const struct of_device_id *id;
 	struct axi_clkgen *axi_clkgen;
 	struct clk_init_data init;
-	const char *parent_name;
+	const char *parent_names[2];
 	const char *clk_name;
 	struct resource *mem;
 	struct clk *clk;
+	unsigned int i;
 
 	if (!pdev->dev.of_node)
 		return -ENODEV;
@@ -391,19 +414,24 @@ static int axi_clkgen_probe(struct platform_device *pdev)
 	if (IS_ERR(axi_clkgen->base))
 		return PTR_ERR(axi_clkgen->base);
 
-	parent_name = of_clk_get_parent_name(pdev->dev.of_node, 0);
-	if (!parent_name)
+	init.num_parents = of_clk_get_parent_count(pdev->dev.of_node);
+	if (init.num_parents < 1 || init.num_parents > 2)
 		return -EINVAL;
 
+	for (i = 0; i < init.num_parents; i++) {
+		parent_names[i] = of_clk_get_parent_name(pdev->dev.of_node, i);
+		if (!parent_names[i])
+			return -EINVAL;
+	}
+
 	clk_name = pdev->dev.of_node->name;
 	of_property_read_string(pdev->dev.of_node, "clock-output-names",
 		&clk_name);
 
 	init.name = clk_name;
 	init.ops = &axi_clkgen_ops;
-	init.flags = CLK_SET_RATE_GATE;
-	init.parent_names = &parent_name;
-	init.num_parents = 1;
+	init.flags = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE;
+	init.parent_names = parent_names;
 
 	axi_clkgen_mmcm_enable(axi_clkgen, false);
 
-- 
2.1.4
