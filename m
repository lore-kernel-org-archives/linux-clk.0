Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52AD7C43334
	for <linux-clk@archiver.kernel.org>; Tue, 19 Jul 2022 10:12:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbiGSKMr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Jul 2022 06:12:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbiGSKMr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Jul 2022 06:12:47 -0400
X-Greylist: delayed 1549 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 19 Jul 2022 03:12:45 PDT
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF83FDF17
        for <linux-clk@vger.kernel.org>; Tue, 19 Jul 2022 03:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
         s=default2002; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
        Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References;
        bh=0xTH0WBeI1U9uiE/7Nyzdx2u7dWUze1MWQGniFaIJOU=; b=YchtapTgomP5QoLg/FxBSv/lOx
        E0NqZU30qi4XwaP/MRPrf0MUP8PRjAYK+5MO5oBnY5i0vC5JuPDoUC7EQXxS6Wk1kmOERHFWUhWAy
        DzbdT7XJJtKLevR4ZpYKWvUm2GIgJIMJWd/SMVFUXEWbhIVgdTrBEp+JNERReDtBYu+WcigwdJo94
        +D67jPkP0PMNOSNnMJrf/vziLfb4Ry9IuPake5sgWU5C6a1sKXZiQxcerH9fWCMT9HYndtba2J36+
        KeFgb9D51VXyEUx0wWIRI5V5PBdfqWvmTXjzzEiRq5708ZmFqLeyguVuNDhJktwtApQra98ps3S/1
        9RhIJt3Q==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
        by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <lars@metafoo.de>)
        id 1oDjoc-00017R-Fs; Tue, 19 Jul 2022 11:46:54 +0200
Received: from [2001:a61:2a04:b01:9e5c:8eff:fe01:8578] (helo=lars-desktop.fritz.box)
        by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1oDjoc-000Dq4-AZ; Tue, 19 Jul 2022 11:46:54 +0200
From:   Lars-Peter Clausen <lars@metafoo.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-clk@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 1/2] clk: vc5: Check IO access results
Date:   Tue, 19 Jul 2022 11:46:36 +0200
Message-Id: <20220719094637.844946-1-lars@metafoo.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.6/26606/Tue Jul 19 09:57:30 2022)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The devices of the versaclk clock generator family use an I2C control bus.
IO access on an I2C bus can fail for various reasons.

The driver currently ignores the return value of most IO operations. This
results in silent failure. To avoid this check the return value and in case
of an error abort the operation and propagate the error code to the caller.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/clk/clk-versaclock5.c | 141 ++++++++++++++++++++++------------
 1 file changed, 91 insertions(+), 50 deletions(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index e7be3e54b9be..e83148eb2c24 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -230,8 +230,12 @@ static unsigned char vc5_mux_get_parent(struct clk_hw *hw)
 		container_of(hw, struct vc5_driver_data, clk_mux);
 	const u8 mask = VC5_PRIM_SRC_SHDN_EN_XTAL | VC5_PRIM_SRC_SHDN_EN_CLKIN;
 	unsigned int src;
+	int ret;
+
+	ret = regmap_read(vc5->regmap, VC5_PRIM_SRC_SHDN, &src);
+	if (ret)
+		return 0;
 
-	regmap_read(vc5->regmap, VC5_PRIM_SRC_SHDN, &src);
 	src &= mask;
 
 	if (src == VC5_PRIM_SRC_SHDN_EN_XTAL)
@@ -286,8 +290,12 @@ static unsigned long vc5_dbl_recalc_rate(struct clk_hw *hw,
 	struct vc5_driver_data *vc5 =
 		container_of(hw, struct vc5_driver_data, clk_mul);
 	unsigned int premul;
+	int ret;
+
+	ret = regmap_read(vc5->regmap, VC5_PRIM_SRC_SHDN, &premul);
+	if (ret)
+		return 0;
 
-	regmap_read(vc5->regmap, VC5_PRIM_SRC_SHDN, &premul);
 	if (premul & VC5_PRIM_SRC_SHDN_EN_DOUBLE_XTAL_FREQ)
 		parent_rate *= 2;
 
@@ -315,11 +323,9 @@ static int vc5_dbl_set_rate(struct clk_hw *hw, unsigned long rate,
 	else
 		mask = 0;
 
-	regmap_update_bits(vc5->regmap, VC5_PRIM_SRC_SHDN,
-			   VC5_PRIM_SRC_SHDN_EN_DOUBLE_XTAL_FREQ,
-			   mask);
-
-	return 0;
+	return regmap_update_bits(vc5->regmap, VC5_PRIM_SRC_SHDN,
+				  VC5_PRIM_SRC_SHDN_EN_DOUBLE_XTAL_FREQ,
+				  mask);
 }
 
 static const struct clk_ops vc5_dbl_ops = {
@@ -334,14 +340,19 @@ static unsigned long vc5_pfd_recalc_rate(struct clk_hw *hw,
 	struct vc5_driver_data *vc5 =
 		container_of(hw, struct vc5_driver_data, clk_pfd);
 	unsigned int prediv, div;
+	int ret;
 
-	regmap_read(vc5->regmap, VC5_VCO_CTRL_AND_PREDIV, &prediv);
+	ret = regmap_read(vc5->regmap, VC5_VCO_CTRL_AND_PREDIV, &prediv);
+	if (ret)
+		return 0;
 
 	/* The bypass_prediv is set, PLL fed from Ref_in directly. */
 	if (prediv & VC5_VCO_CTRL_AND_PREDIV_BYPASS_PREDIV)
 		return parent_rate;
 
-	regmap_read(vc5->regmap, VC5_REF_DIVIDER, &div);
+	ret = regmap_read(vc5->regmap, VC5_REF_DIVIDER, &div);
+	if (ret)
+		return 0;
 
 	/* The Sel_prediv2 is set, PLL fed from prediv2 (Ref_in / 2) */
 	if (div & VC5_REF_DIVIDER_SEL_PREDIV2)
@@ -376,15 +387,18 @@ static int vc5_pfd_set_rate(struct clk_hw *hw, unsigned long rate,
 	struct vc5_driver_data *vc5 =
 		container_of(hw, struct vc5_driver_data, clk_pfd);
 	unsigned long idiv;
+	int ret;
 	u8 div;
 
 	/* CLKIN within range of PLL input, feed directly to PLL. */
 	if (parent_rate <= 50000000) {
-		regmap_update_bits(vc5->regmap, VC5_VCO_CTRL_AND_PREDIV,
-				   VC5_VCO_CTRL_AND_PREDIV_BYPASS_PREDIV,
-				   VC5_VCO_CTRL_AND_PREDIV_BYPASS_PREDIV);
-		regmap_update_bits(vc5->regmap, VC5_REF_DIVIDER, 0xff, 0x00);
-		return 0;
+		ret = regmap_update_bits(vc5->regmap, VC5_VCO_CTRL_AND_PREDIV,
+					 VC5_VCO_CTRL_AND_PREDIV_BYPASS_PREDIV,
+					 VC5_VCO_CTRL_AND_PREDIV_BYPASS_PREDIV);
+		if (ret)
+			return ret;
+
+		return regmap_update_bits(vc5->regmap, VC5_REF_DIVIDER, 0xff, 0x00);
 	}
 
 	idiv = DIV_ROUND_UP(parent_rate, rate);
@@ -395,11 +409,12 @@ static int vc5_pfd_set_rate(struct clk_hw *hw, unsigned long rate,
 	else
 		div = VC5_REF_DIVIDER_REF_DIV(idiv);
 
-	regmap_update_bits(vc5->regmap, VC5_REF_DIVIDER, 0xff, div);
-	regmap_update_bits(vc5->regmap, VC5_VCO_CTRL_AND_PREDIV,
-			   VC5_VCO_CTRL_AND_PREDIV_BYPASS_PREDIV, 0);
+	ret = regmap_update_bits(vc5->regmap, VC5_REF_DIVIDER, 0xff, div);
+	if (ret)
+		return ret;
 
-	return 0;
+	return regmap_update_bits(vc5->regmap, VC5_VCO_CTRL_AND_PREDIV,
+				  VC5_VCO_CTRL_AND_PREDIV_BYPASS_PREDIV, 0);
 }
 
 static const struct clk_ops vc5_pfd_ops = {
@@ -551,9 +566,12 @@ static int vc5_fod_set_rate(struct clk_hw *hw, unsigned long rate,
 		hwdata->div_int >> 4, hwdata->div_int << 4,
 		0
 	};
+	int ret;
 
-	regmap_bulk_write(vc5->regmap, VC5_OUT_DIV_FRAC(hwdata->num, 0),
-			  data, 14);
+	ret = regmap_bulk_write(vc5->regmap, VC5_OUT_DIV_FRAC(hwdata->num, 0),
+				data, 14);
+	if (ret)
+		return ret;
 
 	/*
 	 * Toggle magic bit in undocumented register for unknown reason.
@@ -561,12 +579,14 @@ static int vc5_fod_set_rate(struct clk_hw *hw, unsigned long rate,
 	 * datasheet somewhat implies this is needed, but the register
 	 * and the bit is not documented.
 	 */
-	regmap_update_bits(vc5->regmap, VC5_GLOBAL_REGISTER,
-			   VC5_GLOBAL_REGISTER_GLOBAL_RESET, 0);
-	regmap_update_bits(vc5->regmap, VC5_GLOBAL_REGISTER,
-			   VC5_GLOBAL_REGISTER_GLOBAL_RESET,
-			   VC5_GLOBAL_REGISTER_GLOBAL_RESET);
-	return 0;
+	ret = regmap_update_bits(vc5->regmap, VC5_GLOBAL_REGISTER,
+				 VC5_GLOBAL_REGISTER_GLOBAL_RESET, 0);
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(vc5->regmap, VC5_GLOBAL_REGISTER,
+				  VC5_GLOBAL_REGISTER_GLOBAL_RESET,
+				  VC5_GLOBAL_REGISTER_GLOBAL_RESET);
 }
 
 static const struct clk_ops vc5_fod_ops = {
@@ -606,7 +626,10 @@ static int vc5_clk_out_prepare(struct clk_hw *hw)
 	 * If the input mux is disabled, enable it first and
 	 * select source from matching FOD.
 	 */
-	regmap_read(vc5->regmap, VC5_OUT_DIV_CONTROL(hwdata->num), &src);
+	ret = regmap_read(vc5->regmap, VC5_OUT_DIV_CONTROL(hwdata->num), &src);
+	if (ret)
+		return ret;
+
 	if ((src & mask) == 0) {
 		src = VC5_OUT_DIV_CONTROL_RESET | VC5_OUT_DIV_CONTROL_EN_FOD;
 		ret = regmap_update_bits(vc5->regmap,
@@ -617,18 +640,24 @@ static int vc5_clk_out_prepare(struct clk_hw *hw)
 	}
 
 	/* Enable the clock buffer */
-	regmap_update_bits(vc5->regmap, VC5_CLK_OUTPUT_CFG(hwdata->num, 1),
-			   VC5_CLK_OUTPUT_CFG1_EN_CLKBUF,
-			   VC5_CLK_OUTPUT_CFG1_EN_CLKBUF);
+	ret = regmap_update_bits(vc5->regmap,
+				 VC5_CLK_OUTPUT_CFG(hwdata->num, 1),
+				 VC5_CLK_OUTPUT_CFG1_EN_CLKBUF,
+				 VC5_CLK_OUTPUT_CFG1_EN_CLKBUF);
+	if (ret)
+		return ret;
+
 	if (hwdata->clk_output_cfg0_mask) {
 		dev_dbg(&vc5->client->dev, "Update output %d mask 0x%0X val 0x%0X\n",
 			hwdata->num, hwdata->clk_output_cfg0_mask,
 			hwdata->clk_output_cfg0);
 
-		regmap_update_bits(vc5->regmap,
-			VC5_CLK_OUTPUT_CFG(hwdata->num, 0),
-			hwdata->clk_output_cfg0_mask,
-			hwdata->clk_output_cfg0);
+		ret = regmap_update_bits(vc5->regmap,
+					 VC5_CLK_OUTPUT_CFG(hwdata->num, 0),
+					 hwdata->clk_output_cfg0_mask,
+					 hwdata->clk_output_cfg0);
+		if (ret)
+			return ret;
 	}
 
 	return 0;
@@ -656,8 +685,12 @@ static unsigned char vc5_clk_out_get_parent(struct clk_hw *hw)
 	const u8 extclk = VC5_OUT_DIV_CONTROL_SELB_NORM |
 			  VC5_OUT_DIV_CONTROL_SEL_EXT;
 	unsigned int src;
+	int ret;
+
+	ret = regmap_read(vc5->regmap, VC5_OUT_DIV_CONTROL(hwdata->num), &src);
+	if (ret)
+		return 0;
 
-	regmap_read(vc5->regmap, VC5_OUT_DIV_CONTROL(hwdata->num), &src);
 	src &= mask;
 
 	if (src == 0)	/* Input mux set to DISABLED */
@@ -819,22 +852,27 @@ static int vc5_update_cap_load(struct device_node *node, struct vc5_driver_data
 {
 	u32 value;
 	int mapped_value;
+	int ret;
 
-	if (!of_property_read_u32(node, "idt,xtal-load-femtofarads", &value)) {
-		mapped_value = vc5_map_cap_value(value);
-		if (mapped_value < 0)
-			return mapped_value;
-
-		/*
-		 * The mapped_value is really the high 6 bits of
-		 * VC5_XTAL_X1_LOAD_CAP and VC5_XTAL_X2_LOAD_CAP, so
-		 * shift the value 2 places.
-		 */
-		regmap_update_bits(vc5->regmap, VC5_XTAL_X1_LOAD_CAP, ~0x03, mapped_value << 2);
-		regmap_update_bits(vc5->regmap, VC5_XTAL_X2_LOAD_CAP, ~0x03, mapped_value << 2);
-	}
+	if (of_property_read_u32(node, "idt,xtal-load-femtofarads", &value))
+		return 0;
 
-	return 0;
+	mapped_value = vc5_map_cap_value(value);
+	if (mapped_value < 0)
+		return mapped_value;
+
+	/*
+	 * The mapped_value is really the high 6 bits of
+	 * VC5_XTAL_X1_LOAD_CAP and VC5_XTAL_X2_LOAD_CAP, so
+	 * shift the value 2 places.
+	 */
+	ret = regmap_update_bits(vc5->regmap, VC5_XTAL_X1_LOAD_CAP, ~0x03,
+				 mapped_value << 2);
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(vc5->regmap, VC5_XTAL_X2_LOAD_CAP, ~0x03,
+				  mapped_value << 2);
 }
 
 static int vc5_update_slew(struct device_node *np_output,
@@ -956,7 +994,10 @@ static int vc5_probe(struct i2c_client *client)
 				     "could not read idt,output-enable-active\n");
 	}
 
-	regmap_update_bits(vc5->regmap, VC5_PRIM_SRC_SHDN, src_mask, src_val);
+	ret = regmap_update_bits(vc5->regmap, VC5_PRIM_SRC_SHDN, src_mask,
+				 src_val);
+	if (ret)
+		return ret;
 
 	/* Register clock input mux */
 	memset(&init, 0, sizeof(init));
-- 
2.30.2

