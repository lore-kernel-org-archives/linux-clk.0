Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BB3C61DD8
	for <linux-clk@archiver.kernel.org>; Fri, 13 Nov 2020 14:53:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DA462222F
	for <linux-clk@archiver.kernel.org>; Fri, 13 Nov 2020 14:53:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbgKMOxc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Nov 2020 09:53:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgKMOxb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Nov 2020 09:53:31 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 971D7C0613D1
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2020 06:53:31 -0800 (PST)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1kdaRx-0000CS-8F; Fri, 13 Nov 2020 15:53:17 +0100
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1kdaRw-0002AU-A8; Fri, 13 Nov 2020 15:53:16 +0100
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
To:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: imx6q: demote warning about pre-boot ldb_di_clk reparenting
Date:   Fri, 13 Nov 2020 15:53:09 +0100
Message-Id: <20201113145310.8274-1-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Since 5d283b083800 ("clk: imx6: Fix procedure to switch the parent
of LDB_DI_CLK"), the clock driver warns if ldb_di\d_sel is changed
from reset value on system boot. This warning is printed even if
the bootloader (or a previous kernel that did kexec) followed the
correct procedure for glitch-free reparenting.

As such systems are doing everything correctly, a warning is too
harsh. Demote to a notice, so users are still alerted, but without
cluttering a loglevel=5 boot.

Cc: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 drivers/clk/imx/clk-imx6q.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
index ba33c79158de..b2e4b6234ac0 100644
--- a/drivers/clk/imx/clk-imx6q.c
+++ b/drivers/clk/imx/clk-imx6q.c
@@ -337,10 +337,10 @@ static void init_ldb_clks(struct device_node *np, void __iomem *ccm_base)
 	of_assigned_ldb_sels(np, &sel[0][3], &sel[1][3]);
 
 	for (i = 0; i < 2; i++) {
-		/* Warn if a glitch might have been introduced already */
+		/* Print a notice if a glitch might have been introduced already */
 		if (sel[i][0] != 3) {
-			pr_warn("ccm: ldb_di%d_sel already changed from reset value: %d\n",
-				i, sel[i][0]);
+			pr_notice("ccm: ldb_di%d_sel already changed from reset value: %d\n",
+				  i, sel[i][0]);
 		}
 
 		if (sel[i][0] == sel[i][3])
-- 
2.28.0

