Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Icenowy Zheng <icenowy@aosc.io>
To: Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-sunxi@googlegroups.com,
        Ondrej Jirman <megous@megous.com>,
        Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 04/10] ARM: sunxi: h3/h5: Add r_i2c I2C controller
Date: Sun, 23 Jul 2017 18:27:43 +0800
Message-Id: <20170723102749.17323-5-icenowy@aosc.io>
In-Reply-To: <20170723102749.17323-1-icenowy@aosc.io>
References: <20170723102749.17323-1-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Ondrej Jirman <megous@megous.com>

Allwinner H3/H5 SoCs have an I2C controller at PL GPIO bank.

Add support for it in the device tree.

Signed-off-by: Ondrej Jirman <megous@megous.com>
[Icenowy: Change to use r_ccu and change pinmux node name]
Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 arch/arm/boot/dts/sunxi-h3-h5.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index b240099bc865..65643c4710a3 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -624,6 +624,20 @@
 			status = "disabled";
 		};
 
+		r_i2c: i2c@01f02400 {
+			compatible = "allwinner,sun6i-a31-i2c";
+			reg = <0x01f02400 0x400>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&r_i2c_pins>;
+			clocks = <&r_ccu CLK_APB0_I2C>;
+			clock-frequency = <100000>;
+			resets = <&r_ccu RST_APB0_I2C>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		r_pio: pinctrl@01f02c00 {
 			compatible = "allwinner,sun8i-h3-r-pinctrl";
 			reg = <0x01f02c00 0x400>;
-- 
2.13.0
