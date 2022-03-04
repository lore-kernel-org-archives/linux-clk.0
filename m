Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D18C433EF
	for <linux-clk@archiver.kernel.org>; Fri,  4 Mar 2022 12:53:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232327AbiCDMxs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Mar 2022 07:53:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbiCDMxr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Mar 2022 07:53:47 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CFB143AD8
        for <linux-clk@vger.kernel.org>; Fri,  4 Mar 2022 04:53:00 -0800 (PST)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1nQ7QY-0002sm-Gr; Fri, 04 Mar 2022 13:52:58 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1nQ7QX-008v3x-H1; Fri, 04 Mar 2022 13:52:57 +0100
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
Subject: [PATCH v3 0/8] clk: i.MX: PLL14xx: Support dynamic rates
Date:   Fri,  4 Mar 2022 13:52:48 +0100
Message-Id: <20220304125256.2125023-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Changes since v2:
- Check for rate in table first before doing other calculations
- Add more Reviewed-by: tags

Changes since v1:
- reword commit message for 2/8
- Add missing includes (kernel test robot)
- Fix printf format (kernel test robot)
- Add Reviewed-by: tags

Sascha Hauer (8):
  clk: imx: pll14xx: Use register defines consistently
  clk: imx: pll14xx: Drop wrong shifting
  clk: imx: pll14xx: Use FIELD_GET/FIELD_PREP
  clk: imx: pll14xx: consolidate rate calculation
  clk: imx: pll14xx: name variables after usage
  clk: imx: pll14xx: explicitly return lowest rate
  clk: imx: pll14xx: Add pr_fmt
  clk: imx: pll14xx: Support dynamic rates

 drivers/clk/imx/clk-pll14xx.c | 287 +++++++++++++++++++++++-----------
 1 file changed, 194 insertions(+), 93 deletions(-)

-- 
2.30.2

