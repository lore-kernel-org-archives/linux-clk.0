Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 5 Dec 2017 20:59:56 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 2/2] clk: sunxi-ng: sun50i: a64: Add 2x fixed
 post-divider to MMC module clocks
Message-ID: <20171205195956.xdil2dsbtfwx35jj@flea.lan>
References: <20171204051912.7485-1-wens@csie.org>
 <20171204051912.7485-3-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7v6tshqn5bujnvtl"
In-Reply-To: <20171204051912.7485-3-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--7v6tshqn5bujnvtl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 04, 2017 at 01:19:12PM +0800, Chen-Yu Tsai wrote:
> On the A64, the MMC module clocks are fixed in the new timing mode,
> i.e. they do not have a bit to select the mode. These clocks have
> a 2x divider somewhere between the clock and the MMC module.
>=20
> To be consistent with other SoCs supporting the new timing mode,
> we model the 2x divider as a fixed post-divider on the MMC module
> clocks.
>=20
> This patch adds the post-dividers to the MMC clocks.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

I had a doubt applying that one... sorry.

> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 57 +++++++++++++++++++++++------=
------
>  1 file changed, 37 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng=
/ccu-sun50i-a64.c
> index 2bb4cabf802f..ee9c12cf3f08 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> @@ -400,28 +400,45 @@ static SUNXI_CCU_MP_WITH_MUX_GATE(nand_clk, "nand",=
 mod0_default_parents, 0x080,
>  				  BIT(31),	/* gate */
>  				  0);
> =20
> +/*
> + * MMC clocks are the new timing mode (see A83T & H3) variety, but witho=
ut
> + * the mode switch. This means they have a 2x post divider between the c=
lock
> + * and the MMC module. This is not documented in the manual, but is taken
> + * into consideration when setting the mmc module clocks in the BSP kern=
el.
> + * Without it, MMC performance is degraded.
> + *
> + * We model it here to be consistent with other SoCs supporting this mod=
e.
> + * The alternative would be to add the 2x multiplier when setting the MMC
> + * module clock in the MMC driver, just for the A64.
> + */
>  static const char * const mmc_default_parents[] =3D { "osc24M", "pll-per=
iph0-2x",
>  						    "pll-periph1-2x" };
> -static SUNXI_CCU_MP_WITH_MUX_GATE(mmc0_clk, "mmc0", mmc_default_parents,=
 0x088,
> -				  0, 4,		/* M */
> -				  16, 2,	/* P */
> -				  24, 2,	/* mux */
> -				  BIT(31),	/* gate */
> -				  0);
> -
> -static SUNXI_CCU_MP_WITH_MUX_GATE(mmc1_clk, "mmc1", mmc_default_parents,=
 0x08c,
> -				  0, 4,		/* M */
> -				  16, 2,	/* P */
> -				  24, 2,	/* mux */
> -				  BIT(31),	/* gate */
> -				  0);
> -
> -static SUNXI_CCU_MP_WITH_MUX_GATE(mmc2_clk, "mmc2", mmc_default_parents,=
 0x090,
> -				  0, 4,		/* M */
> -				  16, 2,	/* P */
> -				  24, 2,	/* mux */
> -				  BIT(31),	/* gate */
> -				  0);
> +static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc0_clk, "mmc0",
> +					  mmc_default_parents, 0x088,
> +					  0, 4,		/* M */
> +					  16, 2,	/* P */
> +					  24, 2,	/* mux */
> +					  BIT(31),	/* gate */
> +					  2,		/* post-div */
> +					  0);
> +
> +static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc1_clk, "mmc1",
> +					  mmc_default_parents, 0x08c,
> +					  0, 4,		/* M */
> +					  16, 2,	/* P */
> +					  24, 2,	/* mux */
> +					  BIT(31),	/* gate */
> +					  2,		/* post-div */
> +					  0);
> +

Are you sure that the divider there for the non-eMMC clocks? Usually,
the new mode is only here for the eMMC, so we would divide the rate by
two in the non-eMMC case.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--7v6tshqn5bujnvtl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlom+rcACgkQ0rTAlCFN
r3Sx2A//aHYZpu4YLrWAtRoV+/4NAGaq3fcDW1ZpuOoeSZdGSmeVcnAFJi1uQ5xt
LZhbHhbEQEa0odlz25Yz9lwXhDZOB5skyZYoHJfmoUCyw/CKd04rT54Xnqm190wj
+glZOBrTtTBuXdjFWgym0lamQJk2ID4chZFxzVpa8Qf4vj+kBj30s7p4fYH4Qf0l
VMnaI47kpBd4A2UYppalU/kwJQ5ivniZC4xn8uTLHBIV9fAX2HqPH3tcMWq3ViNC
+0BeGDmleTSYYvVo0LBE9rxaDpn3Yn50c11aHh47xwY5ELZB//f6xOlEXalfX9a9
3j7s8Ld1GXB5iiFFlRNR+SSWpVF5oKt1s2Q4LShyh55Z7OWgwOcBAeiNPKNDsfpy
vgzfQfwjTTUgttIHmrN+Zu5jimkTR3kR6+whp7GKtuGg+SpEAi1eJhDN0x5GO1on
vtd08rUy8MFSQSH66ZLhQYsUe3WAC8txU4vJe64vtb/BMRowUCHWdiaiFBsB/Uh2
iY5jdC02hqC8t5kurd2zmn9Diz3HypzT22eCmGmG62tagkYNAy+5+0cyQ0gqI+in
tXYshceY4gxTLbJXnK3oS2ItLnNR8cxHQHS5q3QqQFBKT/qQZyVaf6ZmIDyRkccG
YFVhIBJI5IS4a5l7tQ3u6uq4IQpr7phn9dKelOAodnCQt5JSGsY=
=2fNx
-----END PGP SIGNATURE-----

--7v6tshqn5bujnvtl--
