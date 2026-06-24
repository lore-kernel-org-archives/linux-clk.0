Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B29B2641CA;
	Wed, 24 Jun 2026 13:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782306219; cv=none; b=YEPradrZW5QvSVRiqqSTpxHpr8kAj/WW/62+b30kAgcKkAMtECFF7B/nwY0mv/fggEDoZcdtIKvqx+cqs1n5XVs832om5EKe1IzW2/ZjcGPkACU13n1wS6jlKQoMfkhUJfVQ0tP8km6S6e3tjnCD2L7J16J/QJ+eoQuD8dMpGn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782306219; c=relaxed/simple;
	bh=3jDZVKvbcOJFCSJkkLR7ebNpUAEpqBiYd+YgCC7lpRo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=No0h1j4cVkl5n3QXYzbmIKn3bloXYebMQ9ltNBMz+sg/QtGeWKs2vtcxZlzhjJGTGiam0fsFrRZEV3h7x1uVH7fEzB/Z0gNgYo92nsc+vkfmk5ma3/3lrPvMVfGutGffMFcnhC4nH4YEDFX+OYhZYjIrRZIYCZOI5zHyY5b138Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 830D12007B6;
	Wed, 24 Jun 2026 15:03:35 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wcNGR-004QbC-1S;
	Wed, 24 Jun 2026 15:03:35 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wcNGR-00000000B6d-1TPc;
	Wed, 24 Jun 2026 15:03:35 +0200
Message-ID: <9db83aa615f43ff6eac090626b43915fcd593a25.camel@pengutronix.de>
Subject: Re: [PATCH v9 04/12] reset: realtek: Add RTD1625-ISO reset
 controller driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yu-Chun Lin <eleanor.lin@realtek.com>, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
 bmasney@redhat.com
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
	cy.huang@realtek.com, stanley_chang@realtek.com
Date: Wed, 24 Jun 2026 15:03:35 +0200
In-Reply-To: <20260624112940.3475605-5-eleanor.lin@realtek.com>
References: <20260624112940.3475605-1-eleanor.lin@realtek.com>
	 <20260624112940.3475605-5-eleanor.lin@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mi, 2026-06-24 at 19:29 +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
>=20
> Add support for the ISO (Isolation) domain reset controller on the Realte=
k
> RTD1625 SoC.
>=20
> The reset controller shares the same register space with the ISO clock
> controller. To handle this shared register space, the reset driver is
> implemented as an auxiliary driver. It will be instantiated and probed vi=
a
> the auxiliary bus by the RTD1625-ISO clock controller driver.
>=20
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v9:
> - Extract reset-related code from the previous clock driver patch
> (formerly patch 9 in v8).
> ---
>  drivers/reset/realtek/Makefile            |  2 +-
>  drivers/reset/realtek/reset-rtd1625-iso.c | 99 +++++++++++++++++++++++
>  2 files changed, 100 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/reset/realtek/reset-rtd1625-iso.c
>=20
> diff --git a/drivers/reset/realtek/Makefile b/drivers/reset/realtek/Makef=
ile
> index c3f605ffb11c..9007c9d5683b 100644
> --- a/drivers/reset/realtek/Makefile
> +++ b/drivers/reset/realtek/Makefile
> @@ -1,3 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_RESET_RTK_COMMON) +=3D reset-rtk-common.o
> -obj-$(CONFIG_RESET_RTD1625) +=3D reset-rtd1625-crt.o
> +obj-$(CONFIG_RESET_RTD1625) +=3D reset-rtd1625-crt.o reset-rtd1625-iso.o

Is there any benefit to these two being separate modules?
I suggest you merge them into one: reset-rtd1625.o

> diff --git a/drivers/reset/realtek/reset-rtd1625-iso.c b/drivers/reset/re=
altek/reset-rtd1625-iso.c
> new file mode 100644
> index 000000000000..78eaabb408f0
> --- /dev/null
> +++ b/drivers/reset/realtek/reset-rtd1625-iso.c
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Realtek Semiconductor Corporation
> + */
> +
> +#include <dt-bindings/reset/realtek,rtd1625.h>
> +#include <linux/auxiliary_bus.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/of.h>
> +#include <linux/slab.h>
> +#include "reset-rtk-common.h"
> +
> +#define RTD1625_ISO_RSTN_MAX	29
> +#define RTD1625_ISO_S_RSTN_MAX	5

These are not necessary, just use ARRAY_SIZE() for nr_resets.

> +
> +static const struct rtk_reset_desc rtd1625_iso_reset_descs[] =3D {
> +	[RTD1625_ISO_RSTN_VFD]                 =3D { .ofs =3D 0x88, .bit =3D 0 =
},
> +	[RTD1625_ISO_RSTN_CEC0]                =3D { .ofs =3D 0x88, .bit =3D 2 =
},
> +	[RTD1625_ISO_RSTN_CEC1]                =3D { .ofs =3D 0x88, .bit =3D 3 =
},
> +	[RTD1625_ISO_RSTN_CBUSTX]              =3D { .ofs =3D 0x88, .bit =3D 5 =
},
> +	[RTD1625_ISO_RSTN_CBUSRX]              =3D { .ofs =3D 0x88, .bit =3D 6 =
},
> +	[RTD1625_ISO_RSTN_USB3_PHY2_XTAL_POW]  =3D { .ofs =3D 0x88, .bit =3D 7 =
},
> +	[RTD1625_ISO_RSTN_UR0]                 =3D { .ofs =3D 0x88, .bit =3D 8 =
},
> +	[RTD1625_ISO_RSTN_GMAC]                =3D { .ofs =3D 0x88, .bit =3D 9 =
},
> +	[RTD1625_ISO_RSTN_GPHY]                =3D { .ofs =3D 0x88, .bit =3D 10=
 },
> +	[RTD1625_ISO_RSTN_I2C_0]               =3D { .ofs =3D 0x88, .bit =3D 11=
 },
> +	[RTD1625_ISO_RSTN_I2C_1]               =3D { .ofs =3D 0x88, .bit =3D 12=
 },
> +	[RTD1625_ISO_RSTN_CBUS]                =3D { .ofs =3D 0x88, .bit =3D 13=
 },
> +	[RTD1625_ISO_RSTN_USB_DRD]             =3D { .ofs =3D 0x88, .bit =3D 14=
 },
> +	[RTD1625_ISO_RSTN_USB_HOST]            =3D { .ofs =3D 0x88, .bit =3D 15=
 },
> +	[RTD1625_ISO_RSTN_USB_PHY_0]           =3D { .ofs =3D 0x88, .bit =3D 16=
 },
> +	[RTD1625_ISO_RSTN_USB_PHY_1]           =3D { .ofs =3D 0x88, .bit =3D 17=
 },
> +	[RTD1625_ISO_RSTN_USB_PHY_2]           =3D { .ofs =3D 0x88, .bit =3D 18=
 },
> +	[RTD1625_ISO_RSTN_USB]                 =3D { .ofs =3D 0x88, .bit =3D 19=
 },
> +	[RTD1625_ISO_RSTN_TYPE_C]              =3D { .ofs =3D 0x88, .bit =3D 20=
 },
> +	[RTD1625_ISO_RSTN_USB_U3_HOST]         =3D { .ofs =3D 0x88, .bit =3D 21=
 },
> +	[RTD1625_ISO_RSTN_USB3_PHY0_POW]       =3D { .ofs =3D 0x88, .bit =3D 22=
 },
> +	[RTD1625_ISO_RSTN_USB3_P0_MDIO]        =3D { .ofs =3D 0x88, .bit =3D 23=
 },
> +	[RTD1625_ISO_RSTN_USB3_PHY1_POW]       =3D { .ofs =3D 0x88, .bit =3D 24=
 },
> +	[RTD1625_ISO_RSTN_USB3_P1_MDIO]        =3D { .ofs =3D 0x88, .bit =3D 25=
 },
> +	[RTD1625_ISO_RSTN_VTC]                 =3D { .ofs =3D 0x88, .bit =3D 26=
 },
> +	[RTD1625_ISO_RSTN_USB3_PHY2_POW]       =3D { .ofs =3D 0x88, .bit =3D 27=
 },
> +	[RTD1625_ISO_RSTN_USB3_P2_MDIO]        =3D { .ofs =3D 0x88, .bit =3D 28=
 },
> +	[RTD1625_ISO_RSTN_USB_PHY_3]           =3D { .ofs =3D 0x88, .bit =3D 29=
 },
> +	[RTD1625_ISO_RSTN_USB_PHY_4]           =3D { .ofs =3D 0x88, .bit =3D 30=
 },
> +};
> +
> +static const struct rtk_reset_desc rtd1625_iso_s_reset_descs[] =3D {
> +	[RTD1625_ISO_S_RSTN_ISOM_MIS] =3D { .ofs =3D 0x310, .bit =3D 0, .write_=
en =3D 1 },
> +	[RTD1625_ISO_S_RSTN_GPIOM]    =3D { .ofs =3D 0x310, .bit =3D 2, .write_=
en =3D 1 },
> +	[RTD1625_ISO_S_RSTN_TIMER7]   =3D { .ofs =3D 0x310, .bit =3D 4, .write_=
en =3D 1 },
> +	[RTD1625_ISO_S_RSTN_IRDA]     =3D { .ofs =3D 0x310, .bit =3D 6, .write_=
en =3D 1 },
> +	[RTD1625_ISO_S_RSTN_UR10]     =3D { .ofs =3D 0x310, .bit =3D 8, .write_=
en =3D 1 },
> +};
> +
> +static int rtd1625_iso_reset_probe(struct auxiliary_device *adev,
> +				   const struct auxiliary_device_id *id)
> +{
> +	struct device *dev =3D &adev->dev;
> +	struct device *parent =3D dev->parent;
> +	struct rtk_reset_data *data;
> +
> +	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	if (of_device_is_compatible(parent->of_node, "realtek,rtd1625-iso-s-clk=
")) {
> +		data->descs           =3D rtd1625_iso_s_reset_descs;
> +		data->rcdev.nr_resets =3D RTD1625_ISO_S_RSTN_MAX;
> +	} else {
> +		data->descs           =3D rtd1625_iso_reset_descs;
> +		data->rcdev.nr_resets =3D RTD1625_ISO_RSTN_MAX;
> +	}

No need to parse OF compatible again. Store these in a struct, point
auxiliary_device_id::driver_data to it, and use that here.


regards
Philipp
