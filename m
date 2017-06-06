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
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v3 4/6] regulator: pfuze100: add fsl,pmic-stby-poweroff property
Date: Tue,  6 Jun 2017 09:31:44 +0200
Message-Id: <20170606073146.26882-5-o.rempel@pengutronix.de>
In-Reply-To: <20170606073146.26882-1-o.rempel@pengutronix.de>
References: <20170606073146.26882-1-o.rempel@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

Document the new optional "fsl,pmic_stby_poweroff" property.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 Documentation/devicetree/bindings/regulator/pfuze100.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/pfuze100.txt b/Documentation/devicetree/bindings/regulator/pfuze100.txt
index 444c47831a40..197f1a52e960 100644
--- a/Documentation/devicetree/bindings/regulator/pfuze100.txt
+++ b/Documentation/devicetree/bindings/regulator/pfuze100.txt
@@ -4,6 +4,13 @@ Required properties:
 - compatible: "fsl,pfuze100", "fsl,pfuze200", "fsl,pfuze3000"
 - reg: I2C slave address
 
+Optional properties:
+- fsl,pmic-stby-poweroff: if present, configure the PMIC to shutdown all
+  power rails when PMIC_STBY_REQ line is asserted during the power off sequence.
+  Use this option if the SoC should be powered off by external power
+  management IC (PMIC) on PMIC_STBY_REQ signal.
+  As opposite to PMIC_STBY_REQ boards can implement PMIC_ON_REQ signal.
+
 Required child node:
 - regulators: This is the list of child nodes that specify the regulator
   initialization data for defined regulators. Please refer to below doc
-- 
2.11.0
