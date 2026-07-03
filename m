Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4053C378D9B;
	Fri,  3 Jul 2026 09:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783070176; cv=none; b=c+VbwKqMTxvg9agJN4bNeT5FYk6px3ne4nhY/DEQSbeqj4qqrMsz6XXTIaLYMZVPJKp50seQw4RRXhbPxxh8qdIn/FN7M6UESmJt0Dkmf8ED8Tn1civEdYVOTBE4Omt2i6Dcs8Fj8pac9Swika80Mo5PqiXVZVC+/ya3C5lxJy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783070176; c=relaxed/simple;
	bh=dp9Xj+cItPFIIBzbEWAY4xV9Mtusw8hT57USFJiYQGA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tjAzOWLN/Mcj0KP9dznwCwsY4ZZqSBfe/Gy+nP27SxpviXqDekFHs25Ad491ElpMrCv1IezIGpx50LWqupZJ47MGGXQ99+u0ce3DnvhNal/Ci8PC72lr04e43SUYybmJssLHHFRx71WyEJSI2f3hF09MVdb72U7dBQ2sKCkJMhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5CA39202670;
	Fri, 03 Jul 2026 11:16:09 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wfa0H-005t2j-0v;
	Fri, 03 Jul 2026 11:16:09 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wfa0H-000000004tG-0qgh;
	Fri, 03 Jul 2026 11:16:09 +0200
Message-ID: <4f12469143f61194c332eb6d911ba090ab58ed95.camel@pengutronix.de>
Subject: Re: [PATCH v6 11/12] reset: zte: Add a zx297520v3 reset driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stefan =?ISO-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>,  Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Brian Masney	 <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Fri, 03 Jul 2026 11:16:09 +0200
In-Reply-To: <20260702-zx29clk-v6-11-377b704f80c4@gmail.com>
References: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
	 <20260702-zx29clk-v6-11-377b704f80c4@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Do, 2026-07-02 at 23:28 +0300, Stefan D=C3=B6singer wrote:
> This drives the MFD child devices created by the zx297520v3-crm driver
> as well as the aux device created by the zx297520v3-lspclk driver.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
>=20
> ---
>=20
> v6:
> Add a comment wrt checking all bits in .status() (Philipp)
> include cleanup (Philipp, Sashiko)
>=20
> v5:
> Make top and matrix MFD children instead of aux devices
> Split USB PHY reset into its own reset ID
> Remove USB reset wait code - this will be handled via syscon from a
> future minimal phy-zx29-usb driver
> ---
>  MAINTAINERS                          |   1 +
>  drivers/reset/Kconfig                |  10 ++
>  drivers/reset/Makefile               |   1 +
>  drivers/reset/reset-zte-zx297520v3.c | 234 +++++++++++++++++++++++++++++=
++++++
>  4 files changed, 246 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8f2e436cb42b..084d30fec1cd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3883,6 +3883,7 @@ F:	Documentation/devicetree/bindings/soc/zte/
>  F:	arch/arm/boot/dts/zte/
>  F:	arch/arm/mach-zte/
>  F:	drivers/clk/zte/
> +F:	drivers/reset/reset-zte-zx297520v3.c
>  F:	drivers/soc/zte/
>  F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
>  F:	include/dt-bindings/reset/zte,zx297520v3-reset.h
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index d009eb0849a3..4dca1f89d22b 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -404,6 +404,16 @@ config RESET_UNIPHIER_GLUE
>  	  on UniPhier SoCs. Say Y if you want to control reset signals
>  	  provided by the glue layer.
> =20
> +config RESET_ZTE_ZX297520V3
> +	tristate "ZTE zx297520v3 Reset Driver"
> +	depends on ZTE_ZX297520V3_CRM || COMPILE_TEST
> +	default SOC_ZX297520V3
> +	help
> +	  This enables the reset controllers for ZTE zx297520v3 SoCs. The reset
> +	  controllers are part of the clock and reset management controllers on
> +	  this board, so you will also need ZTE_ZX297520V3_CRM. Enable this if
> +	  you are building a kernel for a ZTE x297520v3 based board.
> +
>  config RESET_ZYNQ
>  	bool "ZYNQ Reset Driver" if COMPILE_TEST
>  	default ARCH_ZYNQ
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 3e52569bd276..9a8a48d44dc4 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -50,5 +50,6 @@ obj-$(CONFIG_RESET_TI_TPS380X) +=3D reset-tps380x.o
>  obj-$(CONFIG_RESET_TN48M_CPLD) +=3D reset-tn48m.o
>  obj-$(CONFIG_RESET_UNIPHIER) +=3D reset-uniphier.o
>  obj-$(CONFIG_RESET_UNIPHIER_GLUE) +=3D reset-uniphier-glue.o
> +obj-$(CONFIG_RESET_ZTE_ZX297520V3) +=3D reset-zte-zx297520v3.o
>  obj-$(CONFIG_RESET_ZYNQ) +=3D reset-zynq.o
>  obj-$(CONFIG_RESET_ZYNQMP) +=3D reset-zynqmp.o
> diff --git a/drivers/reset/reset-zte-zx297520v3.c b/drivers/reset/reset-z=
te-zx297520v3.c
> new file mode 100644
> index 000000000000..75a9e6e93cda
> --- /dev/null
> +++ b/drivers/reset/reset-zte-zx297520v3.c
> @@ -0,0 +1,234 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Stefan D=C3=B6singer
> + */
> +#include <dt-bindings/reset/zte,zx297520v3-reset.h>
> +#include <linux/reset-controller.h>
> +#include <linux/platform_device.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
> +#include <linux/module.h>
> +#include <linux/types.h>
> +#include <linux/errno.h>
> +#include <linux/bits.h>
> +#include <linux/err.h>
> +
> +/* Most devices on the zx297520v3 SoC have one reset bit per clock line.=
 As a rule of thumb, the
> + * lower bit disconnects the device from the bus, similarly to turning o=
ff PCLK - registers read 0
> + * or hang indefinitely. Unlike PCLK, this reset may have a lingering ef=
fect after deasserting.
> + * E.g. timers will be disabled, but retain their counter value.
> + *
> + * The other bit resets the actual device registers.
> + *
> + * For some devices, e.g. GMAC, both reset bits behave in the same way: =
They disconnect the device
> + * and registers will have their default state after deasserting. For de=
vices that have two reset
> + * bits, both need to be deasserted for the device to function.
> + */
> +struct zte_reset_reg {
> +	u32 mask;
> +	u16 reg;
> +};
> +
> +struct zte_reset_data {
> +	const struct zte_reset_reg *resets;
> +	unsigned int num;
> +};
> +
> +struct zte_reset {
> +	struct reset_controller_dev rcdev;
> +	struct regmap *map;
> +	const struct zte_reset_reg *resets;
> +};
> +
> +static inline struct zte_reset *to_zte_reset(struct reset_controller_dev=
 *rcdev)
> +{
> +	return container_of(rcdev, struct zte_reset, rcdev);
> +}
> +
> +static int zx29_rst_assert(struct reset_controller_dev *rcdev, unsigned =
long id)
> +{
> +	struct zte_reset *rst =3D to_zte_reset(rcdev);
> +
> +	return regmap_clear_bits(rst->map, rst->resets[id].reg, rst->resets[id]=
.mask);
> +}
> +
> +static int zx29_rst_deassert(struct reset_controller_dev *rcdev, unsigne=
d long id)
> +{
> +	struct zte_reset *rst =3D to_zte_reset(rcdev);
> +
> +	return regmap_set_bits(rst->map, rst->resets[id].reg, rst->resets[id].m=
ask);
> +}
> +
> +static int zx29_rst_status(struct reset_controller_dev *rcdev, unsigned =
long id)
> +{
> +	struct zte_reset *rst =3D to_zte_reset(rcdev);
> +	int res;
> +
> +	/* Devices with two reset bits need both deasserted to work. So only re=
port them as
> +	 * deasserted if both bits are set.
> +	 *
> +	 * assert()/deassert() will always clear/set both. The only reason a de=
vice might be in a
> +	 * hybrid state is an unexpected handover state from the bootloader.
> +	 */
> +	res =3D regmap_test_bits(rst->map, rst->resets[id].reg, rst->resets[id]=
.mask);
> +	if (res < 0)
> +		return res;
> +
> +	return !res;
> +}
> +
> +static const struct reset_control_ops zx29_rst_ops =3D {
> +	.assert		=3D zx29_rst_assert,
> +	.deassert	=3D zx29_rst_deassert,
> +	.status		=3D zx29_rst_status,
> +};
> +
> +static const struct zte_reset_reg zx297520v3_top_resets[] =3D {
> +	/* This bit is set by ZTE's cpko.ko blob, it looks like a reset bit for=
 the LTE DSP
> +	 * coprocessor. Clocks for it are in matrixcrm.
> +	 */
> +	[ZX297520V3_ZSP_RESET]       =3D { .reg =3D 0x13c, .mask =3D BIT(0)    =
        },
> +
> +	[ZX297520V3_UART0_RESET]     =3D { .reg =3D  0x78, .mask =3D BIT(6)  | =
BIT(7)  },
> +	[ZX297520V3_I2C0_RESET]      =3D { .reg =3D  0x74, .mask =3D BIT(8)  | =
BIT(9)  },
> +	/* Only one reset. Bit 5 is settable but does not do anything observabl=
e */
> +	[ZX297520V3_RTC_RESET]       =3D { .reg =3D  0x74, .mask =3D BIT(4)    =
        },
> +	[ZX297520V3_TIMER_T08_RESET] =3D { .reg =3D  0x78, .mask =3D BIT(4)  | =
BIT(5)  },
> +	[ZX297520V3_TIMER_T09_RESET] =3D { .reg =3D  0x78, .mask =3D BIT(2)  | =
BIT(3)  },
> +	/* Only one reset. Bit 0 is settable but does not do anything observabl=
e */
> +	[ZX297520V3_PMM_RESET]       =3D { .reg =3D  0x74, .mask =3D BIT(1)    =
        },
> +
> +	/* I haven't found any clocks for GPIO. It probably wouldn't make much
> +	 * sense anyway. Only one reset bit per controller.
> +	 */
> +	[ZX297520V3_GPIO_RESET]      =3D { .reg =3D  0x74, .mask =3D BIT(3)    =
        },
> +	[ZX297520V3_GPIO8_RESET]     =3D { .reg =3D  0x74, .mask =3D BIT(2)    =
        },
> +
> +	[ZX297520V3_TIMER_T12_RESET] =3D { .reg =3D  0x74, .mask =3D BIT(6)  | =
BIT(7)  },
> +	[ZX297520V3_TIMER_T13_RESET] =3D { .reg =3D  0x7c, .mask =3D BIT(0)  | =
BIT(1)  },
> +	[ZX297520V3_TIMER_T14_RESET] =3D { .reg =3D  0x7c, .mask =3D BIT(2)  | =
BIT(3)  },
> +	[ZX297520V3_TIMER_T15_RESET] =3D { .reg =3D  0x74, .mask =3D BIT(10) | =
BIT(11) },
> +	[ZX297520V3_TIMER_T16_RESET] =3D { .reg =3D  0x7c, .mask =3D BIT(4)  | =
BIT(5)  },
> +	[ZX297520V3_TIMER_T17_RESET] =3D { .reg =3D 0x12c, .mask =3D BIT(0)  | =
BIT(1)  },
> +	[ZX297520V3_WDT_T18_RESET]   =3D { .reg =3D  0x74, .mask =3D BIT(12) | =
BIT(13) },
> +	[ZX297520V3_USIM1_RESET]     =3D { .reg =3D  0x74, .mask =3D BIT(14) | =
BIT(15) },
> +	[ZX297520V3_AHB_RESET]       =3D { .reg =3D  0x70, .mask =3D BIT(0)  | =
BIT(1)  },
> +
> +	/* USB reset. 0x84 returns the USB device status (0x1 for HSIC up, 0x2 =
for USB up, but
> +	 * all 3 bits (PCLK, WCLK, PHY) need to be deasserted for the device to=
 report ready.
> +	 * Thus polling the status is the responsibility of the USB PHY driver.
> +	 */
> +	[ZX297520V3_USB_PHY_RESET]   =3D { .reg =3D  0x80, .mask =3D BIT(3)    =
        },
> +	[ZX297520V3_USB_RESET]       =3D { .reg =3D  0x80, .mask =3D BIT(4) | B=
IT(5)   },
> +	[ZX297520V3_HSIC_PHY_RESET]  =3D { .reg =3D  0x80, .mask =3D BIT(0)    =
        },
> +	[ZX297520V3_HSIC_RESET]      =3D { .reg =3D  0x80, .mask =3D BIT(1) | B=
IT(2)   },
> +};
> +
> +static const struct zte_reset_data zx297520v3_topreset_data =3D {
> +	.resets =3D zx297520v3_top_resets,
> +	.num =3D ARRAY_SIZE(zx297520v3_top_resets),
> +};
> +
> +static const struct zte_reset_reg zx297520v3_matrix_resets[] =3D {
> +	[ZX297520V3_CPU_RESET]       =3D { .reg =3D  0x28, .mask =3D BIT(1)    =
        },
> +	[ZX297520V3_EDCP_RESET]      =3D { .reg =3D  0x68, .mask =3D BIT(0)    =
        },
> +	[ZX297520V3_SD0_RESET]       =3D { .reg =3D  0x58, .mask =3D BIT(1)    =
        },
> +	[ZX297520V3_SD1_RESET]       =3D { .reg =3D  0x58, .mask =3D BIT(0)    =
        },
> +	[ZX297520V3_NAND_RESET]      =3D { .reg =3D  0x58, .mask =3D BIT(4)    =
        },
> +	[ZX297520V3_PDCFG_RESET]     =3D { .reg =3D  0x94, .mask =3D BIT(20)   =
        },
> +	[ZX297520V3_SSC_RESET]       =3D { .reg =3D  0x94, .mask =3D BIT(24)   =
        },
> +	[ZX297520V3_GMAC_RESET]      =3D { .reg =3D 0x114, .mask =3D BIT(0)  | =
BIT(1)  },
> +	[ZX297520V3_VOU_RESET]       =3D { .reg =3D 0x16c, .mask =3D BIT(0)    =
        },
> +};
> +
> +static const struct zte_reset_data zx297520v3_matrixreset_data =3D {
> +	.resets =3D zx297520v3_matrix_resets,
> +	.num =3D ARRAY_SIZE(zx297520v3_matrix_resets),
> +};
> +
> +static const struct zte_reset_reg zx297520v3_lsp_resets[] =3D {
> +	[ZX297520V3_TIMER_L1_RESET]  =3D { .reg =3D 0x04,  .mask =3D BIT(8)  | =
BIT(9)  },
> +	[ZX297520V3_WDT_L2_RESET]    =3D { .reg =3D 0x08,  .mask =3D BIT(8)  | =
BIT(9)  },
> +	[ZX297520V3_WDT_L3_RESET]    =3D { .reg =3D 0x0c,  .mask =3D BIT(8)  | =
BIT(9)  },
> +	[ZX297520V3_PWM_RESET]       =3D { .reg =3D 0x10,  .mask =3D BIT(8)  | =
BIT(9)  },
> +	[ZX297520V3_I2S0_RESET]      =3D { .reg =3D 0x14,  .mask =3D BIT(8)  | =
BIT(9)  },
> +	/* 0x18: Not writeable */
> +	[ZX297520V3_I2S1_RESET]      =3D { .reg =3D 0x1c,  .mask =3D BIT(8)  | =
BIT(9)  },
> +	/* 0x20: Not writeable */
> +	[ZX297520V3_QSPI_RESET]      =3D { .reg =3D 0x24,  .mask =3D BIT(8)  | =
BIT(9)  },
> +	[ZX297520V3_UART1_RESET]     =3D { .reg =3D 0x28,  .mask =3D BIT(8)  | =
BIT(9)  },
> +	[ZX297520V3_I2C1_RESET]      =3D { .reg =3D 0x2c,  .mask =3D BIT(8)  | =
BIT(9)  },
> +	[ZX297520V3_SPI0_RESET]      =3D { .reg =3D 0x30,  .mask =3D BIT(8)  | =
BIT(9)  },
> +	[ZX297520V3_TIMER_LB_RESET]  =3D { .reg =3D 0x34,  .mask =3D BIT(8)  | =
BIT(9)  },
> +	[ZX297520V3_TIMER_LC_RESET]  =3D { .reg =3D 0x38,  .mask =3D BIT(8)  | =
BIT(9)  },
> +	[ZX297520V3_UART2_RESET]     =3D { .reg =3D 0x3c,  .mask =3D BIT(8)  | =
BIT(9)  },
> +	[ZX297520V3_WDT_LE_RESET]    =3D { .reg =3D 0x40,  .mask =3D BIT(8)  | =
BIT(9)  },
> +	[ZX297520V3_TIMER_LF_RESET]  =3D { .reg =3D 0x44,  .mask =3D BIT(8)  | =
BIT(9)  },
> +	[ZX297520V3_SPI1_RESET]      =3D { .reg =3D 0x48,  .mask =3D BIT(8)  | =
BIT(9)  },
> +	[ZX297520V3_TIMER_L11_RESET] =3D { .reg =3D 0x4c,  .mask =3D BIT(8)  | =
BIT(9)  },
> +	[ZX297520V3_TDM_RESET]       =3D { .reg =3D 0x50,  .mask =3D BIT(8)  | =
BIT(9)  },
> +};
> +
> +static const struct zte_reset_data zx297520v3_lspreset_data =3D {
> +	.resets =3D zx297520v3_lsp_resets,
> +	.num =3D ARRAY_SIZE(zx297520v3_lsp_resets),
> +};
> +
> +static int reset_zx297520v3_probe(struct platform_device *pdev)
> +{
> +	const struct platform_device_id *id =3D platform_get_device_id(pdev);
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *of_node =3D dev->parent->of_node;
> +	const struct zte_reset_data *data;
> +	struct zte_reset *rst;
> +
> +	if (!id)
> +		return -ENODEV;
> +	data =3D (const struct zte_reset_data *)id->driver_data;
> +
> +	rst =3D devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
> +	if (!rst)
> +		return -ENOMEM;
> +
> +	rst->resets =3D data->resets;
> +	rst->rcdev.owner =3D THIS_MODULE;
> +	rst->rcdev.nr_resets =3D data->num;
> +	rst->rcdev.ops =3D &zx29_rst_ops;
> +	rst->rcdev.of_node =3D of_node;
> +	rst->rcdev.dev =3D dev;
> +
> +	rst->map =3D device_node_to_regmap(of_node);
> +	if (IS_ERR(rst->map))
> +		return dev_err_probe(dev, PTR_ERR(rst->map), "Cannot get parent syscon=
 regmap\n");

Does your parent even have to be a syscon?

Could you just create the regmap in the MFD driver and use
dev_get_regmap(pdev->dev.parent, NULL) here?

> +
> +	return devm_reset_controller_register(dev, &rst->rcdev);
> +}
> +
> +static const struct platform_device_id reset_zx297520v3_ids[] =3D {
> +	{
> +		.name =3D "zx297520v3-topreset",
> +		.driver_data =3D (kernel_ulong_t)&zx297520v3_topreset_data,
> +	},
> +	{
> +		.name =3D "zx297520v3-matrixreset",
> +		.driver_data =3D (kernel_ulong_t)&zx297520v3_matrixreset_data,
> +	},
> +	{
> +		.name =3D "zx297520v3-lspreset",
> +		.driver_data =3D (kernel_ulong_t)&zx297520v3_lspreset_data,
> +	},
> +	{ }
> +};
MODULE_DEVICE_TABLE(platform, reset_zx297520v3_ids);

With that,


Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
