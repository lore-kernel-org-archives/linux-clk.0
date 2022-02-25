Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A02BC433EF
	for <linux-clk@archiver.kernel.org>; Fri, 25 Feb 2022 08:29:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238510AbiBYIaN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Feb 2022 03:30:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236052AbiBYIaM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 03:30:12 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 113652399C8
        for <linux-clk@vger.kernel.org>; Fri, 25 Feb 2022 00:29:41 -0800 (PST)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1nNVyt-0007PC-Ak; Fri, 25 Feb 2022 09:29:39 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1nNVys-00BWSc-Dp; Fri, 25 Feb 2022 09:29:38 +0100
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
Subject: [PATCH v2 2/8] clk: imx: pll14xx: Drop wrong shifting
Date:   Fri, 25 Feb 2022 09:29:31 +0100
Message-Id: <20220225082937.2746176-3-s.hauer@pengutronix.de>
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

The code tries to mask the bits in SDIV_MASK from 'tmp'. SDIV_MASK
already contains the shifted value, so shifting it again is wrong.
No functional change though as SDIV_SHIFT is zero.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Reviewed-by: Abel Vesa <abel.vesa@nxp.com>
---

Notes:
    Changes since v1:
    - Avoid the word 'fix' in the subject to prevent stable guys from picking this patch
    - Add note to the commit message that there's no functional change

 drivers/clk/imx/clk-pll14xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index cae64d750672e..b295d8a049009 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -195,7 +195,7 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
 	tmp = readl_relaxed(pll->base + DIV_CTL0);
 
 	if (!clk_pll14xx_mp_change(rate, tmp)) {
-		tmp &= ~(SDIV_MASK) << SDIV_SHIFT;
+		tmp &= ~SDIV_MASK;
 		tmp |= rate->sdiv << SDIV_SHIFT;
 		writel_relaxed(tmp, pll->base + DIV_CTL0);
 
@@ -261,7 +261,7 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 	tmp = readl_relaxed(pll->base + DIV_CTL0);
 
 	if (!clk_pll14xx_mp_change(rate, tmp)) {
-		tmp &= ~(SDIV_MASK) << SDIV_SHIFT;
+		tmp &= ~SDIV_MASK;
 		tmp |= rate->sdiv << SDIV_SHIFT;
 		writel_relaxed(tmp, pll->base + DIV_CTL0);
 
-- 
2.30.2

