Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62226EB64DC
	for <linux-clk@archiver.kernel.org>; Fri, 14 Jul 2023 13:49:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235510AbjGNNty (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Jul 2023 09:49:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235841AbjGNNtx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Jul 2023 09:49:53 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF7F63593
        for <linux-clk@vger.kernel.org>; Fri, 14 Jul 2023 06:49:49 -0700 (PDT)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.felsch@pengutronix.de>)
        id 1qKJB4-00080D-K3; Fri, 14 Jul 2023 15:49:46 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     aford173@gmail.com
Cc:     adrian.alonso@nxp.com, rasmus.villemoes@prevas.dk,
        bli@bang-olufsen.dk, linux-imx@nxp.com, linux-clk@vger.kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, abelvesa@kernel.org
Subject: [PATCH] clk: imx: pll14xx: align pdiv with reference manual
Date:   Fri, 14 Jul 2023 15:49:38 +0200
Message-Id: <20230714134938.2124861-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <CAHCN7x+fs7k0y8Sps+0N7NUPVto8UhZD9E8DbVEuDRPv6bdDMg@mail.gmail.com>
References: <CAHCN7x+fs7k0y8Sps+0N7NUPVto8UhZD9E8DbVEuDRPv6bdDMg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The PLL14xx hardware can be found on i.MX8M{M,N,P} SoCs and always come
with a 6-bit pre-divider. Neither the reference manuals nor the
datasheets of these SoCs do mention any restrictions. Furthermore the
current code doesn't respect the restrictions from the comment too.

Therefore drop the restriction and align the max pre-divider (pdiv)
value to 63 to get more accurate frequencies.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Hi Adam,

here is the patch I made for setting the exact video-pll settings.

Regards,
  Marco


 drivers/clk/imx/clk-pll14xx.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index 7150c59bbfc95..dc6bc21dff41f 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -139,11 +139,10 @@ static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rat
 	/*
 	 * Fractional PLL constrains:
 	 *
-	 * a) 6MHz <= prate <= 25MHz
-	 * b) 1 <= p <= 63 (1 <= p <= 4 prate = 24MHz)
-	 * c) 64 <= m <= 1023
-	 * d) 0 <= s <= 6
-	 * e) -32768 <= k <= 32767
+	 * a) 1 <= p <= 63
+	 * b) 64 <= m <= 1023
+	 * c) 0 <= s <= 6
+	 * d) -32768 <= k <= 32767
 	 *
 	 * fvco = (m * 65536 + k) * prate / (p * 65536)
 	 */
@@ -186,7 +185,7 @@ static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rat
 	}
 
 	/* Finally calculate best values */
-	for (pdiv = 1; pdiv <= 7; pdiv++) {
+	for (pdiv = 1; pdiv <= 63; pdiv++) {
 		for (sdiv = 0; sdiv <= 6; sdiv++) {
 			/* calc mdiv = round(rate * pdiv * 2^sdiv) / prate) */
 			mdiv = DIV_ROUND_CLOSEST(rate * (pdiv << sdiv), prate);
-- 
2.39.2

