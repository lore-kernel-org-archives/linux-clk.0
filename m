Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E483C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 23 Feb 2022 07:56:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238933AbiBWH5U (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Feb 2022 02:57:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238941AbiBWH5F (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 02:57:05 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F392F1109
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 23:56:30 -0800 (PST)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1nMmVJ-0006yf-3o; Wed, 23 Feb 2022 08:56:05 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1nMmVH-00FNhx-Tn; Wed, 23 Feb 2022 08:56:03 +0100
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
Subject: [PATCH 6/8] clk: imx: pll14xx: explicitly return lowest rate
Date:   Wed, 23 Feb 2022 08:55:59 +0100
Message-Id: <20220223075601.3652543-7-s.hauer@pengutronix.de>
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

clk_pll14xx_round_rate() returns the lowest rate by indexing into
the rate table with the variable i. i is actually pll->rate_count
as this is the value we come out of the loop with. Use pll->rate_count
explicitly to make it a bit more clear what is being done. While at
it fix a typo in the comment. No functional change.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/clk/imx/clk-pll14xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index c56abd3c47460..469e0cbb24487 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -117,13 +117,13 @@ static long clk_pll14xx_round_rate(struct clk_hw *hw, unsigned long rate,
 	const struct imx_pll14xx_rate_table *rate_table = pll->rate_table;
 	int i;
 
-	/* Assumming rate_table is in descending order */
+	/* Assuming rate_table is in descending order */
 	for (i = 0; i < pll->rate_count; i++)
 		if (rate >= rate_table[i].rate)
 			return rate_table[i].rate;
 
 	/* return minimum supported value */
-	return rate_table[i - 1].rate;
+	return rate_table[pll->rate_count - 1].rate;
 }
 
 static unsigned long clk_pll14xx_recalc_rate(struct clk_hw *hw,
-- 
2.30.2

