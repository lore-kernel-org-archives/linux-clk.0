Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B7AC433F5
	for <linux-clk@archiver.kernel.org>; Fri, 25 Feb 2022 08:29:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238526AbiBYIa3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Feb 2022 03:30:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238523AbiBYIa2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 03:30:28 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 133002399C4
        for <linux-clk@vger.kernel.org>; Fri, 25 Feb 2022 00:29:57 -0800 (PST)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1nNVyt-0007PH-Ar; Fri, 25 Feb 2022 09:29:39 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1nNVys-00BWSr-Gu; Fri, 25 Feb 2022 09:29:38 +0100
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
Subject: [PATCH v2 7/8] clk: imx: pll14xx: Add pr_fmt
Date:   Fri, 25 Feb 2022 09:29:36 +0100
Message-Id: <20220225082937.2746176-8-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225082937.2746176-1-s.hauer@pengutronix.de>
References: <20220225082937.2746176-1-s.hauer@pengutronix.de>
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

Notes:
    Changes since v1:
    - Drop __func__ argument for which the %s was removed

 drivers/clk/imx/clk-pll14xx.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index af4c979e70a64..646e0ce7d6242 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -3,6 +3,8 @@
  * Copyright 2017-2018 NXP.
  */
 
+#define pr_fmt(fmt) "pll14xx: " fmt
+
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/clk-provider.h>
@@ -177,8 +179,8 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
 
 	rate = imx_get_pll_settings(pll, drate);
 	if (!rate) {
-		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
-		       drate, clk_hw_get_name(hw));
+		pr_err("Invalid rate %lu for pll clk %s\n", drate,
+		       clk_hw_get_name(hw));
 		return -EINVAL;
 	}
 
@@ -404,8 +406,7 @@ struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
 		init.ops = &clk_pll1443x_ops;
 		break;
 	default:
-		pr_err("%s: Unknown pll type for pll clk %s\n",
-		       __func__, name);
+		pr_err("Unknown pll type for pll clk %s\n", name);
 		kfree(pll);
 		return ERR_PTR(-EINVAL);
 	}
@@ -424,8 +425,7 @@ struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
 
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

