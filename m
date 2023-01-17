Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE73DC6379F
	for <linux-clk@archiver.kernel.org>; Tue, 17 Jan 2023 06:17:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235775AbjAQGRK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Jan 2023 01:17:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235782AbjAQGQF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Jan 2023 01:16:05 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 508E628849
        for <linux-clk@vger.kernel.org>; Mon, 16 Jan 2023 22:15:46 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1pHfFf-0002TY-Hr; Tue, 17 Jan 2023 07:15:19 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ore@pengutronix.de>)
        id 1pHfFZ-006c0Q-SL; Tue, 17 Jan 2023 07:15:13 +0100
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ore@pengutronix.de>)
        id 1pHfFX-00Fck9-2p; Tue, 17 Jan 2023 07:15:11 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Russell King <linux@armlinux.org.uk>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH v2 14/19] clk: imx: add imx_obtain_fixed_of_clock()
Date:   Tue, 17 Jan 2023 07:14:48 +0100
Message-Id: <20230117061453.3723649-15-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230117061453.3723649-1-o.rempel@pengutronix.de>
References: <20230117061453.3723649-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add imx_obtain_fixed_of_clock() to optionally add clock not configured in
the devicetree.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/clk/imx/clk.c | 14 ++++++++++++++
 drivers/clk/imx/clk.h |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
index b636cc099d96..5f1f729008ee 100644
--- a/drivers/clk/imx/clk.c
+++ b/drivers/clk/imx/clk.c
@@ -110,6 +110,20 @@ struct clk_hw *imx_obtain_fixed_clock_hw(
 	return __clk_get_hw(clk);
 }
 
+struct clk_hw *imx_obtain_fixed_of_clock(struct device_node *np,
+					 const char *name, unsigned long rate)
+{
+	struct clk *clk = of_clk_get_by_name(np, name);
+	struct clk_hw *hw;
+
+	if (IS_ERR(clk))
+		hw = imx_obtain_fixed_clock_hw(name, rate);
+	else
+		hw = __clk_get_hw(clk);
+
+	return hw;
+}
+
 struct clk_hw *imx_get_clk_hw_by_name(struct device_node *np, const char *name)
 {
 	struct clk *clk;
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index 801213109697..f0a24cd54d1c 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -288,6 +288,9 @@ struct clk * imx_obtain_fixed_clock(
 struct clk_hw *imx_obtain_fixed_clock_hw(
 			const char *name, unsigned long rate);
 
+struct clk_hw *imx_obtain_fixed_of_clock(struct device_node *np,
+					 const char *name, unsigned long rate);
+
 struct clk_hw *imx_get_clk_hw_by_name(struct device_node *np, const char *name);
 
 struct clk_hw *imx_clk_hw_gate_exclusive(const char *name, const char *parent,
-- 
2.30.2

