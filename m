Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4906C6DCE1;
	Wed, 24 Jun 2026 13:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782306141; cv=none; b=ufGuraVDGMq/GwOG9Dwly6bnRk+V7uFkYeyEugaWGCxJ38wsJfTT098aFhdfrUb5NGRh06hQTzHhWtON0dTjg5Hz+wBB7ht+r2uPysx1+cFQUoWJ6+6TiakwMM/sKWmdHH1rCs7v8xypUlLiV8CBN5MemaMbf8HK01QIj5Qah9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782306141; c=relaxed/simple;
	bh=J0AgED6aJxmZdZlRRaBAO1oHZIaam+W21IcU1HLr0kw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GUeTkTT/m3rFeU2qFwHdmHpFBigsVDXjBsSg32AmigcNivHAPjJnCtqUMYFKr9eglJlaxcHDMVJHpOrDswzrkSCu+cOysRhU5jYxtjwq5L2wYEe0v7Je9QNcMF3c7Tjhvcsjz9OgnF+HpsgWxowcCivIYKnguIAik5Tt7PGtTEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 20A192000D8;
	Wed, 24 Jun 2026 15:02:13 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wcNF7-004Qb0-09;
	Wed, 24 Jun 2026 15:02:13 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wcNF6-00000000B61-3z8C;
	Wed, 24 Jun 2026 15:02:12 +0200
Message-ID: <eb03894ae2765a426457238157e474087ea0aaa6.camel@pengutronix.de>
Subject: Re: [PATCH v9 02/12] reset: Add Realtek basic reset support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yu-Chun Lin <eleanor.lin@realtek.com>, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
 bmasney@redhat.com
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
	cy.huang@realtek.com, stanley_chang@realtek.com
Date: Wed, 24 Jun 2026 15:02:12 +0200
In-Reply-To: <20260624112940.3475605-3-eleanor.lin@realtek.com>
References: <20260624112940.3475605-1-eleanor.lin@realtek.com>
	 <20260624112940.3475605-3-eleanor.lin@realtek.com>
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
> Define the reset operations backed by a regmap-based register interface
> and prepare the reset controller to be registered through the reset
> framework.
>=20
> Since the reset controllers on Realtek SoCs often share the same register
> space with the clock controllers, this common framework is designed to
> extract the regmap and device tree node from the parent device
> (e.g., an auxiliary device parent).
>=20
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v8:
> - Rename common.[ch] to reset-rtk-common.[ch].
> ---
>  MAINTAINERS                              |  1 +
>  drivers/reset/Kconfig                    |  1 +
>  drivers/reset/Makefile                   |  1 +
>  drivers/reset/realtek/Kconfig            |  8 +++
>  drivers/reset/realtek/Makefile           |  2 +
>  drivers/reset/realtek/reset-rtk-common.c | 90 ++++++++++++++++++++++++
>  drivers/reset/realtek/reset-rtk-common.h | 29 ++++++++
>  7 files changed, 132 insertions(+)
>  create mode 100644 drivers/reset/realtek/Kconfig
>  create mode 100644 drivers/reset/realtek/Makefile
>  create mode 100644 drivers/reset/realtek/reset-rtk-common.c
>  create mode 100644 drivers/reset/realtek/reset-rtk-common.h
>=20
[...]
> diff --git a/drivers/reset/realtek/reset-rtk-common.c b/drivers/reset/rea=
ltek/reset-rtk-common.c
> new file mode 100644
> index 000000000000..75b27cb2a208
> --- /dev/null
> +++ b/drivers/reset/realtek/reset-rtk-common.c
> @@ -0,0 +1,90 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2019-2026 Realtek Semiconductor Corporation
> + */
> +
> +#include <linux/device.h>
> +#include <linux/export.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include "reset-rtk-common.h"
> +
> +static inline struct rtk_reset_data *to_rtk_reset_controller(struct rese=
t_controller_dev *r)
> +{
> +	return container_of(r, struct rtk_reset_data, rcdev);
> +}
> +
> +static inline const struct rtk_reset_desc *rtk_reset_get_desc(struct rtk=
_reset_data *data,
> +							      unsigned long idx)
> +{
> +	return &data->descs[idx];
> +}
> +
> +static int rtk_reset_assert(struct reset_controller_dev *rcdev,
> +			    unsigned long idx)
> +{
> +	struct rtk_reset_data *data =3D to_rtk_reset_controller(rcdev);
> +	const struct rtk_reset_desc *desc;
> +	u32 mask, val;
> +
> +	desc =3D rtk_reset_get_desc(data, idx);
> +	mask =3D desc->write_en ? (0x3U << desc->bit) : BIT(desc->bit);
> +	val  =3D desc->write_en ? (0x2U << desc->bit) : 0;
> +
> +	return regmap_update_bits(data->regmap, desc->ofs, mask, val);
> +}
> +
> +static int rtk_reset_deassert(struct reset_controller_dev *rcdev,
> +			      unsigned long idx)
> +{
> +	struct rtk_reset_data *data =3D to_rtk_reset_controller(rcdev);
> +	const struct rtk_reset_desc *desc;
> +	u32 mask, val;
> +
> +	desc =3D rtk_reset_get_desc(data, idx);
> +	mask =3D desc->write_en ? (0x3U << desc->bit) : BIT(desc->bit);
> +	val =3D mask;
> +
> +	return regmap_update_bits(data->regmap, desc->ofs, mask, val);

You can use regmap_set_bits() here.

> +}
> +
> +static int rtk_reset_status(struct reset_controller_dev *rcdev,
> +			    unsigned long idx)
> +{
> +	struct rtk_reset_data *data =3D to_rtk_reset_controller(rcdev);
> +	const struct rtk_reset_desc *desc;
> +	u32 val;

	unsigned int val;

> +	int ret;
> +
> +	desc =3D rtk_reset_get_desc(data, idx);
> +	ret =3D regmap_read(data->regmap, desc->ofs, &val);
> +	if (ret)
> +		return ret;
> +
> +	return !((val >> desc->bit) & 1);
> +}
> +
> +static const struct reset_control_ops rtk_reset_ops =3D {
> +	.assert   =3D rtk_reset_assert,
> +	.deassert =3D rtk_reset_deassert,
> +	.status   =3D rtk_reset_status,
> +};
> +
> +/* The caller must initialize data->descs, data->rcdev.nr_resets and
> + * data->rcdev.owner before calling rtk_reset_controller_add().
> + */
> +int rtk_reset_controller_add(struct device *dev,
> +			     struct rtk_reset_data *data)
> +{
> +	data->regmap          =3D dev_get_platdata(dev);
> +	data->rcdev.ops       =3D &rtk_reset_ops;
> +	data->rcdev.dev       =3D dev;
> +	data->rcdev.of_node   =3D dev->parent->of_node;

This split rcdev initialization is more hassle than it is worth.
Please just export rtk_reset_ops and duplicate the
regmap/ops/dev/of_node assignment in the probe functions.

Alternatively, consolidate the probe function and export it from here.

regards
Philipp
