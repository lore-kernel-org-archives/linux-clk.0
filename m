Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF78C4321E
	for <linux-clk@archiver.kernel.org>; Wed, 23 Feb 2022 07:56:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238871AbiBWH4f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Feb 2022 02:56:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238879AbiBWH4e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 02:56:34 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC40F75605
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 23:56:06 -0800 (PST)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1nMmVJ-0006yg-3p; Wed, 23 Feb 2022 08:56:05 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1nMmVH-00FNi2-UI; Wed, 23 Feb 2022 08:56:03 +0100
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     linux-clk@vger.kernel.org
Cc:     Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Adrian Alonso <adrian.alonso@nxp.com>,
        Mads Bligaard Nielsen <bli@bang-olufsen.dk>,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 7/8] clk: imx: pll14xx: Add pr_fmt
Date:   Wed, 23 Feb 2022 08:56:00 +0100
Message-Id: <20220223075601.3652543-8-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223075601.3652543-1-s.hauer@pengutronix.de>
References: <20220223075601.3652543-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Print all messages from within the pll14xx driver with a common
prefix using pr_fmt. No need to print function names anymore, so
drop them from the messages.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/clk/imx/clk-pll14xx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index 469e0cbb24487..28c75963a80bd 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -3,6 +3,8 @@
  * Copyright 2017-2018 NXP.
  */
 
+#define pr_fmt(fmt) "pll14xx: " fmt
+
 #include <linux/bits.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
@@ -176,7 +178,7 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
 
 	rate = imx_get_pll_settings(pll, drate);
 	if (!rate) {
-		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
+		pr_err("Invalid rate %lu for pll clk %s\n", __func__,
 		       drate, clk_hw_get_name(hw));
 		return -EINVAL;
 	}
@@ -403,8 +405,7 @@ struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
 		init.ops = &clk_pll1443x_ops;
 		break;
 	default:
-		pr_err("%s: Unknown pll type for pll clk %s\n",
-		       __func__, name);
+		pr_err("Unknown pll type for pll clk %s\n", name);
 		kfree(pll);
 		return ERR_PTR(-EINVAL);
 	}
@@ -423,8 +424,7 @@ struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
 
 	ret = clk_hw_register(dev, hw);
 	if (ret) {
-		pr_err("%s: failed to register pll %s %d\n",
-			__func__, name, ret);
+		pr_err("failed to register pll %s %d\n", name, ret);
 		kfree(pll);
 		return ERR_PTR(ret);
 	}
-- 
2.30.2

