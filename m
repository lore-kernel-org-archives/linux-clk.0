Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953AA384243;
	Thu, 21 May 2026 10:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779358418; cv=none; b=D5mJUu7KBFiYym5shFHKDalkpB+j0sBL9SHc4CnuzmnLPSv4TsZwrRnPnMHfNza5vkJysbz1r4vIRuOi7u+pjxinUWTnOTjiApmVXgZbm6HWITrygl+BAHVxh9jxndmbGNqKmhrmkv+S1J8045VbXSceQvI0QwgB9sAArhvSjXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779358418; c=relaxed/simple;
	bh=UvUDUo8CnuMBFaEuDUmGzKGSsB0mzNlko0srZ+NMyjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/eoR52wMIdBdJupvtIvg6hmg/SOYOAyorFI9i7hTSMQ4U1uxrr5CSmNM+8AmSrN4+klkCxg2hVDkKCABVuuYQnNLhF6V4WVvBmZgX76SNF+aybMze/lfWkeYAmbdqBjHCL4fQij+enN/u15nqzvJvSlNZQ8qtEiekGS/J1i3zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TuVK0Q/q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TuVK0Q/q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAFF71F000E9;
	Thu, 21 May 2026 10:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779358417;
	bh=yJeHngwTjx7iNIdwSm6fHexQ8q+sCx+IVxLkKopKarU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TuVK0Q/qAfpjOGxYzuqJ3o6qbYhgM3EhNpWORTVle5w6GmwzVfh4LvX7F6KQFUlUa
	 lQ0kkLurG5uYLYCxgQMJOhc0Uk0J4Vf9F8YOh7x3IlMONQ5i+PQr2ml4lShMnUBtna
	 YDHaS2O67rBYSfIyj1DgDDjkMQuvH87vM+TdChh8juyQiDu2nXhpi/j3P8ixy3t60S
	 TPkW9MLExBAVxP+bQWB/WoumU6wpIJXvP5cewVqZrnBENKw/D27NEi8/OQQoB9E7c9
	 Tq3bT2kTqAdGKN5YP2IWi0PEwHbmz8y99w9Zu50FzDYZpqTmDDbfgUoWi6Qgnf1AZi
	 /ohoTqq5tQQGQ==
Date: Thu, 21 May 2026 12:13:34 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v8 4/5] phy: move and rename Airoha PCIe PHY driver to
 dedicated directory
Message-ID: <ag7azmxlWspK_iVS@lore-desk>
References: <20260520150912.11614-1-ansuelsmth@gmail.com>
 <20260520150912.11614-5-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+GwfGcxHJb0ERKyP"
Content-Disposition: inline
In-Reply-To: <20260520150912.11614-5-ansuelsmth@gmail.com>


--+GwfGcxHJb0ERKyP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> To keep the generic PHY directory tidy, move the PCIe PHY driver for
> Airoha AN7581 SoC to a dedicated directory.
>=20
> Also rename the driver and add the relevant SoC name to the .c and .h
> file in preparation for support of PCIe and USB PHY driver for Airoha
> AN7583 SoC that use a completely different implementation and
> calibration for PHYs and will have their own dedicated drivers.
>=20
> The rename permits to better identify the specific usage of the driver
> in the future once the airoha PHY directory will have multiple driver
> for multiple SoC.
>=20
> The config is changed from PHY_AIROHA_PCIE to PHY_AIROHA_AN7581_PCIE.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  MAINTAINERS                                         |  4 ++--
>  drivers/phy/Kconfig                                 | 11 +----------
>  drivers/phy/Makefile                                |  4 ++--
>  drivers/phy/airoha/Kconfig                          | 13 +++++++++++++
>  drivers/phy/airoha/Makefile                         |  3 +++
>  .../phy-an7581-pcie-regs.h}                         |  2 +-
>  .../{phy-airoha-pcie.c =3D> airoha/phy-an7581-pcie.c} |  6 +++---
>  7 files changed, 25 insertions(+), 18 deletions(-)
>  create mode 100644 drivers/phy/airoha/Kconfig
>  create mode 100644 drivers/phy/airoha/Makefile
>  rename drivers/phy/{phy-airoha-pcie-regs.h =3D> airoha/phy-an7581-pcie-r=
egs.h} (99%)
>  rename drivers/phy/{phy-airoha-pcie.c =3D> airoha/phy-an7581-pcie.c} (99=
%)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 932044785a39..7bea8c620da8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -759,8 +759,8 @@ M:	Lorenzo Bianconi <lorenzo@kernel.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/phy/airoha,en7581-pcie-phy.yaml
> -F:	drivers/phy/phy-airoha-pcie-regs.h
> -F:	drivers/phy/phy-airoha-pcie.c
> +F:	drivers/phy/airoha/phy-an7581-pcie-regs.h
> +F:	drivers/phy/airoha/phy-an7581-pcie.c
> =20
>  AIROHA SPI SNFI DRIVER
>  M:	Lorenzo Bianconi <lorenzo@kernel.org>
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 227b9a4c612e..f9cd765a3ccc 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -46,16 +46,6 @@ config GENERIC_PHY_MIPI_DPHY
>  	  Provides a number of helpers a core functions for MIPI D-PHY
>  	  drivers to us.
> =20
> -config PHY_AIROHA_PCIE
> -	tristate "Airoha PCIe-PHY Driver"
> -	depends on ARCH_AIROHA || COMPILE_TEST
> -	depends on OF
> -	select GENERIC_PHY
> -	help
> -	  Say Y here to add support for Airoha PCIe PHY driver.
> -	  This driver create the basic PHY instance and provides initialize
> -	  callback for PCIe GEN3 port.
> -
>  config PHY_CAN_TRANSCEIVER
>  	tristate "CAN transceiver PHY"
>  	select GENERIC_PHY
> @@ -133,6 +123,7 @@ config PHY_XGENE
>  	help
>  	  This option enables support for APM X-Gene SoC multi-purpose PHY.
> =20
> +source "drivers/phy/airoha/Kconfig"
>  source "drivers/phy/allwinner/Kconfig"
>  source "drivers/phy/amlogic/Kconfig"
>  source "drivers/phy/apple/Kconfig"
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index f49d83f00a3d..84062279fa63 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -7,7 +7,6 @@ obj-$(CONFIG_PHY_COMMON_PROPS)		+=3D phy-common-props.o
>  obj-$(CONFIG_PHY_COMMON_PROPS_TEST)	+=3D phy-common-props-test.o
>  obj-$(CONFIG_GENERIC_PHY)		+=3D phy-core.o
>  obj-$(CONFIG_GENERIC_PHY_MIPI_DPHY)	+=3D phy-core-mipi-dphy.o
> -obj-$(CONFIG_PHY_AIROHA_PCIE)		+=3D phy-airoha-pcie.o
>  obj-$(CONFIG_PHY_CAN_TRANSCEIVER)	+=3D phy-can-transceiver.o
>  obj-$(CONFIG_PHY_GOOGLE_USB)		+=3D phy-google-usb.o
>  obj-$(CONFIG_USB_LGM_PHY)		+=3D phy-lgm-usb.o
> @@ -17,7 +16,8 @@ obj-$(CONFIG_PHY_PISTACHIO_USB)		+=3D phy-pistachio-usb=
=2Eo
>  obj-$(CONFIG_PHY_SNPS_EUSB2)		+=3D phy-snps-eusb2.o
>  obj-$(CONFIG_PHY_XGENE)			+=3D phy-xgene.o
> =20
> -obj-$(CONFIG_GENERIC_PHY)		+=3D allwinner/	\
> +obj-$(CONFIG_GENERIC_PHY)		+=3D airoha/	\
> +					   allwinner/	\
>  					   amlogic/	\
>  					   apple/	\
>  					   broadcom/	\
> diff --git a/drivers/phy/airoha/Kconfig b/drivers/phy/airoha/Kconfig
> new file mode 100644
> index 000000000000..9a1b625a7701
> --- /dev/null
> +++ b/drivers/phy/airoha/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Phy drivers for Airoha devices
> +#
> +config PHY_AIROHA_AN7581_PCIE
> +	tristate "Airoha AN7581 PCIe-PHY Driver"
> +	depends on ARCH_AIROHA || COMPILE_TEST
> +	depends on OF
> +	select GENERIC_PHY
> +	help
> +	  Say Y here to add support for Airoha AN7581 PCIe PHY driver.
> +	  This driver create the basic PHY instance and provides initialize
> +	  callback for PCIe GEN3 port.
> diff --git a/drivers/phy/airoha/Makefile b/drivers/phy/airoha/Makefile
> new file mode 100644
> index 000000000000..912f3e11a061
> --- /dev/null
> +++ b/drivers/phy/airoha/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_PHY_AIROHA_AN7581_PCIE)	+=3D phy-an7581-pcie.o
> diff --git a/drivers/phy/phy-airoha-pcie-regs.h b/drivers/phy/airoha/phy-=
an7581-pcie-regs.h
> similarity index 99%
> rename from drivers/phy/phy-airoha-pcie-regs.h
> rename to drivers/phy/airoha/phy-an7581-pcie-regs.h
> index 58572c793722..b938a7b468fe 100644
> --- a/drivers/phy/phy-airoha-pcie-regs.h
> +++ b/drivers/phy/airoha/phy-an7581-pcie-regs.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> +// SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (c) 2024 AIROHA Inc
>   * Author: Lorenzo Bianconi <lorenzo@kernel.org>
> diff --git a/drivers/phy/phy-airoha-pcie.c b/drivers/phy/airoha/phy-an758=
1-pcie.c
> similarity index 99%
> rename from drivers/phy/phy-airoha-pcie.c
> rename to drivers/phy/airoha/phy-an7581-pcie.c
> index 56e9ade8a9fd..81ddf0e7638b 100644
> --- a/drivers/phy/phy-airoha-pcie.c
> +++ b/drivers/phy/airoha/phy-an7581-pcie.c
> @@ -13,7 +13,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> =20
> -#include "phy-airoha-pcie-regs.h"
> +#include "phy-an7581-pcie-regs.h"
> =20
>  #define LEQ_LEN_CTRL_MAX_VAL	7
>  #define FREQ_LOCK_MAX_ATTEMPT	10
> @@ -1279,12 +1279,12 @@ MODULE_DEVICE_TABLE(of, airoha_pcie_phy_of_match);
>  static struct platform_driver airoha_pcie_phy_driver =3D {
>  	.probe	=3D airoha_pcie_phy_probe,
>  	.driver	=3D {
> -		.name =3D "airoha-pcie-phy",
> +		.name =3D "airoha-an7581-pcie-phy",
>  		.of_match_table =3D airoha_pcie_phy_of_match,
>  	},
>  };
>  module_platform_driver(airoha_pcie_phy_driver);
> =20
> -MODULE_DESCRIPTION("Airoha PCIe PHY driver");
> +MODULE_DESCRIPTION("Airoha AN7581 PCIe PHY driver");
>  MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
>  MODULE_LICENSE("GPL");
> --=20
> 2.53.0
>=20

--+GwfGcxHJb0ERKyP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCag7azgAKCRA6cBh0uS2t
rFl9AP9jI7aQgapV/BhGPwx6KIRaUVocpOpElFOYjVyAYUrVWAEAlzn1Hem7Kfsm
7AaS1RgEi0GfQMSjQgzQ81hdjLzT8Ag=
=O8tV
-----END PGP SIGNATURE-----

--+GwfGcxHJb0ERKyP--
