Return-Path: <ore@pengutronix.de>
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Andrew Morton <akpm@linux-foundation.org>,
	devicetree@vger.kernel.org,
	Fabio Estevam <fabio.estevam@nxp.com>,
	kernel@pengutronix.de,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Leonard Crestez <leonard.crestez@nxp.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v6 6/6] ARM: dts: imx6: RIoTboard provide standby on power off option
Date: Tue, 20 Jun 2017 16:09:10 +0200
Message-Id: <20170620140910.7568-7-o.rempel@pengutronix.de>
In-Reply-To: <20170620140910.7568-1-o.rempel@pengutronix.de>
References: <20170620140910.7568-1-o.rempel@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

This board, as well as some other boards with i.MX6 and a PMIC, uses a
"PMIC_STBY_REQ" line to notify the PMIC about a state change.
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
