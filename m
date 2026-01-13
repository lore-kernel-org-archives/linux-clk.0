Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96028356A39
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 19:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768331096; cv=none; b=Y8aEdjgD4XBLhooqZODobmgVfyMvlKX9S2qo4/qDvrgH+jQx8xRR86Z61B/KpTNcI0jP3B0afq+93U4IdgBiT0p3DkIUqYDiJZI11jUCT6up6lblTUt+Zp59Kv/RiSFBrk0S65Jiv3ZOeFJCqCiYZEPvYZgIWphEAcyKD67rcBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768331096; c=relaxed/simple;
	bh=/ZzTFZcpmy3pYNXIc9H9OFBbgCuW2yvXuy0nRSGNSVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJmqTse0vSD2nWcwRVl6YmVlf5F7AGuCpLP99jxshDQUREx/1ZI2di/H4LgQend3YWOg+mroSNrPccvitKaRAnvdATuyJZAaO749jmphrJPBOZ9n0n8xKoPgVwv8q8tW5jt7q41PVTuTUYIZQTgT7dX+9/99Z+jo+vVqx6TIR9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vfjgG-0007Vl-Uw; Tue, 13 Jan 2026 20:03:52 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vfjgG-000T1g-38;
	Tue, 13 Jan 2026 20:03:52 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vfjgG-009wMy-0S;
	Tue, 13 Jan 2026 20:03:52 +0100
Date: Tue, 13 Jan 2026 20:03:52 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, andrej.picej@norik.com,
	primoz.fiser@norik.com, c.hemp@phytec.de,
	s.mueller-klieser@phytec.de, n.wesp@phytec.de, c.stoidner@phytec.de
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: imx93-phyboard-segin: Add peb-av-02
 overlay
Message-ID: <20260113190352.vdun5q3cfdh77g45@pengutronix.de>
References: <20260113-v6-18-topic-imx93-phyboard-segin-av-02-display-v2-1-39399e4d691d@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-v6-18-topic-imx93-phyboard-segin-av-02-display-v2-1-39399e4d691d@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

On 26-01-13, Marco Felsch wrote:
> From: Andrej Picej <andrej.picej@norik.com>
> 
> Add overlay for Audio-Video module PEB-AV-02. Add support for panel
> display, capacitive touchscreen and backlight.
> 
> For now the backlight is configured as a GPIO, brightness of the display
> can not be set. When the FLEXIO PWM driver is available this should be
> switched to PWM backlight driver.

Argh.. I noticed to late that I missed to adapt the commit message. I
will send a new v3 real quick.

Regards,
  Marco

> 
> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> [rework commit message, use local regulator, remove compatible]
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> Signed-off-by: Christian Hemp <c.hemp@phytec.de>
> [m.felsch@pengutronix.de: cleanup downstream commit]
> Tested-by: Primoz Fiser <primoz.fiser@norik.com>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> Hi,
> 
> this small series add the support for the phyBOARD-Segin DisplayKit
> AV-02 evaluation kit. This patchset depends on the following patchsets:
> 
>  - https://lore.kernel.org/linux-arm-kernel/20251202-v6-18-topic-imx93-blkctrl-v2-0-e73501034adc@pengutronix.de/
>  - https://lore.kernel.org/linux-arm-kernel/20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de/
>  - https://lore.kernel.org/all/20260113-v6-18-topic-clk-fracn-gppll-v3-0-45da70f43c98@pengutronix.de/
> 
> My test setup was:
> - phyCORE-i.MX93 +
> - phyBOARD-Segin + 
> - DisplayKit
> 
> and I used 'modeset -r' to validate the display output.
> 
> Regards,
>  Marco
> ---
> Changes in v2:
> - Link to v1: https://lore.kernel.org/r/20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-v1-0-9c14be6c7478@pengutronix.de
> - Add tested-by and r-b (Primoz)
> - Rebase to v6.19-rc1 (Primoz)
> - Rename power supply name (Primoz)
> - add vcc/iovcc-supply (Primoz)
> - add wakeup-source (Primoz)
> - add pwm-backlight and gpio-pwm
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |   2 +
>  .../freescale/imx93-phyboard-segin-peb-av-02.dtso  | 146 +++++++++++++++++++++
>  2 files changed, 148 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index f30d3fd724d0ce6b38f7bef10e3970ac34f70f4a..a850cf5d8c0298c1bcfbff0fe857c39745ac7a6c 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -384,12 +384,14 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
>  imx93-phyboard-nash-jtag-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-jtag.dtbo
>  imx93-phyboard-nash-peb-wlbt-07-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-peb-wlbt-07.dtbo
>  imx93-phyboard-nash-pwm-fan-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-pwm-fan.dtbo
> +imx93-phyboard-segin-peb-av-02-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-av-02.dtbo
>  imx93-phyboard-segin-peb-eval-01-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-eval-01.dtbo
>  imx93-phyboard-segin-peb-wlbt-05-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-wlbt-05.dtbo
>  imx93-phycore-rpmsg-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-segin.dtb imx93-phycore-rpmsg.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-jtag.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-peb-wlbt-07.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-pwm-fan.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-av-02.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-eval-01.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-wlbt-05.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phycore-rpmsg.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtso b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..af330756abfd127f2dd0a7e54c2e141300462889
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtso
> @@ -0,0 +1,146 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2025 PHYTEC Messtechnik GmbH
> + * Copyright (C) 2025 Pengutronix
> + *
> + * Author: Andrej Picej <andrej.picej@norik.com>
> + * Author: Marco Felsch <kernel@pengutronix.de>
> + */
> +
> +#include <dt-bindings/clock/imx93-clock.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include "imx93-pinfunc.h"
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		brightness-levels = <0 4 8 16 32 64 128 255>;
> +		default-brightness-level = <5>;
> +		power-supply = <&reg_vcc_3v3_con>;
> +		pwms = <&pwm7 0 5000000 0>;
> +	};
> +
> +	panel {
> +		compatible = "edt,etm0700g0edh6";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_panel>;
> +
> +		backlight = <&backlight>;
> +		enable-gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
> +		power-supply = <&reg_vcc_3v3_con>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&dpi_to_panel>;
> +			};
> +		};
> +	};
> +
> +	/* TODO: Convert to FlexIO PWM once supported */
> +	pwm7: pwm-7 {
> +		compatible = "pwm-gpio";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_pwm7>;
> +		gpios = <&gpio4 28 GPIO_ACTIVE_HIGH>;
> +		#pwm-cells = <3>;
> +	};
> +
> +	reg_vcc_3v3_con: regulator-vcc-3v3-con {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC3V3_CON";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +	};
> +};
> +
> +&dpi_bridge {
> +	status = "okay";
> +};
> +
> +&dpi_to_panel {
> +	remote-endpoint = <&panel_in>;
> +};
> +
> +&lcdif {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lcdif>;
> +	assigned-clocks = <&clk IMX93_CLK_VIDEO_PLL>;
> +	assigned-clock-rates = <332600000>;
> +	status = "okay";
> +};
> +
> +&lpi2c2 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	touchscreen@38 {
> +		compatible = "edt,edt-ft5406";
> +		reg = <0x38>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_touchscreen>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpio4 1 GPIO_ACTIVE_LOW>;
> +		vcc-supply = <&reg_vcc_3v3_con>;
> +		iovcc-supply = <&reg_vcc_3v3_con>;
> +		touchscreen-size-x = <1792>;
> +		touchscreen-size-y = <1024>;
> +		wakeup-source;
> +	};
> +};
> +
> +&media_blk_ctrl {
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_lcdif: lcdifgrp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO00__MEDIAMIX_DISP_CLK		0x50e
> +			MX93_PAD_GPIO_IO01__MEDIAMIX_DISP_DE		0x50e
> +			MX93_PAD_GPIO_IO02__MEDIAMIX_DISP_VSYNC		0x50e
> +			MX93_PAD_GPIO_IO03__MEDIAMIX_DISP_HSYNC		0x50e
> +			MX93_PAD_GPIO_IO04__MEDIAMIX_DISP_DATA00	0x50e
> +			MX93_PAD_GPIO_IO05__MEDIAMIX_DISP_DATA01	0x50e
> +			MX93_PAD_GPIO_IO06__MEDIAMIX_DISP_DATA02	0x50e
> +			MX93_PAD_GPIO_IO07__MEDIAMIX_DISP_DATA03	0x50e
> +			MX93_PAD_GPIO_IO08__MEDIAMIX_DISP_DATA04	0x50e
> +			MX93_PAD_GPIO_IO09__MEDIAMIX_DISP_DATA05	0x51e
> +			MX93_PAD_GPIO_IO10__MEDIAMIX_DISP_DATA06	0x50e
> +			MX93_PAD_GPIO_IO11__MEDIAMIX_DISP_DATA07	0x50e
> +			MX93_PAD_GPIO_IO12__MEDIAMIX_DISP_DATA08	0x50e
> +			MX93_PAD_GPIO_IO13__MEDIAMIX_DISP_DATA09	0x50e
> +			MX93_PAD_GPIO_IO14__MEDIAMIX_DISP_DATA10	0x50e
> +			MX93_PAD_GPIO_IO15__MEDIAMIX_DISP_DATA11	0x50e
> +			MX93_PAD_GPIO_IO16__MEDIAMIX_DISP_DATA12	0x506
> +			MX93_PAD_GPIO_IO17__MEDIAMIX_DISP_DATA13	0x506
> +			MX93_PAD_GPIO_IO18__MEDIAMIX_DISP_DATA14	0x506
> +			MX93_PAD_GPIO_IO19__MEDIAMIX_DISP_DATA15	0x506
> +			MX93_PAD_GPIO_IO20__MEDIAMIX_DISP_DATA16	0x506
> +			MX93_PAD_GPIO_IO21__MEDIAMIX_DISP_DATA17	0x506
> +		>;
> +	};
> +
> +	pinctrl_panel: panelgrp {
> +		fsl,pins = <
> +			MX93_PAD_CCM_CLKO4__GPIO4_IO29			0x1133e
> +		>;
> +	};
> +
> +	pinctrl_pwm7: pwm7grp {
> +		fsl,pins = <
> +			MX93_PAD_CCM_CLKO3__GPIO4_IO28			0x1133e
> +		>;
> +	};
> +
> +	pinctrl_touchscreen: touchscreengrp {
> +		fsl,pins = <
> +			MX93_PAD_ENET1_MDIO__GPIO4_IO01			0x11e
> +			MX93_PAD_ENET1_RD2__GPIO4_IO12			0x1133e
> +		>;
> +	};
> +};
> 
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-c1687aa1ccf4
> 
> Best regards,
> -- 
> Marco Felsch <m.felsch@pengutronix.de>
> 
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
