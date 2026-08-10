Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528373603EE;
	Mon, 10 Aug 2026 16:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786377908; cv=none; b=IqTEviGNxKr+Ru2t5CGnktJpWHkDssc2iJuWl4Y7R7rGQFw6OWnGumaL/dttaQ+y80poPZ7vQ3B6EzjtB+qF1O38gbYD2up/C0sxbY552PlpLSpy+pNSw+4s4UJFOXGZYM1tayExI6hyfDprKvOFPzNO1WkHWtCQ744jNef48k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786377908; c=relaxed/simple;
	bh=PfEHcdpAPF8cm/Vt14RaR/mhzp660oLbTPEnojaWRSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EN9iQWEIFADWc15f6LX57SQgi2Ng8eLH0+nzbu27MUDjsKZFrlAcO4BbLOiUwMddoTjgwN+NdwnBcDpSinw1hNsabVJRwokMWw3C5/3cNjhRqJRHry9YZwsllzXyXNGS+zUJRqiPisfbXk1xROoFXLEpOjlV/K6LK3bojPxav3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KlT8GMCa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KlT8GMCa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 036CB1F000E9;
	Mon, 10 Aug 2026 16:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786377907;
	bh=aZliVbVvGETr0QEqkNRL1i42gj38xTn+l5ropz04LAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KlT8GMCabzHf5JBAPWuurFXxmwDLGnZ+BBl2/GhGPVjWpchX36CtJI+6hYbABn7vk
	 OoiCyW4qtNLBBtLaikWtB8jzEr8cv5Gz5o4j3HwOEXnVR59ZphEQ5lOzTwpxTi4ooc
	 WpZtyxdMjSc4OUPaomynH5ULLd2DmZvOjUgpSobuHmbhRw0Larwa/6KzOC5X+aBGta
	 AbD5lKLXOOl1nRk80R7WfbaCMQLhLmrCMdHbQu0RWsKNo7tXQaNjr9PoBOBSFyyewN
	 aQm5wdNzZNZjYHhUssgRD7LSGBeCYs1KxkMTV/aLKzkny0+Cl4nL8WiFmbOhM6Q/lS
	 36sM+uBQtL2aA==
Date: Mon, 10 Aug 2026 17:05:01 +0100
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
Subject: Re: [PATCH v4 7/8] soc: starfive: Add socinfo driver for JHB100 SoC
Message-ID: <20260810-caress-rack-45615c8d9747@spud>
References: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
 <20260809015054.210577-8-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IY6Lbzd1L/jArdrp"
Content-Disposition: inline
In-Reply-To: <20260809015054.210577-8-changhuang.liang@starfivetech.com>

--IY6Lbzd1L/jArdrp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 08, 2026 at 06:50:53PM -0700, Changhuang Liang wrote:
> Add socinfo driver for JHB100 SoC. Currently available for distinguishing
> between the two reversions, A0 and A1.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  MAINTAINERS                                   |  6 ++
>  drivers/soc/Kconfig                           |  1 +
>  drivers/soc/Makefile                          |  1 +
>  drivers/soc/starfive/Kconfig                  |  6 ++
>  drivers/soc/starfive/Makefile                 |  2 +
>  drivers/soc/starfive/socinfo/Kconfig          | 11 +++
>  drivers/soc/starfive/socinfo/Makefile         |  2 +
>  drivers/soc/starfive/socinfo/jhb100-socinfo.c | 90 +++++++++++++++++++
>  8 files changed, 119 insertions(+)
>  create mode 100644 drivers/soc/starfive/Kconfig
>  create mode 100644 drivers/soc/starfive/Makefile
>  create mode 100644 drivers/soc/starfive/socinfo/Kconfig
>  create mode 100644 drivers/soc/starfive/socinfo/Makefile
>  create mode 100644 drivers/soc/starfive/socinfo/jhb100-socinfo.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cecb4f279160..90919c672d4d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26040,6 +26040,7 @@ M:	Conor Dooley <conor@kernel.org>
>  S:	Maintained
>  T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
>  F:	Documentation/devicetree/bindings/soc/starfive/
> +F:	drivers/soc/starfive/
> =20
>  STARFIVE STARLINK PMU DRIVER
>  M:	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
> @@ -26094,6 +26095,11 @@ S:	Maintained
>  F:	drivers/reset/starfive/reset-starfive-jhb1*
>  F:	include/dt-bindings/reset/starfive,jhb1*.h
> =20
> +STARFIVE JHB100 SOCINFO DRIVER
> +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> +S:	Maintained
> +F:	drivers/soc/starfive/socinfo/jhb100-socinfo.c
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
> index 000000000000..638f81ef174c
> --- /dev/null
> +++ b/drivers/soc/starfive/socinfo/jhb100-socinfo.c
> @@ -0,0 +1,90 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2025 StarFive Technology Co., Ltd.
> + *
> + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> + */
> +
> +#define pr_fmt(fmt) "jhb100-socinfo: " fmt
> +
> +#include <linux/bitfield.h>
> +#include <linux/init.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
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

Remind me again why this is not just probed as an mfd cell from the syscon
driver?

(Hint: please put this info in the commit message).

Cheers
Conor.

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
> +	if (!attrs->revision) {
> +		kfree(attrs->machine);
> +		kfree(attrs);
> +		return -ENOMEM;
> +	}
> +
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
> +subsys_initcall(starfive_socinfo_init);
> --=20
> 2.25.1
>=20

--IY6Lbzd1L/jArdrp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCann2rAAKCRB4tDGHoIJi
0ohHAQDdhAr1kJrXXf8gDwzmNcWcdZswvT6sxS4RoDwPoASqtQD9Gdx69wWho21S
1KaFgDL9u9uMGKVOJPZ+baxhqEpe/ws=
=maJS
-----END PGP SIGNATURE-----

--IY6Lbzd1L/jArdrp--
