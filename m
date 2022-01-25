Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A7D5C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jan 2022 09:50:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236879AbiAYJti (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jan 2022 04:49:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234397AbiAYJmU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jan 2022 04:42:20 -0500
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5C813C06177D;
        Tue, 25 Jan 2022 01:42:20 -0800 (PST)
Received: from hq-00021.fritz.box (p57bc97b3.dip0.t-ipconnect.de [87.188.151.179])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 401305015AE;
        Tue, 25 Jan 2022 09:33:45 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH RESEND v4 6/9] clk: cs2000-cp: add support for dynamic mode
Date:   Tue, 25 Jan 2022 10:33:33 +0100
Message-Id: <20220125093336.226787-7-daniel@zonque.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125093336.226787-1-daniel@zonque.org>
References: <20220125093336.226787-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The CS2000 chip features two input clocks, REF_CLK and CLK_IN.

In static mode, the output clock (CLK_OUT) is directly derived from
REF_CLK, and CLK_IN is ignored. In dynamic mode, CLK_IN is used by the
digital PLL.

In dynamic mode, a low-frequency ratio configuration that uses a higher
multiplier factor.

Until now, only the static mode and high-frequency divider rations of
the hardware was supported by the driver. This patch adds support for
dynamic mode and both ratios:

 * Parse a new OF property 'cirrus,dynamic-mode' to determine the mode
 * In dynamic mode, present CLK_IN as parent clock, else use REF_CLK
 * The low-frequency ratio mode is automatically selected, depending
   on the mode of operation and the given input and output rates

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/clk/clk-cs2000-cp.c | 111 ++++++++++++++++++++++++------------
 1 file changed, 74 insertions(+), 37 deletions(-)

diff --git a/drivers/clk/clk-cs2000-cp.c b/drivers/clk/clk-cs2000-cp.c
index db7290621cef..bd030e156d65 100644
--- a/drivers/clk/clk-cs2000-cp.c
+++ b/drivers/clk/clk-cs2000-cp.c
@@ -49,7 +49,7 @@
 #define LOCKCLK_MASK	LOCKCLK(0x3)
 #define FRACNSRC_MASK	(1 << 0)
 #define FRACNSRC_STATIC		(0 << 0)
-#define FRACNSRC_DYNAMIC	(1 << 1)
+#define FRACNSRC_DYNAMIC	(1 << 0)
 
 /* GLOBAL_CFG */
 #define ENDEV2		(0x1)
@@ -79,6 +79,9 @@ struct cs2000_priv {
 	struct clk *clk_in;
 	struct clk *ref_clk;
 
+	bool dynamic_mode;
+	bool lf_ratio;
+
 	/* suspend/resume */
 	unsigned long saved_rate;
 	unsigned long saved_parent_rate;
@@ -134,17 +137,11 @@ static int cs2000_enable_dev_config(struct cs2000_priv *priv, bool enable)
 	if (ret < 0)
 		return ret;
 
-	/* FIXME: for Static ratio mode */
-	ret = cs2000_bset(priv, FUNC_CFG2, LFRATIO_MASK,
-			  LFRATIO_12_20);
-	if (ret < 0)
-		return ret;
-
 	return 0;
 }
 
-static int cs2000_clk_in_bound_rate(struct cs2000_priv *priv,
-				    u32 rate_in)
+static int cs2000_ref_clk_bound_rate(struct cs2000_priv *priv,
+				     u32 rate_in)
 {
 	u32 val;
 
@@ -191,35 +188,37 @@ static int cs2000_clk_out_enable(struct cs2000_priv *priv, bool enable)
 			   (AUXOUTDIS | CLKOUTDIS));
 }
 
-static u32 cs2000_rate_to_ratio(u32 rate_in, u32 rate_out)
+static u32 cs2000_rate_to_ratio(u32 rate_in, u32 rate_out, bool lf_ratio)
 {
 	u64 ratio;
+	u32 multiplier = lf_ratio ? 12 : 20;
 
 	/*
-	 * ratio = rate_out / rate_in * 2^20
+	 * ratio = rate_out / rate_in * 2^multiplier
 	 *
 	 * To avoid over flow, rate_out is u64.
 	 * The result should be u32.
 	 */
-	ratio = (u64)rate_out << 20;
+	ratio = (u64)rate_out << multiplier;
 	do_div(ratio, rate_in);
 
 	return ratio;
 }
 
-static unsigned long cs2000_ratio_to_rate(u32 ratio, u32 rate_in)
+static unsigned long cs2000_ratio_to_rate(u32 ratio, u32 rate_in, bool lf_ratio)
 {
 	u64 rate_out;
+	u32 multiplier = lf_ratio ? 12 : 20;
 
 	/*
-	 * ratio = rate_out / rate_in * 2^20
+	 * ratio = rate_out / rate_in * 2^multiplier
 	 *
 	 * To avoid over flow, rate_out is u64.
 	 * The result should be u32 or unsigned long.
 	 */
 
 	rate_out = (u64)ratio * rate_in;
-	return rate_out >> 20;
+	return rate_out >> multiplier;
 }
 
 static int cs2000_ratio_set(struct cs2000_priv *priv,
@@ -232,7 +231,7 @@ static int cs2000_ratio_set(struct cs2000_priv *priv,
 	if (CH_SIZE_ERR(ch))
 		return -EINVAL;
 
-	val = cs2000_rate_to_ratio(rate_in, rate_out);
+	val = cs2000_rate_to_ratio(rate_in, rate_out, priv->lf_ratio);
 	for (i = 0; i < RATIO_REG_SIZE; i++) {
 		ret = cs2000_write(priv,
 				   Ratio_Add(ch, i),
@@ -265,22 +264,20 @@ static u32 cs2000_ratio_get(struct cs2000_priv *priv, int ch)
 static int cs2000_ratio_select(struct cs2000_priv *priv, int ch)
 {
 	int ret;
+	u8 fracnsrc;
 
 	if (CH_SIZE_ERR(ch))
 		return -EINVAL;
 
-	/*
-	 * FIXME
-	 *
-	 * this driver supports static ratio mode only at this point.
-	 */
 	ret = cs2000_bset(priv, DEVICE_CFG1, RSEL_MASK, RSEL(ch));
 	if (ret < 0)
 		return ret;
 
+	fracnsrc = priv->dynamic_mode ? FRACNSRC_DYNAMIC : FRACNSRC_STATIC;
+
 	ret = cs2000_bset(priv, DEVICE_CFG2,
-			  (AUTORMOD | LOCKCLK_MASK | FRACNSRC_MASK),
-			  (LOCKCLK(ch) | FRACNSRC_STATIC));
+			  AUTORMOD | LOCKCLK_MASK | FRACNSRC_MASK,
+			  LOCKCLK(ch) | fracnsrc);
 	if (ret < 0)
 		return ret;
 
@@ -296,17 +293,39 @@ static unsigned long cs2000_recalc_rate(struct clk_hw *hw,
 
 	ratio = cs2000_ratio_get(priv, ch);
 
-	return cs2000_ratio_to_rate(ratio, parent_rate);
+	return cs2000_ratio_to_rate(ratio, parent_rate, priv->lf_ratio);
 }
 
 static long cs2000_round_rate(struct clk_hw *hw, unsigned long rate,
 			      unsigned long *parent_rate)
 {
+	struct cs2000_priv *priv = hw_to_priv(hw);
 	u32 ratio;
 
-	ratio = cs2000_rate_to_ratio(*parent_rate, rate);
+	ratio = cs2000_rate_to_ratio(*parent_rate, rate, priv->lf_ratio);
+
+	return cs2000_ratio_to_rate(ratio, *parent_rate, priv->lf_ratio);
+}
+
+static int cs2000_select_ratio_mode(struct cs2000_priv *priv,
+				    unsigned long rate,
+				    unsigned long parent_rate)
+{
+	/*
+	 * From the datasheet:
+	 *
+	 * | It is recommended that the 12.20 High-Resolution format be
+	 * | utilized whenever the desired ratio is less than 4096 since
+	 * | the output frequency accuracy of the PLL is directly proportional
+	 * | to the accuracy of the timing reference clock and the resolution
+	 * | of the R_UD.
+	 *
+	 * This mode is only available in dynamic mode.
+	 */
+	priv->lf_ratio = priv->dynamic_mode && ((rate / parent_rate) > 4096);
 
-	return cs2000_ratio_to_rate(ratio, *parent_rate);
+	return cs2000_bset(priv, FUNC_CFG2, LFRATIO_MASK,
+			   priv->lf_ratio ? LFRATIO_20_12 : LFRATIO_12_20);
 }
 
 static int __cs2000_set_rate(struct cs2000_priv *priv, int ch,
@@ -315,7 +334,7 @@ static int __cs2000_set_rate(struct cs2000_priv *priv, int ch,
 {
 	int ret;
 
-	ret = cs2000_clk_in_bound_rate(priv, parent_rate);
+	ret = cs2000_select_ratio_mode(priv, rate, parent_rate);
 	if (ret < 0)
 		return ret;
 
@@ -382,8 +401,13 @@ static void cs2000_disable(struct clk_hw *hw)
 
 static u8 cs2000_get_parent(struct clk_hw *hw)
 {
-	/* always return REF_CLK */
-	return REF_CLK;
+	struct cs2000_priv *priv = hw_to_priv(hw);
+
+	/*
+	 * In dynamic mode, output rates are derived from CLK_IN.
+	 * In static mode, CLK_IN is ignored, so we return REF_CLK instead.
+	 */
+	return priv->dynamic_mode ? CLK_IN : REF_CLK;
 }
 
 static const struct clk_ops cs2000_ops = {
@@ -424,28 +448,41 @@ static int cs2000_clk_register(struct cs2000_priv *priv)
 	const char *name = np->name;
 	static const char *parent_names[CLK_MAX];
 	u32 aux_out = 0;
+	int ref_clk_rate;
 	int ch = 0; /* it uses ch0 only at this point */
-	int rate;
 	int ret;
 
 	of_property_read_string(np, "clock-output-names", &name);
 
+	priv->dynamic_mode = of_property_read_bool(np, "cirrus,dynamic-mode");
+	dev_info(dev, "operating in %s mode\n",
+		 priv->dynamic_mode ? "dynamic" : "static");
+
 	of_property_read_u32(np, "cirrus,aux-output-source", &aux_out);
 	ret = cs2000_bset(priv, DEVICE_CFG1,
 			  AUXOUTSRC_MASK, AUXOUTSRC(aux_out));
 	if (ret < 0)
 		return ret;
 
-	/*
-	 * set default rate as 1/1.
-	 * otherwise .set_rate which setup ratio
-	 * is never called if user requests 1/1 rate
-	 */
-	rate = clk_get_rate(priv->ref_clk);
-	ret = __cs2000_set_rate(priv, ch, rate, rate);
+	ref_clk_rate = clk_get_rate(priv->ref_clk);
+	ret = cs2000_ref_clk_bound_rate(priv, ref_clk_rate);
 	if (ret < 0)
 		return ret;
 
+	if (priv->dynamic_mode) {
+		/* Default to low-frequency mode to allow for large ratios */
+		priv->lf_ratio = true;
+	} else {
+		/*
+		 * set default rate as 1/1.
+		 * otherwise .set_rate which setup ratio
+		 * is never called if user requests 1/1 rate
+		 */
+		ret = __cs2000_set_rate(priv, ch, ref_clk_rate, ref_clk_rate);
+		if (ret < 0)
+			return ret;
+	}
+
 	parent_names[CLK_IN]	= __clk_get_name(priv->clk_in);
 	parent_names[REF_CLK]	= __clk_get_name(priv->ref_clk);
 
-- 
2.31.1

