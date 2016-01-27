Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 27 Jan 2016 16:37:22 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio.lopez@collabora.co.uk>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, wens@csie.org,
	heiko@sntech.de, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] clk: sunxi: delay protected clocks until arch
 initcall
Message-ID: <20160127153722.GC4317@lukather>
References: <1453385439-10154-1-git-send-email-emilio.lopez@collabora.co.uk>
 <1453385439-10154-2-git-send-email-emilio.lopez@collabora.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wxDdMuZNg1r63Hyj"
In-Reply-To: <1453385439-10154-2-git-send-email-emilio.lopez@collabora.co.uk>
List-ID: <linux-clk.vger.kernel.org>


--wxDdMuZNg1r63Hyj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Emilio,

On Thu, Jan 21, 2016 at 11:10:38AM -0300, Emilio L=F3pez wrote:
> Clocks are registered early on, and unused clocks get disabled on
> late initcall, so we can delay protecting important clocks a bit.
> If we do this too early, it may happen that some clocks are orphans
> and therefore enabling them may not work as intended. If we do this
> too late, a driver may reparent some clock and cause another important
> clock to be disabled as a byproduct.
>=20
> arch_initcall should be a good spot to do this, as clock drivers using
> the OF mechanisms will be all registered by then, and drivers won't
> have started probing yet.
>=20
> Signed-off-by: Emilio L=F3pez <emilio.lopez@collabora.co.uk>
> ---
>  drivers/clk/sunxi/clk-sunxi.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
> index 5ba2188..285e8ee 100644
> --- a/drivers/clk/sunxi/clk-sunxi.c
> +++ b/drivers/clk/sunxi/clk-sunxi.c
> @@ -1153,10 +1153,12 @@ static void __init of_sunxi_table_clock_setup(con=
st struct of_device_id *clk_mat
>  	}
>  }
> =20
> +/* By default, don't protect any clocks */
> +static const char **protected_clocks __initdata;
> +static int protected_clocks_nr __initdata;
> +
>  static void __init sunxi_init_clocks(const char *clocks[], int nclocks)
>  {
> -	unsigned int i;
> -
>  	/* Register divided output clocks */
>  	of_sunxi_table_clock_setup(clk_divs_match, sunxi_divs_clk_setup);
> =20
> @@ -1169,14 +1171,26 @@ static void __init sunxi_init_clocks(const char *=
clocks[], int nclocks)
>  	/* Register mux clocks */
>  	of_sunxi_table_clock_setup(clk_mux_match, sunxi_mux_clk_setup);
> =20
> +	/* We shall protect these clocks when everything is ready */
> +	protected_clocks =3D clocks;
> +	protected_clocks_nr =3D nclocks;
> +}
> +
> +static int __init sunxi_init_clock_protection(void)
> +{
> +	unsigned int i;
> +
>  	/* Protect the clocks that needs to stay on */
> -	for (i =3D 0; i < nclocks; i++) {
> -		struct clk *clk =3D clk_get(NULL, clocks[i]);
> +	for (i =3D 0; i < protected_clocks_nr; i++) {
> +		struct clk *clk =3D clk_get(NULL, protected_clocks[i]);
> =20
>  		if (!IS_ERR(clk))
>  			clk_prepare_enable(clk);
>  	}
> +
> +	return 0;
>  }
> +arch_initcall(sunxi_init_clock_protection);

You also need to filter that by the machine compatible in case you're
running it on a !sunxi SoC.

Overall, I'm a bit skeptical about the approach. It doesn't really fix
everything, just hides it behind a curtain, and I'm pretty sure the
clocks not registered by this code would still be broken (the mod0
clocks for example).

The real fix would be to make sure we don't have any orphan clock in
the first place, by using CLK_OF_DECLARE everywhere. I did submit a
patch doing just that when the clocks broke, but I never got any
answer to it. I thought the patches were simply dropped and the
rockchip people just took another approach.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--wxDdMuZNg1r63Hyj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWqOQyAAoJEBx+YmzsjxAgjXcP/18Wrz0u5aqOOFqZc3gGZoY3
UAb6vGwKCtH/QH6ZcnQ+tHeQ4MLiFD5PAj4NcOzGbDmpT+BP6R/Lb7RAzDW/u0sM
od4r/V9N5nmmzptFd87DC8EDNKzU4kOMuz/1/GrFcjG4SFf9SqqYkMrc4HDbF7m9
0ZkJ/sXUMmOf2YXqVkKho0Ge/IvdewbkWqVTr4bq7tAzNLdzWyuzPdg2MTeE8wQb
NjoMevIFaJeQ84QIZh1ach5AhuCbGYiyKtlBI7mM1mU4mkDHOhhBU4zNVeqDIGnZ
LMuSsjqvmeRf4J3PMilxwcRbD8Cy2n+xwYIzwAMEk7rYV50rzxkk32erSLWBOT1j
alWHIk508nAyvZL7BYK0fJfI4UITMWf8ArGhrT8iUu8NCeeEGXRZk1mmQBiL37aL
vshiD5Kxg4dpnN1zEAbl9cKmOltF8ZMBJfv/9sG8U/rvL2vo0KnaA8BWrs5gSoAA
6OyhHx+r0DMjvibUKXLlcER9Wx8GDlufeqQqYkLh8MRSvwjPiztOdhqBk6T2Oudm
Gi6Esa0vK6Su/h3C539NJcoU3P5YUqavowopa6W5NlD0q1cGmsTP8FlcxDk33dQd
no65FmKg+GxSxRclwKvgSQyQJpM/3wZpBnkdRoYZ2pSoTZzqyUYJ7ZZcYkqu2PP8
AXiDCDjTe0E0xXmmsXUy
=GoGR
-----END PGP SIGNATURE-----

--wxDdMuZNg1r63Hyj--
