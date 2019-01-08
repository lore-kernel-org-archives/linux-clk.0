Return-Path: <SRS0=Ml2J=PQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 234C3C43387
	for <linux-clk@archiver.kernel.org>; Tue,  8 Jan 2019 16:21:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F0A072087F
	for <linux-clk@archiver.kernel.org>; Tue,  8 Jan 2019 16:21:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728211AbfAHQVW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Jan 2019 11:21:22 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:33845 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728483AbfAHQVW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Jan 2019 11:21:22 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.89)
        (envelope-from <l.stach@pengutronix.de>)
        id 1ggu7x-0006Mm-3s; Tue, 08 Jan 2019 17:21:17 +0100
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        kernel@pengutronix.de, patchwork-lst@pengutronix.de
Subject: [PATCH] clk: imx5: add imx5_SCC2_IPG_GATE
Date:   Tue,  8 Jan 2019 17:21:15 +0100
Message-Id: <20190108162115.1998-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Michael Grzeschik <m.grzeschik@pengutronix.de>

This adds the missing clock for the SCC2 peripheral unit.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/clk/imx/clk-imx51-imx53.c      | 1 +
 include/dt-bindings/clock/imx5-clock.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx51-imx53.c b/drivers/clk/imx/clk-imx51-imx53.c
index fc8e782d817b..e91c826bce70 100644
--- a/drivers/clk/imx/clk-imx51-imx53.c
+++ b/drivers/clk/imx/clk-imx51-imx53.c
@@ -428,6 +428,7 @@ static void __init mx51_clocks_init(struct device_node *np)
 	clk[IMX5_CLK_ESDHC4_PER_GATE]	= imx_clk_gate2("esdhc4_per_gate", "esdhc_d_sel", MXC_CCM_CCGR3, 14);
 	clk[IMX5_CLK_USB_PHY_GATE]	= imx_clk_gate2("usb_phy_gate", "usb_phy_sel", MXC_CCM_CCGR2, 0);
 	clk[IMX5_CLK_HSI2C_GATE]	= imx_clk_gate2("hsi2c_gate", "ipg", MXC_CCM_CCGR1, 22);
+	clk[IMX5_CLK_SCC2_IPG_GATE]	= imx_clk_gate2("scc2_gate", "ipg", MXC_CCM_CCGR1, 30);
 	clk[IMX5_CLK_MIPI_HSC1_GATE]	= imx_clk_gate2_flags("mipi_hsc1_gate", "ipg", MXC_CCM_CCGR4, 6, CLK_IS_CRITICAL);
 	clk[IMX5_CLK_MIPI_HSC2_GATE]	= imx_clk_gate2_flags("mipi_hsc2_gate", "ipg", MXC_CCM_CCGR4, 8, CLK_IS_CRITICAL);
 	clk[IMX5_CLK_MIPI_ESC_GATE]	= imx_clk_gate2_flags("mipi_esc_gate", "ipg", MXC_CCM_CCGR4, 10, CLK_IS_CRITICAL);
diff --git a/include/dt-bindings/clock/imx5-clock.h b/include/dt-bindings/clock/imx5-clock.h
index d382fc71aa83..a81be5be6700 100644
--- a/include/dt-bindings/clock/imx5-clock.h
+++ b/include/dt-bindings/clock/imx5-clock.h
@@ -214,6 +214,7 @@
 #define IMX5_CLK_IEEE1588_SEL		202
 #define IMX5_CLK_IEEE1588_PODF		203
 #define IMX5_CLK_IEEE1588_GATE		204
-#define IMX5_CLK_END			205
+#define IMX5_CLK_SCC2_IPG_GATE		205
+#define IMX5_CLK_END			206
 
 #endif /* __DT_BINDINGS_CLOCK_IMX5_H */
-- 
2.20.1

