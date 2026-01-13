Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5434C357A47
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 19:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768331231; cv=none; b=OQ81agwKKU3C2m3a5/GgXlE57mQA/IOIOqM1g4RLlXW9IWvw9aH1kRyyYBtiLhqLfwEwjWSB1rDQv5FdHGtQaDBsX8ogo8B8gFq+Wny0qRGDJ9epf3udCnEPrN/055QrnKzTvkRD7zvOKvIf14+9Q3Ca8HAD8gFu3+toaii9Q3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768331231; c=relaxed/simple;
	bh=RXb1S6Hmy2Xyqp4BPsECuZZ4ji64woZOLLIqD6lUP7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KCv6RkPAp5VjiJ+WsHc5lREUb4OEUOCnHDBs+cGFNd9GNIKZsjKOL2y1hPgtODdmNl+AEW8perJebVXh9bKYeFFKnAgXAlgRBno2vbzXCTpLWR575VAPW/erHEJKAsIxSVGCvIAVGxa3UuOuJFoY3XFQk/AZZdOKh1NbyB8afus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1vfjiT-00082u-3f; Tue, 13 Jan 2026 20:06:09 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Tue, 13 Jan 2026 20:06:08 +0100
Subject: [PATCH v3] arm64: dts: imx93-phyboard-segin: Add peb-av-02 overlay
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-v6-18-topic-imx93-phyboard-segin-av-02-display-v3-1-fcbb85b0fbe5@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAJ+XZmkC/53NwWrDMAyA4VcpPk8jijMn7mnvUXpwbTURdLaxM
 5MQ8u51Cz3ttF4EvxD6NpEpMWVxPGwiUeHMwdeQHwdhJ+NHAna1Rdu0X1gHFAU4wBwiW+CfRUu
 I03oJJjnINLIHU6CeOc7xZlawqIbeGLT22on6NCa68vIET+faE+c5pPXpF3xs36YKQgPaYnchZ
 fuuH74j+fF3TsHz8ulIPLzSvgzVIMp/Gy0gSC21ps4pje6Pse/7HZsS1WFVAQAA
X-Change-ID: 20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-c1687aa1ccf4
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

The pwm-backlight uses the GPIO based PWM implementation for now. Switch
to the FlexIO PWM support once available.

Signed-off-by: Andrej Picej <andrej.picej@norik.com>
[rework commit message, use local regulator, remove compatible]
Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Signed-off-by: Christian Hemp <c.hemp@phytec.de>
[m.felsch@pengutronix.de: cleanup downstream commit]
Tested-by: Primoz Fiser <primoz.fiser@norik.com>
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Hi,

this small series add the support for the phyBOARD-Segin DisplayKit
AV-02 evaluation kit. This patchset depends on the following patchsets:

 - https://lore.kernel.org/linux-arm-kernel/20251202-v6-18-topic-imx93-blkctrl-v2-0-e73501034adc@pengutronix.de/
 - https://lore.kernel.org/linux-arm-kernel/20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de/
 - https://lore.kernel.org/all/20260113-v6-18-topic-clk-fracn-gppll-v3-0-45da70f43c98@pengutronix.de/

My test setup was:
- phyCORE-i.MX93 +
- phyBOARD-Segin + 
- DisplayKit

and I used 'modeset -r' to validate the display output.

Regards,
 Marco
---
Changes in v3:
- Link to v2: https://lore.kernel.org/r/20260113-v6-18-topic-imx93-phyboard-segin-av-02-display-v2-1-39399e4d691d@pengutronix.de
- adapt commit message accordingly

Changes in v2:
- Link to v1: https://lore.kernel.org/r/20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-v1-0-9c14be6c7478@pengutronix.de
- Add tested-by and r-b (Primoz)
- Rebase to v6.19-rc1 (Primoz)
- Rename power supply name (Primoz)
- add vcc/iovcc-supply (Primoz)
- add wakeup-source (Primoz)
- add pwm-backlight and gpio-pwm
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../freescale/imx93-phyboard-segin-peb-av-02.dtso  | 146 +++++++++++++++++++++
 2 files changed, 148 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index f30d3fd724d0ce6b38f7bef10e3970ac34f70f4a..a850cf5d8c0298c1bcfbff0fe857c39745ac7a6c 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -384,12 +384,14 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
 imx93-phyboard-nash-jtag-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-jtag.dtbo
 imx93-phyboard-nash-peb-wlbt-07-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-peb-wlbt-07.dtbo
 imx93-phyboard-nash-pwm-fan-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-pwm-fan.dtbo
+imx93-phyboard-segin-peb-av-02-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-av-02.dtbo
 imx93-phyboard-segin-peb-eval-01-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-eval-01.dtbo
 imx93-phyboard-segin-peb-wlbt-05-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-wlbt-05.dtbo
 imx93-phycore-rpmsg-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-segin.dtb imx93-phycore-rpmsg.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-jtag.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-peb-wlbt-07.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-pwm-fan.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-av-02.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-eval-01.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-wlbt-05.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phycore-rpmsg.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtso b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..af330756abfd127f2dd0a7e54c2e141300462889
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtso
@@ -0,0 +1,146 @@
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
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <5>;
+		power-supply = <&reg_vcc_3v3_con>;
+		pwms = <&pwm7 0 5000000 0>;
+	};
+
+	panel {
+		compatible = "edt,etm0700g0edh6";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_panel>;
+
+		backlight = <&backlight>;
+		enable-gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+		power-supply = <&reg_vcc_3v3_con>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dpi_to_panel>;
+			};
+		};
+	};
+
+	/* TODO: Convert to FlexIO PWM once supported */
+	pwm7: pwm-7 {
+		compatible = "pwm-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pwm7>;
+		gpios = <&gpio4 28 GPIO_ACTIVE_HIGH>;
+		#pwm-cells = <3>;
+	};
+
+	reg_vcc_3v3_con: regulator-vcc-3v3-con {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC3V3_CON";
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
+		vcc-supply = <&reg_vcc_3v3_con>;
+		iovcc-supply = <&reg_vcc_3v3_con>;
+		touchscreen-size-x = <1792>;
+		touchscreen-size-y = <1024>;
+		wakeup-source;
+	};
+};
+
+&media_blk_ctrl {
+	status = "okay";
+};
+
+&iomuxc {
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
+	pinctrl_pwm7: pwm7grp {
+		fsl,pins = <
+			MX93_PAD_CCM_CLKO3__GPIO4_IO28			0x1133e
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

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-c1687aa1ccf4

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>

