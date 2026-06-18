Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DC83D9DC5;
	Thu, 18 Jun 2026 09:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781774675; cv=none; b=BSop+V6sEym9eehqMzExcYuRb10TXDiPqpOvc7/DesoAUNlr+b3HVC/0WzM5bpsKyo9O7MKnFkzklkdOC8qk+M9l4pN8zLmHWGw6apm3j2iza8wdTcmxOM7d9p61dxJkbRo6zXbiEcoz9vZbTHScYLmQCOJHA+Na7UklXw4Dmlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781774675; c=relaxed/simple;
	bh=sw7Hy59oOVhnVGUeKozK34lfggB6eTw8VANbz/eoxgI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qea+5kFJNbkLVPnEAJ/0XKJeXLr9/z4R9OpcgdJUfCsj54b9oJnG2TpLCaMA6dQEoBd+19C9huvO86n3bsfWrmyGviwskxVhRUhEWpo/fCui0kfF9Ox0409wv9Bi4CG7wkDYAY+qEVmeRIG+PECZ102mDcwJJ0dTbKXaz92e0vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C2CBA2002AA;
	Thu, 18 Jun 2026 11:24:26 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wa8z4-003Plt-2I;
	Thu, 18 Jun 2026 11:24:26 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wa8z4-000000004i0-2ZQF;
	Thu, 18 Jun 2026 11:24:26 +0200
Message-ID: <90c4f50eb23dec06497d46f9c0f522a6b90a918b.camel@pengutronix.de>
Subject: Re: [PATCH RFC v4 10/12] reset: zte: Add a zx297520v3 reset driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stefan =?ISO-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>,  Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Brian Masney	 <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Thu, 18 Jun 2026 11:24:26 +0200
In-Reply-To: <20260616-zx29clk-v4-10-ca994bd22e9d@gmail.com>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
	 <20260616-zx29clk-v4-10-ca994bd22e9d@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Di, 2026-06-16 at 23:26 +0300, Stefan D=C3=B6singer wrote:
> This drives the auxiliary devices created by the clock driver.

Which auxiliary devices? Which clock driver?

> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
> ---
>  MAINTAINERS                          |   1 +
>  drivers/reset/Kconfig                |  11 ++
>  drivers/reset/Makefile               |   1 +
>  drivers/reset/reset-zte-zx297520v3.c | 224 +++++++++++++++++++++++++++++=
++++++
>  4 files changed, 237 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f1f0459b2c72..55bf0290343a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3871,6 +3871,7 @@ F:	Documentation/devicetree/zte,zx297520v3-*
>  F:	arch/arm/boot/dts/zte/
>  F:	arch/arm/mach-zte/
>  F:	drivers/clk/zte/
> +F:	drivers/reset/reset-zte-zx297520v3.c
>  F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
> =20
>  ARM/ZYNQ ARCHITECTURE
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index d009eb0849a3..116dd23f1b8e 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -404,6 +404,17 @@ config RESET_UNIPHIER_GLUE
>  	  on UniPhier SoCs. Say Y if you want to control reset signals
>  	  provided by the glue layer.
> =20
> +config RESET_ZTE_ZX297520V3
> +	tristate "ZTE zx297520v3 Reset Driver"
> +	depends on (ARCH_ZTE || COMPILE_TEST)
> +	default CLK_ZTE_ZX297520V3
> +	select AUXILIARY_BUS
> +	help
> +	  This enables the reset controller for ZTE zx297520v3 SoCs. The reset
> +	  controller is part of the clock controller on this SoC. This driver
> +	  operates on an auxiliary device exposed by the clock driver. Enable
> +	  this driver if you plan to boot the kernel on a zx297520v3 based SoC.
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
> index 000000000000..2022f4df2ebd
> --- /dev/null
> +++ b/drivers/reset/reset-zte-zx297520v3.c
> @@ -0,0 +1,224 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Stefan D=C3=B6singer
> + */
> +#include <dt-bindings/clock/zte,zx297520v3-clk.h>
> +#include <linux/reset-controller.h>
> +#include <linux/platform_device.h>

What is this used for?

> +#include <linux/auxiliary_bus.h>
> +#include <linux/clk-provider.h>

What is this used for?

> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
> +#include <linux/iopoll.h>
> +#include <linux/delay.h>
> +
> +struct zte_reset_reg {
> +	u32 mask, wait_mask;
> +	u16 reg;
> +};
> +
> +struct zte_reset_info {
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
> +	int res;
> +	u32 val;
> +
> +	res =3D regmap_set_bits(rst->map, rst->resets[id].reg, rst->resets[id].=
mask);
> +	if (res)
> +		return res;
> +
> +	/* This is a special case used only by USB reset */
> +	if (rst->resets[id].wait_mask) {
> +		return regmap_read_poll_timeout(rst->map, rst->resets[id].reg + 4, val=
,
> +						val & rst->resets[id].wait_mask, 1, 100);
> +	}
> +
> +	return 0;
> +}
> +
> +static int zx29_rst_status(struct reset_controller_dev *rcdev, unsigned =
long id)
> +{
> +	struct zte_reset *rst =3D to_zte_reset(rcdev);
> +	int res;
> +
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
> +	 * coprocessor. Clocks for it are in matrixclk.
> +	 */
> +	[ZX297520V3_ZSP_RESET]       =3D { .reg =3D 0x13c, .mask =3D BIT(0)    =
        },
> +
> +	[ZX297520V3_UART0_RESET]     =3D { .reg =3D 0x78,  .mask =3D BIT(6)  | =
BIT(7)  },

Is this a single reset line controlled by two bits (do you know what
they are)? Or might these actually be two different reset controls that
are just always set together?

> +	[ZX297520V3_I2C0_RESET]      =3D { .reg =3D 0x74,  .mask =3D BIT(8)  | =
BIT(9)  },
> +	[ZX297520V3_RTC_RESET]       =3D { .reg =3D 0x74,  .mask =3D BIT(4)  | =
BIT(5)  },
> +	[ZX297520V3_TIMER_T08_RESET] =3D { .reg =3D 0x78,  .mask =3D BIT(4)  | =
BIT(5)  },
> +	[ZX297520V3_TIMER_T09_RESET] =3D { .reg =3D 0x78,  .mask =3D BIT(2)  | =
BIT(3)  },
> +	[ZX297520V3_PMM_RESET]       =3D { .reg =3D 0x74,  .mask =3D BIT(0)  | =
BIT(1)  },
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
> +	/* USB reset. This is slightly special because it needs to wait for a r=
eady bit after
> +	 * deasserting.
> +	 */
> +	[ZX297520V3_USB_RESET]      =3D  { .reg =3D 0x80,   .mask =3D BIT(3) | =
BIT(4) | BIT(5),
> +		.wait_mask =3D BIT(1)},

Same as above, are these actually three separate reset lines?

> +	[ZX297520V3_HSIC_RESET]      =3D { .reg =3D 0x80,   .mask =3D BIT(0) | =
BIT(1) | BIT(2),
> +		.wait_mask =3D BIT(0)},
> +};
> +
> +static const struct zte_reset_info zx297520v3_top_info =3D {
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
> +static const struct zte_reset_info zx297520v3_matrix_info =3D {
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
> +static const struct zte_reset_info zx297520v3_lsp_info =3D {
> +	.resets =3D zx297520v3_lsp_resets,
> +	.num =3D ARRAY_SIZE(zx297520v3_lsp_resets),
> +};
> +
> +static int reset_zx297520v3_probe(struct auxiliary_device *adev,
> +				  const struct auxiliary_device_id *id)
> +{
> +	const struct zte_reset_info *drv_info;
> +	struct device *dev =3D &adev->dev;
> +	struct zte_reset *rst;
> +
> +	drv_info =3D (struct zte_reset_info *)id->driver_data;
> +
> +	rst =3D devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
> +	if (!rst)
> +		return -ENOMEM;
> +
> +	rst->resets =3D drv_info->resets;
> +	rst->rcdev.owner =3D THIS_MODULE;
> +	rst->rcdev.nr_resets =3D drv_info->num;
> +	rst->rcdev.ops =3D &zx29_rst_ops;
> +	rst->rcdev.of_node =3D dev->of_node;
> +	rst->rcdev.dev =3D dev;
> +	rst->rcdev.of_reset_n_cells =3D 1;

No need to set of_reset_n_cells if of_xlate is not set. Here
reset_controller_register will use fwnode_n_cells and set it to 1
anyway.

> +
> +	rst->map =3D device_node_to_regmap(dev->of_node);
> +	if (IS_ERR(rst->map))
> +		return dev_err_probe(rdev, PTR_ERR(rst->map), "Cannot get parent sysco=
n regmap\n");
> +
> +	return devm_reset_controller_register(dev, &rst->rcdev);
> +}
> +
> +static const struct auxiliary_device_id reset_zx297520v3_ids[] =3D {
> +	{
> +		.name =3D "clk_zte.zx297520v3_toprst",
> +		.driver_data =3D (kernel_ulong_t)&zx297520v3_top_info,
> +	},
> +	{
> +		.name =3D "clk_zte.zx297520v3_matrixrst",
> +		.driver_data =3D (kernel_ulong_t)&zx297520v3_matrix_info,
> +	},
> +	{
> +		.name =3D "clk_zte.zx297520v3_lsprst",
> +		.driver_data =3D (kernel_ulong_t)&zx297520v3_lsp_info,
> +	},
> +	{ },
> +};
> +

Drop this empty line.

> +MODULE_DEVICE_TABLE(auxiliary, reset_zx297520v3_ids);
> +
> +static struct auxiliary_driver reset_zx297520v3_drv =3D {
> +	.name =3D "zx297520v3_reset",
> +	.id_table =3D reset_zx297520v3_ids,
> +	.probe =3D reset_zx297520v3_probe,
> +};
> +

Drop this empty line.

> +module_auxiliary_driver(reset_zx297520v3_drv);
> +
> +MODULE_AUTHOR("Stefan D=C3=B6singer <stefandoesinger@gmail.com>");
> +MODULE_DESCRIPTION("ZTE zx297520v3 reset driver");
> +MODULE_LICENSE("GPL");

regards
Philipp
