Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Wed, 22 Feb 2017 11:09:52 -0800
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH 2/8] clk: sunxi-ng: add support for DE2 CCU
Message-ID: <20170222190952.2tfbtqotbi2bwd3f@lukather>
References: <20170222151854.3280-1-icenowy@aosc.xyz>
 <20170222151854.3280-3-icenowy@aosc.xyz>
MIME-Version: 1.0
In-Reply-To: <20170222151854.3280-3-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Jean-Francois Moine <moinejf@free.fr>,
 Jernej Skrabec <jernej.skrabec@siol.net>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4945561542660012626=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============4945561542660012626==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yfmtkozrres32xcm"
Content-Disposition: inline


--yfmtkozrres32xcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Feb 22, 2017 at 11:18:48PM +0800, Icenowy Zheng wrote:
> +config SUNXI_DE2_CCU
> +	bool "Support for the Allwinner SoCs DE2 CCU"
> +	select SUNXI_CCU_DIV
> +	select SUNXI_CCU_GATE
> +	default n

This is already the default.

> +
>  endif
> diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefile
> index 6feaac0c5600..1d36c40384a6 100644
> --- a/drivers/clk/sunxi-ng/Makefile
> +++ b/drivers/clk/sunxi-ng/Makefile
> @@ -28,3 +28,4 @@ obj-$(CONFIG_SUN8I_V3S_CCU)	+=3D ccu-sun8i-v3s.o
>  obj-$(CONFIG_SUN9I_A80_CCU)	+=3D ccu-sun9i-a80.o
>  obj-$(CONFIG_SUN9I_A80_CCU)	+=3D ccu-sun9i-a80-de.o
>  obj-$(CONFIG_SUN9I_A80_CCU)	+=3D ccu-sun9i-a80-usb.o
> +obj-$(CONFIG_SUNXI_DE2_CCU)	+=3D ccu-sunxi-de2.o

sun8i-de2 please

> diff --git a/drivers/clk/sunxi-ng/ccu-sunxi-de2.c b/drivers/clk/sunxi-ng/=
ccu-sunxi-de2.c
> new file mode 100644
> index 000000000000..4259c145d5da
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-sunxi-de2.c
> @@ -0,0 +1,204 @@
> +/*
> + * Copyright (c) 2016 Chen-Yu Tsai. All rights reserved.

Wrong author?

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
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +
> +#include "ccu_common.h"
> +#include "ccu_div.h"
> +#include "ccu_gate.h"
> +#include "ccu_reset.h"
> +
> +#include "ccu-sunxi-de2.h"
> +
> +static SUNXI_CCU_GATE(bus_mixer0_clk,	"bus-mixer0",	"bus-de",
> +		      0x04, BIT(0), 0);
> +static SUNXI_CCU_GATE(bus_mixer1_clk,	"bus-mixer1",	"bus-de",
> +		      0x04, BIT(1), 0);
> +static SUNXI_CCU_GATE(bus_wb_clk,	"bus-wb",	"bus-de",
> +		      0x04, BIT(2), 0);
> +
> +static SUNXI_CCU_GATE(mixer0_clk,	"mixer0",	"mixer0-div",
> +		      0x00, BIT(0), CLK_SET_RATE_PARENT);
> +static SUNXI_CCU_GATE(mixer1_clk,	"mixer1",	"mixer1-div",
> +		      0x00, BIT(1), CLK_SET_RATE_PARENT);
> +static SUNXI_CCU_GATE(wb_clk,		"wb",		"wb-div",
> +		      0x00, BIT(2), CLK_SET_RATE_PARENT);
> +
> +static SUNXI_CCU_M(mixer0_div_clk, "mixer0-div", "de", 0x0c, 0, 4,
> +		   CLK_SET_RATE_PARENT);
> +static SUNXI_CCU_M(mixer1_div_clk, "mixer1-div", "de", 0x0c, 4, 4,
> +		   CLK_SET_RATE_PARENT);
> +static SUNXI_CCU_M(wb_div_clk, "wb-div", "de", 0x0c, 8, 4,
> +		   CLK_SET_RATE_PARENT);
> +
> +static struct ccu_common *sunxi_de2_clks[] =3D {
> +	&mixer0_clk.common,
> +	&mixer1_clk.common,
> +	&wb_clk.common,
> +
> +	&bus_mixer0_clk.common,
> +	&bus_mixer1_clk.common,
> +	&bus_wb_clk.common,
> +
> +	&mixer0_div_clk.common,
> +	&mixer1_div_clk.common,
> +	&wb_div_clk.common,
> +};
> +
> +static struct clk_hw_onecell_data sunxi_de2_hw_clks =3D {
> +	.hws	=3D {
> +		[CLK_MIXER0]		=3D &mixer0_clk.common.hw,
> +		[CLK_MIXER1]		=3D &mixer1_clk.common.hw,
> +		[CLK_WB]		=3D &wb_clk.common.hw,
> +
> +		[CLK_BUS_MIXER0]	=3D &bus_mixer0_clk.common.hw,
> +		[CLK_BUS_MIXER1]	=3D &bus_mixer1_clk.common.hw,
> +		[CLK_BUS_WB]		=3D &bus_wb_clk.common.hw,
> +
> +		[CLK_MIXER0_DIV]	=3D &mixer1_div_clk.common.hw,
> +		[CLK_MIXER1_DIV]	=3D &mixer0_div_clk.common.hw,
> +		[CLK_WB_DIV]		=3D &wb_div_clk.common.hw,
> +	},
> +	.num	=3D CLK_NUMBER,
> +};
> +
> +static struct ccu_reset_map sun8i_a83t_de2_resets[] =3D {
> +	[RST_MIXER0]	=3D { 0x08, BIT(0) },
> +	/*
> +	 * For A83T, H3 and R40, mixer1 reset line is shared with wb, so
> +	 * only RST_WB is exported here.
> +	 */
> +	[RST_WB]	=3D { 0x08, BIT(2) },
> +};
> +
> +static struct ccu_reset_map sun50i_a64_de2_resets[] =3D {
> +	[RST_MIXER0]	=3D { 0x08, BIT(0) },
> +	[RST_MIXER1]	=3D { 0x08, BIT(1) },
> +	[RST_WB]	=3D { 0x08, BIT(2) },
> +};
> +
> +static const struct sunxi_ccu_desc sun8i_a83t_de2_clk_desc =3D {
> +	.ccu_clks	=3D sunxi_de2_clks,
> +	.num_ccu_clks	=3D ARRAY_SIZE(sunxi_de2_clks),
> +
> +	.hw_clks	=3D &sunxi_de2_hw_clks,
> +
> +	.resets		=3D sun8i_a83t_de2_resets,
> +	.num_resets	=3D ARRAY_SIZE(sun8i_a83t_de2_resets),
> +};
> +
> +static const struct sunxi_ccu_desc sun50i_a64_de2_clk_desc =3D {
> +	.ccu_clks	=3D sunxi_de2_clks,
> +	.num_ccu_clks	=3D ARRAY_SIZE(sunxi_de2_clks),
> +
> +	.hw_clks	=3D &sunxi_de2_hw_clks,
> +
> +	.resets		=3D sun50i_a64_de2_resets,
> +	.num_resets	=3D ARRAY_SIZE(sun50i_a64_de2_resets),
> +};
> +
> +static int sunxi_de2_clk_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	struct clk *bus_clk;
> +	struct reset_control *rstc;
> +	void __iomem *reg;
> +	const struct sunxi_ccu_desc *ccu_desc;
> +	int ret;
> +
> +	ccu_desc =3D of_device_get_match_data(&pdev->dev);
> +	if (!ccu_desc)
> +		return -EINVAL;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	reg =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(reg))
> +		return PTR_ERR(reg);
> +
> +	bus_clk =3D devm_clk_get(&pdev->dev, "bus");
> +	if (IS_ERR(bus_clk)) {
> +		ret =3D PTR_ERR(bus_clk);
> +		if (ret !=3D -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "Couldn't get bus clk: %d\n", ret);
> +		return ret;
> +	}
> +
> +	rstc =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +	if (IS_ERR(rstc)) {
> +		ret =3D PTR_ERR(bus_clk);
> +		if (ret !=3D -EPROBE_DEFER)
> +			dev_err(&pdev->dev,
> +				"Couldn't get reset control: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* The bus clock needs to be enabled for us to access the registers */
> +	ret =3D clk_prepare_enable(bus_clk);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Couldn't enable bus clk: %d\n", ret);
> +		return ret;
> +	}

That looks inefficient if none of the clocks are enabled. Maybe you
can use CLK_OPS_PARENT_ENABLE?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--yfmtkozrres32xcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYreH9AAoJEBx+YmzsjxAge4kP/04BgWkSsCF3zbKcFngMJV/+
ic9es+C9CYoQrWNgRhrZSF1r5pOeBHaqoTxuJ8PmkROlXPuBmuUvpDY7HK5SEdVP
6WE0W+qAcNhFxrP0c8I/Qgg+v3t7//A9tJWnKkPWuBxxVjxS0Wd/BRbDdy3MPOBB
F79h6DIKrwVNHiqBZ5BvIZhRMkE261Hkkjb7ZrnEFffEg/OD740HcGcMns+/INqM
sU+qrbvsuYrN/cJLPq2l6PxwqKPHe/S33Lv29+0icEE1BX5dzuaP7nq2cfPQEmpr
XGQiTQ4BQj+Ha2JL9gYr+XjBzh5FB85uL08RV27JhAG9l37i6VDe+Eo4JL/Qi9t5
/6HZHiLHOg37eY5S568t3ayZtsXeTo3tRDN95SFBsjFYE7LSyTIKG9/l+cA2g+UP
VN7CZWIDqaFtiv17oaZH5hWR+QwM6HkT1t5ssVkwLf3t9lmdnsn31dRSUuIAI9Kd
oaG8R7MvidmSzgywNwd6TOS2cCuLtbMWlGInjaPx0vJ2odC+i7jR8PFHSC4CXwld
Dza0LpX0gkgf0lxknafMKTB+eulJ/zFHpjJJ3j1ijgJGHgYjRFEwkURX7YYnOKIy
VdJjaFQTLEYCjK/I+IsvpRDjWEeqaRym3CHPdF0uOVjzQcqW/6ff9q4QP2iIOjhn
MX3FergX8qSnXSIBYu5k
=Tqlf
-----END PGP SIGNATURE-----

--yfmtkozrres32xcm--


--===============4945561542660012626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4945561542660012626==--
