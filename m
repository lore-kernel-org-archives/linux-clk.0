Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13FABC636CD
	for <linux-clk@archiver.kernel.org>; Tue, 31 Jan 2023 08:54:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbjAaIyn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 Jan 2023 03:54:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232114AbjAaIy1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 Jan 2023 03:54:27 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ABAD48A1C
        for <linux-clk@vger.kernel.org>; Tue, 31 Jan 2023 00:49:50 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1pMmHw-0003vr-C3; Tue, 31 Jan 2023 09:46:48 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ore@pengutronix.de>)
        id 1pMmHw-001eMR-3C; Tue, 31 Jan 2023 09:46:47 +0100
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ore@pengutronix.de>)
        id 1pMmHr-002yam-7W; Tue, 31 Jan 2023 09:46:43 +0100
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
Subject: [PATCH v3 13/19] ARM: dts: imx6dl-eckelmann-ci4x10: configure ethernet reference clock parent
Date:   Tue, 31 Jan 2023 09:46:36 +0100
Message-Id: <20230131084642.709385-14-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230131084642.709385-1-o.rempel@pengutronix.de>
References: <20230131084642.709385-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On this board the PHY is the ref clock provider. So, configure ethernet
reference clock as input.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 arch/arm/boot/dts/imx6dl-eckelmann-ci4x10.dts | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/imx6dl-eckelmann-ci4x10.dts b/arch/arm/boot/dts/imx6dl-eckelmann-ci4x10.dts
index 864dc5018451..33825b5a8f26 100644
--- a/arch/arm/boot/dts/imx6dl-eckelmann-ci4x10.dts
+++ b/arch/arm/boot/dts/imx6dl-eckelmann-ci4x10.dts
@@ -28,6 +28,7 @@ rmii_clk: clock-rmii {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <50000000>;
+		clock-output-names = "enet_ref_pad";
 	};
 
 	reg_usb_h1_vbus: regulator-usb-h1-vbus {
@@ -64,6 +65,13 @@ &can2 {
 	status = "okay";
 };
 
+&clks {
+	clocks = <&rmii_clk>;
+	clock-names = "enet_ref_pad";
+	assigned-clocks = <&clks IMX6QDL_CLK_ENET_REF_SEL>;
+	assigned-clock-parents = <&rmii_clk>;
+};
+
 &ecspi2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_ecspi2>;
@@ -297,11 +305,6 @@ &fec {
 	phy-mode = "rmii";
 	phy-reset-gpios = <&gpio1 18 GPIO_ACTIVE_LOW>;
 	phy-handle = <&phy>;
-	clocks = <&clks IMX6QDL_CLK_ENET>,
-		 <&clks IMX6QDL_CLK_ENET>,
-		 <&rmii_clk>,
-		 <&clks IMX6QDL_CLK_ENET_REF>;
-	clock-names = "ipg", "ahb", "ptp", "enet_out";
 	status = "okay";
 
 	mdio {
-- 
2.30.2

