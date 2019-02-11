Return-Path: <SRS0=QcJy=QS=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0542C169C4
	for <linux-clk@archiver.kernel.org>; Mon, 11 Feb 2019 22:59:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7950C2075D
	for <linux-clk@archiver.kernel.org>; Mon, 11 Feb 2019 22:59:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727300AbfBKW7N (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Feb 2019 17:59:13 -0500
Received: from muru.com ([72.249.23.125]:38146 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727206AbfBKW7N (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 11 Feb 2019 17:59:13 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 102D480BF;
        Mon, 11 Feb 2019 22:59:21 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>
Cc:     linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
        Misael Lopez Cruz <misael.lopez@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH] clk: clk-twl6040: Fix imprecise external abort for pdmclk
Date:   Mon, 11 Feb 2019 14:59:07 -0800
Message-Id: <20190211225907.38511-1-tony@atomide.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

I noticed that modprobe clk-twl6040 can fail after a cold boot with:
abe_cm:clk:0010:0: failed to enable
...
Unhandled fault: imprecise external abort (0x1406) at 0xbe896b20

WARNING: CPU: 1 PID: 29 at drivers/clk/clk.c:828 clk_core_disable_lock+0x18/0x24
...
(clk_core_disable_lock) from [<c0123534>] (_disable_clocks+0x18/0x90)
(_disable_clocks) from [<c0124040>] (_idle+0x17c/0x244)
(_idle) from [<c0125ad4>] (omap_hwmod_idle+0x24/0x44)
(omap_hwmod_idle) from [<c053a038>] (sysc_runtime_suspend+0x48/0x108)
(sysc_runtime_suspend) from [<c06084c4>] (__rpm_callback+0x144/0x1d8)
(__rpm_callback) from [<c0608578>] (rpm_callback+0x20/0x80)
(rpm_callback) from [<c0607034>] (rpm_suspend+0x120/0x694)
(rpm_suspend) from [<c0607a78>] (__pm_runtime_idle+0x60/0x84)
(__pm_runtime_idle) from [<c053aaf0>] (sysc_probe+0x874/0xf2c)
(sysc_probe) from [<c05fecd4>] (platform_drv_probe+0x48/0x98)

After searching around for a similar issue, I came across an earlier fix
that never got merged upstream in the Android tree for glass-omap-xrr02.
There is patch "MFD: twl6040-codec: Implement PDMCLK cold temp errata"
by Misael Lopez Cruz <misael.lopez@ti.com>.

Based on my observations, this fix is also needed when cold booting
devices, and not just for deeper idle modes. Since we now have a clock
driver for pdmclk, let's fix the issue in twl6040_pdmclk_prepare().

Cc: Misael Lopez Cruz <misael.lopez@ti.com>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clk/clk-twl6040.c | 53 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-twl6040.c b/drivers/clk/clk-twl6040.c
--- a/drivers/clk/clk-twl6040.c
+++ b/drivers/clk/clk-twl6040.c
@@ -41,6 +41,43 @@ static int twl6040_pdmclk_is_prepared(struct clk_hw *hw)
 	return pdmclk->enabled;
 }
 
+static int twl6040_pdmclk_reset_one_clock(struct twl6040_pdmclk *pdmclk,
+					  unsigned int reg)
+{
+	const u8 reset_mask = TWL6040_HPLLRST;	/* Same for HPPLL and LPPLL */
+	int ret;
+
+	ret = twl6040_set_bits(pdmclk->twl6040, reg, reset_mask);
+	if (ret < 0)
+		return ret;
+
+	ret = twl6040_clear_bits(pdmclk->twl6040, reg, reset_mask);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+/*
+ * TWL6040A2 Phoenix Audio IC erratum #6: "PDM Clock Generation Issue At
+ * Cold Temperature". This affects cold boot and deeper idle states it
+ * seems. The workaround consists of resetting HPPLL and LPPLL.
+ */
+static int twl6040_pdmclk_quirk_reset_clocks(struct twl6040_pdmclk *pdmclk)
+{
+	int ret;
+
+	ret = twl6040_pdmclk_reset_one_clock(pdmclk, TWL6040_REG_HPPLLCTL);
+	if (ret)
+		return ret;
+
+	ret = twl6040_pdmclk_reset_one_clock(pdmclk, TWL6040_REG_LPPLLCTL);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int twl6040_pdmclk_prepare(struct clk_hw *hw)
 {
 	struct twl6040_pdmclk *pdmclk = container_of(hw, struct twl6040_pdmclk,
@@ -48,8 +85,20 @@ static int twl6040_pdmclk_prepare(struct clk_hw *hw)
 	int ret;
 
 	ret = twl6040_power(pdmclk->twl6040, 1);
-	if (!ret)
-		pdmclk->enabled = 1;
+	if (ret)
+		return ret;
+
+	ret = twl6040_pdmclk_quirk_reset_clocks(pdmclk);
+	if (ret)
+		goto out_err;
+
+	pdmclk->enabled = 1;
+
+	return 0;
+
+out_err:
+	dev_err(pdmclk->dev, "%s: error %i\n", __func__, ret);
+	twl6040_power(pdmclk->twl6040, 0);
 
 	return ret;
 }
-- 
2.20.1
