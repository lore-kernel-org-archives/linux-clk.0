Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:52163 "EHLO
        metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751417AbdFFHck (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Jun 2017 03:32:40 -0400
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Andrew Morton <akpm@linux-foundation.org>,
        devicetree@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>,
        kernel@pengutronix.de, Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v3 6/6] ARM: dts: imx6: RIoTboard provide standby on power off option
Date: Tue,  6 Jun 2017 09:31:46 +0200
Message-Id: <20170606073146.26882-7-o.rempel@pengutronix.de>
In-Reply-To: <20170606073146.26882-1-o.rempel@pengutronix.de>
References: <20170606073146.26882-1-o.rempel@pengutronix.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This board, as well as some other boards with i.MX6 and a PMIC, uses a
"MPIC_STBY_REQ" line to notify the PMIC about a state change.
The PMIC is programmed for a specific state change before triggering the
line.
In this case, PMIC_STBY_REQ can be used for stand by, sleep
and power off modes.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 arch/arm/boot/dts/imx6dl-riotboard.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/imx6dl-riotboard.dts b/arch/arm/boot/dts/imx6dl-riotboard.dts
index 2cb72824e800..da9d0c102a31 100644
--- a/arch/arm/boot/dts/imx6dl-riotboard.dts
+++ b/arch/arm/boot/dts/imx6dl-riotboard.dts
@@ -90,6 +90,10 @@
 	status = "okay";
 };
 
+&clks {
+	fsl,pmic-stby-poweroff;
+};
+
 &fec {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_enet>;
@@ -125,6 +129,7 @@
 		reg = <0x08>;
 		interrupt-parent = <&gpio5>;
 		interrupts = <16 8>;
+		fsl,pmic-stby-poweroff;
 
 		regulators {
 			reg_vddcore: sw1ab {				/* VDDARM_IN */
-- 
2.11.0

