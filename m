Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from www381.your-server.de ([78.46.137.84]:57332 "EHLO
        www381.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750762AbdIEJcz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 Sep 2017 05:32:55 -0400
From: Lars-Peter Clausen <lars@metafoo.de>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 1/2] clk: axi-clkgen: Correctly handle nocount bit in recalc_rate()
Date: Tue,  5 Sep 2017 11:32:40 +0200
Message-Id: <20170905093241.18582-1-lars@metafoo.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

If the nocount bit is set the divider is bypassed and the settings for the
divider count should be ignored and a divider value of 1 should be assumed.
Handle this correctly in the driver recalc_rate() callback.

While the driver sets up the part so that the read back dividers values
yield the correct result the power-on reset settings of the part might not
reflect this and hence calling e.g. clk_get_rate() without prior calls to
clk_set_rate() will yield the wrong result.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/clk/clk-axi-clkgen.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-axi-clkgen.c b/drivers/clk/clk-axi-clkgen.c
index 5e918e7afaba..95a6e9834392 100644
--- a/drivers/clk/clk-axi-clkgen.c
+++ b/drivers/clk/clk-axi-clkgen.c
@@ -40,6 +40,10 @@
 #define MMCM_REG_FILTER1	0x4e
 #define MMCM_REG_FILTER2	0x4f
 
+#define MMCM_CLKOUT_NOCOUNT	BIT(6)
+
+#define MMCM_CLK_DIV_NOCOUNT	BIT(12)
+
 struct axi_clkgen {
 	void __iomem *base;
 	struct clk_hw clk_hw;
@@ -315,12 +319,27 @@ static unsigned long axi_clkgen_recalc_rate(struct clk_hw *clk_hw,
 	unsigned int reg;
 	unsigned long long tmp;
 
-	axi_clkgen_mmcm_read(axi_clkgen, MMCM_REG_CLKOUT0_1, &reg);
-	dout = (reg & 0x3f) + ((reg >> 6) & 0x3f);
+	axi_clkgen_mmcm_read(axi_clkgen, MMCM_REG_CLKOUT0_2, &reg);
+	if (reg & MMCM_CLKOUT_NOCOUNT) {
+		dout = 1;
+	} else {
+		axi_clkgen_mmcm_read(axi_clkgen, MMCM_REG_CLKOUT0_1, &reg);
+		dout = (reg & 0x3f) + ((reg >> 6) & 0x3f);
+	}
+
 	axi_clkgen_mmcm_read(axi_clkgen, MMCM_REG_CLK_DIV, &reg);
-	d = (reg & 0x3f) + ((reg >> 6) & 0x3f);
-	axi_clkgen_mmcm_read(axi_clkgen, MMCM_REG_CLK_FB1, &reg);
-	m = (reg & 0x3f) + ((reg >> 6) & 0x3f);
+	if (reg & MMCM_CLK_DIV_NOCOUNT)
+		d = 1;
+	else
+		d = (reg & 0x3f) + ((reg >> 6) & 0x3f);
+
+	axi_clkgen_mmcm_read(axi_clkgen, MMCM_REG_CLK_FB2, &reg);
+	if (reg & MMCM_CLKOUT_NOCOUNT) {
+		m = 1;
+	} else {
+		axi_clkgen_mmcm_read(axi_clkgen, MMCM_REG_CLK_FB1, &reg);
+		m = (reg & 0x3f) + ((reg >> 6) & 0x3f);
+	}
 
 	if (d == 0 || dout == 0)
 		return 0;
-- 
2.11.0

