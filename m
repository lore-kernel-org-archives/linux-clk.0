Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1112EBB84;
	Tue, 12 May 2026 17:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778607929; cv=none; b=lfUTd9jpUvqaj+QpNAV4qKth1fgZnVZPnjTX2YthKOpym3BWkNVQt08jChctfYRUs/kDdIfrstlNklUR8HxU5pULNvKYsfXsX3zHfqa90P2JpP9vy+58feJ2PXqA42+v8Mh3V7wiLLyXvk/bjjJp/BZ661Av/KivTXFVDm7wG6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778607929; c=relaxed/simple;
	bh=9aMeB+elZKJmBmPb1njtTesJSt6OSyeU3hoZQHRS7CE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XhtWBj9Biu/1RycbpaCndVV9JiMz5JB2/zCELdQ3FJ08VhZDqw5vLy26OvZRF/rGqzdZXcO6tcCen+eV9lG1gNviMMvF9GjlCgAjzeLJCuGtka1t3ChLBUTtECIvjuveAhQS2TDqpsg6L6qfbYwrvjjF9UKgAvRrlefDm7jyoVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cGpEoFO1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cGpEoFO1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D058C2BCB0;
	Tue, 12 May 2026 17:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778607929;
	bh=9aMeB+elZKJmBmPb1njtTesJSt6OSyeU3hoZQHRS7CE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cGpEoFO111K/xozDW22L7T2YoE3xgsPRmW/+yiSRn+Cqsi66R4xNf+w6nxqk4L+KL
	 DQCOuDmwImerMLEvlYIODmVIDH8snfj1qsUBrmL4TqQdCALwv6UdaUqId39i59FHeh
	 LbYYzDg4a8WU/5VPgaUSXm2cSZsp9XnGbIcflw554HYHQv1Qol40K2sq7UfRTdpOnU
	 st33D0MANtoxJFGo0sXROWDmQXfKCulR22eA4n3kGYpt2r2FVgxyFNWe9PigWoS2vi
	 TITtCMqsweXHLWJ43f4kujm2oMIHmmNA4w2LZTcUsAMvM3uC/Okn2bZSQdZlQuYG3k
	 KQkacWNLCK4QQ==
Date: Tue, 12 May 2026 18:45:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 11/12] soc: starfive: Add socinfo driver for JHB100 SoC
Message-ID: <20260512-mushroom-helpless-0815d0885abb@spud>
References: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
 <20260512083521.3448-12-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tSIjibv7OA7pVANL"
Content-Disposition: inline
In-Reply-To: <20260512083521.3448-12-changhuang.liang@starfivetech.com>


--tSIjibv7OA7pVANL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 01:35:20AM -0700, Changhuang Liang wrote:
> Add socinfo driver for JHB100 SoC. Currently available for distinguishing
> between the two reversions, A0 and A1.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  MAINTAINERS                                   |  5 ++
>  drivers/soc/Kconfig                           |  1 +
>  drivers/soc/Makefile                          |  1 +
>  drivers/soc/starfive/Kconfig                  |  6 ++
>  drivers/soc/starfive/Makefile                 |  2 +
>  drivers/soc/starfive/socinfo/Kconfig          | 11 +++
>  drivers/soc/starfive/socinfo/Makefile         |  2 +
>  drivers/soc/starfive/socinfo/jhb100-socinfo.c | 80 +++++++++++++++++++
>  8 files changed, 108 insertions(+)
>  create mode 100644 drivers/soc/starfive/Kconfig
>  create mode 100644 drivers/soc/starfive/Makefile
>  create mode 100644 drivers/soc/starfive/socinfo/Kconfig
>  create mode 100644 drivers/soc/starfive/socinfo/Makefile
>  create mode 100644 drivers/soc/starfive/socinfo/jhb100-socinfo.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6f6aac7cea95..66175f453d20 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25613,6 +25613,11 @@ S:	Maintained
>  F:	drivers/reset/starfive/reset-starfive-jhb1*
>  F:	include/dt-bindings/reset/starfive,jhb1*.h
> =20
> +STARFIVE JHB100 SOCINFO DRIVER
> +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> +S:	Maintained
> +F:	drivers/soc/starfive/

FWIW, this is not what I asked for in v1, this should remain the full
path to the driver. I wanted you to add this directory back to the
"STARFIVE SOC DRIVERS" entry, since it's me that'll be applying patches
for this driver.

> +
>  STARFIVE JHB100 SYSCON
>  M:	Changhuang Liang <changhuang.liang@starfivetech.com>
>  S:	Maintained
> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> index a2d65adffb80..b3b01fc38139 100644
> --- a/drivers/soc/Kconfig
> +++ b/drivers/soc/Kconfig
> @@ -24,6 +24,7 @@ source "drivers/soc/renesas/Kconfig"
>  source "drivers/soc/rockchip/Kconfig"
>  source "drivers/soc/samsung/Kconfig"
>  source "drivers/soc/sophgo/Kconfig"
> +source "drivers/soc/starfive/Kconfig"
>  source "drivers/soc/sunxi/Kconfig"
>  source "drivers/soc/tegra/Kconfig"
>  source "drivers/soc/ti/Kconfig"
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index c9e689080ceb..009f85ff891a 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -30,6 +30,7 @@ obj-y				+=3D renesas/
>  obj-y				+=3D rockchip/
>  obj-$(CONFIG_SOC_SAMSUNG)	+=3D samsung/
>  obj-y				+=3D sophgo/
> +obj-y				+=3D starfive/
>  obj-y				+=3D sunxi/
>  obj-$(CONFIG_ARCH_TEGRA)	+=3D tegra/
>  obj-y				+=3D ti/
> diff --git a/drivers/soc/starfive/Kconfig b/drivers/soc/starfive/Kconfig
> new file mode 100644
> index 000000000000..04b020083d3e
> --- /dev/null
> +++ b/drivers/soc/starfive/Kconfig
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +menu "StarFive SoC (System On Chip) specific Drivers"
> +
> +source "drivers/soc/starfive/socinfo/Kconfig"
> +
> +endmenu
> diff --git a/drivers/soc/starfive/Makefile b/drivers/soc/starfive/Makefile
> new file mode 100644
> index 000000000000..ca1e609b8104
> --- /dev/null
> +++ b/drivers/soc/starfive/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-y +=3D socinfo/
> diff --git a/drivers/soc/starfive/socinfo/Kconfig b/drivers/soc/starfive/=
socinfo/Kconfig
> new file mode 100644
> index 000000000000..92bbab62895b
> --- /dev/null
> +++ b/drivers/soc/starfive/socinfo/Kconfig
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config STARFIVE_JHB100_SOCINFO
> +	bool "StarFive JHB100 SoC Information"
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	select SOC_BUS
> +	default y
> +	help
> +	  Include support for the SoC bus socinfo for the StarFive JHB100 SoC
> +	  platforms to provide information about the SoC family and variant
> +	  to user space.
> diff --git a/drivers/soc/starfive/socinfo/Makefile b/drivers/soc/starfive=
/socinfo/Makefile
> new file mode 100644
> index 000000000000..26c2bdf1de3b
> --- /dev/null
> +++ b/drivers/soc/starfive/socinfo/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_STARFIVE_JHB100_SOCINFO)	+=3D jhb100-socinfo.o
> diff --git a/drivers/soc/starfive/socinfo/jhb100-socinfo.c b/drivers/soc/=
starfive/socinfo/jhb100-socinfo.c
> new file mode 100644
> index 000000000000..9c5826d7c253
> --- /dev/null
> +++ b/drivers/soc/starfive/socinfo/jhb100-socinfo.c
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2025 StarFive Technology Co., Ltd.
> + *
> + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/init.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include <linux/sys_soc.h>
> +
> +#define JHB100_REV_ID			0x38
> +#define JHB100_REV_ID_CHAR		GENMASK(3, 2)
> +#define JHB100_REV_ID_NUM		GENMASK(1, 0)
> +
> +static int __init starfive_socinfo_init(void)
> +{
> +	struct soc_device_attribute *attrs;
> +	struct soc_device *soc_dev;
> +	const char *machine =3D NULL;
> +	struct device_node *np;
> +	struct regmap *regmap;
> +	char rev_char;
> +	u32 rev_id;
> +	int ret;
> +
> +	np =3D of_find_compatible_node(NULL, NULL, "starfive,jhb100-sys0-syscon=
");
> +	if (!of_device_is_available(np)) {
> +		of_node_put(np);
> +		return -ENODEV;
> +	}
> +
> +	regmap =3D syscon_node_to_regmap(np);
> +	if (IS_ERR(regmap)) {
> +		of_node_put(np);
> +		return PTR_ERR(regmap);
> +	}
> +
> +	ret =3D regmap_read(regmap, JHB100_REV_ID, &rev_id);
> +	if (ret) {
> +		of_node_put(np);
> +		return ret;
> +	}
> +
> +	of_node_put(np);
> +
> +	rev_char =3D (char)FIELD_GET(JHB100_REV_ID_CHAR, rev_id) + 'A';
> +	rev_id =3D (u32)FIELD_GET(JHB100_REV_ID_NUM, rev_id);
> +
> +	attrs =3D kzalloc_obj(*attrs);
> +	if (!attrs)
> +		return -ENOMEM;
> +
> +	np =3D of_find_node_by_path("/");
> +	of_property_read_string(np, "model", &machine);
> +	if (machine)
> +		attrs->machine =3D kstrdup(machine, GFP_KERNEL);
> +	of_node_put(np);
> +
> +	attrs->revision =3D kasprintf(GFP_KERNEL, "%c%u", rev_char, rev_id);
> +	attrs->family =3D "JH";
> +	attrs->soc_id =3D "JHB100";
> +
> +	soc_dev =3D soc_device_register(attrs);
> +	if (IS_ERR(soc_dev)) {
> +		kfree(attrs->revision);
> +		kfree(attrs->machine);
> +		kfree(attrs);
> +		return PTR_ERR(soc_dev);
> +	}
> +
> +	pr_info("StarFive %s SoC rev(%s)\n", attrs->soc_id, attrs->revision);
> +
> +	return 0;
> +}
> +
> +early_initcall(starfive_socinfo_init);

Does this really need to be an early initcall btw?

--tSIjibv7OA7pVANL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagNnMwAKCRB4tDGHoIJi
0s3SAQDOveOtLqjxEwo/NynsHooZNj674awuY1eMenP54fnqUwEA2klyVlbxwlxm
9Ha6aqwG9AHCPWXshLZvhuXgwR+gnAk=
=tC2B
-----END PGP SIGNATURE-----

--tSIjibv7OA7pVANL--
