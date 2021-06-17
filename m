Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 011A9C49EAB
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jun 2021 19:09:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E035D613E1
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jun 2021 19:09:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232671AbhFQTLh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jun 2021 15:11:37 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:37032 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232676AbhFQTLb (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 17 Jun 2021 15:11:31 -0400
Received: from hq-00021.fritz.box (p57bc9ba2.dip0.t-ipconnect.de [87.188.155.162])
        by mail.bugwerft.de (Postfix) with ESMTPSA id B245D4C3EBE;
        Thu, 17 Jun 2021 19:09:20 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, kuninori.morimoto.gx@renesas.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH v3 6/9] clk: cs2000-cp: add support for dynamic mode
Date:   Thu, 17 Jun 2021 21:09:09 +0200
Message-Id: <20210617190912.262809-7-daniel@zonque.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617190912.262809-1-daniel@zonque.org>
References: <20210617190912.262809-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The CS2000 chip features two input clocks, REF_CLK and CLK_IN. REF_CLK
is mandatory, while CLK_IN is optional, depending on the mode of
operation.

In static mode, the output clock (CLK_OUT) is directly derived from
REF_CLK, and CLK_IN is ignored. In dynamic mode, CLK_IN is used by the
digital PLL.

In dynamic mode, a low-frequency ratio configuration that uses a higher
multiplier factor.

This patch adds support for dynamic mode and both ratios:

 * Make the CLK_IN input clock optional
 * If CLK_IN is provided, present it as parent clock
 * The low-frequency ratio mode is automatically selected, depending
   on the presence of CLK_IN and the given input and output rates

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/clk/clk-cs2000-cp.c | 111 ++++++++++++++++++++++++------------
 1 file changed, 73 insertions(+), 38 deletions(-)

diff --git a/drivers/clk/clk-cs2000-cp.c b/drivers/clk/clk-cs2000-cp.c
index db7290621cef..791f088ec9aa 100644
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
@@ -79,6 +79,8 @@ struct cs2000_priv {
 	struct clk *clk_in;
 	struct clk *ref_clk;
 
+	bool lf_ratio;
+
 	/* suspend/resume */
 	unsigned long saved_rate;
 	unsigned long saved_parent_rate;
@@ -134,17 +136,11 @@ static int cs2000_enable_dev_config(struct cs2000_priv *priv, bool enable)
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
 
@@ -191,35 +187,37 @@ static int cs2000_clk_out_enable(struct cs2000_priv *priv, bool enable)
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
@@ -232,7 +230,7 @@ static int cs2000_ratio_set(struct cs2000_priv *priv,
 	if (CH_SIZE_ERR(ch))
 		return -EINVAL;
 
-	val = cs2000_rate_to_ratio(rate_in, rate_out);
+	val = cs2000_rate_to_ratio(rate_in, rate_out, priv->lf_ratio);
 	for (i = 0; i < RATIO_REG_SIZE; i++) {
 		ret = cs2000_write(priv,
 				   Ratio_Add(ch, i),
@@ -265,22 +263,21 @@ static u32 cs2000_ratio_get(struct cs2000_priv *priv, int ch)
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
 
+	/* Always use dynamic mode when CLK_IN is present */
+	fracnsrc = priv->clk_in ? FRACNSRC_DYNAMIC : FRACNSRC_STATIC;
+
 	ret = cs2000_bset(priv, DEVICE_CFG2,
-			  (AUTORMOD | LOCKCLK_MASK | FRACNSRC_MASK),
-			  (LOCKCLK(ch) | FRACNSRC_STATIC));
+			  AUTORMOD | LOCKCLK_MASK | FRACNSRC_MASK,
+			  LOCKCLK(ch) | fracnsrc);
 	if (ret < 0)
 		return ret;
 
@@ -296,17 +293,40 @@ static unsigned long cs2000_recalc_rate(struct clk_hw *hw,
 
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
+	 * This mode is only available in dynamic mode (ie, with a CLK_IN input
+	 * present).
+	 */
+	priv->lf_ratio = priv->clk_in && ((rate / parent_rate) > 4096);
 
-	return cs2000_ratio_to_rate(ratio, *parent_rate);
+	return cs2000_bset(priv, FUNC_CFG2, LFRATIO_MASK,
+			   priv->lf_ratio ? LFRATIO_20_12 : LFRATIO_12_20);
 }
 
 static int __cs2000_set_rate(struct cs2000_priv *priv, int ch,
@@ -315,7 +335,7 @@ static int __cs2000_set_rate(struct cs2000_priv *priv, int ch,
 {
 	int ret;
 
-	ret = cs2000_clk_in_bound_rate(priv, parent_rate);
+	ret = cs2000_select_ratio_mode(priv, rate, parent_rate);
 	if (ret < 0)
 		return ret;
 
@@ -382,8 +402,14 @@ static void cs2000_disable(struct clk_hw *hw)
 
 static u8 cs2000_get_parent(struct clk_hw *hw)
 {
-	/* always return REF_CLK */
-	return REF_CLK;
+	struct cs2000_priv *priv = hw_to_priv(hw);
+
+	/*
+	 * If CLK_IN was provided, we're operating in dynamic mode,
+	 * hence output clock rates are derived from that.
+	 */
+
+	return priv->clk_in ? CLK_IN : REF_CLK;
 }
 
 static const struct clk_ops cs2000_ops = {
@@ -400,7 +426,7 @@ static int cs2000_clk_get(struct cs2000_priv *priv)
 	struct device *dev = priv_to_dev(priv);
 	struct clk *clk_in, *ref_clk;
 
-	clk_in = devm_clk_get(dev, "clk_in");
+	clk_in = devm_clk_get_optional(dev, "clk_in");
 	/* not yet provided */
 	if (IS_ERR(clk_in))
 		return -EPROBE_DEFER;
@@ -424,8 +450,8 @@ static int cs2000_clk_register(struct cs2000_priv *priv)
 	const char *name = np->name;
 	static const char *parent_names[CLK_MAX];
 	u32 aux_out = 0;
+	int ref_clk_rate;
 	int ch = 0; /* it uses ch0 only at this point */
-	int rate;
 	int ret;
 
 	of_property_read_string(np, "clock-output-names", &name);
@@ -436,16 +462,25 @@ static int cs2000_clk_register(struct cs2000_priv *priv)
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
 
+	if (priv->clk_in) {
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

