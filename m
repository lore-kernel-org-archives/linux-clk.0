Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70253C9ED6;
	Tue,  7 Apr 2026 15:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775576598; cv=none; b=KnCld2I4UM/gUc0iTRsHDYEpcfhigwC3EZMXtIuLEVvPOHDtPFo+SR3iJJeFxDRV+WwxsQIz2AOZzDbnY4YFdR2cDyCLjArsDZ7umkOPC3v0wbA+Zw51XY+o0Rv5dIjtEcvrBAteT/Lx1pfyD67L0XIOAprSvYCnVWeyQZexpD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775576598; c=relaxed/simple;
	bh=r+FSZeLHIqlsWPbl2Ro25yNq+E1Vx6IeiDR61rp9gAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CcyO3IgBwXkZB9aKZmGQ919KPVFxjtRBZt4YNEoFOAg7j+8Gk2lozqyXoTtxwzZuThAXoZMfo0/fK3jVf149OluPXSmSrEfuZyjJwuLlGTqFmnwmuF46T3fgcQflPTW4rnU5vLbQDBzMk5UHY00DQhhozY+E3mA6uJVXdPTGB8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tBC+xmcC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tBC+xmcC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A1E4C19424;
	Tue,  7 Apr 2026 15:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775576595;
	bh=r+FSZeLHIqlsWPbl2Ro25yNq+E1Vx6IeiDR61rp9gAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tBC+xmcCFxnqDl3cHvlYvyDQC6t9GSpomSbeKl62GfoU5KQtHF8M3bsEUxajJ0HyL
	 zaUf8hc4K2jx0rIYcPNsXZLjxFA6pojpFD56oLU+3cL1HX1P/N9hFLtt1/H0VIq+1x
	 VKx5UASiIgjVNkfeiSEw86MbAj9OUtVQwjjVXXmF0bfNaOlLv2t7WZ/fTcMnnUXFQA
	 9c9e1LXPhxWpYwb5xsRpcc6gkG1GH2jtYewOZIcrtYiIMydQiGlT4DNjrBC+gqkCoE
	 fSL1shYqAgC/vk37+oqbWf6BxJW4cVe/y9/J3G5+p8D5J6nrdXpkmh537PPeEB5DaL
	 xperOoNUhCImg==
Date: Tue, 7 Apr 2026 16:43:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v1 12/13] soc: starfive: Add socinfo driver for JHB100 SoC
Message-ID: <20260407-vigorous-clustered-79d62b6fa20a@spud>
References: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
 <20260403054945.467700-13-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/VAzyku+3yIu6BpE"
Content-Disposition: inline
In-Reply-To: <20260403054945.467700-13-changhuang.liang@starfivetech.com>


--/VAzyku+3yIu6BpE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 02, 2026 at 10:49:44PM -0700, Changhuang Liang wrote:
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
> index eb5f6a383146..32bd94a0b94c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25325,6 +25325,12 @@ S:	Maintained
>  F:	drivers/reset/starfive/reset-starfive-jhb1*
>  F:	include/dt-bindings/reset/starfive,jhb1*.h
> =20
> +STARFIVE JHB100 SOCINFO DRIVER
> +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/hwinfo/starfive,jhb100-socinfo.yaml
> +F:	drivers/soc/starfive/socinfo/jhb100-socinfo.c

Make sure you add the drivers/soc/starfive directory back to the
starfive soc drivers entry.

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
> index 000000000000..0a20382da5d3
> --- /dev/null
> +++ b/drivers/soc/starfive/socinfo/Kconfig
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config STARFIVE_JHB100_SOCINFO
> +	tristate "StarFive JHB100 SoC Information"
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	select SOC_BUS
> +	default ARCH_STARFIVE

This can just be default y, since it depends on ARCH_STARFIVE.

> +	help
> +	  Include support for the SoC bus socinfo for the StarFive JHB100 SoC
> +	  platforms to provide information about the SoC family and variant
> +	  to user space.

--/VAzyku+3yIu6BpE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCadUmDAAKCRB4tDGHoIJi
0uepAQC7ntfH69ktomW75v5F61miSN/mOMGDvnF71s+HhCw7dgD/YPqMuQE+EzM/
6pRWppBsT1NXKoSi6ShyMVOAGmLNrws=
=iV1Y
-----END PGP SIGNATURE-----

--/VAzyku+3yIu6BpE--
