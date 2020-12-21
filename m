Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F3E0C43217
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 15:07:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5228B22CB3
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 15:07:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725902AbgLUPHZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Dec 2020 10:07:25 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:43313 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbgLUPHZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Dec 2020 10:07:25 -0500
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1krMll-0007Vn-0X; Mon, 21 Dec 2020 16:06:41 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1krMle-003Ab9-PM; Mon, 21 Dec 2020 16:06:34 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc:     rajanv@xilinx.com, tejasp@xilinx.com, dshah@xilinx.com,
        rvisaval@xilinx.com, michals@xilinx.com, kernel@pengutronix.de,
        mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v2 04/15] soc: xilinx: vcu: add helper to wait for PLL locked
Date:   Mon, 21 Dec 2020 16:06:23 +0100
Message-Id: <20201221150634.755673-5-m.tretter@pengutronix.de>
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

Extract a helper function to wait until the PLL is locked. Also,
disabling the bypass was buried in the exit path on the wait loop.
Separate the different steps and add a helper function to make the code
more readable.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changelog:

v2: none
---
 drivers/soc/xilinx/xlnx_vcu.c | 46 ++++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/soc/xilinx/xlnx_vcu.c b/drivers/soc/xilinx/xlnx_vcu.c
index 7da9643820a8..0fd8356a3776 100644
--- a/drivers/soc/xilinx/xlnx_vcu.c
+++ b/drivers/soc/xilinx/xlnx_vcu.c
@@ -256,6 +256,22 @@ static void xvcu_write_field_reg(void __iomem *iomem, int offset,
 	xvcu_write(iomem, offset, val);
 }
 
+static int xvcu_pll_wait_for_lock(struct xvcu_device *xvcu)
+{
+	void __iomem *base = xvcu->vcu_slcr_ba;
+	unsigned long timeout;
+	u32 lock_status;
+
+	timeout = jiffies + msecs_to_jiffies(2000);
+	do {
+		lock_status = xvcu_read(base, VCU_PLL_STATUS);
+		if (lock_status & VCU_PLL_STATUS_LOCK_STATUS_MASK)
+			return 0;
+	} while (!time_after(jiffies, timeout));
+
+	return -ETIMEDOUT;
+}
+
 /**
  * xvcu_set_vcu_pll_info - Set the VCU PLL info
  * @xvcu:	Pointer to the xvcu_device structure
@@ -428,8 +444,6 @@ static int xvcu_set_vcu_pll_info(struct xvcu_device *xvcu)
  */
 static int xvcu_set_pll(struct xvcu_device *xvcu)
 {
-	u32 lock_status;
-	unsigned long timeout;
 	int ret;
 
 	ret = xvcu_set_vcu_pll_info(xvcu);
@@ -447,24 +461,18 @@ static int xvcu_set_pll(struct xvcu_device *xvcu)
 	xvcu_write_field_reg(xvcu->vcu_slcr_ba, VCU_PLL_CTRL,
 			     0, VCU_PLL_CTRL_RESET_MASK,
 			     VCU_PLL_CTRL_RESET_SHIFT);
-	/*
-	 * Defined the timeout for the max time to wait the
-	 * PLL_STATUS to be locked.
-	 */
-	timeout = jiffies + msecs_to_jiffies(2000);
-	do {
-		lock_status = xvcu_read(xvcu->vcu_slcr_ba, VCU_PLL_STATUS);
-		if (lock_status & VCU_PLL_STATUS_LOCK_STATUS_MASK) {
-			xvcu_write_field_reg(xvcu->vcu_slcr_ba, VCU_PLL_CTRL,
-					     0, VCU_PLL_CTRL_BYPASS_MASK,
-					     VCU_PLL_CTRL_BYPASS_SHIFT);
-			return 0;
-		}
-	} while (!time_after(jiffies, timeout));
 
-	/* PLL is not locked even after the timeout of the 2sec */
-	dev_err(xvcu->dev, "PLL is not locked\n");
-	return -ETIMEDOUT;
+	ret = xvcu_pll_wait_for_lock(xvcu);
+	if (ret) {
+		dev_err(xvcu->dev, "PLL is not locked\n");
+		return ret;
+	}
+
+	xvcu_write_field_reg(xvcu->vcu_slcr_ba, VCU_PLL_CTRL,
+			     0, VCU_PLL_CTRL_BYPASS_MASK,
+			     VCU_PLL_CTRL_BYPASS_SHIFT);
+
+	return ret;
 }
 
 /**
-- 
2.20.1

