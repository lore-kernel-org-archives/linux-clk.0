Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D543433CEBF
	for <linux-clk@vger.kernel.org>; Mon, 15 Dec 2025 17:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765818535; cv=none; b=FhNcwf+hcm7c5dOEcaTXGvgCfSzVwDRR6evwOzFXs5e67I49YD+E1L4/5p32DIWawU2pwDTjHrFzUmmnY9sFRggbZbKTMlWJe6NGZyuzhhty4wYgeRcHJ0cugyce63xRIcaB3GFuhAi225Q61jAnV9w9nP4SganBH1X7dW8UKL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765818535; c=relaxed/simple;
	bh=yM747pZGK3nYAfsyKJlUfuPwd1Kx7fiDGBtS8a9/dIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WN1eCGR65ChyrqJaLQ88Cvs4K4smVtSKt+O5anRpV3YnnX7/NALktvege+VIrfqJyv4nta+nEysJ2b4N0tA/1sr/FLjuWhFemMLZZqC4Dtqebqe0ytUd7KoHmnY/PvPJYpl/7g/tIBsoBITkrWw9Y+PIDJUevKsFDsJiBB6WaXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vVC36-0007TL-5t; Mon, 15 Dec 2025 18:07:52 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vVC35-005okW-0J;
	Mon, 15 Dec 2025 18:07:51 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vVC34-008zRV-32;
	Mon, 15 Dec 2025 18:07:50 +0100
Date: Mon, 15 Dec 2025 18:07:50 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, andrej.picej@norik.com,
	c.hemp@phytec.de, s.mueller-klieser@phytec.de, n.wesp@phytec.de,
	c.stoidner@phytec.de, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: imx93-phyboard-segin: Add peb-av-02
 overlay
Message-ID: <20251215170750.j2l6gnbocmhdloe6@pengutronix.de>
References: <20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-v1-0-9c14be6c7478@pengutronix.de>
 <20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-v1-2-9c14be6c7478@pengutronix.de>
 <15bb2331-713a-4b6a-ae9a-4870066e84dc@norik.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15bb2331-713a-4b6a-ae9a-4870066e84dc@norik.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

Hi Primoz,

On 25-12-03, Primoz Fiser wrote:
> Hi Marco,
> 
> On 2. 12. 25 14:44, Marco Felsch wrote:
> > From: Andrej Picej <andrej.picej@norik.com>
> > 
> > Add overlay for Audio-Video module PEB-AV-02. Add support for panel
> > display, capacitive touchscreen and backlight.
> > 
> > For now the backlight is configured as a GPIO, brightness of the display
> > can not be set. When the FLEXIO PWM driver is available this should be
> > switched to PWM backlight driver.
> > 
> > Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> > [rework commit message, use local regulator, remove compatible]
> > Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> > Signed-off-by: Christian Hemp <c.hemp@phytec.de>
> > [m.felsch@pengutronix.de: cleanup downstream commit]
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile             |   2 +
> >  .../freescale/imx93-phyboard-segin-peb-av-02.dtso  | 135 +++++++++++++++++++++
> >  2 files changed, 137 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> > index 525ef180481d331e9c4decd092b7b831c497b67e..27e27ac29e82bc0692e86c2ba15c240dc9fbe1c6 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -357,10 +357,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
> >  
> >  imx93-phyboard-nash-peb-wlbt-07-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-peb-wlbt-07.dtbo
> > +imx93-phyboard-segin-peb-av-02-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-av-02.dtbo
> >  imx93-phyboard-segin-peb-eval-01-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-eval-01.dtbo
> >  imx93-phyboard-segin-peb-wlbt-05-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-wlbt-05.dtbo
> >  imx93-phycore-rpmsg-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-segin.dtb imx93-phycore-rpmsg.dtbo
> >  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-peb-wlbt-07.dtb
> > +dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-av-02.dtb
> 
> Here you need to rebase since new commits on linux-next.

Argh.. will do.

> >  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-eval-01.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-wlbt-05.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx93-phycore-rpmsg.dtb
> > diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtso b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtso
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..2e7074e402dc8fdeb1568d4f2d4960431e972501
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtso
> > @@ -0,0 +1,135 @@
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
> > +	/* TODO: Convert to PWM backlight once the FlexIO PWM is supported */
> > +	backlight: backlight {
> > +		compatible = "gpio-backlight";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_backlight>;
> > +		gpios = <&gpio4 28 GPIO_ACTIVE_HIGH>;
> > +	};
> > +
> > +	panel {
> > +		compatible = "edt,etm0700g0edh6";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_panel>;
> > +
> > +		backlight = <&backlight>;
> > +		enable-gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
> > +		power-supply = <&reg_x71_vcc_3v3>;
> > +
> > +		port {
> > +			panel_in: endpoint {
> > +				remote-endpoint = <&dpi_to_panel>;
> > +			};
> > +		};
> > +	};
> > +
> > +	reg_x71_vcc_3v3: regulator-x71-vcc-3v3 {
> 
> I just checked the schematics.
> 
> Can we rename this to reg_vcc_3v3_con in v2 maybe?
> 
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "X71-VCC3V3";
> 
> And this to "VCC3V3_CON"?
> 
> The reasoning behind is that "X71-VCC3V3" voltage doesn't exist on the
> schematics, while there is actually "VCC3V3_CON" voltage supplying the
> display panel.

I know that "X71-VCC3V3" doesn't exist, I also thought about
"X71:VCC3V3" to make it clear. Why I mentioned the X71 in the first
place was to not cause any naming conflict. I would like to keep the X71
naming since "VCC3V3_CON" really is the "X71-VCC3V3" with some filters
applied. Anyway, I can change this of course.

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
> > +	bus-width = <18>;
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
> > +		touchscreen-size-x = <1792>;
> > +		touchscreen-size-y = <1024>;
> 
> Please add "wakeup-source" property here like in the downstream commit.
> 
> With this in place, panel touch can be used to wake up the board from sleep.

Is this a required feature? Touchscreens with no certain
low-power mode handlig (e.g. reduced scanning time) can draw much power
in suspend.

I can add it if Phytec is aware of this fact and still wants to have
thsi feature.

> Last but not least, can you add the vcc and iovcc supply regulators here
> like in the downstream commit:
> 
> vcc-supply = <&reg_vcc_3v3_con>;
> iovcc-supply = <&reg_vcc_3v3_con>;
> 
> to get rid of the following warnings:
> 
> edt_ft5x06 1-0038: supply vcc not found, using dummy regulator
> edt_ft5x06 1-0038: supply iovcc not found, using dummy regulator

Will do.

> Anyway, I tested the display on the segin board with latest linux-next
> and your patches. Can report display, touch and backlight work as expected.
> 
> Thank you!
> 
> Tested-by: Primoz Fiser <primoz.fiser@norik.com>

Regards,
  Marco

> 
> BR,
> Primoz
> 
> > +	};
> > +};
> > +
> > +&media_blk_ctrl {
> > +	status = "okay";
> > +};
> > +
> > +&iomuxc {
> > +	pinctrl_backlight: backlightgrp {
> > +		fsl,pins = <
> > +			MX93_PAD_CCM_CLKO3__GPIO4_IO28			0x1133e
> > +		>;
> > +	};
> > +
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
> > +	pinctrl_touchscreen: touchscreengrp {
> > +		fsl,pins = <
> > +			MX93_PAD_ENET1_MDIO__GPIO4_IO01			0x11e
> > +			MX93_PAD_ENET1_RD2__GPIO4_IO12			0x1133e
> > +		>;
> > +	};
> > +};
> > 
> 
> -- 
> Primoz Fiser
> phone: +386-41-390-545
> email: primoz.fiser@norik.com
> --
> Norik systems d.o.o.
> Your embedded software partner
> Slovenia, EU
> phone: +386-41-540-545
> email: info@norik.com
> 
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
