Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5B735CBCB
	for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 16:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776960598; cv=none; b=kKm0mlB5jQrSDTGYJHssgrHTIxbu+z3B23dqJNDlkvR3OexKl2uoH2I0QPMCdc4kRloKczamzDALXgFaQNeOxHWxYg95Ql4R1oaVbv2IelOFWTx0ZRB5I6lwRZlMMrmK//Q9IBfZh3fJeAVUfK7gpGfwLXR266bwW6W3k99YNrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776960598; c=relaxed/simple;
	bh=QR2FBrQ7+O1/AjKHDPRgUEXZFnVLrbPdh8YK/Bk1VoY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eCDsfoRDgf1yGB0VoFhJPsMyN5Lfua8tCvhUkbjPy9lYyNrLSaN84qPG6MBxGQp13S0F2DAPCxnZ0yQ3FcAK8cKyygvoRCSC5YRTzFqauDf+cuGYhacmVJUALabHeXFKscWSuPiQXBujXr00O0zzaB3QxnB35a5W4s2b5N3CbEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wFwcS-0005mU-0N; Thu, 23 Apr 2026 18:09:36 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wFwcQ-006r1f-23;
	Thu, 23 Apr 2026 18:09:34 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wFwcQ-00000000Epg-2IBb;
	Thu, 23 Apr 2026 18:09:34 +0200
Message-ID: <60dfdfbd334fcc26344a1648cdc811543b5fc84b.camel@pengutronix.de>
Subject: Re: [PATCH v3 3/3] reset: eswin: Add eic7700 HSP reset driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dongxuyang@eswincomputing.com, mturquette@baylibre.com,
 sboyd@kernel.org, 	robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 huangyifeng@eswincomputing.com, 	benoit.monin@bootlin.com,
 bmasney@redhat.com
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com, 
	pinkesh.vaghela@einfochips.com
Date: Thu, 23 Apr 2026 18:09:34 +0200
In-Reply-To: <20260423091256.2542-1-dongxuyang@eswincomputing.com>
References: <20260423090904.2108-1-dongxuyang@eswincomputing.com>
	 <20260423091256.2542-1-dongxuyang@eswincomputing.com>
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

On Do, 2026-04-23 at 17:12 +0800, dongxuyang@eswincomputing.com wrote:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
>=20
> Add auxiliary driver to support ESWIN EIC7700 high-speed peripherals
> system. The reset controller is created using the auxiliary device
> framework and set up in the clock driver.
>=20
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
> ---
>  drivers/reset/Kconfig             |  11 +++
>  drivers/reset/Makefile            |   1 +
>  drivers/reset/reset-eic7700-hsp.c | 118 ++++++++++++++++++++++++++++++
>  3 files changed, 130 insertions(+)
>  create mode 100644 drivers/reset/reset-eic7700-hsp.c
>=20
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index d009eb0849a3..f63e89ed6a4e 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -83,6 +83,17 @@ config RESET_EIC7700
>  	  The driver supports eic7700 series chips and provides functionality f=
or
>  	  asserting and deasserting resets on the chip.
> =20
> +config RESET_EIC7700_HSP
> +	tristate "EIC7700 HSP Reset controller"
> +	depends on ARCH_ESWIN || COMPILE_TEST
> +	select AUXILIARY_BUS
> +	help
> +	  This enables the HSP reset controller driver for ESWIN SoCs. This
> +	  driver is specific to ESWIN SoCs and should only be enabled if using
> +	  such hardware.
> +	  The driver supports EIC7700 series chips and provides functionality
> +	  for asserting and deasserting resets on the chip.
> +
>  config RESET_EYEQ
>  	bool "Mobileye EyeQ reset controller"
>  	depends on EYEQ || COMPILE_TEST
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 3e52569bd276..a75af831ef58 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -15,6 +15,7 @@ obj-$(CONFIG_RESET_BERLIN) +=3D reset-berlin.o
>  obj-$(CONFIG_RESET_BRCMSTB) +=3D reset-brcmstb.o
>  obj-$(CONFIG_RESET_BRCMSTB_RESCAL) +=3D reset-brcmstb-rescal.o
>  obj-$(CONFIG_RESET_EIC7700) +=3D reset-eic7700.o
> +obj-$(CONFIG_RESET_EIC7700_HSP) +=3D reset-eic7700-hsp.o
>  obj-$(CONFIG_RESET_EYEQ) +=3D reset-eyeq.o
>  obj-$(CONFIG_RESET_GPIO) +=3D reset-gpio.o
>  obj-$(CONFIG_RESET_HSDK) +=3D reset-hsdk.o
> diff --git a/drivers/reset/reset-eic7700-hsp.c b/drivers/reset/reset-eic7=
700-hsp.c
> new file mode 100644
> index 000000000000..dde1f9bffa61
> --- /dev/null
> +++ b/drivers/reset/reset-eic7700-hsp.c
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2026, Beijing ESWIN Computing Technology Co., Ltd..
> + * All rights reserved.
> + *
> + * ESWIN EIC7700 HSP Reset Driver
> + *
> + * Authors: Xuyang Dong <dongxuyang@eswincomputing.com>
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>
> +
> +#include <dt-bindings/reset/eswin,eic7700-hspcrg.h>
> +
> +/**
> + * struct eic7700_hsp_reset_data - reset controller information structur=
e
> + * @rcdev: reset controller entity
> + * @regmap: regmap handle containing the memory-mapped reset registers
> + */
> +struct eic7700_hsp_reset_data {
> +	struct reset_controller_dev rcdev;
> +	struct regmap *regmap;
> +};
> +
> +struct eic7700_hsp_reg {
> +	u32 reg;
> +	u32 bit;
> +	bool active_low;
> +};
> +
> +static inline struct eic7700_hsp_reset_data *
> +to_eic7700_hsp_reset(struct reset_controller_dev *rcdev)
> +{
> +	return container_of(rcdev, struct eic7700_hsp_reset_data, rcdev);
> +}
> +
> +static const struct eic7700_hsp_reg eic7700_hsp_reset[] =3D {
> +	[EIC7700_HSP_RST_SATA_P0]	=3D {0x340, BIT(0), false},
> +	[EIC7700_HSP_RST_SATA_PHY]	=3D {0x340, BIT(1), false},
> +	[EIC7700_HSP_RST_USB0]		=3D {0x800, BIT(24), true},
> +	[EIC7700_HSP_RST_USB1]		=3D {0x900, BIT(24), true},
> +	[EIC7700_HSP_RST_USB0_PHY]	=3D {0x800, BIT(25), false},
> +	[EIC7700_HSP_RST_USB1_PHY]	=3D {0x900, BIT(25), false},
> +};
> +
> +static int eic7700_hsp_reset_assert(struct reset_controller_dev *rcdev,
> +				    unsigned long id)
> +{
> +	struct eic7700_hsp_reset_data *data =3D to_eic7700_hsp_reset(rcdev);
> +	int ret;
> +
> +	ret =3D regmap_assign_bits(data->regmap, eic7700_hsp_reset[id].reg,
> +				 eic7700_hsp_reset[id].bit,
> +				 !eic7700_hsp_reset[id].active_low);
> +
> +	return ret;

You can drop the temporary variable, just return
regmap_assign_bits(...) directly.

> +}
> +
> +static int eic7700_hsp_reset_deassert(struct reset_controller_dev *rcdev=
,
> +				      unsigned long id)
> +{
> +	struct eic7700_hsp_reset_data *data =3D to_eic7700_hsp_reset(rcdev);
> +	int ret;
> +
> +	ret =3D regmap_assign_bits(data->regmap, eic7700_hsp_reset[id].reg,
> +				 eic7700_hsp_reset[id].bit,
> +				 eic7700_hsp_reset[id].active_low);
> +
> +	return ret;
> +}
> +
> +static const struct reset_control_ops eic7700_hsp_reset_ops =3D {
> +	.assert =3D eic7700_hsp_reset_assert,
> +	.deassert =3D eic7700_hsp_reset_deassert,
> +};
> +
> +static int eic7700_hsp_reset_probe(struct auxiliary_device *adev,
> +				   const struct auxiliary_device_id *id)
> +{
> +	struct eic7700_hsp_reset_data *data;
> +	struct device *dev =3D &adev->dev;
> +
> +	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->regmap =3D dev_get_regmap(dev->parent, NULL);
> +	if (!data->regmap)
> +		return dev_err_probe(dev, -EINVAL, "failed to get regmap!\n");

-ENODEV seems to be more commonly used for this.

> +
> +	data->rcdev.owner =3D THIS_MODULE;
> +	data->rcdev.ops =3D &eic7700_hsp_reset_ops;
> +	data->rcdev.of_node =3D dev->parent->of_node;
> +	data->rcdev.dev =3D dev;
> +	data->rcdev.nr_resets =3D ARRAY_SIZE(eic7700_hsp_reset);
> +
> +	return devm_reset_controller_register(dev, &data->rcdev);
> +}
> +
> +static const struct auxiliary_device_id eic7700_hsp_reset_dt_ids[] =3D {

Drop the "_dt".

> +	{ .name =3D "clk_eic7700_hsp.hsp-reset", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(auxiliary, eic7700_hsp_reset_dt_ids);
> +
> +static struct auxiliary_driver eic7700_hsp_reset_driver =3D {
> +	.probe	=3D eic7700_hsp_reset_probe,
> +	.id_table =3D eic7700_hsp_reset_dt_ids,
> +};
> +
> +module_auxiliary_driver(eic7700_hsp_reset_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Xuyang Dong <dongxuyang@eswincomputing.com>");
> +MODULE_DESCRIPTION("ESWIN EIC7700 HSP Reset Controller Driver");

With that,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
