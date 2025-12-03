Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDF22C15BB;
	Wed,  3 Dec 2025 08:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764750888; cv=none; b=YOTGn0hhFmt7+DoQu6oKz+CgnEtjcsMX0YDHxJRLvSiV1JfQq0Mhyz2pAw3aXOIV89FFCMnzCPqTfO1PG+4JRBSntrvtJbwAvpV9T23mDVDo60XNCebEU4o48JOhNTNqEzgMsTCCRByoZH+vvpjspQCmDTD6g7M7xasNLRNuYyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764750888; c=relaxed/simple;
	bh=hHQxqxbqtVcLWJBJZTpxJ3mvvOapur+L/MsFYqU1tnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LM29e82MmoPVvvKQyYmG37dMDjP/Cq1yotCdo/+ZFTZyTf/yal9KexG08ngVNyq9UvJ6QlLpj7wGF9yax0hd9/1RyoLOG+UADxxIT7t1mvhfybksLH/ZsTaalulCrTyU8GVZJ5mD/5L0aW4IOAFLNWV0dRRwtIXmbpJ6RkkkhUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=l3BFhAXv; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="l3BFhAXv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rl2K4apG31pyKgMdWU6hr7CphVkuxZN6ocO/Se3/VAE=; b=l3BFhAXvQvf5/XQiI9KstARdhu
	MZ9bvZBFCoT99FCXmP9q8D76JK0Ll10b5Wdv5IPYFOAqqRLA78DP8uwupWQxuaoLZJvR4PFDcjdhE
	MlDUjBktNqJScLfKygczryhfMhWBdDtccaUTnjcXZ2eTdklzDO9hkeea4wHrfYdiYjvO5BJT/SyOq
	5rh7N37AZXGuGPBJJ+MJK9mhUg5HaXxG6WlkkMm0e8MKfk8TFl3+O50JSB9JZWuGDrsZL8G9CqDwn
	PBpoTruvEjtZR79J7/FuOvViFycr5UClJJCKEaXR4DApDnOF5kiDD4vTP4gP9wJKPtK1prRIi6O0j
	FWbno83Q==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:43316 helo=[192.168.69.116])
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1vQiJy-00000002Wbe-1wDZ;
	Wed, 03 Dec 2025 09:34:43 +0100
Message-ID: <15bb2331-713a-4b6a-ae9a-4870066e84dc@norik.com>
Date: Wed, 3 Dec 2025 09:34:43 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: imx93-phyboard-segin: Add peb-av-02
 overlay
To: Marco Felsch <m.felsch@pengutronix.de>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, andrej.picej@norik.com, c.hemp@phytec.de,
 s.mueller-klieser@phytec.de, n.wesp@phytec.de, c.stoidner@phytec.de
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-v1-0-9c14be6c7478@pengutronix.de>
 <20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-v1-2-9c14be6c7478@pengutronix.de>
Content-Language: en-US
From: Primoz Fiser <primoz.fiser@norik.com>
Autocrypt: addr=primoz.fiser@norik.com; keydata=
 xjMEZrROOxYJKwYBBAHaRw8BAQdAADVOb5tiLVTUAC9nu/FUl4gj/+4fDLqbc3mk0Vz8riTN
 JVByaW1veiBGaXNlciA8cHJpbW96LmZpc2VyQG5vcmlrLmNvbT7CiQQTFggAMRYhBK2YFSAH
 ExsBZLCwJGoLbQEHbnBPBQJmtE47AhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQagttAQducE+T
 gAD+K4fKlIuvH75fAFwGYG/HT3F9mN64majvqJqvp3gTB9YBAL12gu+cm11m9JMyOyN0l6Os
 jStsQFghPkzBSDWSDN0NzjgEZrROPBIKKwYBBAGXVQEFAQEHQP2xtEOhbgA+rfzvvcFkV1zK
 6ym3/c/OUQObCp50BocdAwEIB8J4BBgWCAAgFiEErZgVIAcTGwFksLAkagttAQducE8FAma0
 TjwCGwwACgkQagttAQducE8ucAD9F1sXtQD4iA7Qu+SwNUAp/9x7Cqr37CSb2p6hbRmPJP8B
 AMYR91JYlFmOJ+ScPhQ8/MgFO+V6pa7K2ebk5xYqsCgA
Organization: Norik systems d.o.o.
In-Reply-To: <20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-v1-2-9c14be6c7478@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi Marco,

On 2. 12. 25 14:44, Marco Felsch wrote:
> From: Andrej Picej <andrej.picej@norik.com>
> 
> Add overlay for Audio-Video module PEB-AV-02. Add support for panel
> display, capacitive touchscreen and backlight.
> 
> For now the backlight is configured as a GPIO, brightness of the display
> can not be set. When the FLEXIO PWM driver is available this should be
> switched to PWM backlight driver.
> 
> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> [rework commit message, use local regulator, remove compatible]
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> Signed-off-by: Christian Hemp <c.hemp@phytec.de>
> [m.felsch@pengutronix.de: cleanup downstream commit]
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |   2 +
>  .../freescale/imx93-phyboard-segin-peb-av-02.dtso  | 135 +++++++++++++++++++++
>  2 files changed, 137 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 525ef180481d331e9c4decd092b7b831c497b67e..27e27ac29e82bc0692e86c2ba15c240dc9fbe1c6 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -357,10 +357,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
>  
>  imx93-phyboard-nash-peb-wlbt-07-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-peb-wlbt-07.dtbo
> +imx93-phyboard-segin-peb-av-02-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-av-02.dtbo
>  imx93-phyboard-segin-peb-eval-01-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-eval-01.dtbo
>  imx93-phyboard-segin-peb-wlbt-05-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-wlbt-05.dtbo
>  imx93-phycore-rpmsg-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-segin.dtb imx93-phycore-rpmsg.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-peb-wlbt-07.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-av-02.dtb

Here you need to rebase since new commits on linux-next.

>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-eval-01.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-wlbt-05.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phycore-rpmsg.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtso b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..2e7074e402dc8fdeb1568d4f2d4960431e972501
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtso
> @@ -0,0 +1,135 @@
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
> +	/* TODO: Convert to PWM backlight once the FlexIO PWM is supported */
> +	backlight: backlight {
> +		compatible = "gpio-backlight";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_backlight>;
> +		gpios = <&gpio4 28 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	panel {
> +		compatible = "edt,etm0700g0edh6";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_panel>;
> +
> +		backlight = <&backlight>;
> +		enable-gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
> +		power-supply = <&reg_x71_vcc_3v3>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&dpi_to_panel>;
> +			};
> +		};
> +	};
> +
> +	reg_x71_vcc_3v3: regulator-x71-vcc-3v3 {

I just checked the schematics.

Can we rename this to reg_vcc_3v3_con in v2 maybe?

> +		compatible = "regulator-fixed";
> +		regulator-name = "X71-VCC3V3";

And this to "VCC3V3_CON"?

The reasoning behind is that "X71-VCC3V3" voltage doesn't exist on the
schematics, while there is actually "VCC3V3_CON" voltage supplying the
display panel.

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
> +	bus-width = <18>;
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
> +		touchscreen-size-x = <1792>;
> +		touchscreen-size-y = <1024>;

Please add "wakeup-source" property here like in the downstream commit.

With this in place, panel touch can be used to wake up the board from sleep.

Last but not least, can you add the vcc and iovcc supply regulators here
like in the downstream commit:

vcc-supply = <&reg_vcc_3v3_con>;
iovcc-supply = <&reg_vcc_3v3_con>;

to get rid of the following warnings:

edt_ft5x06 1-0038: supply vcc not found, using dummy regulator
edt_ft5x06 1-0038: supply iovcc not found, using dummy regulator

Anyway, I tested the display on the segin board with latest linux-next
and your patches. Can report display, touch and backlight work as expected.

Thank you!

Tested-by: Primoz Fiser <primoz.fiser@norik.com>

BR,
Primoz

> +	};
> +};
> +
> +&media_blk_ctrl {
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_backlight: backlightgrp {
> +		fsl,pins = <
> +			MX93_PAD_CCM_CLKO3__GPIO4_IO28			0x1133e
> +		>;
> +	};
> +
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
> +	pinctrl_touchscreen: touchscreengrp {
> +		fsl,pins = <
> +			MX93_PAD_ENET1_MDIO__GPIO4_IO01			0x11e
> +			MX93_PAD_ENET1_RD2__GPIO4_IO12			0x1133e
> +		>;
> +	};
> +};
> 

-- 
Primoz Fiser
phone: +386-41-390-545
email: primoz.fiser@norik.com
--
Norik systems d.o.o.
Your embedded software partner
Slovenia, EU
phone: +386-41-540-545
email: info@norik.com

