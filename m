Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617643FFAC9
	for <linux-clk@vger.kernel.org>; Mon,  2 Mar 2026 14:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772462561; cv=none; b=erUNG/66QaJyqvuN6xmkhTf+0qtq2CKAjoDU2CxJr8tf+vXnSCh9V1zUVa3MH1yxhdGwuT3MrGGB5ePzOU+h2fe8tH5LyPXj6HMcdEutUtijV42vKyQdT+2lhhAoT0Wy8oXQQqvjJzbNpouxH9u7hyiO/GXPR66BFIKEopPSAbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772462561; c=relaxed/simple;
	bh=IG50v+hrHGT9nfHnk4YBSpvz1amBrkz1mY2gh8hcuyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZuWSrW4kqN8px1tKsNFA0gpA+beNlAzH+80OJPvXWFu9lFiGV5X3oLOzb9sbUSXj9PvGau+qdyrvyIAX4txT4DDwaL8qW7U7WvjWH2O2+1EnO8J3vXkLsgOz7WvRmui2HKSsFUXUgp9JNt4bk8nxGLPlQjgODN0HGwBd94ZOV6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vx4Sh-0005yf-7l; Mon, 02 Mar 2026 15:41:31 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vx4Se-003OgQ-20;
	Mon, 02 Mar 2026 15:41:29 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1vx4Sf-0000000EFWv-3Xl9;
	Mon, 02 Mar 2026 15:41:29 +0100
Date: Mon, 2 Mar 2026 15:41:29 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, andrej.picej@norik.com, 
	primoz.fiser@norik.com, c.hemp@phytec.de, s.mueller-klieser@phytec.de, n.wesp@phytec.de, 
	c.stoidner@phytec.de, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: imx93-phyboard-segin: Add peb-av-02
 overlay
Message-ID: <qhkhjjlhleg5hb4md35djnstzi2zfb3kyzgzs3uj6jwo2rr52v@dd74kclcxop2>
References: <20260113-v6-18-topic-imx93-phyboard-segin-av-02-display-v3-1-fcbb85b0fbe5@pengutronix.de>
 <aZ3AnxbjO8YDTPP7@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ3AnxbjO8YDTPP7@lizhi-Precision-Tower-5810>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

Hi Frank,

On 26-02-24, Frank Li wrote:

...

> On Tue, Jan 13, 2026 at 08:06:08PM +0100, Marco Felsch wrote:
> >  arch/arm64/boot/dts/freescale/Makefile             |   2 +
> >  .../freescale/imx93-phyboard-segin-peb-av-02.dtso  | 146 +++++++++++++++++++++
> >  2 files changed, 148 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> > index f30d3fd724d0ce6b38f7bef10e3970ac34f70f4a..a850cf5d8c0298c1bcfbff0fe857c39745ac7a6c 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -384,12 +384,14 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
> >  imx93-phyboard-nash-jtag-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-jtag.dtbo
> >  imx93-phyboard-nash-peb-wlbt-07-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-peb-wlbt-07.dtbo
> >  imx93-phyboard-nash-pwm-fan-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-pwm-fan.dtbo
> > +imx93-phyboard-segin-peb-av-02-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-av-02.dtbo
> >  imx93-phyboard-segin-peb-eval-01-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-eval-01.dtbo
> >  imx93-phyboard-segin-peb-wlbt-05-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-wlbt-05.dtbo
> >  imx93-phycore-rpmsg-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-segin.dtb imx93-phycore-rpmsg.dtbo
> >  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-jtag.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-peb-wlbt-07.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-pwm-fan.dtb
> > +dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-av-02.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-eval-01.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-wlbt-05.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx93-phycore-rpmsg.dtb
> 
> I get build error
> 
> Failed to apply 'arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtbo': FDT_ERR_NOTFOUND

I couldn't reproduce your error on my site:

make ARCH=arm64 O=dtb defconfig
make ARCH=arm64 O=dtb -j dtbs|grep imx93-phyboard-segin
  DTC     arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb
  DTC     arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtbo
  DTC     arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-eval-01.dtbo
  DTC     arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-wlbt-05.dtbo
  OVL     arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtb
  OVL     arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-eval-01.dtb
  OVL     arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-wlbt-05.dtb

Regards,
  Marco


> 
> Frank
> 
> > diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtso b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtso
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..af330756abfd127f2dd0a7e54c2e141300462889
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtso
> > @@ -0,0 +1,146 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright (C) 2025 PHYTEC Messtechnik GmbH
> > + * Copyright (C) 2025 Pengutronix
> > + *
> > + * Author: Andrej Picej <andrej.picej@norik.com>
> > + * Author: Marco Felsch <kernel@pengutronix.de>
> > + */
> > +
> > +#include <dt-bindings/clock/imx93-clock.h>
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include "imx93-pinfunc.h"
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +&{/} {
> > +	backlight: backlight {
> > +		compatible = "pwm-backlight";
> > +		brightness-levels = <0 4 8 16 32 64 128 255>;
> > +		default-brightness-level = <5>;
> > +		power-supply = <&reg_vcc_3v3_con>;
> > +		pwms = <&pwm7 0 5000000 0>;
> > +	};
> > +
> > +	panel {
> > +		compatible = "edt,etm0700g0edh6";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_panel>;
> > +
> > +		backlight = <&backlight>;
> > +		enable-gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
> > +		power-supply = <&reg_vcc_3v3_con>;
> > +
> > +		port {
> > +			panel_in: endpoint {
> > +				remote-endpoint = <&dpi_to_panel>;
> > +			};
> > +		};
> > +	};
> > +
> > +	/* TODO: Convert to FlexIO PWM once supported */
> > +	pwm7: pwm-7 {
> > +		compatible = "pwm-gpio";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_pwm7>;
> > +		gpios = <&gpio4 28 GPIO_ACTIVE_HIGH>;
> > +		#pwm-cells = <3>;
> > +	};
> > +
> > +	reg_vcc_3v3_con: regulator-vcc-3v3-con {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "VCC3V3_CON";
> > +		regulator-max-microvolt = <3300000>;
> > +		regulator-min-microvolt = <3300000>;
> > +	};
> > +};
> > +
> > +&dpi_bridge {
> > +	status = "okay";
> > +};
> > +
> > +&dpi_to_panel {
> > +	remote-endpoint = <&panel_in>;
> > +};
> > +
> > +&lcdif {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_lcdif>;
> > +	assigned-clocks = <&clk IMX93_CLK_VIDEO_PLL>;
> > +	assigned-clock-rates = <332600000>;
> > +	status = "okay";
> > +};
> > +
> > +&lpi2c2 {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +
> > +	touchscreen@38 {
> > +		compatible = "edt,edt-ft5406";
> > +		reg = <0x38>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_touchscreen>;
> > +		interrupt-parent = <&gpio4>;
> > +		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
> > +		reset-gpios = <&gpio4 1 GPIO_ACTIVE_LOW>;
> > +		vcc-supply = <&reg_vcc_3v3_con>;
> > +		iovcc-supply = <&reg_vcc_3v3_con>;
> > +		touchscreen-size-x = <1792>;
> > +		touchscreen-size-y = <1024>;
> > +		wakeup-source;
> > +	};
> > +};
> > +
> > +&media_blk_ctrl {
> > +	status = "okay";
> > +};
> > +
> > +&iomuxc {
> > +	pinctrl_lcdif: lcdifgrp {
> > +		fsl,pins = <
> > +			MX93_PAD_GPIO_IO00__MEDIAMIX_DISP_CLK		0x50e
> > +			MX93_PAD_GPIO_IO01__MEDIAMIX_DISP_DE		0x50e
> > +			MX93_PAD_GPIO_IO02__MEDIAMIX_DISP_VSYNC		0x50e
> > +			MX93_PAD_GPIO_IO03__MEDIAMIX_DISP_HSYNC		0x50e
> > +			MX93_PAD_GPIO_IO04__MEDIAMIX_DISP_DATA00	0x50e
> > +			MX93_PAD_GPIO_IO05__MEDIAMIX_DISP_DATA01	0x50e
> > +			MX93_PAD_GPIO_IO06__MEDIAMIX_DISP_DATA02	0x50e
> > +			MX93_PAD_GPIO_IO07__MEDIAMIX_DISP_DATA03	0x50e
> > +			MX93_PAD_GPIO_IO08__MEDIAMIX_DISP_DATA04	0x50e
> > +			MX93_PAD_GPIO_IO09__MEDIAMIX_DISP_DATA05	0x51e
> > +			MX93_PAD_GPIO_IO10__MEDIAMIX_DISP_DATA06	0x50e
> > +			MX93_PAD_GPIO_IO11__MEDIAMIX_DISP_DATA07	0x50e
> > +			MX93_PAD_GPIO_IO12__MEDIAMIX_DISP_DATA08	0x50e
> > +			MX93_PAD_GPIO_IO13__MEDIAMIX_DISP_DATA09	0x50e
> > +			MX93_PAD_GPIO_IO14__MEDIAMIX_DISP_DATA10	0x50e
> > +			MX93_PAD_GPIO_IO15__MEDIAMIX_DISP_DATA11	0x50e
> > +			MX93_PAD_GPIO_IO16__MEDIAMIX_DISP_DATA12	0x506
> > +			MX93_PAD_GPIO_IO17__MEDIAMIX_DISP_DATA13	0x506
> > +			MX93_PAD_GPIO_IO18__MEDIAMIX_DISP_DATA14	0x506
> > +			MX93_PAD_GPIO_IO19__MEDIAMIX_DISP_DATA15	0x506
> > +			MX93_PAD_GPIO_IO20__MEDIAMIX_DISP_DATA16	0x506
> > +			MX93_PAD_GPIO_IO21__MEDIAMIX_DISP_DATA17	0x506
> > +		>;
> > +	};
> > +
> > +	pinctrl_panel: panelgrp {
> > +		fsl,pins = <
> > +			MX93_PAD_CCM_CLKO4__GPIO4_IO29			0x1133e
> > +		>;
> > +	};
> > +
> > +	pinctrl_pwm7: pwm7grp {
> > +		fsl,pins = <
> > +			MX93_PAD_CCM_CLKO3__GPIO4_IO28			0x1133e
> > +		>;
> > +	};
> > +
> > +	pinctrl_touchscreen: touchscreengrp {
> > +		fsl,pins = <
> > +			MX93_PAD_ENET1_MDIO__GPIO4_IO01			0x11e
> > +			MX93_PAD_ENET1_RD2__GPIO4_IO12			0x1133e
> > +		>;
> > +	};
> > +};
> >
> > ---
> > base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> > change-id: 20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-c1687aa1ccf4
> >
> > Best regards,
> > --
> > Marco Felsch <m.felsch@pengutronix.de>
> >
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
