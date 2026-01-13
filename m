Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D75535BDBE
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 12:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768306027; cv=none; b=DGRkNDQpDeephINwFaw28i36A6GhIpodBOyZSUXJUUvK1EeeLe592Yk6/ekfV9cn3T3B2WxVF9+HZb/ZozAeQD+c2fbDK6yuJF44CL6kxvc0UpcjT0jRudIDH1hnYcsn6vIPHanc94YVRhuyFGaK/jrgSvUIatcO7BiSy3C8LG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768306027; c=relaxed/simple;
	bh=012aFC6eZ1elcVQiXrCoLRyLQ2amIqj/qKm0+JztLBY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RNWA6PdEr7h23Yw4jOhKP5JM+4kjfHTNbO12UXa+WE6vAoxubpa2PSP03y4dyt7Ap1z2Oy+R7P91FiAvTI2oT7k0/FwZZYNdm+luP+X3Rm3SRq7RGDVMb6yUjvXeD1JOleS4wu3sxvJ1imQDsdEgnSzMFGA798iHzoONIu5p35k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vfdAj-000705-LC; Tue, 13 Jan 2026 13:06:53 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vfdAk-000Pwc-0B;
	Tue, 13 Jan 2026 13:06:53 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vfdAj-000000006Nj-1I6b;
	Tue, 13 Jan 2026 13:06:53 +0100
Message-ID: <07ba7a3a4325f927fa1db3b0f0af124ea9cd2ee4.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/9] clk: realtek: Add basic reset support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yu-Chun Lin <eleanor.lin@realtek.com>, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 	cylee12@realtek.com, jyanchou@realtek.com
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, james.tai@realtek.com, cy.huang@realtek.com, 
	stanley_chang@realtek.com
Date: Tue, 13 Jan 2026 13:06:53 +0100
In-Reply-To: <20260113112333.821-3-eleanor.lin@realtek.com>
References: <20260113112333.821-1-eleanor.lin@realtek.com>
	 <20260113112333.821-3-eleanor.lin@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

On Di, 2026-01-13 at 19:23 +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
>=20
> Define the reset operations backed by a regmap-based register
> interface and prepare the reset controller to be registered
> through the reset framework.
>=20
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v2:
> - Added missing Co-developed-by tag.
> - Added missing maintainer entry for driver/clk.
> - Removed explicit of_xlate/of_reset_n_cells assignment as it matches def=
aults.
> - Added error handling for rtk_reset_read() return value
> ---
>  MAINTAINERS                  |   1 +
>  drivers/clk/Kconfig          |   1 +
>  drivers/clk/Makefile         |   1 +
>  drivers/clk/realtek/Kconfig  |  28 ++++++++
>  drivers/clk/realtek/Makefile |   4 ++
>  drivers/clk/realtek/reset.c  | 125 +++++++++++++++++++++++++++++++++++
>  drivers/clk/realtek/reset.h  |  36 ++++++++++
>  7 files changed, 196 insertions(+)
>  create mode 100644 drivers/clk/realtek/Kconfig
>  create mode 100644 drivers/clk/realtek/Makefile
>  create mode 100644 drivers/clk/realtek/reset.c
>  create mode 100644 drivers/clk/realtek/reset.h
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 66c0f4924c1e..de772e0026de 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21975,6 +21975,7 @@ L:	devicetree@vger.kernel.org
>  L:	linux-clk@vger.kernel.org
>  S:	Supported
>  F:	Documentation/devicetree/bindings/clock/realtek*
> +F:	drivers/clk/realtek/*
>  F:	include/dt-bindings/clock/realtek*
> =20
>  REALTEK SPI-NAND
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 3a1611008e48..2f2cacf87c38 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -530,6 +530,7 @@ source "drivers/clk/nuvoton/Kconfig"
>  source "drivers/clk/pistachio/Kconfig"
>  source "drivers/clk/qcom/Kconfig"
>  source "drivers/clk/ralink/Kconfig"
> +source "drivers/clk/realtek/Kconfig"
>  source "drivers/clk/renesas/Kconfig"
>  source "drivers/clk/rockchip/Kconfig"
>  source "drivers/clk/samsung/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 61ec08404442..075a1c410b90 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -141,6 +141,7 @@ obj-$(CONFIG_COMMON_CLK_PISTACHIO)	+=3D pistachio/
>  obj-$(CONFIG_COMMON_CLK_PXA)		+=3D pxa/
>  obj-$(CONFIG_COMMON_CLK_QCOM)		+=3D qcom/
>  obj-y					+=3D ralink/
> +obj-$(CONFIG_COMMON_CLK_REALTEK)	+=3D realtek/
>  obj-y					+=3D renesas/
>  obj-$(CONFIG_ARCH_ROCKCHIP)		+=3D rockchip/
>  obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+=3D samsung/
> diff --git a/drivers/clk/realtek/Kconfig b/drivers/clk/realtek/Kconfig
> new file mode 100644
> index 000000000000..121158f11dd1
> --- /dev/null
> +++ b/drivers/clk/realtek/Kconfig
> @@ -0,0 +1,28 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config COMMON_CLK_REALTEK
> +	bool "Clock driver for Realtek SoCs"
> +	depends on ARCH_REALTEK || COMPILE_TEST
> +	select MFD_SYSCON
> +	default y
> +	help
> +	  Enable the common clock framework infrastructure for Realtek
> +	  system-on-chip platforms.
> +
> +	  This provides the base support required by individual Realtek
> +	  clock controller drivers to expose clocks to peripheral devices.
> +
> +	  If you have a Realtek-based platform, say Y.
> +
> +if COMMON_CLK_REALTEK
> +
> +config RTK_CLK_COMMON
> +	tristate "Realtek Clock Common"
> +	select RESET_CONTROLLER
> +	help
> +	  Common helper code shared by Realtek clock controller drivers.
> +
> +	  This provides utility functions and data structures used by
> +	  multiple Realtek clock implementations, and include integration
> +	  with reset controllers where required.
> +
> +endif
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> new file mode 100644
> index 000000000000..52267de2eef4
> --- /dev/null
> +++ b/drivers/clk/realtek/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_RTK_CLK_COMMON) +=3D clk-rtk.o
> +
> +clk-rtk-y +=3D reset.o
> diff --git a/drivers/clk/realtek/reset.c b/drivers/clk/realtek/reset.c
> new file mode 100644
> index 000000000000..0ba0d46811d4
> --- /dev/null
> +++ b/drivers/clk/realtek/reset.c
> @@ -0,0 +1,125 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2019 Realtek Semiconductor Corporation
> + */
> +
> +#include <linux/of.h>
> +#include <linux/device.h>
> +#include "reset.h"
> +
> +#define RTK_RESET_BANK_SHIFT         8
> +#define RTK_RESET_ID_MASK            0xff

Why are there 256 possible ids per bank? Each bank is only a 32-bit
register, containing 32 (or in the case of write_en) 16 reset controls.

> +#define to_rtk_reset_controller(r) container_of(r, struct rtk_reset_data=
, rcdev)

Please make this an inline function.

> +static inline struct rtk_reset_bank *
> +rtk_reset_get_bank(struct rtk_reset_data *data, unsigned long idx)
> +{
> +	int bank_id =3D idx >> RTK_RESET_BANK_SHIFT;
> +
> +	return &data->banks[bank_id];
> +}
> +
> +static inline int rtk_reset_get_id(struct rtk_reset_data *data,
> +				   unsigned long idx)
> +{
> +	return idx & RTK_RESET_ID_MASK;
> +}
> +
> +static int rtk_reset_update_bits(struct rtk_reset_data *data, u32 offset=
,
> +				 u32 mask, u32 val)
> +{
> +	int ret;
> +
> +	ret =3D regmap_update_bits(data->regmap, offset, mask, val);
> +	return ret;
> +}
> +
> +static int rtk_reset_read(struct rtk_reset_data *data, u32 offset, u32 *=
val)
> +{
> +	int ret;
> +
> +	ret =3D regmap_read(data->regmap, offset, val);
> +	return ret;
> +}

The local variable ret is superfluous. And why not use
regmap_read/update_bits() directly below?

> +
> +static int rtk_reset_assert(struct reset_controller_dev *rcdev,
> +			    unsigned long idx)
> +{
> +	struct rtk_reset_data *data =3D to_rtk_reset_controller(rcdev);
> +	struct rtk_reset_bank *bank =3D rtk_reset_get_bank(data, idx);
> +	u32 id =3D rtk_reset_get_id(data, idx);
> +	u32 mask =3D bank->write_en ? (0x3 << id) : BIT(id);
> +	u32 val =3D bank->write_en ? (0x2 << id) : 0;

I'd use UL(0x3) / UL(0x2) to avoid UB when compiling for 32-bit.

Only even ids are allowed for banks with write_en set?

> +
> +	return rtk_reset_update_bits(data, bank->ofs, mask, val);
> +}
> +
> +static int rtk_reset_deassert(struct reset_controller_dev *rcdev,
> +			      unsigned long idx)
> +{
> +	struct rtk_reset_data *data =3D to_rtk_reset_controller(rcdev);
> +	struct rtk_reset_bank *bank =3D rtk_reset_get_bank(data, idx);
> +	u32 id =3D rtk_reset_get_id(data, idx);
> +	u32 mask =3D bank->write_en ? (0x3 << id) : BIT(id);
> +	u32 val =3D mask;
> +
> +	return rtk_reset_update_bits(data, bank->ofs, mask, val);
> +}
> +
> +static int rtk_reset_reset(struct reset_controller_dev *rcdev,
> +			   unsigned long idx)
> +{
> +	int ret;
> +
> +	ret =3D rtk_reset_assert(rcdev, idx);
> +	if (ret)
> +		return ret;
> +	return rtk_reset_deassert(rcdev, idx);
> +}
> +
> +static int rtk_reset_status(struct reset_controller_dev *rcdev,
> +			    unsigned long idx)
> +{
> +	struct rtk_reset_data *data =3D to_rtk_reset_controller(rcdev);
> +	struct rtk_reset_bank *bank =3D &data->banks[idx >> RTK_RESET_BANK_SHIF=
T];
> +	u32 id =3D idx & RTK_RESET_ID_MASK;
> +	u32 val;
> +	int ret;
> +
> +	ret =3D rtk_reset_read(data, bank->ofs, &val);
> +	if (ret)
> +		return ret;
> +
> +	return !((val >> id) & 1);
> +}
> +
> +static const struct reset_control_ops rtk_reset_ops =3D {
> +	.reset    =3D rtk_reset_reset,
> +	.assert   =3D rtk_reset_assert,
> +	.deassert =3D rtk_reset_deassert,
> +	.status   =3D rtk_reset_status,
> +};
> +
> +int rtk_reset_controller_add(struct device *dev,
> +			     struct rtk_reset_initdata *initdata)
> +{
> +	struct rtk_reset_data *data;
> +
> +	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->dev =3D dev;
> +	data->num_banks =3D initdata->num_banks;
> +	data->banks =3D initdata->banks;
> +	data->regmap =3D initdata->regmap;
> +	data->rcdev.owner =3D THIS_MODULE;
> +	data->rcdev.ops =3D &rtk_reset_ops;
> +	data->rcdev.dev =3D dev;
> +	data->rcdev.of_node =3D dev->of_node;
> +	data->rcdev.nr_resets =3D initdata->num_banks * 0x100;

This is misleading. Surely there's not num_banks * 256 resets, since
each bank can only carry 16 or 32 resets. It'd probably better to not
use nr_resets at all and implement your own of_xlate.


regards
Philipp
