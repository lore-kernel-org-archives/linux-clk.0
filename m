Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F5D2C43333
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 15:07:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39DE822CB1
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 15:07:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgLUPHZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Dec 2020 10:07:25 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:53521 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbgLUPHZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Dec 2020 10:07:25 -0500
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1krMll-0007Vp-0f; Mon, 21 Dec 2020 16:06:41 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1krMle-003AbF-QK; Mon, 21 Dec 2020 16:06:34 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc:     rajanv@xilinx.com, tejasp@xilinx.com, dshah@xilinx.com,
        rvisaval@xilinx.com, michals@xilinx.com, kernel@pengutronix.de,
        mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v2 06/15] soc: xilinx: vcu: implement PLL disable
Date:   Mon, 21 Dec 2020 16:06:25 +0100
Message-Id: <20201221150634.755673-7-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201221150634.755673-1-m.tretter@pengutronix.de>
References: <20201221150634.755673-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The disabling of the PLL is not fully implemented, because according to
the ZynqMP register reference the RESET, POR_IN and PWR_POR bits have to
be set to bring the PLL into reset.

Set the bits to disable the PLL.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changelog:

v2: none
---
 drivers/soc/xilinx/xlnx_vcu.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/xilinx/xlnx_vcu.c b/drivers/soc/xilinx/xlnx_vcu.c
index ff66551a5966..34f3299afc0d 100644
--- a/drivers/soc/xilinx/xlnx_vcu.c
+++ b/drivers/soc/xilinx/xlnx_vcu.c
@@ -329,6 +329,10 @@ static int xvcu_pll_enable(struct xvcu_device *xvcu)
 		return ret;
 	}
 
+	xvcu_write_field_reg(base, VCU_PLL_CTRL,
+			     1, VCU_PLL_CTRL_BYPASS_MASK,
+			     VCU_PLL_CTRL_BYPASS_SHIFT);
+
 	vcu_pll_ctrl = xvcu_read(base, VCU_PLL_CTRL);
 	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_POR_IN_MASK <<
 			  VCU_PLL_CTRL_POR_IN_SHIFT);
@@ -340,15 +344,9 @@ static int xvcu_pll_enable(struct xvcu_device *xvcu)
 			 VCU_PLL_CTRL_PWR_POR_SHIFT;
 	xvcu_write(base, VCU_PLL_CTRL, vcu_pll_ctrl);
 
-	xvcu_write_field_reg(base, VCU_PLL_CTRL,
-			     1, VCU_PLL_CTRL_BYPASS_MASK,
-			     VCU_PLL_CTRL_BYPASS_SHIFT);
-	xvcu_write_field_reg(base, VCU_PLL_CTRL,
-			     1, VCU_PLL_CTRL_RESET_MASK,
-			     VCU_PLL_CTRL_RESET_SHIFT);
-	xvcu_write_field_reg(base, VCU_PLL_CTRL,
-			     0, VCU_PLL_CTRL_RESET_MASK,
-			     VCU_PLL_CTRL_RESET_SHIFT);
+	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_RESET_MASK << VCU_PLL_CTRL_RESET_SHIFT);
+	vcu_pll_ctrl |= (0 & VCU_PLL_CTRL_RESET_MASK) << VCU_PLL_CTRL_RESET_SHIFT;
+	xvcu_write(base, VCU_PLL_CTRL, vcu_pll_ctrl);
 
 	ret = xvcu_pll_wait_for_lock(xvcu);
 	if (ret) {
@@ -368,6 +366,18 @@ static int xvcu_pll_enable(struct xvcu_device *xvcu)
 
 static void xvcu_pll_disable(struct xvcu_device *xvcu)
 {
+	void __iomem *base = xvcu->vcu_slcr_ba;
+	u32 vcu_pll_ctrl;
+
+	vcu_pll_ctrl = xvcu_read(base, VCU_PLL_CTRL);
+	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_POR_IN_MASK << VCU_PLL_CTRL_POR_IN_SHIFT);
+	vcu_pll_ctrl |= (1 & VCU_PLL_CTRL_POR_IN_MASK) << VCU_PLL_CTRL_POR_IN_SHIFT;
+	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_PWR_POR_MASK << VCU_PLL_CTRL_PWR_POR_SHIFT);
+	vcu_pll_ctrl |= (1 & VCU_PLL_CTRL_PWR_POR_MASK) << VCU_PLL_CTRL_PWR_POR_SHIFT;
+	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_RESET_MASK << VCU_PLL_CTRL_RESET_SHIFT);
+	vcu_pll_ctrl |= (1 & VCU_PLL_CTRL_RESET_MASK) << VCU_PLL_CTRL_RESET_SHIFT;
+	xvcu_write(base, VCU_PLL_CTRL, vcu_pll_ctrl);
+
 	clk_disable_unprepare(xvcu->pll_ref);
 }
 
-- 
2.20.1

