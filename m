Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Wed, 1 Mar 2017 11:47:35 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH 2/3] clk: sunxi-ng: add support for PRCM CCUs
Message-ID: <20170301104735.4dkqgxobozkosfgc@lukather>
References: <20170301041541.24388-1-icenowy@aosc.xyz>
 <20170301041541.24388-3-icenowy@aosc.xyz>
MIME-Version: 1.0
In-Reply-To: <20170301041541.24388-3-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============6070489114383020638=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============6070489114383020638==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kpt6vdu4tcyx4z77"
Content-Disposition: inline


--kpt6vdu4tcyx4z77
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 01, 2017 at 12:15:40PM +0800, Icenowy Zheng wrote:
> SoCs after A31 has a clock controller module in the PRCM part.
>=20
> Support the clock controller module on H5 and A64 now.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
>  drivers/clk/sunxi-ng/Kconfig            |   6 +
>  drivers/clk/sunxi-ng/Makefile           |   1 +
>  drivers/clk/sunxi-ng/ccu-sun6i-r.c      | 209 ++++++++++++++++++++++++++=
++++++
>  drivers/clk/sunxi-ng/ccu-sun6i-r.h      |  27 +++++
>  include/dt-bindings/clock/sun6i-r-ccu.h |  58 +++++++++
>  include/dt-bindings/reset/sun6i-r-ccu.h |  54 +++++++++
>  6 files changed, 355 insertions(+)
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun6i-r.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun6i-r.h
>  create mode 100644 include/dt-bindings/clock/sun6i-r-ccu.h
>  create mode 100644 include/dt-bindings/reset/sun6i-r-ccu.h
>=20
> diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
> index 695bbf9ef428..44984c050052 100644
> --- a/drivers/clk/sunxi-ng/Kconfig
> +++ b/drivers/clk/sunxi-ng/Kconfig
> @@ -141,4 +141,10 @@ config SUN9I_A80_CCU
>  	select SUNXI_CCU_PHASE
>  	default MACH_SUN9I
> =20
> +config SUN6I_R_CCU

This is not ordered.

> +	bool "Support for Allwinner SoCs' PRCM CCUs"
> +	select SUNXI_CCU_DIV
> +	select SUNXI_CCU_GATE
> +	default MACH_SUN8I || (ARCH_SUNXI && ARM64)

And you can't build it for A31?

> +
>  endif
> diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefile
> index 6feaac0c5600..77ebcfd7d2ca 100644
> --- a/drivers/clk/sunxi-ng/Makefile
> +++ b/drivers/clk/sunxi-ng/Makefile
> @@ -21,6 +21,7 @@ obj-$(CONFIG_SUNXI_CCU_MP)	+=3D ccu_mp.o
>  obj-$(CONFIG_SUN50I_A64_CCU)	+=3D ccu-sun50i-a64.o
>  obj-$(CONFIG_SUN5I_CCU)		+=3D ccu-sun5i.o
>  obj-$(CONFIG_SUN6I_A31_CCU)	+=3D ccu-sun6i-a31.o
> +obj-$(CONFIG_SUN6I_R_CCU)	+=3D ccu-sun6i-r.o
>  obj-$(CONFIG_SUN8I_A23_CCU)	+=3D ccu-sun8i-a23.o
>  obj-$(CONFIG_SUN8I_A33_CCU)	+=3D ccu-sun8i-a33.o
>  obj-$(CONFIG_SUN8I_H3_CCU)	+=3D ccu-sun8i-h3.o
> diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-r.c b/drivers/clk/sunxi-ng/cc=
u-sun6i-r.c
> new file mode 100644
> index 000000000000..988d6b299e91
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-sun6i-r.c
> @@ -0,0 +1,209 @@
> +/*
> + * Copyright (c) 2016 Icenowy Zheng <icenowy@aosc.xyz>
> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +
> +#include "ccu_common.h"
> +#include "ccu_reset.h"
> +
> +#include "ccu_div.h"
> +#include "ccu_gate.h"
> +#include "ccu_mp.h"
> +#include "ccu_nm.h"
> +
> +#include "ccu-sun6i-r.h"
> +
> +static const char * const cpus_parents[] =3D { "osc32k", "osc24M",
> +					     "pll-periph0" };

You need another pll-periph0 here, the value 3 is valid.

And that pll should be in your binding.

> +
> +static struct ccu_div cpus_clk =3D {
> +	.div		=3D _SUNXI_CCU_DIV_FLAGS(4, 2, CLK_DIVIDER_POWER_OF_TWO),
> +
> +	.mux		=3D {
> +		.shift	=3D 16,
> +		.width	=3D 2,
> +
> +		.variable_prediv	=3D {
> +			.index	=3D 2,
> +			.shift	=3D 8,
> +			.width	=3D 5,
> +		},
> +	},
> +
> +	.common		=3D {
> +		.reg		=3D 0x00,
> +		.features	=3D CCU_FEATURE_VARIABLE_PREDIV,
> +		.hw.init	=3D CLK_HW_INIT_PARENTS("cpus",

We've been calling it ar100 so far.

> +						      cpus_parents,
> +						      &ccu_div_ops,
> +						      0),
> +	},
> +};
> +
> +static CLK_FIXED_FACTOR(r_ahb0_clk, "r-ahb0", "cpus", 1, 1, 0);

ahb0 is by definition in the PRCM, there's no need to prefix it by
"r-".

> +
> +static struct ccu_div r_apb0_clk =3D {
> +	.div		=3D _SUNXI_CCU_DIV_FLAGS(0, 2, CLK_DIVIDER_POWER_OF_TWO),
> +
> +	.common		=3D {
> +		.reg		=3D 0x0c,
> +		.hw.init	=3D CLK_HW_INIT("r-apb0",

Ditto.

> +					      "r-ahb0",
> +					      &ccu_div_ops,
> +					      0),
> +	},
> +};
> +
> +static SUNXI_CCU_GATE(r_bus_pio_clk,	"r-bus-pio",	"r-apb0",
> +		      0x28, BIT(0), 0);

apb0-pio

> +static SUNXI_CCU_GATE(r_bus_ir_clk,	"r-bus-ir",	"r-apb0",
> +		      0x28, BIT(1), 0);

apb0-ir

> +static SUNXI_CCU_GATE(r_bus_timer_clk,	"r-bus-timer",	"r-apb0",
> +		      0x28, BIT(2), 0);

apb0-timer

> +static SUNXI_CCU_GATE(r_bus_rsb_clk,	"r-bus-rsb",	"r-apb0",
> +		      0x28, BIT(3), 0);

This is not RSB on the A31

> +static SUNXI_CCU_GATE(r_bus_uart_clk,	"r-bus-uart",	"r-apb0",
> +		      0x28, BIT(4), 0);

And the A31 also has a 1-wire clock here.

> +static SUNXI_CCU_GATE(r_bus_i2c_clk,	"r-bus-i2c",	"r-apb0",
> +		      0x28, BIT(6), 0);
> +
> +static const char * const r_mod0_default_parents[] =3D { "osc32K", "osc2=
4M" };
> +static SUNXI_CCU_MP_WITH_MUX_GATE(r_ir_clk, "r-ir",

ir is enough.

I'm a bit worried by that to be honest. You claim to support the A31,
yet jugdging by the current state of that code you never actually
tested it on that SoC.

What makes you say that the PRCM clocks are the same for the H3 and
A64? We have to be sure, otherwise we might not be able to get the DT
binding right from the very beginning, and we might not be able to fix
it later.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--kpt6vdu4tcyx4z77
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYtqbDAAoJEBx+YmzsjxAgeOMP/jrsOGj41F/LpP41hzxhhT8a
StYzsBL9Olk10+7OAHW6s94+fq+RWMbh5WWU7TQslBiIK5VolQszqbHpFDKgHvuB
lp64tzBNErltLMvui/vK7YPofCh15wQ7HT87SPWjUggPsHb8jX/n+x2Y35JkG/3X
84C/k5gaV6GnWe8S0/MaCmMzhrC/3pJa4m9h+MKbp7hOjNxQGkfDU+VjPQpTy4Yf
Rs7PC5EX29WIPPTu1SnEFjKzNVuwY1WR5LeZ0vySEXQf3ewxnfgYAYA0t4Ie9BVb
92SQ8O5mNWJmJy8VuIkNqcLDRUooIBmrc/Ax4qg3GA5QmM6bSJuuLjl08+5giMfI
Zn53e54TtP3dGe3sGBA9jREG9S1/NcIWVMsj5TOyfhOnPdnz/YeuGn0mgwc4GlHH
/vARVQhBeTMEXRF0L1MLZhS1tvkDpuO8HQ9ZNYW0X+ovB/S1iNepzWOF8j1iY/Hd
Kvva6raMN32furwlqm+cid0zj9MqxJk820IsineRYI21zXLGyqIzyJXALP5tLP9G
u/S4i2Xmour1iqKVLOKFNegsA/t20tRVfFcx8IV1t3ND50/G9l5ZJqoyDjfe42xG
UqnzK1uvhW0eOB9foXAVNc1Q/cqPsB2HfA/bpFBkU16U/axDgkB2ZROizPI1IZSp
YJUH6KzCyw+lr2oVcGIV
=rknD
-----END PGP SIGNATURE-----

--kpt6vdu4tcyx4z77--


--===============6070489114383020638==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6070489114383020638==--
