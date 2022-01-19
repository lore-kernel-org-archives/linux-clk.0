Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30724C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 19 Jan 2022 11:54:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354405AbiASLym (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Jan 2022 06:54:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354382AbiASLyh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Jan 2022 06:54:37 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2C42C061574
        for <linux-clk@vger.kernel.org>; Wed, 19 Jan 2022 03:54:37 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1nA9Xv-0003Ru-Ui; Wed, 19 Jan 2022 12:54:36 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mtr@pengutronix.de>)
        id 1nA9Xv-00BAa2-M5; Wed, 19 Jan 2022 12:54:34 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mtr@pengutronix.de>)
        id 1nA9Xu-008ZEW-5w; Wed, 19 Jan 2022 12:54:34 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, michal.simek@xilinx.com,
        rajan.vaja@xilinx.com, kernel@pengutronix.de,
        m.tretter@pengutronix.de
Subject: [PATCH v2] clk: zynqmp: replace warn_once with pr_debug for failed clock ops
Date:   Wed, 19 Jan 2022 12:54:34 +0100
Message-Id: <20220119115434.2042017-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The warning that a clock operation failed is only printed once. However,
the function is called for various different clocks. The limit hides the
warnings if different clocks are affected by the failures.

The clock ops might fail if the firmware that handles the clocks is
misconfigured. Therefore, replace the pr_warn_once with pr_debug to
allow the user to see all errors if necessary. By default, hide the
error messages and let drivers handle the errors.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
This is v2 of the patch to improve the error messages of the ZynqMP
clock driver [0].

[0] https://lore.kernel.org/all/20220112141229.700708-1-m.tretter@pengutronix.de/

Changelog:

v2:

- Update commit message
- Use pr_debug instead of pr_warn
---
 drivers/clk/zynqmp/clk-gate-zynqmp.c | 12 +++++------
 drivers/clk/zynqmp/clk-mux-zynqmp.c  |  8 +++----
 drivers/clk/zynqmp/divider.c         | 12 +++++------
 drivers/clk/zynqmp/pll.c             | 32 ++++++++++++++--------------
 4 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/zynqmp/clk-gate-zynqmp.c b/drivers/clk/zynqmp/clk-gate-zynqmp.c
index 565ed67a0430..b89e55737198 100644
--- a/drivers/clk/zynqmp/clk-gate-zynqmp.c
+++ b/drivers/clk/zynqmp/clk-gate-zynqmp.c
@@ -41,8 +41,8 @@ static int zynqmp_clk_gate_enable(struct clk_hw *hw)
 	ret = zynqmp_pm_clock_enable(clk_id);
 
 	if (ret)
-		pr_warn_once("%s() clock enabled failed for %s, ret = %d\n",
-			     __func__, clk_name, ret);
+		pr_debug("%s() clock enable failed for %s (id %d), ret = %d\n",
+			 __func__, clk_name, clk_id, ret);
 
 	return ret;
 }
@@ -61,8 +61,8 @@ static void zynqmp_clk_gate_disable(struct clk_hw *hw)
 	ret = zynqmp_pm_clock_disable(clk_id);
 
 	if (ret)
-		pr_warn_once("%s() clock disable failed for %s, ret = %d\n",
-			     __func__, clk_name, ret);
+		pr_debug("%s() clock disable failed for %s (id %d), ret = %d\n",
+			 __func__, clk_name, clk_id, ret);
 }
 
 /**
@@ -80,8 +80,8 @@ static int zynqmp_clk_gate_is_enabled(struct clk_hw *hw)
 
 	ret = zynqmp_pm_clock_getstate(clk_id, &state);
 	if (ret) {
-		pr_warn_once("%s() clock get state failed for %s, ret = %d\n",
-			     __func__, clk_name, ret);
+		pr_debug("%s() clock get state failed for %s, ret = %d\n",
+			 __func__, clk_name, ret);
 		return -EIO;
 	}
 
diff --git a/drivers/clk/zynqmp/clk-mux-zynqmp.c b/drivers/clk/zynqmp/clk-mux-zynqmp.c
index 17afce594f28..60359333f26d 100644
--- a/drivers/clk/zynqmp/clk-mux-zynqmp.c
+++ b/drivers/clk/zynqmp/clk-mux-zynqmp.c
@@ -51,8 +51,8 @@ static u8 zynqmp_clk_mux_get_parent(struct clk_hw *hw)
 	ret = zynqmp_pm_clock_getparent(clk_id, &val);
 
 	if (ret) {
-		pr_warn_once("%s() getparent failed for clock: %s, ret = %d\n",
-			     __func__, clk_name, ret);
+		pr_debug("%s() getparent failed for clock: %s, ret = %d\n",
+			 __func__, clk_name, ret);
 		/*
 		 * clk_core_get_parent_by_index() takes num_parents as incorrect
 		 * index which is exactly what I want to return here
@@ -80,8 +80,8 @@ static int zynqmp_clk_mux_set_parent(struct clk_hw *hw, u8 index)
 	ret = zynqmp_pm_clock_setparent(clk_id, index);
 
 	if (ret)
-		pr_warn_once("%s() set parent failed for clock: %s, ret = %d\n",
-			     __func__, clk_name, ret);
+		pr_debug("%s() set parent failed for clock: %s, ret = %d\n",
+			 __func__, clk_name, ret);
 
 	return ret;
 }
diff --git a/drivers/clk/zynqmp/divider.c b/drivers/clk/zynqmp/divider.c
index cb49281f9cf9..422ea79907dd 100644
--- a/drivers/clk/zynqmp/divider.c
+++ b/drivers/clk/zynqmp/divider.c
@@ -89,8 +89,8 @@ static unsigned long zynqmp_clk_divider_recalc_rate(struct clk_hw *hw,
 	ret = zynqmp_pm_clock_getdivider(clk_id, &div);
 
 	if (ret)
-		pr_warn_once("%s() get divider failed for %s, ret = %d\n",
-			     __func__, clk_name, ret);
+		pr_debug("%s() get divider failed for %s, ret = %d\n",
+			 __func__, clk_name, ret);
 
 	if (div_type == TYPE_DIV1)
 		value = div & 0xFFFF;
@@ -177,8 +177,8 @@ static long zynqmp_clk_divider_round_rate(struct clk_hw *hw,
 		ret = zynqmp_pm_clock_getdivider(clk_id, &bestdiv);
 
 		if (ret)
-			pr_warn_once("%s() get divider failed for %s, ret = %d\n",
-				     __func__, clk_name, ret);
+			pr_debug("%s() get divider failed for %s, ret = %d\n",
+				 __func__, clk_name, ret);
 		if (div_type == TYPE_DIV1)
 			bestdiv = bestdiv & 0xFFFF;
 		else
@@ -244,8 +244,8 @@ static int zynqmp_clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 	ret = zynqmp_pm_clock_setdivider(clk_id, div);
 
 	if (ret)
-		pr_warn_once("%s() set divider failed for %s, ret = %d\n",
-			     __func__, clk_name, ret);
+		pr_debug("%s() set divider failed for %s, ret = %d\n",
+			 __func__, clk_name, ret);
 
 	return ret;
 }
diff --git a/drivers/clk/zynqmp/pll.c b/drivers/clk/zynqmp/pll.c
index 036e4ff64a2f..91a6b4cc910e 100644
--- a/drivers/clk/zynqmp/pll.c
+++ b/drivers/clk/zynqmp/pll.c
@@ -56,8 +56,8 @@ static inline enum pll_mode zynqmp_pll_get_mode(struct clk_hw *hw)
 
 	ret = zynqmp_pm_get_pll_frac_mode(clk_id, ret_payload);
 	if (ret) {
-		pr_warn_once("%s() PLL get frac mode failed for %s, ret = %d\n",
-			     __func__, clk_name, ret);
+		pr_debug("%s() PLL get frac mode failed for %s, ret = %d\n",
+			 __func__, clk_name, ret);
 		return PLL_MODE_ERROR;
 	}
 
@@ -84,8 +84,8 @@ static inline void zynqmp_pll_set_mode(struct clk_hw *hw, bool on)
 
 	ret = zynqmp_pm_set_pll_frac_mode(clk_id, mode);
 	if (ret)
-		pr_warn_once("%s() PLL set frac mode failed for %s, ret = %d\n",
-			     __func__, clk_name, ret);
+		pr_debug("%s() PLL set frac mode failed for %s, ret = %d\n",
+			 __func__, clk_name, ret);
 	else
 		clk->set_pll_mode = true;
 }
@@ -145,8 +145,8 @@ static unsigned long zynqmp_pll_recalc_rate(struct clk_hw *hw,
 
 	ret = zynqmp_pm_clock_getdivider(clk_id, &fbdiv);
 	if (ret) {
-		pr_warn_once("%s() get divider failed for %s, ret = %d\n",
-			     __func__, clk_name, ret);
+		pr_debug("%s() get divider failed for %s, ret = %d\n",
+			 __func__, clk_name, ret);
 		return 0ul;
 	}
 
@@ -200,8 +200,8 @@ static int zynqmp_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 			WARN(1, "More than allowed devices are using the %s, which is forbidden\n",
 			     clk_name);
 		else if (ret)
-			pr_warn_once("%s() set divider failed for %s, ret = %d\n",
-				     __func__, clk_name, ret);
+			pr_debug("%s() set divider failed for %s, ret = %d\n",
+				 __func__, clk_name, ret);
 		zynqmp_pm_set_pll_frac_data(clk_id, f);
 
 		return rate + frac;
@@ -211,8 +211,8 @@ static int zynqmp_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	fbdiv = clamp_t(u32, fbdiv, PLL_FBDIV_MIN, PLL_FBDIV_MAX);
 	ret = zynqmp_pm_clock_setdivider(clk_id, fbdiv);
 	if (ret)
-		pr_warn_once("%s() set divider failed for %s, ret = %d\n",
-			     __func__, clk_name, ret);
+		pr_debug("%s() set divider failed for %s, ret = %d\n",
+			 __func__, clk_name, ret);
 
 	return parent_rate * fbdiv;
 }
@@ -233,8 +233,8 @@ static int zynqmp_pll_is_enabled(struct clk_hw *hw)
 
 	ret = zynqmp_pm_clock_getstate(clk_id, &state);
 	if (ret) {
-		pr_warn_once("%s() clock get state failed for %s, ret = %d\n",
-			     __func__, clk_name, ret);
+		pr_debug("%s() clock get state failed for %s, ret = %d\n",
+			 __func__, clk_name, ret);
 		return -EIO;
 	}
 
@@ -265,8 +265,8 @@ static int zynqmp_pll_enable(struct clk_hw *hw)
 
 	ret = zynqmp_pm_clock_enable(clk_id);
 	if (ret)
-		pr_warn_once("%s() clock enable failed for %s, ret = %d\n",
-			     __func__, clk_name, ret);
+		pr_debug("%s() clock enable failed for %s, ret = %d\n",
+			 __func__, clk_name, ret);
 
 	return ret;
 }
@@ -287,8 +287,8 @@ static void zynqmp_pll_disable(struct clk_hw *hw)
 
 	ret = zynqmp_pm_clock_disable(clk_id);
 	if (ret)
-		pr_warn_once("%s() clock disable failed for %s, ret = %d\n",
-			     __func__, clk_name, ret);
+		pr_debug("%s() clock disable failed for %s, ret = %d\n",
+			 __func__, clk_name, ret);
 }
 
 static const struct clk_ops zynqmp_pll_ops = {
-- 
2.30.2

