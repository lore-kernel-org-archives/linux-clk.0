Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26AD8C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 13 Sep 2021 08:53:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0692360F6D
	for <linux-clk@archiver.kernel.org>; Mon, 13 Sep 2021 08:53:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238084AbhIMIyd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Sep 2021 04:54:33 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:34173 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238162AbhIMIyd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Sep 2021 04:54:33 -0400
Received: from stretch.efe.local ([79.233.161.113]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N332D-1n4NYp3r4v-013Nuu; Mon, 13 Sep 2021 10:53:11 +0200
From:   Jens Renner <renner@efe-gmbh.de>
To:     linux-clk@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, s.hauer@pengutronix.de,
        sebastian.hesselbarth@gmail.com, renner@efe-gmbh.de
Subject: [PATCH 2/2] clk: si5351: Add clock output phase offset
Date:   Mon, 13 Sep 2021 10:53:08 +0200
Message-Id: <20210913085308.116720-1-renner@efe-gmbh.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210913085138.116653-1-renner@efe-gmbh.de>
References: <20210913085138.116653-1-renner@efe-gmbh.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZbwaKJ8uBguXLLdNSKSZor/Cs6YeKCK6c9Ib6cTqgKUs78YUhiU
 Wm+72H3Ce5UkY532fAT8YL+o0X3RpI+t2GFFE10XA8g/SYWnpBsbRERT7c1rF5oe+LR4lOV
 iHlks13vYoOeJSDtvn3odpiyPAy/emvmkSQ2ZpkKi7FoUf75K3/la4B3kssyTMJWUryYdWW
 L8UHT8M+zMIYH+FrvXMNQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8pBgcjpKyBs=:DydbFl8wh2VwOESpnMC0Wt
 DgkMSpozYKXFtiM4fT2mboWDBcbN4m3RUcQbBrEw9l7gnWnmnWbB27SCTzl4EgzP4edKQzh2J
 j8pFU/uxIObeolRku1xZYe1TdaZDWxAdk8Ivcah4d3wH7+3ptaSDKjIgZ/lLvss2S826qwzts
 3ZWu4Vo4LJVL1BSZ12q4aomJJCTw15yFBO45RsU6ePOicP0ItTiVJES/mZBKUiF14V4JNi3xw
 ZqQPTcJLDmQL5GhdFPdEfCHdb9QNNEdI89xcb51F+ECrdht0Ac7D69cmUQREmk7USl6KtNTI0
 QajwwYXujN5RNsz5u4eGPVHJIYFSM/FFiEU2dfFdZYS6EKOQrYxCIjWl6ZuYJUPG4uI91NPSJ
 CFqiIeQuomgBX3MbM+utWSIrkE4dWwfCYC8uce2gtm1NlaajM2+1Bo27d2qoWInJoqhvQvFZ7
 ipn0dtJv/6/NscC+tB0G2XmzW4E1VNZ2UuE9YC04cryoWCU+UmJeHAJ9bqcRwSP+pAfbE7lk7
 7U1G5y87GXEA7AfpovNbxR6/qLxgwK29Vt/AqOeL+MHSqyaW7Gn3aBkey+UyLh5e7WoJjeBld
 msYoF4N3nhtq38R6GZs7+cFaWP91ZMQ0rZ4ArGpVKK9atdFksUtN4Q92gaiEuLAzzMMtSgkj6
 eF2uJIAMVaPysxb05bEh542+E929FfRZHtBXGmmE3Y6k58hz0dxnQo53p7T5spwgRNn5wLpBB
 1yQb0o0sEyhi5mdoNFup7qahz3XMCtPfVBWiTg==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add phase offsets for individual clock outputs with respect to other
clock outputs. This allows to generate differential signals (via simple
clock output inversion) as well as arbitrary phase shifts in steps of
T_vco/4. The achievable phase offset range and resolution at the clock
output depends on the ratios of f_vco / f_ms and f_ms / f_clk.

Because phase offsets are not getting propagated through the clock
subsystem, the implementation takes care of this and converts the clock
output phase offset to the parent multisynth and VCO frequencies.

Tested on a Xilinx Zynq board with a SI5351A-B-GT (MSOP-10) for various
frequencies (up to 128 MHz) and phase offsets (90, 180, 270 deg.).

Signed-off-by: Jens Renner <renner@efe-gmbh.de>
---
 drivers/clk/clk-si5351.c             | 234 ++++++++++++++++++++++++++-
 drivers/clk/clk-si5351.h             |   1 +
 include/linux/platform_data/si5351.h |   2 +
 3 files changed, 235 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index 57e4597cdf4c..573d8a6d4c72 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -771,6 +771,10 @@ static int si5351_msynth_set_rate(struct clk_hw *hw, unsigned long rate,
 		si5351_set_bits(hwdata->drvdata, reg + 2,
 				SI5351_OUTPUT_CLK_DIVBY4,
 				(divby4) ? SI5351_OUTPUT_CLK_DIVBY4 : 0);
+		/* clear existing phase offset */
+		reg = si5351_set_bits(hwdata->drvdata,
+				SI5351_CLK0_PHASE_OFFSET + hwdata->num,
+				SI5351_CLK_PHASE_OFFSET_MASK, 0);
 		si5351_set_bits(hwdata->drvdata, SI5351_CLK0_CTRL + hwdata->num,
 			SI5351_CLK_INTEGER_MODE,
 			(hwdata->params.p2 == 0) ? SI5351_CLK_INTEGER_MODE : 0);
@@ -785,12 +789,107 @@ static int si5351_msynth_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
+/*
+ * Initial phase offset for MS0..5 can be set in 127 steps of T_vco/4.
+ * With a minimum MS divider a = 6, a theoretical maximum phase shift of
+ * ph_ms,max = 127 * 90 deg. / 6 = 1905 deg. is possible at the MS output.
+ *
+ * For a maximum R divider of 128 though, CLKOUT could request a phase shift
+ * from the MS of up to 128 * 360 deg. = 46080 deg.
+ *
+ * (clk_set_phase() applies a limit of degrees %= 360 which means CLKOUT phase
+ * offsets will be restricted to ph_clk < 180,..,3 deg. for RDIV = 2,..,128
+ * when not calling si5351_msynth_set_phase() directly!)
+ */
+static int si5351_msynth_set_phase(struct clk_hw *hw, int degrees)
+{
+	struct si5351_hw_data *hwdata =
+		container_of(hw, struct si5351_hw_data, hw);
+	struct clk_hw *parent_hw;
+	unsigned long parent_rate, rate;
+	unsigned int phoff, act_degrees, tmp;
+	bool fractmode;
+
+	/*
+	 * To leverage the full phase offset range for high ratios of
+	 * f_vco/f_clk, set the theoretical limit to ph_ms,max < 1905 deg.
+	 * The later calculation could still fail for large phase-divider
+	 * products (i.e. ph_ms * a = ph_ms * f_vco/f_ms > ph_vco,max).
+	 */
+	if ((degrees < 0) || (degrees >= 127*90/SI5351_MULTISYNTH_A_MIN) ||
+	    (hwdata->num > 5)) {
+		dev_err(&hwdata->drvdata->client->dev,
+			"Phase offset of %d degrees is not allowed for %s.\n",
+			degrees, clk_hw_get_name(hw));
+		return -EINVAL;
+	}
+
+	/*
+	 * Requested phase offset refers to multisynth output (ph_ms).
+	 * CLKx_PHOFF[6:0] = round(t_off * 4 * f_vco)
+	 * Convert phase offset for f_ms to steps of 4 x f_vco:
+	 * ph_offs = ph_ms * (a + b/c) / 90 = ph_ms * (f_vco / f_ms) / 90
+	 */
+	parent_hw = clk_hw_get_parent(hw);
+	parent_rate = clk_get_rate(parent_hw->clk);
+	rate = clk_get_rate(hw->clk);
+
+	tmp = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(parent_rate, degrees), rate);
+	phoff = tmp/90;
+
+	if (phoff > 127) {
+		dev_err(&hwdata->drvdata->client->dev,
+			"Phase offset of %d degrees (%d steps) not possible for chosen rates of %s.\n",
+			degrees, phoff, clk_hw_get_name(hw));
+		return -EINVAL;
+	}
+
+	/*
+	 * Fractional mode should be used for phase offsets, but works only
+	 * for dividers a + b/c >= 8! (P1 = 128 * a + floor(128*b/c) - 512).
+	 * (For RDIVBY4 = 11b, P1 = 0, P2 = 0, P3 = 1.)
+	 * Hence, use fract. mode for P2 != 0, or P1 >= 512 with phase offset.
+	 */
+	fractmode = ((hwdata->params.p2 != 0) ||
+		     ((phoff > 0) && (hwdata->params.p1 >= 512)));
+
+	si5351_set_bits(hwdata->drvdata, SI5351_CLK0_CTRL + hwdata->num,
+		SI5351_CLK_INTEGER_MODE,
+		(fractmode) ? 0 : SI5351_CLK_INTEGER_MODE);
+
+	/*
+	 * For a MS rate f_ms > 112.5 MHz, only dividers a < 8 are possible and
+	 * fractional mode cannot be used. Issue a warning and continue.
+	 * (Tested & works for f_ms = 128 MHz, a = 7, and ph_vco = 7 * 90 deg.)
+	 */
+	if ((phoff > 0) && !fractmode) {
+		dev_warn(&hwdata->drvdata->client->dev,
+			 "Fract. mode cannot be set for divider of %s. Continue with int. mode.\n",
+			 clk_hw_get_name(hw));
+	}
+
+	si5351_set_bits(hwdata->drvdata,
+			SI5351_CLK0_PHASE_OFFSET + hwdata->num,
+			SI5351_CLK_PHASE_OFFSET_MASK, phoff);
+
+	act_degrees = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(90 * phoff, rate),
+					    parent_rate);
+
+	dev_dbg(&hwdata->drvdata->client->dev,
+		"%s - %s: degrees = %d, actual = %d, phoff steps = %u, mode = %c. PLL needs reset!\n",
+		__func__, clk_hw_get_name(hw),
+		degrees, act_degrees, phoff, (fractmode) ? 'f' : 'i');
+
+	return 0;
+}
+
 static const struct clk_ops si5351_msynth_ops = {
 	.set_parent = si5351_msynth_set_parent,
 	.get_parent = si5351_msynth_get_parent,
 	.recalc_rate = si5351_msynth_recalc_rate,
 	.round_rate = si5351_msynth_round_rate,
 	.set_rate = si5351_msynth_set_rate,
+	.set_phase = si5351_msynth_set_phase,
 };
 
 /*
@@ -952,10 +1051,11 @@ static void si5351_clkout_unprepare(struct clk_hw *hw)
 	struct si5351_hw_data *hwdata =
 		container_of(hw, struct si5351_hw_data, hw);
 
-	si5351_set_bits(hwdata->drvdata, SI5351_CLK0_CTRL + hwdata->num,
-			SI5351_CLK_POWERDOWN, SI5351_CLK_POWERDOWN);
+	/* disable output first, then power down output driver */
 	si5351_set_bits(hwdata->drvdata, SI5351_OUTPUT_ENABLE_CTRL,
 			(1 << hwdata->num), (1 << hwdata->num));
+	si5351_set_bits(hwdata->drvdata, SI5351_CLK0_CTRL + hwdata->num,
+			SI5351_CLK_POWERDOWN, SI5351_CLK_POWERDOWN);
 }
 
 static u8 si5351_clkout_get_parent(struct clk_hw *hw)
@@ -1124,6 +1224,10 @@ static int si5351_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
 				rdiv << SI5351_OUTPUT_CLK_DIV_SHIFT);
 	}
 
+	/* clear existing clock output inversion */
+	si5351_set_bits(hwdata->drvdata, SI5351_CLK0_CTRL + hwdata->num,
+			SI5351_CLK_INVERT, 0);
+
 	/* powerup clkout */
 	si5351_set_bits(hwdata->drvdata, SI5351_CLK0_CTRL + hwdata->num,
 			SI5351_CLK_POWERDOWN, 0);
@@ -1136,6 +1240,41 @@ static int si5351_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
+/*
+ * CLKOUT0..7 can be inverted to create differential signals or aid phase
+ * shifting, so allow only phase offsets of multiples of 180 deg.
+ */
+static int si5351_clkout_set_phase(struct clk_hw *hw, int degrees)
+{
+	struct si5351_hw_data *hwdata =
+		container_of(hw, struct si5351_hw_data, hw);
+	bool invert;
+
+	/* sanity check */
+	degrees %= 360;
+	if (degrees < 0)
+		degrees += 360;
+
+	if ((degrees % 180) != 0) {
+		dev_err(&hwdata->drvdata->client->dev,
+			"Phase offset of %d deg. is not allowed for %s.\n",
+			degrees, clk_hw_get_name(hw));
+		return -EINVAL;
+	}
+
+	invert = (degrees == 180) ? true : false;
+
+	si5351_set_bits(hwdata->drvdata, SI5351_CLK0_CTRL + hwdata->num,
+			SI5351_CLK_INVERT, (invert) ? SI5351_CLK_INVERT : 0);
+
+	dev_dbg(&hwdata->drvdata->client->dev,
+		"%s - %s: clock output inverter %s\n",
+		__func__, clk_hw_get_name(hw),
+		(invert) ? "on (180 deg.)" : "off (0 deg.)");
+
+	return 0;
+}
+
 static const struct clk_ops si5351_clkout_ops = {
 	.prepare = si5351_clkout_prepare,
 	.unprepare = si5351_clkout_unprepare,
@@ -1144,8 +1283,73 @@ static const struct clk_ops si5351_clkout_ops = {
 	.recalc_rate = si5351_clkout_recalc_rate,
 	.round_rate = si5351_clkout_round_rate,
 	.set_rate = si5351_clkout_set_rate,
+	.set_phase = si5351_clkout_set_phase,
 };
 
+/*
+ * Phase offset calculation except trivial 0 / 180 deg. shift (i.e. inverting
+ * CLKOUT) depends on the CLKOUT / MS / PLL frequency ratio.
+ *
+ * Maximum phase offset at the clock output:
+ *   ph_clk,max = ph_vco,max * f_clk / f_vco = 127 * 90 deg. * f_clk / f_vco
+ *
+ * According to the documentation of clk_set_phase(), phase shift changes won't
+ * get propagated through the clock tree hierarchy.
+ *
+ * This function can be called with the desired clock output phase offset (as
+ * specified in the DTS) and takes care of the synthesis stages and dividers.
+ */
+static int _si5351_clk_set_phase(struct clk_hw *hw, int degrees)
+{
+	struct si5351_hw_data *hwdata =
+		container_of(hw, struct si5351_hw_data, hw);
+	struct clk_hw *parent_hw;
+	unsigned long rate, parent_rate;
+	int parent_degrees, ret;
+	bool invert = false;
+
+	/* sanity check */
+	degrees %= 360;
+	if (degrees < 0)
+		degrees += 360;
+
+	if (degrees >= 180)
+		invert = true;
+
+	dev_dbg(&hwdata->drvdata->client->dev,
+		"%s - %s: requested phase shift %d deg. (use inverter: %s).\n",
+		__func__, clk_hw_get_name(hw), degrees, (invert) ? "y" : "n");
+
+	ret = si5351_clkout_set_phase(hw, (invert) ? 180 : 0);
+	if (ret)
+		return -EINVAL;
+
+	if (invert)
+		degrees -= 180;
+
+	/*
+	 * The remaining phase offset must be taken care of by the MS parent
+	 * (phase offset value, reg 165..170, requires fractional mode).
+	 * This phase offset is relative to f_vco, but make a conversion to the
+	 * parent rate f_ms (rdiv: 1,2,4,...,128) first.
+	 */
+	rate = clk_get_rate(hw->clk);
+	parent_hw = clk_hw_get_parent(hw);
+	parent_rate = clk_get_rate(parent_hw->clk);
+	parent_degrees = degrees * (parent_rate / rate);
+
+	dev_dbg(&hwdata->drvdata->client->dev,
+		"%s - %s: RDIV = %lu, request MS phase = %d deg.\n",
+		__func__, clk_hw_get_name(hw),
+		parent_rate/rate, parent_degrees);
+
+	ret = si5351_msynth_set_phase(parent_hw, parent_degrees);
+	if (ret)
+		return -EINVAL;
+
+	return 0;
+}
+
 /*
  * Si5351 i2c probe and DT
  */
@@ -1327,6 +1531,9 @@ static int si5351_dt_parse(struct i2c_client *client,
 		if (!of_property_read_u32(child, "clock-frequency", &val))
 			pdata->clkout[num].rate = val;
 
+		if (!of_property_read_u32(child, "clock-phase", &val))
+			pdata->clkout[num].phase = val;
+
 		pdata->clkout[num].pll_master =
 			of_property_read_bool(child, "silabs,pll-master");
 
@@ -1620,6 +1827,15 @@ static int si5351_i2c_probe(struct i2c_client *client,
 			return ret;
 		}
 
+		/*
+		 * All clocks are powered & enabled by default and the clock
+		 * subsystem assumes an unprepared clock.
+		 * So call our implementation directly to put each clock into a
+		 * safe state and get a well-defined behavior also with respect
+		 * to other clocks.
+		 */
+		si5351_clkout_unprepare(&drvdata->clkout[n].hw);
+
 		/* set initial clkout rate */
 		if (pdata->clkout[n].rate != 0) {
 			int ret;
@@ -1629,6 +1845,20 @@ static int si5351_i2c_probe(struct i2c_client *client,
 				dev_err(&client->dev, "Cannot set rate : %d\n",
 					ret);
 			}
+
+			/*
+			 * phase doesn't get propagated through the clock
+			 * hierarchy, so call our implementation directly
+			 */
+			ret = _si5351_clk_set_phase(&drvdata->clkout[n].hw,
+					    pdata->clkout[n].phase);
+			if (ret < 0) {
+				dev_err(&client->dev,
+					"Cannot set phase : %d\n", ret);
+			}
+
+			clk_prepare(drvdata->clkout[n].hw.clk);
+			clk_enable(drvdata->clkout[n].hw.clk);
 		}
 	}
 
diff --git a/drivers/clk/clk-si5351.h b/drivers/clk/clk-si5351.h
index 73dc8effc519..b00dddcf835b 100644
--- a/drivers/clk/clk-si5351.h
+++ b/drivers/clk/clk-si5351.h
@@ -133,6 +133,7 @@
 #define SI5351_CLK3_PHASE_OFFSET		168
 #define SI5351_CLK4_PHASE_OFFSET		169
 #define SI5351_CLK5_PHASE_OFFSET		170
+#define  SI5351_CLK_PHASE_OFFSET_MASK		127
 
 #define SI5351_PLL_RESET			177
 #define  SI5351_PLL_RESET_B			(1<<7)
diff --git a/include/linux/platform_data/si5351.h b/include/linux/platform_data/si5351.h
index c71a2dd66143..4eb59bd424dc 100644
--- a/include/linux/platform_data/si5351.h
+++ b/include/linux/platform_data/si5351.h
@@ -89,6 +89,7 @@ enum si5351_disable_state {
  * @pll_reset: if true, clkout can reset its pll
  * @drive: output drive strength
  * @rate: initial clkout rate, or default if 0
+ * @phase: initial clkout phase offset (default 0)
  */
 struct si5351_clkout_config {
 	enum si5351_multisynth_src multisynth_src;
@@ -98,6 +99,7 @@ struct si5351_clkout_config {
 	bool pll_master;
 	bool pll_reset;
 	unsigned long rate;
+	unsigned long phase;
 };
 
 /**
-- 
2.33.0

