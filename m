Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B2BAC61DB3
	for <linux-clk@archiver.kernel.org>; Fri, 13 Jan 2023 14:34:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjAMOet (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Jan 2023 09:34:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbjAMOd3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Jan 2023 09:33:29 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F9194F13F
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 06:28:00 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1pGL1e-0006Dw-Pw; Fri, 13 Jan 2023 15:27:22 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ore@pengutronix.de>)
        id 1pGL1d-005myg-U6; Fri, 13 Jan 2023 15:27:21 +0100
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ore@pengutronix.de>)
        id 1pGL1b-00CkQD-Ch; Fri, 13 Jan 2023 15:27:19 +0100
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
        Lee Jones <lee@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH v1 05/20] ARM: dts: imx6qdl: use enet_clk_ref instead of enet_out for the FEC node
Date:   Fri, 13 Jan 2023 15:27:03 +0100
Message-Id: <20230113142718.3038265-6-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230113142718.3038265-1-o.rempel@pengutronix.de>
References: <20230113142718.3038265-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Old imx6q machine code makes RGMII/RMII clock direction decision based on
configuration of "ptp" clock. "enet_out" is not used and make no real
sense, since we can't configure it as output or use it as clock
provider.

Instead of "enet_out" use "enet_clk_ref" which is actual selector to
choose between internal and external clock source:

FEC MAC <---------- enet_clk_ref <--------- SoC PLL
                         \
			  ^------<-> refclock PAD (bi directional)

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 arch/arm/boot/dts/imx6qdl.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index ff1e0173b39b..71522263031a 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -1050,8 +1050,8 @@ fec: ethernet@2188000 {
 				clocks = <&clks IMX6QDL_CLK_ENET>,
 					 <&clks IMX6QDL_CLK_ENET>,
 					 <&clks IMX6QDL_CLK_ENET_REF>,
-					 <&clks IMX6QDL_CLK_ENET_REF>;
-				clock-names = "ipg", "ahb", "ptp", "enet_out";
+					 <&clks IMX6QDL_CLK_ENET_REF_SEL>;
+				clock-names = "ipg", "ahb", "ptp", "enet_clk_ref";
 				fsl,stop-mode = <&gpr 0x34 27>;
 				status = "disabled";
 			};
-- 
2.30.2

