Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40D3C55ABD
	for <linux-clk@archiver.kernel.org>; Mon, 16 Nov 2020 08:05:42 +0000 (UTC)
Received: from vger.kernel.org (unknown [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4875F2222E
	for <linux-clk@archiver.kernel.org>; Mon, 16 Nov 2020 08:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4875F2222E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728072AbgKPHzm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Nov 2020 02:55:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727955AbgKPHzm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Nov 2020 02:55:42 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7BF1C0613CF
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2020 23:55:41 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1keZMO-0007Ye-4B; Mon, 16 Nov 2020 08:55:39 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1keZMN-00Grbr-3D; Mon, 16 Nov 2020 08:55:35 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     rajanv@xilinx.com, tejasp@xilinx.com, dshah@xilinx.com,
        rvisaval@xilinx.com, michals@xilinx.com, kernel@pengutronix.de,
        robh+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        Michael Tretter <m.tretter@pengutronix.de>
Date:   Mon, 16 Nov 2020 08:55:31 +0100
Message-Id: <20201116075532.4019252-12-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116075532.4019252-1-m.tretter@pengutronix.de>
References: <20201116075532.4019252-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
Subject: [PATCH 11/12] soc: xilinx: vcu: remove calculation of PLL configuration
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As the consumers are now responsible for setting the clock rate via
clock framework, the clock rate is now calculated using round_rate and
the driver does not need to calculate the clock rate beforehand.

Remove the code that calculates the PLL configuration.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/soc/xilinx/xlnx_vcu.c | 125 ----------------------------------
 1 file changed, 125 deletions(-)

diff --git a/drivers/soc/xilinx/xlnx_vcu.c b/drivers/soc/xilinx/xlnx_vcu.c
index 84d7c46cd42f..519699fdc8b9 100644
--- a/drivers/soc/xilinx/xlnx_vcu.c
+++ b/drivers/soc/xilinx/xlnx_vcu.c
@@ -59,10 +59,6 @@
 #define MHZ				1000000
 #define FVCO_MIN			(1500U * MHZ)
 #define FVCO_MAX			(3000U * MHZ)
-#define DIVISOR_MIN			0
-#define DIVISOR_MAX			63
-#define FRAC				100
-#define LIMIT				(10 * MHZ)
 
 /**
  * struct xvcu_device - Xilinx VCU init device structure
@@ -478,119 +474,6 @@ static struct clk_hw *xvcu_register_pll(struct device *dev,
 	return hw;
 }
 
-/**
- * xvcu_set_vcu_pll_info - Set the VCU PLL info
- * @xvcu:	Pointer to the xvcu_device structure
- *
- * Programming the VCU PLL based on the user configuration
- * (ref clock freq, core clock freq, mcu clock freq).
- * Core clock frequency has higher priority than mcu clock frequency
- * Errors in following cases
- *    - When mcu or clock clock get from logicoreIP is 0
- *    - When VCU PLL DIV related bits value other than 1
- *    - When proper data not found for given data
- *    - When sis570_1 clocksource related operation failed
- *
- * Return:	Returns status, either success or error+reason
- */
-static int xvcu_set_vcu_pll_info(struct xvcu_device *xvcu)
-{
-	u32 refclk, coreclk, mcuclk, inte, deci;
-	u32 divisor_mcu, divisor_core, fvco;
-	u32 pll_clk;
-	u32 mod;
-	int i;
-	const struct xvcu_pll_cfg *found = NULL;
-	struct clk_hw *hw;
-
-	regmap_read(xvcu->logicore_reg_ba, VCU_PLL_CLK, &inte);
-	regmap_read(xvcu->logicore_reg_ba, VCU_PLL_CLK_DEC, &deci);
-	regmap_read(xvcu->logicore_reg_ba, VCU_CORE_CLK, &coreclk);
-	coreclk *= MHZ;
-	regmap_read(xvcu->logicore_reg_ba, VCU_MCU_CLK, &mcuclk);
-	mcuclk *= MHZ;
-	if (!mcuclk || !coreclk) {
-		dev_err(xvcu->dev, "Invalid mcu and core clock data\n");
-		return -EINVAL;
-	}
-
-	refclk = (inte * MHZ) + (deci * (MHZ / FRAC));
-	dev_dbg(xvcu->dev, "Ref clock from logicoreIP is %uHz\n", refclk);
-	dev_dbg(xvcu->dev, "Core clock from logicoreIP is %uHz\n", coreclk);
-	dev_dbg(xvcu->dev, "Mcu clock from logicoreIP is %uHz\n", mcuclk);
-
-	for (i = ARRAY_SIZE(xvcu_pll_cfg) - 1; i >= 0; i--) {
-		const struct xvcu_pll_cfg *cfg = &xvcu_pll_cfg[i];
-
-		fvco = cfg->fbdiv * refclk;
-		if (fvco >= FVCO_MIN && fvco <= FVCO_MAX) {
-			pll_clk = fvco / VCU_PLL_DIV2;
-			if (fvco % VCU_PLL_DIV2 != 0)
-				pll_clk++;
-			mod = pll_clk % coreclk;
-			if (mod < LIMIT) {
-				divisor_core = pll_clk / coreclk;
-			} else if (coreclk - mod < LIMIT) {
-				divisor_core = pll_clk / coreclk;
-				divisor_core++;
-			} else {
-				continue;
-			}
-			if (divisor_core >= DIVISOR_MIN &&
-			    divisor_core <= DIVISOR_MAX) {
-				found = cfg;
-				divisor_mcu = pll_clk / mcuclk;
-				mod = pll_clk % mcuclk;
-				if (mcuclk - mod < LIMIT)
-					divisor_mcu++;
-				break;
-			}
-		}
-	}
-
-	if (!found) {
-		dev_err(xvcu->dev, "Invalid clock combination.\n");
-		return -EINVAL;
-	}
-
-	coreclk = pll_clk / divisor_core;
-	mcuclk = pll_clk / divisor_mcu;
-	dev_dbg(xvcu->dev, "Actual Ref clock freq is %uHz\n", refclk);
-	dev_dbg(xvcu->dev, "Actual Core clock freq is %uHz\n", coreclk);
-	dev_dbg(xvcu->dev, "Actual Mcu clock freq is %uHz\n", mcuclk);
-
-	hw = xvcu_register_pll(xvcu->dev, xvcu,
-			       "vcu_pll", __clk_get_name(xvcu->pll_ref),
-			       CLK_SET_RATE_NO_REPARENT);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
-	xvcu->pll = hw;
-
-	return 0;
-}
-
-/**
- * xvcu_set_pll - PLL init sequence
- * @xvcu:	Pointer to the xvcu_device structure
- *
- * Call the api to set the PLL info and once that is done then
- * init the PLL sequence to make the PLL stable.
- *
- * Return:	Returns status, either success or error+reason
- */
-static int xvcu_set_pll(struct xvcu_device *xvcu)
-{
-	int ret;
-
-	ret = xvcu_set_vcu_pll_info(xvcu);
-	if (ret) {
-		dev_err(xvcu->dev, "failed to set pll info\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static struct clk_hw *xvcu_clk_hw_register_leaf(struct device *dev,
 						const char *name,
 						const char * const *parent_names,
@@ -834,13 +717,6 @@ static int xvcu_probe(struct platform_device *pdev)
 	 */
 	regmap_write(xvcu->logicore_reg_ba, VCU_GASKET_INIT, VCU_GASKET_VALUE);
 
-	/* Do the PLL Settings based on the ref clk,core and mcu clk freq */
-	ret = xvcu_set_pll(xvcu);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to set the pll\n");
-		goto error_pll_ref;
-	}
-
 	ret = xvcu_register_clock_provider(xvcu);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register clock provider\n");
@@ -853,7 +729,6 @@ static int xvcu_probe(struct platform_device *pdev)
 
 error_clk_provider:
 	xvcu_unregister_clock_provider(xvcu);
-error_pll_ref:
 	clk_disable_unprepare(xvcu->aclk);
 	return ret;
 }
-- 
2.20.1

