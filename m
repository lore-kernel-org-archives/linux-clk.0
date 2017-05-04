Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Thu, 4 May 2017 14:50:55 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v6 02/13] clk: sunxi-ng: add support for DE2 CCU
Message-ID: <20170504125055.uvcl4ov4bxzis4um@lukather>
References: <20170504114858.9008-1-icenowy@aosc.io>
 <20170504114858.9008-3-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="njmu7voz264w32d4"
In-Reply-To: <20170504114858.9008-3-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--njmu7voz264w32d4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2017 at 07:48:47PM +0800, Icenowy Zheng wrote:
> The "Display Engine 2.0" in Allwinner newer SoCs contains a clock
> management unit for its subunits, like the DE CCU in A80.
>=20
> Add a sunxi-ng style driver for it.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Changes in v5:
> - Removed dt-bindings headers (they're now in patch 1).
> Changes in v4:
> - Fixed the inconsistence between mixer_div clocks' number and real clock.
> Changes in v2:
> - Rename sunxi-de2-ccu to sun8i-de2-ccu.
>=20
>  drivers/clk/sunxi-ng/Kconfig         |   5 +
>  drivers/clk/sunxi-ng/Makefile        |   1 +
>  drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 218 +++++++++++++++++++++++++++++=
++++++
>  drivers/clk/sunxi-ng/ccu-sun8i-de2.h |  28 +++++
>  4 files changed, 252 insertions(+)
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-de2.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-de2.h
>=20
> diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
> index 64088e599404..2e4d804fbf61 100644
> --- a/drivers/clk/sunxi-ng/Kconfig
> +++ b/drivers/clk/sunxi-ng/Kconfig
> @@ -140,6 +140,11 @@ config SUN8I_V3S_CCU
>  	default MACH_SUN8I
>  	depends on MACH_SUN8I || COMPILE_TEST
> =20
> +config SUN8I_DE2_CCU
> +	bool "Support for the Allwinner SoCs DE2 CCU"
> +	select SUNXI_CCU_DIV
> +	select SUNXI_CCU_GATE
> +
>  config SUN9I_A80_CCU
>  	bool "Support for the Allwinner A80 CCU"
>  	select SUNXI_CCU_DIV
> diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefile
> index 0ec02fe14c50..be616279450e 100644
> --- a/drivers/clk/sunxi-ng/Makefile
> +++ b/drivers/clk/sunxi-ng/Makefile
> @@ -25,6 +25,7 @@ obj-$(CONFIG_SUN8I_A23_CCU)	+=3D ccu-sun8i-a23.o
>  obj-$(CONFIG_SUN8I_A33_CCU)	+=3D ccu-sun8i-a33.o
>  obj-$(CONFIG_SUN8I_H3_CCU)	+=3D ccu-sun8i-h3.o
>  obj-$(CONFIG_SUN8I_V3S_CCU)	+=3D ccu-sun8i-v3s.o
> +obj-$(CONFIG_SUN8I_DE2_CCU)	+=3D ccu-sun8i-de2.o
>  obj-$(CONFIG_SUN8I_R_CCU)	+=3D ccu-sun8i-r.o
>  obj-$(CONFIG_SUN9I_A80_CCU)	+=3D ccu-sun9i-a80.o
>  obj-$(CONFIG_SUN9I_A80_CCU)	+=3D ccu-sun9i-a80-de.o
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/=
ccu-sun8i-de2.c
> new file mode 100644
> index 000000000000..adb2c344692a
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> @@ -0,0 +1,218 @@
> +/*
> + * Copyright (c) 2017 Icenowy Zheng <icenowy@aosc.io>
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
> +#include "ccu-sun8i-de2.h"
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
> +		[CLK_MIXER0_DIV]	=3D &mixer0_div_clk.common.hw,
> +		[CLK_MIXER1_DIV]	=3D &mixer1_div_clk.common.hw,
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
> +	struct clk *bus_clk, *mod_clk;
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
> +	mod_clk =3D devm_clk_get(&pdev->dev, "mod");
> +	if (IS_ERR(mod_clk)) {
> +		ret =3D PTR_ERR(mod_clk);
> +		if (ret !=3D -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "Couldn't get mod clk: %d\n", ret);
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
> +	/* The clocks need to be enabled for us to access the registers */
> +	ret =3D clk_prepare_enable(bus_clk);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Couldn't enable bus clk: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D clk_prepare_enable(mod_clk);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Couldn't enable mod clk: %d\n", ret);
> +		return ret;

You're leaving the bus clock enabled here if it fails.

> +	}
> +
> +	/* The reset control needs to be asserted for the controls to work */
> +	ret =3D reset_control_deassert(rstc);
> +	if (ret) {
> +		dev_err(&pdev->dev,
> +			"Couldn't deassert reset control: %d\n", ret);
> +		goto err_disable_clk;
> +	}
> +
> +	ret =3D sunxi_ccu_probe(pdev->dev.of_node, reg, ccu_desc);
> +	if (ret)
> +		goto err_assert_reset;
> +
> +	return 0;
> +
> +err_assert_reset:
> +	reset_control_assert(rstc);

And here you're leaving the mod_clk enabled

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--njmu7voz264w32d4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZCyOqAAoJEBx+YmzsjxAgrcAP/RB0kQvj5t2uxKRoj5WbfWmJ
EjfUEk8xsJ36nX/XQaWiVAJKq4QLL//h/LVtw/7qbZUc3JozW6riWr1YGD7K18Wu
AY+4ArKBnHj2frDR1+Y+m8DZWItKYF6z/lUzDDa/k6LQHiS/LfdXAHOVGiGCyTWr
lCfgeoqlRf2TJc9DB91d956K8M4R3qT5BcHoRXtgNHuVgzw9vYQ4zMWApple9bCh
xiVJAbTTwyipMmqw44gU9sjriz9MoySNKwREzr7AXjUBk0FqgD5CCgUsk9XVWM1s
KrWl2mXblDgLXXN7EBFfVbXNZAV/dpRzzXoboAUu6UjEAzv0dzp/dKxQzWt8/YcS
rSl6OsMCzW99Vgh1w+WUQGEb3TGFvBsjOqaxcKQyRpzHQaWz/GzdKrx666stn8qi
JftCEDa6HnBASYY2N/rHiDEM+nsE0Y9GKuSXjJuEYYXrnTCRwtm3nenpeNvmOiCE
xdsECNSJ3f7xUN884X5Ha3yPNf48EhhNDS+oDu3/U840ZdfBqFNM9AE0dCjg0Eqg
C1opAXsKoMMqtcdVvYdvdTTgu/99phZF5+GJ9xwr96ICWmFaPa8Ydy8FiuEKn1DY
1/mAsNyfRUyIKNPrlf/mz0WnTCAjoerfqVYBqNvSuvZBH88YpSEysnCq7KM+9MV9
lCZ943g2HfB1HeLdasWC
=LjIg
-----END PGP SIGNATURE-----

--njmu7voz264w32d4--
