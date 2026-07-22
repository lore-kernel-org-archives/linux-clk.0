Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7332EF653;
	Wed, 22 Jul 2026 07:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784704093; cv=none; b=DReJy+xtuhDiBthkhlms5D5sWSZTlOlc3QyBbdA9EWN3eFj9ICpXXKW0Jlg3mfnKl2poHwFcH099aeEo3uf5A1P/gk6c2TGu+ZP84uNJQn+y69KBLM3X1RBc/OdK7FbGoXgAe6F3G/KIiLVqdEgEYPoEqtw5j+VbcIfU/TcxQAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784704093; c=relaxed/simple;
	bh=KAgCZXnouZ6uHr6dbDUKHfYecnmBGhQ+Og1d79Oo9mM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M+HXN0K2RmclTzdh4y6o788p+rGWIThlSFI5FTP6PbeEF6zraCaRQAm0fQ42pDq/HRGMMu8+gUeEEm76n5OUrnCexFRzCZ4MCwK4a0lAideCekUwdGBnysShw1JhASe8qqBjsg144QmOafgS+cq1PnZbqwn4ZeZ2PXQwFt6mEnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 192BE200A6A;
	Wed, 22 Jul 2026 09:08:08 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wmR3o-000hCx-03;
	Wed, 22 Jul 2026 09:08:08 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wmR3n-000000003oZ-3s4p;
	Wed, 22 Jul 2026 09:08:07 +0200
Message-ID: <c5dc6f193db5993958bba1e7fe904253fed1876b.camel@pengutronix.de>
Subject: Re: [PATCH v10 02/11] reset: Add Realtek basic reset support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yu-Chun Lin <eleanor.lin@realtek.com>, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
 bmasney@redhat.com
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
	cy.huang@realtek.com, stanley_chang@realtek.com
Date: Wed, 22 Jul 2026 09:08:07 +0200
In-Reply-To: <20260713155630.3054636-3-eleanor.lin@realtek.com>
References: <20260713155630.3054636-1-eleanor.lin@realtek.com>
	 <20260713155630.3054636-3-eleanor.lin@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mo, 2026-07-13 at 23:56 +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
>=20
> Define the reset operations backed by a regmap-based register interface

Correct. Maybe mention the optional write-enable bit or stat that this
is for Realtek SoC reset controllers, but that's it.

> and prepare the reset controller to be registered through the reset
> framework.

This part is deprecated.

> Since the reset controllers on Realtek SoCs often share the same register
> space with the clock controllers, this common framework is designed to
> extract the regmap and device tree node from the parent device
> (e.g., an auxiliary device parent).

And this as well, it can just be removed.

>=20
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v10:
> - Export 'rtk_reset_ops' directly instead of using a wrapper function,
> allowing callers to assign regmap, ops, dev, and of_node individually.
> - Replacing 'regmap_update_bits()' with 'regmap_set_bits()'.
> - Change variable types.
> ---
>  MAINTAINERS                              |  1 +
>  drivers/reset/Kconfig                    |  1 +
>  drivers/reset/Makefile                   |  1 +
>  drivers/reset/realtek/Kconfig            |  8 +++
>  drivers/reset/realtek/Makefile           |  2 +
>  drivers/reset/realtek/reset-rtk-common.c | 75 ++++++++++++++++++++++++
>  drivers/reset/realtek/reset-rtk-common.h | 28 +++++++++
>  7 files changed, 116 insertions(+)
>  create mode 100644 drivers/reset/realtek/Kconfig
>  create mode 100644 drivers/reset/realtek/Makefile
>  create mode 100644 drivers/reset/realtek/reset-rtk-common.c
>  create mode 100644 drivers/reset/realtek/reset-rtk-common.h
>=20
[...]
> diff --git a/drivers/reset/realtek/reset-rtk-common.c b/drivers/reset/rea=
ltek/reset-rtk-common.c
> new file mode 100644
> index 000000000000..4d5ec2b0416d
> --- /dev/null
> +++ b/drivers/reset/realtek/reset-rtk-common.c
> @@ -0,0 +1,75 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2019-2026 Realtek Semiconductor Corporation
> + */
> +
> +#include <linux/device.h>
> +#include <linux/export.h>
> +#include <linux/module.h>
> +#include <linux/of.h>

Drop unused headers.

[...]

> diff --git a/drivers/reset/realtek/reset-rtk-common.h b/drivers/reset/rea=
ltek/reset-rtk-common.h
> new file mode 100644
> index 000000000000..dce6724dd50c
> --- /dev/null
> +++ b/drivers/reset/realtek/reset-rtk-common.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2026 Realtek Semiconductor Corporation
> + * Author: Yu-Chun Lin <eleanor.lin@realtek.com>
> + */
> +
> +#ifndef __RESET_REALTEK_COMMON_H
> +#define __RESET_REALTEK_COMMON_H
> +
> +#include <linux/reset-controller.h>

#include <linux/types.h>

for bool and u32.
It's included indirectly via reset-controller.h, but IWYU.

> +
> +struct regmap;
> +
> +struct rtk_reset_desc {
> +	u32 ofs;
> +	u32 bit;
> +	bool write_en;
> +};
> +
> +struct rtk_reset_data {
> +	struct reset_controller_dev rcdev;
> +	const struct rtk_reset_desc *descs;
> +	struct regmap *regmap;
> +};
> +
> +extern const struct reset_control_ops rtk_reset_ops;
> +
> +#endif /* __RESET_REALTEK_COMMON_H */

With these issues addressed,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
