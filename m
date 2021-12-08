Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2993C433F5
	for <linux-clk@archiver.kernel.org>; Wed,  8 Dec 2021 15:46:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236270AbhLHPtz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Dec 2021 10:49:55 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:58671 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233975AbhLHPty (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Dec 2021 10:49:54 -0500
Received: from localhost.localdomain ([87.166.17.165]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MiIlc-1mIsyZ0xNO-00fSIZ; Wed, 08 Dec 2021 16:46:13 +0100
From:   Jens Renner <renner@efe-gmbh.de>
To:     linux-clk@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        sebastian.hesselbarth@gmail.com, s.hauer@pengutronix.de,
        devicetree@vger.kernel.org, robh+dt@kernel.org, renner@efe-gmbh.de
Subject: [PATCH v2 2/2] clk: si5351: Add clock output phase offset
Date:   Wed,  8 Dec 2021 16:46:05 +0100
Message-Id: <20211208154605.72476-1-renner@efe-gmbh.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211208154440.72087-1-renner@efe-gmbh.de>
References: <20211208154440.72087-1-renner@efe-gmbh.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Kvm7H2jE2Dj7j1aQ2IULwkNle+ClYz7w4p6lHVQdrgR7XRL+g9k
 WXkgi7K0MpokTd4+Nr9IXoP5+6/Oqh76i4gQLCTuad88tsnq8GLGbT+X0sFyXMdXYRN0NBT
 sMXPD2T1YYfmrHJNwiDEwiKfqSyR0FT9ra+8kvySWqBuZMiSWPY3VBqjPMB8O+lPL7HJfP3
 F4s11EafDg/qXUxrlUDzg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TGQIdMrCLJk=:So7NMoEMUnHiXATckQsjxW
 BdXzYRaF9x+X9GJ/nqlxf20AM1w+1KLgVn4Zyvl2lDYqnyin6vaaC1wo944yM0FZ9ax7vgpQr
 5LYRCYY84hZxClsTHv255EKxP+OrhHvL2qNjAYa1qWYi21k3GFuIbt8peQQJTSk2qU99g2xYu
 qSX2WgROSR6sswf5pYGe26CpdEXiygIdTR3nVdbbG18QvWlXjmXCvytzv1XpXgBYTDQGPkogY
 Zav/R/AD51+hnsniC/Of8pNBS9yQ0N2UESCK6dsB2H6neccQWaNIDiCUFdlJ1J9R5q19fGLmd
 +uGz2wCqe1CWRXgt/pIE+Oz84xCsz7N7o9kQ2SyXtLbOtgMWh9PdxJgT9+FZhe3PcmbePctIk
 CjMVi/XzBRZ+eT8B9HJEpeHKkBaIZGkYP8Hjb6mxTE8omDOunRTEUl7pxoji+lD8h3/tZftzA
 bSTFD6WERf8+X4qo+tSWLYpX2WuDM0OyvSh4YKOh2cDNBhFZoEvxUEsd0Aw3F0vRK2BPRftBt
 9m0WqhAAa9jyVtB1Y0qhGZvWxu99yqqD0mtUmlGAzZTBt+1drbGbSMr9T2eEb66cxKIGeS5no
 2eVPY0GxZWQbGc8YUt1vtWeOwtsUUZb2SYE/ui87Aix4YaztTI9Q0QAhsY6XNGrbkID+Bl0/C
 VF/gpZB5kMPyOeJeO12OhZ/iBmNeYy7sX2WnYmHQjOsob4LXqMfz6QRrdtHIcgVhfqng=
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
Changes in v2:
  - Use vendor-specific DT property silabs,clock-phase

 drivers/clk/clk-si5351.c             | 234 ++++++++++++++++++++++++++-
 drivers/clk/clk-si5351.h             |   1 +
 include/linux/platform_data/si5351.h |   2 +
 3 files changed, 235 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index 80c493019..744ace50a 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -772,6 +772,10 @@ static int si5351_msynth_set_rate(struct clk_hw *hw, unsigned long rate,
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
@@ -786,12 +790,107 @@ static int si5351_msynth_set_rate(struct clk_hw *hw, unsigned long rate,
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
@@ -953,10 +1052,11 @@ static void si5351_clkout_unprepare(struct clk_hw *hw)
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
@@ -1125,6 +1225,10 @@ static int si5351_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
 				rdiv << SI5351_OUTPUT_CLK_DIV_SHIFT);
 	}
 
+	/* clear existing clock output inversion */
+	si5351_set_bits(hwdata->drvdata, SI5351_CLK0_CTRL + hwdata->num,
+			SI5351_CLK_INVERT, 0);
+
 	/* powerup clkout */
 	si5351_set_bits(hwdata->drvdata, SI5351_CLK0_CTRL + hwdata->num,
 			SI5351_CLK_POWERDOWN, 0);
@@ -1137,6 +1241,41 @@ static int si5351_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
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
@@ -1145,8 +1284,73 @@ static const struct clk_ops si5351_clkout_ops = {
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
@@ -1328,6 +1532,9 @@ static int si5351_dt_parse(struct i2c_client *client,
 		if (!of_property_read_u32(child, "clock-frequency", &val))
 			pdata->clkout[num].rate = val;
 
+		if (!of_property_read_u32(child, "silabs,clock-phase", &val))
+			pdata->clkout[num].phase = val;
+
 		pdata->clkout[num].pll_master =
 			of_property_read_bool(child, "silabs,pll-master");
 
@@ -1621,6 +1828,15 @@ static int si5351_i2c_probe(struct i2c_client *client,
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
@@ -1630,6 +1846,20 @@ static int si5351_i2c_probe(struct i2c_client *client,
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
index 8f7a25b25..b0da1b5d5 100644
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
index c71a2dd66..4eb59bd42 100644
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
2.30.2

