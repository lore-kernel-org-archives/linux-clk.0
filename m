Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5172931A077
	for <linux-clk@vger.kernel.org>; Tue,  2 Dec 2025 13:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764683158; cv=none; b=CuPp1Ttkj67h5dNMxCVxgd6ArkzlsuQ+hmJuEqvilOCxDcWSfWZeVhdhgh9zZBaqMpiXmg4bSBQvCoapcooAcJoidnhMrsq2kN8AI4b7N7kvPeXiALQlJrtAfbwMzMxFLIB/n2u2AXZ0KmjU+V0h2+eImpYaA1Y3e8c9ZDTnU2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764683158; c=relaxed/simple;
	bh=5Fjm548BcB9+qacmfIY7TjQvqhpEmQ+b3YCCsZH3NPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bvk8rPuL/5GIKctNQBWaG/RQxWKCXzBWwo21jRoNwu4/hJH2KfNYKh3i68H1SKlqL2Qubey/0SiI3XbJjbsMTuVhONkclSVg8lP+Xo8FMgexn424WP9FCHMGtdDhwfDIzNRvx8K1/2jAETfthjkcgRYr1f+evVLnXGjxqd8RUhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1vQQgZ-0006jO-Lo; Tue, 02 Dec 2025 14:44:55 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Tue, 02 Dec 2025 14:44:54 +0100
Subject: [PATCH 2/2] arm64: dts: imx93-phyboard-segin: Add peb-av-02
 overlay
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-v1-2-9c14be6c7478@pengutronix.de>
References: <20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-v1-0-9c14be6c7478@pengutronix.de>
In-Reply-To: <20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-v1-0-9c14be6c7478@pengutronix.de>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, andrej.picej@norik.com, 
 primoz.fiser@norik.com, c.hemp@phytec.de, s.mueller-klieser@phytec.de, 
 n.wesp@phytec.de, c.stoidner@phytec.de
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

From: Andrej Picej <andrej.picej@norik.com>

Add overlay for Audio-Video module PEB-AV-02. Add support for panel
display, capacitive touchscreen and backlight.

For now the backlight is configured as a GPIO, brightness of the display
can not be set. When the FLEXIO PWM driver is available this should be
switched to PWM backlight driver.

Signed-off-by: Andrej Picej <andrej.picej@norik.com>
[rework commit message, use local regulator, remove compatible]
Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Signed-off-by: Christian Hemp <c.hemp@phytec.de>
[m.felsch@pengutronix.de: cleanup downstream commit]
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../freescale/imx93-phyboard-segin-peb-av-02.dtso  | 135 +++++++++++++++++++++
 2 files changed, 137 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 525ef180481d331e9c4decd092b7b831c497b67e..27e27ac29e82bc0692e86c2ba15c240dc9fbe1c6 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -357,10 +357,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
 
 imx93-phyboard-nash-peb-wlbt-07-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-peb-wlbt-07.dtbo
+imx93-phyboard-segin-peb-av-02-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-av-02.dtbo
 imx93-phyboard-segin-peb-eval-01-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-eval-01.dtbo
 imx93-phyboard-segin-peb-wlbt-05-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-wlbt-05.dtbo
 imx93-phycore-rpmsg-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-segin.dtb imx93-phycore-rpmsg.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-peb-wlbt-07.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-av-02.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-eval-01.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-wlbt-05.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phycore-rpmsg.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtso b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..2e7074e402dc8fdeb1568d4f2d4960431e972501
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtso
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ * Copyright (C) 2025 Pengutronix
+ *
+ * Author: Andrej Picej <andrej.picej@norik.com>
+ * Author: Marco Felsch <kernel@pengutronix.de>
+ */
+
+#include <dt-bindings/clock/imx93-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include "imx93-pinfunc.h"
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	/* TODO: Convert to PWM backlight once the FlexIO PWM is supported */
+	backlight: backlight {
+		compatible = "gpio-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_backlight>;
+		gpios = <&gpio4 28 GPIO_ACTIVE_HIGH>;
+	};
+
+	panel {
+		compatible = "edt,etm0700g0edh6";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_panel>;
+
+		backlight = <&backlight>;
+		enable-gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+		power-supply = <&reg_x71_vcc_3v3>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dpi_to_panel>;
+			};
+		};
+	};
+
+	reg_x71_vcc_3v3: regulator-x71-vcc-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "X71-VCC3V3";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+	};
+};
+
+&dpi_bridge {
+	status = "okay";
+};
+
+&dpi_to_panel {
+	remote-endpoint = <&panel_in>;
+	bus-width = <18>;
+};
+
+&lcdif {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lcdif>;
+	assigned-clocks = <&clk IMX93_CLK_VIDEO_PLL>;
+	assigned-clock-rates = <332600000>;
+	status = "okay";
+};
+
+&lpi2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@38 {
+		compatible = "edt,edt-ft5406";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_touchscreen>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpio4 1 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <1792>;
+		touchscreen-size-y = <1024>;
+	};
+};
+
+&media_blk_ctrl {
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_backlight: backlightgrp {
+		fsl,pins = <
+			MX93_PAD_CCM_CLKO3__GPIO4_IO28			0x1133e
+		>;
+	};
+
+	pinctrl_lcdif: lcdifgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO00__MEDIAMIX_DISP_CLK		0x50e
+			MX93_PAD_GPIO_IO01__MEDIAMIX_DISP_DE		0x50e
+			MX93_PAD_GPIO_IO02__MEDIAMIX_DISP_VSYNC		0x50e
+			MX93_PAD_GPIO_IO03__MEDIAMIX_DISP_HSYNC		0x50e
+			MX93_PAD_GPIO_IO04__MEDIAMIX_DISP_DATA00	0x50e
+			MX93_PAD_GPIO_IO05__MEDIAMIX_DISP_DATA01	0x50e
+			MX93_PAD_GPIO_IO06__MEDIAMIX_DISP_DATA02	0x50e
+			MX93_PAD_GPIO_IO07__MEDIAMIX_DISP_DATA03	0x50e
+			MX93_PAD_GPIO_IO08__MEDIAMIX_DISP_DATA04	0x50e
+			MX93_PAD_GPIO_IO09__MEDIAMIX_DISP_DATA05	0x51e
+			MX93_PAD_GPIO_IO10__MEDIAMIX_DISP_DATA06	0x50e
+			MX93_PAD_GPIO_IO11__MEDIAMIX_DISP_DATA07	0x50e
+			MX93_PAD_GPIO_IO12__MEDIAMIX_DISP_DATA08	0x50e
+			MX93_PAD_GPIO_IO13__MEDIAMIX_DISP_DATA09	0x50e
+			MX93_PAD_GPIO_IO14__MEDIAMIX_DISP_DATA10	0x50e
+			MX93_PAD_GPIO_IO15__MEDIAMIX_DISP_DATA11	0x50e
+			MX93_PAD_GPIO_IO16__MEDIAMIX_DISP_DATA12	0x506
+			MX93_PAD_GPIO_IO17__MEDIAMIX_DISP_DATA13	0x506
+			MX93_PAD_GPIO_IO18__MEDIAMIX_DISP_DATA14	0x506
+			MX93_PAD_GPIO_IO19__MEDIAMIX_DISP_DATA15	0x506
+			MX93_PAD_GPIO_IO20__MEDIAMIX_DISP_DATA16	0x506
+			MX93_PAD_GPIO_IO21__MEDIAMIX_DISP_DATA17	0x506
+		>;
+	};
+
+	pinctrl_panel: panelgrp {
+		fsl,pins = <
+			MX93_PAD_CCM_CLKO4__GPIO4_IO29			0x1133e
+		>;
+	};
+
+	pinctrl_touchscreen: touchscreengrp {
+		fsl,pins = <
+			MX93_PAD_ENET1_MDIO__GPIO4_IO01			0x11e
+			MX93_PAD_ENET1_RD2__GPIO4_IO12			0x1133e
+		>;
+	};
+};

-- 
2.47.3

