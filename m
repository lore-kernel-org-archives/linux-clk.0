Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AB31E0083
	for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 11:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762774473; cv=none; b=phLebT/G99cNYGjnR1JsUpRhMrxtUVPEWfeSu7nwN3V1zrzRe4NHwDG3JagU7PaKLpTFd9MbJECNH/k1SsXSgCdE405vvk1nWLvdt14LXjD0SZMEuvvc3ad3RFzEb+raewI4CrRW6Mc0ykgGhmA1Nafx1rR1LHa4ztRX+VipnbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762774473; c=relaxed/simple;
	bh=BXjbksbjPHfdcqAMM/5e33b0GMABq+tYGnPW6uspEtc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EaZpDgXPAO3rnNZMyZyM7GGQauALTgzUyEpj9xCh6jXxW1DLnNsgKViOyXuG9GgHp7Kz/fcYcFENUcVlvHH5yEOTxsA+B+QOY2qStUPTcfE0tBcAWkwoSA+hFNq+93OQ/A944awNNLM13BUbv9FOP5Q7aKr86gc8v0ain4MWmbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vIQA5-00029j-Da; Mon, 10 Nov 2025 12:34:17 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vIQA5-0080xe-0H;
	Mon, 10 Nov 2025 12:34:17 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vIQA4-000000009M4-4BQp;
	Mon, 10 Nov 2025 12:34:17 +0100
Message-ID: <2fabead977bee651800790f6b0d6323ffdc372c5.camel@pengutronix.de>
Subject: Re: [PATCH v7 1/5] reset: mpfs: add non-auxiliary bus probing
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Conor Dooley <conor@kernel.org>, claudiu.beznea@tuxon.dev
Cc: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	 <daire.mcnamara@microchip.com>, pierre-henry.moussay@microchip.com, 
	valentina.fernandezalanis@microchip.com, Michael Turquette
	 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 10 Nov 2025 12:34:16 +0100
In-Reply-To: <20251110-evict-gratified-bb816e2799a2@spud>
References: <20251110-zookeeper-femur-68a0ae346397@spud>
	 <20251110-evict-gratified-bb816e2799a2@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
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

On Mo, 2025-11-10 at 11:23 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> While the auxiliary bus was a nice bandaid, and meant that re-writing
> the representation of the clock regions in devicetree was not required,
> it has run its course. The "mss_top_sysreg" region that contains the
> clock and reset regions, also contains pinctrl and an interrupt
> controller, so the time has come rewrite the devicetree and probe the
> reset controller from an mfd devicetree node, rather than implement
> those drivers using the auxiliary bus. Wanting to avoid propagating this
> naive/incorrect description of the hardware to the new pic64gx SoC is a
> major motivating factor here.
>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> v7:
> - move entirely to regmap
> - use clear/set instead of update
>=20
> v6:
> - depend on MFD_SYSCON
> - return regmap_update_bits() result directly instead of an additional
>   return 0
>=20
> v4:
> - Only use driver specific lock for non-regmap writes
>=20
> v2:
> - Implement the request to use regmap_update_bits(). I found that I then
>   hated the read/write helpers since they were just bloat, so I ripped
>   them out. I replaced the regular spin_lock_irqsave() stuff with a
>   guard(spinlock_irqsave), since that's a simpler way of handling the two
>   different paths through such a trivial pair of functions.
> ---
>  drivers/clk/microchip/clk-mpfs.c |  4 +-
>  drivers/reset/Kconfig            |  1 +
>  drivers/reset/reset-mpfs.c       | 92 +++++++++++++++++++-------------
>  include/soc/microchip/mpfs.h     |  3 +-
>  4 files changed, 61 insertions(+), 39 deletions(-)
>=20
> diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk=
-mpfs.c
> index 484893e68b67..ee58304913ef 100644
> --- a/drivers/clk/microchip/clk-mpfs.c
> +++ b/drivers/clk/microchip/clk-mpfs.c
> @@ -38,7 +38,7 @@ static const struct regmap_config mpfs_clk_regmap_confi=
g =3D {
>  	.reg_stride =3D 4,
>  	.val_bits =3D 32,
>  	.val_format_endian =3D REGMAP_ENDIAN_LITTLE,
> -	.max_register =3D REG_SUBBLK_CLOCK_CR,
> +	.max_register =3D REG_SUBBLK_RESET_CR,
>  };
> =20
>  /*
> @@ -502,7 +502,7 @@ static inline int mpfs_clk_old_format_probe(struct mp=
fs_clock_data *clk_data,
>  	if (IS_ERR(clk_data->regmap))
>  		return PTR_ERR(clk_data->regmap);
> =20
> -	return mpfs_reset_controller_register(dev, clk_data->base + REG_SUBBLK_=
RESET_CR);
> +	return mpfs_reset_controller_register(dev, clk_data->regmap);
>  }
> =20
>  static int mpfs_clk_probe(struct platform_device *pdev)
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 78b7078478d4..0ec4b7cd08d6 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -200,6 +200,7 @@ config RESET_PISTACHIO
>  config RESET_POLARFIRE_SOC
>  	bool "Microchip PolarFire SoC (MPFS) Reset Driver"
>  	depends on MCHP_CLK_MPFS
> +	depends on MFD_SYSCON
>  	select AUXILIARY_BUS
>  	default MCHP_CLK_MPFS
>  	help
> diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
> index f6fa10e03ea8..d00212450990 100644
> --- a/drivers/reset/reset-mpfs.c
> +++ b/drivers/reset/reset-mpfs.c
> @@ -7,13 +7,16 @@
>   *
>   */
>  #include <linux/auxiliary_bus.h>
> +#include <linux/cleanup.h>

Not used anymore.

[...]=20
> @@ -176,12 +196,12 @@ static const struct auxiliary_device_id mpfs_reset_=
ids[] =3D {
>  };
>  MODULE_DEVICE_TABLE(auxiliary, mpfs_reset_ids);
> =20
> -static struct auxiliary_driver mpfs_reset_driver =3D {
> -	.probe		=3D mpfs_reset_probe,
> +static struct auxiliary_driver mpfs_reset_aux_driver =3D {
> +	.probe		=3D mpfs_reset_adev_probe,
>  	.id_table	=3D mpfs_reset_ids,
>  };
> =20
> -module_auxiliary_driver(mpfs_reset_driver);
> +module_auxiliary_driver(mpfs_reset_aux_driver);
> =20
>  MODULE_DESCRIPTION("Microchip PolarFire SoC Reset Driver");
>  MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
> diff --git a/include/soc/microchip/mpfs.h b/include/soc/microchip/mpfs.h
> index 0bd67e10b704..ec04c98a8b63 100644
> --- a/include/soc/microchip/mpfs.h
> +++ b/include/soc/microchip/mpfs.h
> @@ -14,6 +14,7 @@
> =20
>  #include <linux/types.h>
>  #include <linux/of_device.h>
> +#include <linux/regmap.h>

You don't have to #include <linux/regmap.h> here, a forward declaration

  struct regmap;

would suffice.
=20
>  struct mpfs_sys_controller;
> =20
> @@ -44,7 +45,7 @@ struct mtd_info *mpfs_sys_controller_get_flash(struct m=
pfs_sys_controller *mpfs_
> =20
>  #if IS_ENABLED(CONFIG_MCHP_CLK_MPFS)
>  #if IS_ENABLED(CONFIG_RESET_POLARFIRE_SOC)
> -int mpfs_reset_controller_register(struct device *clk_dev, void __iomem =
*base);
> +int mpfs_reset_controller_register(struct device *clk_dev, struct regmap=
 *map);
>  #else
>  static inline int mpfs_reset_controller_register(struct device *clk_dev,=
 void __iomem *base) { return 0; }
>  #endif /* if IS_ENABLED(CONFIG_RESET_POLARFIRE_SOC) */

With the superfluous cleanup include fixed.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

and

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

to be merged with the reset of the series.

regards
Philipp
