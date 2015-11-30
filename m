Return-Path: <lars@metafoo.de>
From: Lars-Peter Clausen <lars@metafoo.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 1/2] clk: axi-clkgen: Remove version 1 support
Date: Mon, 30 Nov 2015 17:54:55 +0100
Message-Id: <1448902496-21218-1-git-send-email-lars@metafoo.de>
List-ID: <linux-clk.vger.kernel.org>

Version 1 of the axi-clkgen core has not been used in new designs for over
two years now. This is a soft peripheral used in FPGAs and anybody who has
updated their kernel to the latest version will also have updated the
bitstream containing the clock generator. So it should be safe to drop
support for this now.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/clk/clk-axi-clkgen.c | 125 ++-----------------------------------------
 1 file changed, 4 insertions(+), 121 deletions(-)

diff --git a/drivers/clk/clk-axi-clkgen.c b/drivers/clk/clk-axi-clkgen.c
index 3bcd42f..8dedc60 100644
--- a/drivers/clk/clk-axi-clkgen.c
+++ b/drivers/clk/clk-axi-clkgen.c
@@ -16,18 +16,6 @@
 #include <linux/module.h>
 #include <linux/err.h>
 
-#define AXI_CLKGEN_V1_REG_UPDATE_ENABLE	0x04
-#define AXI_CLKGEN_V1_REG_CLK_OUT1	0x08
-#define AXI_CLKGEN_V1_REG_CLK_OUT2	0x0c
-#define AXI_CLKGEN_V1_REG_CLK_DIV	0x10
-#define AXI_CLKGEN_V1_REG_CLK_FB1	0x14
-#define AXI_CLKGEN_V1_REG_CLK_FB2	0x18
-#define AXI_CLKGEN_V1_REG_LOCK1		0x1c
-#define AXI_CLKGEN_V1_REG_LOCK2		0x20
-#define AXI_CLKGEN_V1_REG_LOCK3		0x24
-#define AXI_CLKGEN_V1_REG_FILTER1	0x28
-#define AXI_CLKGEN_V1_REG_FILTER2	0x2c
-
 #define AXI_CLKGEN_V2_REG_RESET		0x40
 #define AXI_CLKGEN_V2_REG_DRP_CNTRL	0x70
 #define AXI_CLKGEN_V2_REG_DRP_STATUS	0x74
@@ -51,40 +39,11 @@
 #define MMCM_REG_FILTER1	0x4e
 #define MMCM_REG_FILTER2	0x4f
 
-struct axi_clkgen;
-
-struct axi_clkgen_mmcm_ops {
-	void (*enable)(struct axi_clkgen *axi_clkgen, bool enable);
-	int (*write)(struct axi_clkgen *axi_clkgen, unsigned int reg,
-		     unsigned int val, unsigned int mask);
-	int (*read)(struct axi_clkgen *axi_clkgen, unsigned int reg,
-		    unsigned int *val);
-};
-
 struct axi_clkgen {
 	void __iomem *base;
-	const struct axi_clkgen_mmcm_ops *mmcm_ops;
 	struct clk_hw clk_hw;
 };
 
-static void axi_clkgen_mmcm_enable(struct axi_clkgen *axi_clkgen,
-	bool enable)
-{
-	axi_clkgen->mmcm_ops->enable(axi_clkgen, enable);
-}
-
-static int axi_clkgen_mmcm_write(struct axi_clkgen *axi_clkgen,
-	unsigned int reg, unsigned int val, unsigned int mask)
-{
-	return axi_clkgen->mmcm_ops->write(axi_clkgen, reg, val, mask);
-}
-
-static int axi_clkgen_mmcm_read(struct axi_clkgen *axi_clkgen,
-	unsigned int reg, unsigned int *val)
-{
-	return axi_clkgen->mmcm_ops->read(axi_clkgen, reg, val);
-}
-
 static uint32_t axi_clkgen_lookup_filter(unsigned int m)
 {
 	switch (m) {
@@ -207,70 +166,6 @@ static void axi_clkgen_read(struct axi_clkgen *axi_clkgen,
 	*val = readl(axi_clkgen->base + reg);
 }
 
-static unsigned int axi_clkgen_v1_map_mmcm_reg(unsigned int reg)
-{
-	switch (reg) {
-	case MMCM_REG_CLKOUT0_1:
-		return AXI_CLKGEN_V1_REG_CLK_OUT1;
-	case MMCM_REG_CLKOUT0_2:
-		return AXI_CLKGEN_V1_REG_CLK_OUT2;
-	case MMCM_REG_CLK_FB1:
-		return AXI_CLKGEN_V1_REG_CLK_FB1;
-	case MMCM_REG_CLK_FB2:
-		return AXI_CLKGEN_V1_REG_CLK_FB2;
-	case MMCM_REG_CLK_DIV:
-		return AXI_CLKGEN_V1_REG_CLK_DIV;
-	case MMCM_REG_LOCK1:
-		return AXI_CLKGEN_V1_REG_LOCK1;
-	case MMCM_REG_LOCK2:
-		return AXI_CLKGEN_V1_REG_LOCK2;
-	case MMCM_REG_LOCK3:
-		return AXI_CLKGEN_V1_REG_LOCK3;
-	case MMCM_REG_FILTER1:
-		return AXI_CLKGEN_V1_REG_FILTER1;
-	case MMCM_REG_FILTER2:
-		return AXI_CLKGEN_V1_REG_FILTER2;
-	default:
-		return 0;
-	}
-}
-
-static int axi_clkgen_v1_mmcm_write(struct axi_clkgen *axi_clkgen,
-	unsigned int reg, unsigned int val, unsigned int mask)
-{
-	reg = axi_clkgen_v1_map_mmcm_reg(reg);
-	if (reg == 0)
-		return -EINVAL;
-
-	axi_clkgen_write(axi_clkgen, reg, val);
-
-	return 0;
-}
-
-static int axi_clkgen_v1_mmcm_read(struct axi_clkgen *axi_clkgen,
-	unsigned int reg, unsigned int *val)
-{
-	reg = axi_clkgen_v1_map_mmcm_reg(reg);
-	if (reg == 0)
-		return -EINVAL;
-
-	axi_clkgen_read(axi_clkgen, reg, val);
-
-	return 0;
-}
-
-static void axi_clkgen_v1_mmcm_enable(struct axi_clkgen *axi_clkgen,
-	bool enable)
-{
-	axi_clkgen_write(axi_clkgen, AXI_CLKGEN_V1_REG_UPDATE_ENABLE, enable);
-}
-
-static const struct axi_clkgen_mmcm_ops axi_clkgen_v1_mmcm_ops = {
-	.write = axi_clkgen_v1_mmcm_write,
-	.read = axi_clkgen_v1_mmcm_read,
-	.enable = axi_clkgen_v1_mmcm_enable,
-};
-
 static int axi_clkgen_wait_non_busy(struct axi_clkgen *axi_clkgen)
 {
 	unsigned int timeout = 10000;
@@ -286,7 +181,7 @@ static int axi_clkgen_wait_non_busy(struct axi_clkgen *axi_clkgen)
 	return val & 0xffff;
 }
 
-static int axi_clkgen_v2_mmcm_read(struct axi_clkgen *axi_clkgen,
+static int axi_clkgen_mmcm_read(struct axi_clkgen *axi_clkgen,
 	unsigned int reg, unsigned int *val)
 {
 	unsigned int reg_val;
@@ -310,7 +205,7 @@ static int axi_clkgen_v2_mmcm_read(struct axi_clkgen *axi_clkgen,
 	return 0;
 }
 
-static int axi_clkgen_v2_mmcm_write(struct axi_clkgen *axi_clkgen,
+static int axi_clkgen_mmcm_write(struct axi_clkgen *axi_clkgen,
 	unsigned int reg, unsigned int val, unsigned int mask)
 {
 	unsigned int reg_val = 0;
@@ -321,7 +216,7 @@ static int axi_clkgen_v2_mmcm_write(struct axi_clkgen *axi_clkgen,
 		return ret;
 
 	if (mask != 0xffff) {
-		axi_clkgen_v2_mmcm_read(axi_clkgen, reg, &reg_val);
+		axi_clkgen_mmcm_read(axi_clkgen, reg, &reg_val);
 		reg_val &= ~mask;
 	}
 
@@ -332,7 +227,7 @@ static int axi_clkgen_v2_mmcm_write(struct axi_clkgen *axi_clkgen,
 	return 0;
 }
 
-static void axi_clkgen_v2_mmcm_enable(struct axi_clkgen *axi_clkgen,
+static void axi_clkgen_mmcm_enable(struct axi_clkgen *axi_clkgen,
 	bool enable)
 {
 	unsigned int val = AXI_CLKGEN_V2_RESET_ENABLE;
@@ -343,12 +238,6 @@ static void axi_clkgen_v2_mmcm_enable(struct axi_clkgen *axi_clkgen,
 	axi_clkgen_write(axi_clkgen, AXI_CLKGEN_V2_REG_RESET, val);
 }
 
-static const struct axi_clkgen_mmcm_ops axi_clkgen_v2_mmcm_ops = {
-	.write = axi_clkgen_v2_mmcm_write,
-	.read = axi_clkgen_v2_mmcm_read,
-	.enable = axi_clkgen_v2_mmcm_enable,
-};
-
 static struct axi_clkgen *clk_hw_to_axi_clkgen(struct clk_hw *clk_hw)
 {
 	return container_of(clk_hw, struct axi_clkgen, clk_hw);
@@ -470,11 +359,7 @@ static const struct clk_ops axi_clkgen_ops = {
 
 static const struct of_device_id axi_clkgen_ids[] = {
 	{
-		.compatible = "adi,axi-clkgen-1.00.a",
-		.data = &axi_clkgen_v1_mmcm_ops
-	}, {
 		.compatible = "adi,axi-clkgen-2.00.a",
-		.data = &axi_clkgen_v2_mmcm_ops,
 	},
 	{ },
 };
@@ -501,8 +386,6 @@ static int axi_clkgen_probe(struct platform_device *pdev)
 	if (!axi_clkgen)
 		return -ENOMEM;
 
-	axi_clkgen->mmcm_ops = id->data;
-
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	axi_clkgen->base = devm_ioremap_resource(&pdev->dev, mem);
 	if (IS_ERR(axi_clkgen->base))
-- 
2.1.4
