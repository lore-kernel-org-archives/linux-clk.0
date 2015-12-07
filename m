Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 7 Dec 2015 10:36:22 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Emilio Lopez <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH v5] clk: sunxi: Add CLK_OF_DECLARE support for
 sun8i-a23-apb0-clk driver
Message-ID: <20151207093622.GE27957@lukather>
References: <1449126330-21595-1-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dzs2zDY0zgkG72+7"
In-Reply-To: <1449126330-21595-1-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--Dzs2zDY0zgkG72+7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Dec 03, 2015 at 03:05:30PM +0800, Chen-Yu Tsai wrote:
> The APBS clock on sun9i is the same as the APB0 clock on sun8i. With
> sun9i we are supporting the PRCM clocks by using CLK_OF_DECLARE,
> instead of through a PRCM mfd device and subdevices for each clock
> and reset control. As such we need a CLK_OF_DECLARE version of
> the sun8i-a23-apb0-clk driver.
>=20
> Also, build it for sun9i/A80, and not just for configurations with
> MFD_SUN6I_PRCM enabled.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>=20
> Changes since v4:
>=20
>   - Keep building clk-sun8i-apb0 for SUN6I_MFD_PRCM.
>=20
>   - Add an error message and comment for when of_io_request_and_map()
>     fails. of_io_request_and_map() merges a bunch of errors into -EINVAL,
>     so this might not be the best approach. But I think having an error
>     message when we know something is wrong (-EBUSY, -ENOMEM) is better.
>=20
> ---
>  drivers/clk/sunxi/Makefile         |  1 +
>  drivers/clk/sunxi/clk-sun8i-apb0.c | 80 ++++++++++++++++++++++++++++++++=
------
>  2 files changed, 69 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
> index 103efab05ca8..ccf21ba3b6b0 100644
> --- a/drivers/clk/sunxi/Makefile
> +++ b/drivers/clk/sunxi/Makefile
> @@ -15,6 +15,7 @@ obj-y +=3D clk-sun9i-core.o
>  obj-y +=3D clk-sun9i-mmc.o
>  obj-y +=3D clk-usb.o
> =20
> +obj-$(CONFIG_MACH_SUN9I) +=3D clk-sun8i-apb0.o
>  obj-$(CONFIG_MACH_SUN9I) +=3D clk-sun9i-cpus.o
> =20
>  obj-$(CONFIG_MFD_SUN6I_PRCM) +=3D \
> diff --git a/drivers/clk/sunxi/clk-sun8i-apb0.c b/drivers/clk/sunxi/clk-s=
un8i-apb0.c
> index 7ae5d2c2cde1..7ba61103a6f5 100644
> --- a/drivers/clk/sunxi/clk-sun8i-apb0.c
> +++ b/drivers/clk/sunxi/clk-sun8i-apb0.c
> @@ -17,13 +17,77 @@
>  #include <linux/clk-provider.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <linux/platform_device.h>
> =20
> +static struct clk *sun8i_a23_apb0_register(struct device_node *node,
> +					   void __iomem *reg)
> +{
> +	const char *clk_name =3D node->name;
> +	const char *clk_parent;
> +	struct clk *clk;
> +	int ret;
> +
> +	clk_parent =3D of_clk_get_parent_name(node, 0);
> +	if (!clk_parent)
> +		return ERR_PTR(-EINVAL);
> +
> +	of_property_read_string(node, "clock-output-names", &clk_name);
> +
> +	/* The A23 APB0 clock is a standard 2 bit wide divider clock */
> +	clk =3D clk_register_divider(NULL, clk_name, clk_parent, 0, reg,
> +				   0, 2, CLK_DIVIDER_POWER_OF_TWO, NULL);
> +	if (IS_ERR(clk))
> +		return clk;
> +
> +	ret =3D of_clk_add_provider(node, of_clk_src_simple_get, clk);
> +	if (ret)
> +		goto err_unregister;
> +
> +	return clk;
> +
> +err_unregister:
> +	clk_unregister_divider(clk);
> +
> +	return ERR_PTR(ret);
> +}
> +
> +static void sun8i_a23_apb0_setup(struct device_node *node)
> +{
> +	void __iomem *reg;
> +	struct resource res;
> +	struct clk *clk;
> +
> +	reg =3D of_io_request_and_map(node, 0, of_node_full_name(node));
> +	if (IS_ERR(reg)) {
> +		/*
> +		 * This happens with clk nodes instantiated through mfd,
> +		 * as those do not have their resources assigned in the
> +		 * device tree. Do not print an error in this case.
> +		 */
> +		if (PTR_ERR(reg) !=3D -EINVAL)
> +			pr_err("Could not get registers for a23-apb0-clk\n");

This is not the only case you have to take into account.

There's also the case when you have a regular clock (and by regular I
mean that is not in the PRCM) that will be probed by the
CLK_OF_DECLARE mechanism and then later by the device model.

In such a case, the second of_io_request_and_map will fail, and you
will have an error returned that you do not ignore at the moment.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Dzs2zDY0zgkG72+7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWZVMWAAoJEBx+YmzsjxAg7KkQAIOtvcYBxyhu4FNBaxWp7ivs
ws2/iart4gQf0mk/RDjtKYuQWiQ8saXjjNRiHXlXbldm340QXvXSTA4lh1TFrhKr
LDpcHfyN2sfTfI70YUjVoN5Rdrj6JP4d3oItuyLfdW54ERRQSsBbk3H9h36ujv8c
uXCb2qkQRkqEDZtz1lRux0PYTx+so9X62EQo0yIg/zThxZdl212OLVm/xLhlvo23
uzmAyErcx4c1FaJtnyWlwkIDGFQjhTQ2MusWLgjPFIVRHW3IuVIdTfFPo+y8UYS5
mMjLdr3FJjqsDkNngpLfTlS8PF7LofFZOCr5pef+Ed30ASteLHyYqPWI3UncsfnE
OdpCYey2PyAM3o2vHhntQ1fS6zQNebI9LdhicNYkYh5aea1gDsKaJPonCUnDao2D
c71IHM81GOdlce0uIYUt5Wh0g3dk3CqLjS9q7nz2LpNEh/RhPWP5T3hsmG9/+56k
XoGTk8VPEVsuBSipm0kTn1kbsYSquvN6R+zCTkrc/aDavUzQG7zFy+P5Erx7LYXZ
Ny2OBPe4mya4S0OHULGP3//g2ZLkiXCsZ8SICPV5OOEPv/a2imVfGDpLKDhuvYXL
zYXOlDu2HAVAbLpl3T70lRcJwB1ohtz4z4ZVURYpOeGjgv5vFy/yA2zSU75/le0k
2BGKZjkyZVmtpcb1Hei1
=7e5z
-----END PGP SIGNATURE-----

--Dzs2zDY0zgkG72+7--
