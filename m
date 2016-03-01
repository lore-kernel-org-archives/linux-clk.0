Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 29 Feb 2016 23:08:55 -0800
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Vishnu Patekar <vishnupatekar0510@gmail.com>
Cc: robh+dt@kernel.org, corbet@lwn.net, pawel.moll@arm.com,
	mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
	galak@codeaurora.org, linux@arm.linux.org.uk, emilio@elopez.com.ar,
	jenskuske@gmail.com, hdegoede@redhat.com, wens@csie.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
	linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
	mturquette@baylibre.com, sboyd@codeaurora.org, patchesrdh@mveas.com,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 01/13] pinctrl: sunxi: Add A83T R_PIO controller
 support
Message-ID: <20160301070855.GH8418@lukather>
References: <1456672738-4993-1-git-send-email-vishnupatekar0510@gmail.com>
 <1456672738-4993-2-git-send-email-vishnupatekar0510@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dMyqICaxQaaUjrCL"
In-Reply-To: <1456672738-4993-2-git-send-email-vishnupatekar0510@gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--dMyqICaxQaaUjrCL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Feb 28, 2016 at 11:18:46PM +0800, Vishnu Patekar wrote:
> The A83T has R_PIO pin controller, it's same as A23, execpt A83T
> interrupt bit is 6th and A83T has one extra pin PL12.
>=20
> Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
> Acked-by: Chen-Yu Tsai <wens@csie.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |   1 +
>  drivers/pinctrl/sunxi/Kconfig                      |   5 +
>  drivers/pinctrl/sunxi/Makefile                     |   1 +
>  drivers/pinctrl/sunxi/pinctrl-sun8i-a83t-r.c       | 119 +++++++++++++++=
++++++
>  4 files changed, 126 insertions(+)
>  create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-a83t-r.c
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pi=
nctrl.txt b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinct=
rl.txt
> index 9213b27..f9ff10b 100644
> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.t=
xt
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.t=
xt
> @@ -20,6 +20,7 @@ Required properties:
>    "allwinner,sun9i-a80-pinctrl"
>    "allwinner,sun9i-a80-r-pinctrl"
>    "allwinner,sun8i-a83t-pinctrl"
> +  "allwinner,sun8i-a83t-r-pinctrl"
>    "allwinner,sun8i-h3-pinctrl"
> =20
>  - reg: Should contain the register physical address and length for the
> diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
> index f8dbc8b..eeab50b 100644
> --- a/drivers/pinctrl/sunxi/Kconfig
> +++ b/drivers/pinctrl/sunxi/Kconfig
> @@ -51,6 +51,11 @@ config PINCTRL_SUN8I_A23_R
>  	depends on RESET_CONTROLLER
>  	select PINCTRL_SUNXI_COMMON
> =20
> +config PINCTRL_SUN8I_A83T_R
> +	def_bool MACH_SUN8I
> +	depends on RESET_CONTROLLER
> +	select PINCTRL_SUNXI_COMMON
> +
>  config PINCTRL_SUN8I_H3
>  	def_bool MACH_SUN8I
>  	select PINCTRL_SUNXI_COMMON
> diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makef=
ile
> index ef82f22..bfd4fa0 100644
> --- a/drivers/pinctrl/sunxi/Makefile
> +++ b/drivers/pinctrl/sunxi/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_PINCTRL_SUN8I_A23)		+=3D pinctrl-sun8i-a23=
=2Eo
>  obj-$(CONFIG_PINCTRL_SUN8I_A23_R)	+=3D pinctrl-sun8i-a23-r.o
>  obj-$(CONFIG_PINCTRL_SUN8I_A33)		+=3D pinctrl-sun8i-a33.o
>  obj-$(CONFIG_PINCTRL_SUN8I_A83T)	+=3D pinctrl-sun8i-a83t.o
> +obj-$(CONFIG_PINCTRL_SUN8I_A83T_R)	+=3D pinctrl-sun8i-a83t-r.o
>  obj-$(CONFIG_PINCTRL_SUN8I_H3)		+=3D pinctrl-sun8i-h3.o
>  obj-$(CONFIG_PINCTRL_SUN9I_A80)		+=3D pinctrl-sun9i-a80.o
>  obj-$(CONFIG_PINCTRL_SUN9I_A80_R)	+=3D pinctrl-sun9i-a80-r.o
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-a83t-r.c b/drivers/pinct=
rl/sunxi/pinctrl-sun8i-a83t-r.c
> new file mode 100644
> index 0000000..11787894
> --- /dev/null
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-a83t-r.c
> @@ -0,0 +1,119 @@
> +/*
> + * Allwinner A83T SoCs special pins pinctrl driver.
> + *
> + * Copyright (C) 2016 Vishnu Patekar
> + * Vishnu Patekar <vishnupatekar0510@gmail.com>
> + *
> + * Based on pinctrl-sun8i-a23.c, which is:
> + * Copyright (C) 2014 Chen-Yu Tsai <wens@csie.org>
> + * Copyright (C) 2014 Maxime Ripard <maxime.ripard@free-electrons.com>
> + *
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2.  This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/reset.h>
> +
> +#include "pinctrl-sunxi.h"
> +
> +static const struct sunxi_desc_pin sun8i_a83t_r_pins[] =3D {
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 0),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "s_rsb"),		/* SCK */
> +		  SUNXI_FUNCTION(0x3, "s_twi"),		/* SCK */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 0)),	/* PL_EINT0 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 1),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "s_rsb"),		/* SDA */
> +		  SUNXI_FUNCTION(0x3, "s_twi"),		/* SDA */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 1)),	/* PL_EINT1 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 2),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "s_uart"),	/* TX */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 2)),	/* PL_EINT2 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 3),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "s_uart"),	/* RX */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 3)),	/* PL_EINT3 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 4),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "s_jtag"),	/* MS */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 4)),	/* PL_EINT4 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 5),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "s_jtag"),	/* CK */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 5)),	/* PL_EINT5 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 6),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "s_jtag"),	/* DO */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 6)),	/* PL_EINT6 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 7),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "s_jtag"),	/* DI */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 7)),	/* PL_EINT7 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 8),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "s_twi"),		/* SCK */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 8)),	/* PL_EINT8 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 9),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "s_twi"),		/* SDA */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 9)),	/* PL_EINT9 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 10),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "s_pwm"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 10)),	/* PL_EINT10 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 11),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 11)),	/* PL_EINT11 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 12),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "s_cir"),		/* RX */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 11)),	/* PL_EINT12 */
> +};
> +
> +static const struct sunxi_pinctrl_desc sun8i_a83t_r_pinctrl_data =3D {
> +	.pins =3D sun8i_a83t_r_pins,
> +	.npins =3D ARRAY_SIZE(sun8i_a83t_r_pins),
> +	.pin_base =3D PL_BASE,
> +	.irq_banks =3D 1,
> +};
> +
> +static int sun8i_a83t_r_pinctrl_probe(struct platform_device *pdev)
> +{
> +	return sunxi_pinctrl_init(pdev, &sun8i_a83t_r_pinctrl_data);
> +}
> +
> +static const struct of_device_id sun8i_a83t_r_pinctrl_match[] =3D {
> +	{ .compatible =3D "allwinner,sun8i-a83t-r-pinctrl", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, sun8i_a83t_r_pinctrl_match);
> +
> +static struct platform_driver sun8i_a83t_r_pinctrl_driver =3D {
> +	.probe	=3D sun8i_a83t_r_pinctrl_probe,
> +	.driver	=3D {
> +		.name		=3D "sun8i-a83t-r-pinctrl",
> +		.of_match_table	=3D sun8i_a83t_r_pinctrl_match,
> +	},
> +};
> +module_platform_driver(sun8i_a83t_r_pinctrl_driver);

This can't be compiled as a module, so please use
builtin_platform_driver instead, and drop the module specific parts:
MODULE_DEVICE_TABLE and module.h

Thanks!
Maxime


--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--dMyqICaxQaaUjrCL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW1UAHAAoJEBx+YmzsjxAgXe4QAJ1bFRTdwkjLOgXKy+wY/5A2
Z71GiVL9L/prLwKJagC/G3t/AS8DryzrYZOhiyBMCGm1dDQknk0nkU0YkKUAGoDh
5rq43cCnjgffmooBoeml4Y8jpRP9DE+8HDYdKpoB6XvhZ2HC8qwdmgsxkHJJ2gFZ
K5uedz9ClKekZCRmJiDwuQV31Leqkk5Xrh7afBSslSDj65G6HbVjmem2BjGwXnhf
wGSom6ADkNnrX8+cl0gzDU54x2hkUd9bqfyYQuVW8dAonv+b2q6pspi6Zd8VklYU
oCkqlHppMXJHufc+n4iQfQMptGdUadxPlL9cqWnQWESRmPX3lJtmJN8tn2MO/AEP
QwBV2Me0WrF7qSKnyq+wr68lIsGKql2EjZUtu0al90gC3cW+tVIWR9/oT3NkIJC6
UE3CzD26dcg6S/p9c3i/1jVlbRQTCenh7osPRmI+dOAP+qtDTIXVxpKMYWeh9lAH
/N6ixhtJnCegYpt6FQJeznDhtfBBUbfR6g3Q/kS+XntXoO+k1Qa0BFjJ2t+n21Fq
6d+Y1pnfeR2bc2B40R/JITywqrMtNTdKj6CUBrUOF/jddhHxgY0nFkWf2YlLSYPA
zjltJ8ahKlU/Kcy0SjWJq+1g/VFcEZVZEWf0LyC+QDLle+3ThgY8cr/8jLVyy3G5
ue9AwBWxxqj7cOHF6N9f
=CkHo
-----END PGP SIGNATURE-----

--dMyqICaxQaaUjrCL--
