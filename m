Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680823859E2
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 10:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773140282; cv=none; b=YLpx5nMQ7adZUve2CiomCrtbMINgej++oweEUu/sVhNplXx1W1dxRWl81DI1RCVbyuTYd1TjlLrpNc+5FP6bnfbfY5NE7egn/UpuG1gZNo08Fv1wkVNbyNZbmg95QoNEdY0dFVLYMf9WpRIX+c1764LidKSpCAeyG9/kgbIRZtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773140282; c=relaxed/simple;
	bh=dOKnRIfBKEzvn5a8zO3WbQbn+dEBPERW/b8Vjykyc9w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=soaa4MXooFXk6o6Mx2zTot/SbfvRrqvTHKrhG2MudMm1vcFNgGfKjjPtM7wjzzZTpqcbTAIe3SvT0IStJvTVxVf7YUt+fFQ5F/tPVA8XBuBRMWKlcgqzL5DfCNH/XHQTG0pZquN42glxzxnBl0Gckll845sAlrxrKrwjNPzZX70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzumd-0004bZ-NW; Tue, 10 Mar 2026 11:57:51 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzumb-004gPK-39;
	Tue, 10 Mar 2026 11:57:51 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzumd-000000005e4-0zIB;
	Tue, 10 Mar 2026 11:57:51 +0100
Message-ID: <c9e71072faea57cff1ef51cbf85121654c74a3aa.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/9] clk: realtek: Add basic reset support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yu-Chun Lin <eleanor.lin@realtek.com>, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 	cylee12@realtek.com, jyanchou@realtek.com
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, james.tai@realtek.com, cy.huang@realtek.com, 
	stanley_chang@realtek.com
Date: Tue, 10 Mar 2026 11:57:51 +0100
In-Reply-To: <20260122110857.12995-3-eleanor.lin@realtek.com>
References: <20260122110857.12995-1-eleanor.lin@realtek.com>
	 <20260122110857.12995-3-eleanor.lin@realtek.com>
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

On Do, 2026-01-22 at 19:08 +0800, Yu-Chun Lin wrote:
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
> Changes in v3:
> - Reduced the number of IDs per bank from 256 to 32, eliminating unnecess=
ary
> gaps.
> - Converted macro to static inline function.
> - Removed redundant functions.
> - Used UL() to prevent undefined behavior.
> ---
>  MAINTAINERS                  |   1 +
>  drivers/clk/Kconfig          |   1 +
>  drivers/clk/Makefile         |   1 +
>  drivers/clk/realtek/Kconfig  |  28 +++++++++
>  drivers/clk/realtek/Makefile |   4 ++
>  drivers/clk/realtek/reset.c  | 111 +++++++++++++++++++++++++++++++++++
>  drivers/clk/realtek/reset.h  |  36 +++++++++++
>  7 files changed, 183 insertions(+)
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
> index 000000000000..4d60a73fc335
> --- /dev/null
> +++ b/drivers/clk/realtek/reset.c
> @@ -0,0 +1,111 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2019 Realtek Semiconductor Corporation
> + */
> +
> +#include <linux/of.h>
> +#include <linux/device.h>
> +#include "reset.h"
> +
> +#define RTK_RESET_BANK_SHIFT 5
> +#define RTK_RESET_ID_MASK    0x1f
> +
> +static inline struct rtk_reset_data *to_rtk_reset_controller(struct rese=
t_controller_dev *r)
> +{
> +	return container_of(r, struct rtk_reset_data, rcdev);
> +}
> +
> +static inline struct rtk_reset_bank *
> +rtk_reset_get_bank(struct rtk_reset_data *data, unsigned long idx)
> +{
> +	int bank_id =3D idx >> RTK_RESET_BANK_SHIFT;
> +
> +	return &data->banks[bank_id];
> +}
> +
> +static inline int rtk_reset_get_id(struct rtk_reset_data *data,

Data is unused.

> +				   unsigned long idx)
> +{
> +	return idx & RTK_RESET_ID_MASK;
> +}
> +
> +static int rtk_reset_assert(struct reset_controller_dev *rcdev,
> +			    unsigned long idx)
> +{
> +	struct rtk_reset_data *data =3D to_rtk_reset_controller(rcdev);
> +	struct rtk_reset_bank *bank =3D rtk_reset_get_bank(data, idx);
> +	u32 id =3D rtk_reset_get_id(data, idx);

Data not used in rtk_reset_get_id().

> +	u32 mask =3D bank->write_en ? (UL(0x3) << id) : BIT(id);
> +	u32 val =3D bank->write_en ? (UL(0x2) << id) : 0;
> +
> +	return regmap_update_bits(data->regmap, bank->ofs, mask, val);
> +}
> +
> +static int rtk_reset_deassert(struct reset_controller_dev *rcdev,
> +			      unsigned long idx)
> +{
> +	struct rtk_reset_data *data =3D to_rtk_reset_controller(rcdev);
> +	struct rtk_reset_bank *bank =3D rtk_reset_get_bank(data, idx);
> +	u32 id =3D rtk_reset_get_id(data, idx);

Same as above.

> +	u32 mask =3D bank->write_en ? (0x3 << id) : BIT(id);
> +	u32 val =3D mask;
> +
> +	return regmap_update_bits(data->regmap, bank->ofs, mask, val);
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

Are there any users of this? Does this work for all consumers, without
any delay between assert and deassert? Don't just implement the .reset
callback for the sake of it.

> +
> +static int rtk_reset_status(struct reset_controller_dev *rcdev,
> +			    unsigned long idx)
> +{
> +	struct rtk_reset_data *data =3D to_rtk_reset_controller(rcdev);
> +	struct rtk_reset_bank *bank =3D &data->banks[idx >> RTK_RESET_BANK_SHIF=
T];
> +	u32 id =3D idx & RTK_RESET_ID_MASK;

	u32 id =3D rtk_reset_get_id(idx);

> +	u32 val;
> +	int ret;
> +
> +	ret =3D regmap_read(data->regmap, bank->ofs, &val);
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

data->dev is unused.

> +	data->num_banks =3D initdata->num_banks;

data->num_banks is unused.

> +	data->banks =3D initdata->banks;
> +	data->regmap =3D initdata->regmap;
> +	data->rcdev.owner =3D THIS_MODULE;
> +	data->rcdev.ops =3D &rtk_reset_ops;
> +	data->rcdev.dev =3D dev;
> +	data->rcdev.of_node =3D dev->of_node;
> +	data->rcdev.nr_resets =3D initdata->num_banks * 32;
> +
> +	return devm_reset_controller_register(dev, &data->rcdev);
> +}
> +EXPORT_SYMBOL_GPL(rtk_reset_controller_add);
> diff --git a/drivers/clk/realtek/reset.h b/drivers/clk/realtek/reset.h
> new file mode 100644
> index 000000000000..cd446b098429
> --- /dev/null
> +++ b/drivers/clk/realtek/reset.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2019 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#ifndef __CLK_REALTEK_RESET_H
> +#define __CLK_REALTEK_RESET_H
> +
> +#include <linux/regmap.h>

Instead of including regmap.h, you can forward declare struct regmap.

> +#include <linux/reset-controller.h>
> +#include <linux/hwspinlock.h>

Unused header.

> +
> +struct rtk_reset_bank {
> +	u32 ofs;
> +	u32 write_en;
> +};
> +
> +struct rtk_reset_data {
> +	struct device *dev;
> +	struct reset_controller_dev rcdev;
> +	struct rtk_reset_bank *banks;
> +	u32 num_banks;
> +	struct regmap *regmap;
> +};

Why is rtk_reset_data in the header? You can move it into reset.c.

> +
> +struct rtk_reset_initdata {
> +	struct rtk_reset_bank *banks;
> +	u32 num_banks;
> +	struct regmap *regmap;
> +};
> +
> +int rtk_reset_controller_add(struct device *dev,
> +			     struct rtk_reset_initdata *initdata);
> +
> +#endif /* __CLK_REALTEK_RESET_H */

regards
Philipp
