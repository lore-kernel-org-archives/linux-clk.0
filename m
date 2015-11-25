Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 25 Nov 2015 18:32:52 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH v3 3/5] clk: sunxi: Add sun9i A80 cpus (cpu special)
 clock support
Message-ID: <20151125173252.GN32142@lukather>
References: <1448357536-26613-1-git-send-email-wens@csie.org>
 <1448357536-26613-4-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TYLBaaOo3Zs/tS0r"
In-Reply-To: <1448357536-26613-4-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--TYLBaaOo3Zs/tS0r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 24, 2015 at 05:32:14PM +0800, Chen-Yu Tsai wrote:
> The "cpus" clock is the clock for the embedded processor in the A80.
> It is also part of the PRCM clock tree. This clock includes a pre-
> divider on one of its inputs. For now we are using a custom clock
> driver for it. In the future we may want to develop a generalized
> driver for these types of clocks, which also includes the AHB clock
> driver on sun[5678]i.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>=20
> Hi Maxime,
>=20
> I'll do the factors clock refactoring mentioned during the discussion
> around v2 later on.

I have no idea what you are talking about :)

>=20
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt |   1 +
>  drivers/clk/sunxi/Makefile                        |   1 +
>  drivers/clk/sunxi/clk-sun9i-cpus.c                | 240 ++++++++++++++++=
++++++
>  3 files changed, 242 insertions(+)
>  create mode 100644 drivers/clk/sunxi/clk-sun9i-cpus.c
>=20
> diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Document=
ation/devicetree/bindings/clock/sunxi.txt
> index b6859ed6913f..153ac72869e8 100644
> --- a/Documentation/devicetree/bindings/clock/sunxi.txt
> +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
> @@ -27,6 +27,7 @@ Required properties:
>  	"allwinner,sun5i-a10s-ahb-gates-clk" - for the AHB gates on A10s
>  	"allwinner,sun7i-a20-ahb-gates-clk" - for the AHB gates on A20
>  	"allwinner,sun6i-a31-ar100-clk" - for the AR100 on A31
> +	"allwinner,sun9i-a80-cpus-clk" - for the CPUS on A80
>  	"allwinner,sun6i-a31-ahb1-clk" - for the AHB1 clock on A31
>  	"allwinner,sun6i-a31-ahb1-gates-clk" - for the AHB1 gates on A31
>  	"allwinner,sun8i-a23-ahb1-gates-clk" - for the AHB1 gates on A23
> diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
> index 121333ce34ea..07d914c3f6d1 100644
> --- a/drivers/clk/sunxi/Makefile
> +++ b/drivers/clk/sunxi/Makefile
> @@ -13,6 +13,7 @@ obj-y +=3D clk-simple-gates.o
>  obj-y +=3D clk-sun8i-apb0.o
>  obj-y +=3D clk-sun8i-mbus.o
>  obj-y +=3D clk-sun9i-core.o
> +obj-y +=3D clk-sun9i-cpus.o

Same thing here, if it's only used in the A80, just compile it when
ARCH_SUN9I is compiled.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--TYLBaaOo3Zs/tS0r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWVfDEAAoJEBx+YmzsjxAgyXYP/R7WPJPXi3buvDoX+1saiCKn
6jlJtOqrTi8YEEoVJvsLyL84aZogzW9sSjvlqlMKyQWNXO9LTA9f5+PczgCvPxTx
G1DMy8I7qfhu210GBdp9I2inj59E4UZ2FtEBPfa4AVs8zchd/+UCpdd+p5RoqJ2i
vevXb5rqp1StZtxAcMx4p96R2uHKY1+AciojVKwUQXxsq9jkCY49ex8bRyJafOuk
n9w60yRxqukz2LLhf0ZhAR0TMRP98kgerKN2GYvmb0Slt2xp2bEWQpJHIDiVgpdl
8SnkUF4iAvdeRqUnDXI6hQsdrU+cGKnNngAc7vDVUQwMOmgawQPKHEXw6qRKKkx0
RHh2KurXNsHa54bYSDISeWDt+wlekQQ8LKN+Mc0and5OIeUKwuPskyAexN99URCt
W0lem3hfDtkieQ3ZLvC3I0h1mmKaZ0/bccV5goA1qIvt2yPVgGZBBoe9ILUPI8x+
7OWg7x3TBnPCPV9RIGeHgJTtqYDQsJ3aypgdLAS3K70kRP4eIbQN7rEY2IbSr2k7
5/iK338e5JkIEMaXplJaMydeT6x/gYqNKbkTFb+2/BDymEVY3y2XHQB50bOyqPs0
6yHwAehNtsVnoeLow3mrhWykBcNIpLOqOP/Dg/1e8iqjGQ30aPzsUJcf4E3SV6Ru
Z3TJ2MVyfvMvKfldAnyi
=bsCH
-----END PGP SIGNATURE-----

--TYLBaaOo3Zs/tS0r--
