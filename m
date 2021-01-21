Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 790D1C43381
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jan 2021 07:18:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E2E1239EE
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jan 2021 07:18:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbhAUHSt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Jan 2021 02:18:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727164AbhAUHST (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Jan 2021 02:18:19 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0B01C061786
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 23:17:02 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1l2UDE-0006UE-C5; Thu, 21 Jan 2021 08:17:00 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1l2UDD-00597X-6j; Thu, 21 Jan 2021 08:16:59 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc:     m.mtretter@pengutronix.de, michals@xilinx.com,
        kernel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v3 03/15] soc: xilinx: vcu: drop coreclk from struct xlnx_vcu
Date:   Thu, 21 Jan 2021 08:16:47 +0100
Message-Id: <20210121071659.1226489-4-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121071659.1226489-1-m.tretter@pengutronix.de>
References: <20210121071659.1226489-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The coreclk field is newer read after being written to xlnx_vcu. Remove
the coreclk field from the xlnx_vcu and use a function local variable
instead.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
Acked-by: Michal Simek <michal.simek@xilinx.com>
---
Changelog:

v3: none
v2: none
---
 drivers/soc/xilinx/xlnx_vcu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/xilinx/xlnx_vcu.c b/drivers/soc/xilinx/xlnx_vcu.c
index 14daad4efc58..7da9643820a8 100644
--- a/drivers/soc/xilinx/xlnx_vcu.c
+++ b/drivers/soc/xilinx/xlnx_vcu.c
@@ -73,7 +73,6 @@
  * @aclk: axi clock source
  * @logicore_reg_ba: logicore reg base address
  * @vcu_slcr_ba: vcu_slcr Register base address
- * @coreclk: core clock frequency
  */
 struct xvcu_device {
 	struct device *dev;
@@ -81,7 +80,6 @@ struct xvcu_device {
 	struct clk *aclk;
 	struct regmap *logicore_reg_ba;
 	void __iomem *vcu_slcr_ba;
-	u32 coreclk;
 };
 
 static struct regmap_config vcu_settings_regmap_config = {
@@ -358,10 +356,10 @@ static int xvcu_set_vcu_pll_info(struct xvcu_device *xvcu)
 		return -EINVAL;
 	}
 
-	xvcu->coreclk = pll_clk / divisor_core;
+	coreclk = pll_clk / divisor_core;
 	mcuclk = pll_clk / divisor_mcu;
 	dev_dbg(xvcu->dev, "Actual Ref clock freq is %uHz\n", refclk);
-	dev_dbg(xvcu->dev, "Actual Core clock freq is %uHz\n", xvcu->coreclk);
+	dev_dbg(xvcu->dev, "Actual Core clock freq is %uHz\n", coreclk);
 	dev_dbg(xvcu->dev, "Actual Mcu clock freq is %uHz\n", mcuclk);
 
 	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_FBDIV_MASK << VCU_PLL_CTRL_FBDIV_SHIFT);
-- 
2.20.1

