Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD7B5C61DB3
	for <linux-clk@archiver.kernel.org>; Fri, 13 Jan 2023 14:36:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbjAMOgm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Jan 2023 09:36:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjAMOer (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Jan 2023 09:34:47 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 021135564A
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 06:28:11 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1pGL1g-0006Ix-FW; Fri, 13 Jan 2023 15:27:24 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ore@pengutronix.de>)
        id 1pGL1f-005mzS-Mq; Fri, 13 Jan 2023 15:27:23 +0100
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ore@pengutronix.de>)
        id 1pGL1b-00CkRN-Hs; Fri, 13 Jan 2023 15:27:19 +0100
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
Subject: [PATCH v1 13/20] ARM: dts: imx6qdl-skov-cpu: configure ethernet reference clock parent
Date:   Fri, 13 Jan 2023 15:27:11 +0100
Message-Id: <20230113142718.3038265-14-o.rempel@pengutronix.de>
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

Configure Ethernet reference clock parent in an obvious way instead of
using cryptic ptp way.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi b/arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi
index 3def1b621c8e..2731faede1cb 100644
--- a/arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi
@@ -105,6 +105,7 @@ clk50m_phy: phy-clock {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <50000000>;
+		clock-output-names = "enet_ref_pad";
 	};
 
 	reg_3v3: regulator-3v3 {
@@ -232,13 +233,16 @@ adc: adc@0 {
 	};
 };
 
+&clks {
+	clocks = <&clk50m_phy>;
+	clock-names = "enet_ref_pad";
+	assigned-clocks = <&clks IMX6QDL_CLK_ENET_REF_SEL>;
+	assigned-clock-parents = <&clk50m_phy>;
+};
+
 &fec {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_enet>;
-	clocks = <&clks IMX6QDL_CLK_ENET>,
-		 <&clks IMX6QDL_CLK_ENET>,
-		 <&clk50m_phy>;
-	clock-names = "ipg", "ahb", "ptp";
 	phy-mode = "rmii";
 	phy-supply = <&reg_3v3>;
 	status = "okay";
-- 
2.30.2

