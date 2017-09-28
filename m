Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:39853 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751082AbdI1K2F (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Sep 2017 06:28:05 -0400
Date: Thu, 28 Sep 2017 12:27:52 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 1/3] clk: sunxi-ng: add mux and pll notifiers for A64 CPU
 clock
Message-ID: <20170928102752.ceo54qccqakb4xyx@flea>
References: <20170923001531.14285-1-icenowy@aosc.io>
 <20170923001531.14285-2-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="fyb5mloqkdqrtwkq"
In-Reply-To: <20170923001531.14285-2-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--fyb5mloqkdqrtwkq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Sep 23, 2017 at 12:15:29AM +0000, Icenowy Zheng wrote:
> The A64 PLL_CPU clock has the same instability if some factor changed
> without the PLL gated like other SoCs with sun6i-style CCU, e.g. A33,
> H3.
>=20
> Add the mux and pll notifiers for A64 CPU clock to workaround the
> problem.
>=20
> Fixes: c6a0637460c2 ("clk: sunxi-ng: Add A64 clocks")
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng=
/ccu-sun50i-a64.c
> index 2bb4cabf802f..b55fa69dd0c1 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> @@ -879,11 +879,26 @@ static const struct sunxi_ccu_desc sun50i_a64_ccu_d=
esc =3D {
>  	.num_resets	=3D ARRAY_SIZE(sun50i_a64_ccu_resets),
>  };
> =20
> +static struct ccu_pll_nb sun50i_a64_pll_cpu_nb =3D {
> +	.common	=3D &pll_cpux_clk.common,
> +	/* copy from pll_cpux_clk */
> +	.enable	=3D BIT(31),
> +	.lock	=3D BIT(28),
> +};
> +
> +static struct ccu_mux_nb sun50i_a64_cpu_nb =3D {
> +	.common		=3D &cpux_clk.common,
> +	.cm		=3D &cpux_clk.mux,
> +	.delay_us	=3D 1, /* > 8 clock cycles at 24 MHz */
> +	.bypass_index	=3D 1, /* index of 24 MHz oscillator */
> +};
> +
>
>  static int sun50i_a64_ccu_probe(struct platform_device *pdev)
>  {
>  	struct resource *res;
>  	void __iomem *reg;
>  	u32 val;
> +	int ret;
> =20
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	reg =3D devm_ioremap_resource(&pdev->dev, res);
> @@ -897,7 +912,18 @@ static int sun50i_a64_ccu_probe(struct platform_devi=
ce *pdev)
> =20
>  	writel(0x515, reg + SUN50I_A64_PLL_MIPI_REG);
> =20
> -	return sunxi_ccu_probe(pdev->dev.of_node, reg, &sun50i_a64_ccu_desc);
> +	ret =3D sunxi_ccu_probe(pdev->dev.of_node, reg, &sun50i_a64_ccu_desc);
> +	if (ret)
> +		return ret;
> +
> +	/* Gate then ungate PLL CPU after any rate changes */
> +	ccu_pll_notifier_register(&sun50i_a64_pll_cpu_nb);
> +
> +	/* Reparent CPU during PLL CPU rate changes */
> +	ccu_mux_notifier_register(pll_cpux_clk.common.hw.clk,
> +				  &sun50i_a64_cpu_nb);
> +
> +	return 0;

So this is the fourth user of the exact same code, can you turn that
into a shared function?

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--fyb5mloqkdqrtwkq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZzM6oAAoJEBx+YmzsjxAgipUQAJl1rj7vv+GlzCsFl1sTIIE3
op+ZWxxXv+Bv+VxtZBQS+PowEdnWMFHHypubUWg0E2LknOP8QI7dPFfAD30Q2H82
KlARA6hEHKKvdmiiJwLIlK2CXLadstUCaZqFFnAHOLqwz+PSNUq5UlqGVQF5hB9N
ALqbIB6/GZnVOWEHXM1GtSgz+suGR7thIHg0vUnzsF1Vvxha/gaWVOxTiU72h3Dr
I8r1LRazePshywzoJhJzqHa1dbiBQZDLSTfhj0XrGnUMqLWzQqPYr9Szbcm1AJWJ
bYLcCcVqq/vHnhrZ7PUav+cBJi55GywcsOfABYAkFaPDl+x9wqLV+uG6blsNRqiL
5lST2MWlb+F5YG09JEle9py5Ka2+FzUkkqM9Jv9RC9U4y6XTA6Q2LTD3AU55iNmq
ASXL7d6ZrM+fRhAYIwQlpcXu6PfDspgl3OyX362k0qK6T+K+Yzlf9dwZ2Xm87l5T
xOF1ttVuuTeRMjfZM6e9iDxb3Fefpi9aiPu8MhOJRJiEr1fpWbAlUlCXlsZ1iz4i
pn1Tz4NmZ4rP2FtBRzOwVjb50uIt+3P4GHwImdUl6Wc7ybAr82W1X7QxdTJPdF2Z
6N3VgwjqN4IvFR5HPssGQqduYVRFQJOb+mrHGzr6SEYUD3FIJqpuwduBOLXPjqT8
m0duQ4IjmZh/MMTjDEt6
=w7WL
-----END PGP SIGNATURE-----

--fyb5mloqkdqrtwkq--
