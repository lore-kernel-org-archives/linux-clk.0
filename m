Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 27 Jul 2016 08:48:09 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, dev@linux-sunxi.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/9] clk: sunxi-ng: mux: Add support for mux tables
Message-ID: <20160727064809.GC6560@lukather>
References: <1469516671-19377-1-git-send-email-wens@csie.org>
 <1469516671-19377-5-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0vzXIDBeUiKkjNJl"
In-Reply-To: <1469516671-19377-5-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--0vzXIDBeUiKkjNJl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 26, 2016 at 03:04:26PM +0800, Chen-Yu Tsai wrote:
> Some clock muxes have holes, i.e. invalid or unconnected inputs,
> between parent mux values.
>=20
> Add support for specifying a mux table to map clock parents to
> mux values.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  drivers/clk/sunxi-ng/ccu_mux.c | 12 ++++++++++++
>  drivers/clk/sunxi-ng/ccu_mux.h | 12 ++++++++++--
>  2 files changed, 22 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mu=
x.c
> index 1329b9ab481e..68b32f168a74 100644
> --- a/drivers/clk/sunxi-ng/ccu_mux.c
> +++ b/drivers/clk/sunxi-ng/ccu_mux.c
> @@ -107,6 +107,15 @@ u8 ccu_mux_helper_get_parent(struct ccu_common *comm=
on,
>  	parent =3D reg >> cm->shift;
>  	parent &=3D (1 << cm->width) - 1;
> =20
> +	if (cm->table) {
> +		int num_parents =3D clk_hw_get_num_parents(&common->hw);
> +		int i;
> +
> +		for (i =3D 0; i < num_parents; i++)
> +			if (cm->table[i] =3D=3D parent)
> +				return i;
> +	}
> +
>  	return parent;
>  }
> =20
> @@ -117,6 +126,9 @@ int ccu_mux_helper_set_parent(struct ccu_common *comm=
on,
>  	unsigned long flags;
>  	u32 reg;
> =20
> +	if (cm->table)
> +		index =3D cm->table[index];
> +
>  	spin_lock_irqsave(common->lock, flags);
> =20
>  	reg =3D readl(common->base + common->reg);
> diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_mu=
x.h
> index d35ce5e93840..f0078de78712 100644
> --- a/drivers/clk/sunxi-ng/ccu_mux.h
> +++ b/drivers/clk/sunxi-ng/ccu_mux.h
> @@ -6,8 +6,9 @@
>  #include "ccu_common.h"
> =20
>  struct ccu_mux_internal {
> -	u8	shift;
> -	u8	width;
> +	u8		shift;
> +	u8		width;
> +	const u8	*table;
> =20
>  	struct {
>  		u8	index;
> @@ -21,6 +22,13 @@ struct ccu_mux_internal {
>  	} variable_prediv;
>  };
> =20
> +#define SUNXI_CLK_MUX_TABLE(_shift, _width, _table)	\
> +	{						\
> +		.shift	=3D _shift,			\
> +		.width	=3D _width,			\
> +		.table	=3D _table,			\
> +	}
> +

I basically had the exact same patch done a few days ago :)

This is in my A64 serie, together with some cleanup on that macro that
is not consistent with the other internal structures.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--0vzXIDBeUiKkjNJl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXmFkpAAoJEBx+YmzsjxAg0CEP/jPtp4SuF8hS9LL7jhcW6H2x
+5X7hKszFgNQ2fP3UCsr+EwgyesDY/fFR4C9c+pwOEJV8wdI6sP3RKs+NFFjxHQN
5/lcZmSHcUNFTLdhnnfFvusPcTzUBXby8Yi5B3tBK3s+TryvVH2AWWNBR/CuQAyc
1SNNHoLFzkn5PTD72n6YXgUepKwScq5BnWbGLI09ZctIZD+CC1RtYmRDF34Hy7Qh
SOo2vmvc/0yBS0scdFyUnbSguZoR6KjZ09TlbIZh2fWnxU2eOavg2h5FRsDZCLc8
DFLWMa4Yla0JyCec8vhS0z1SXYESWyebioHcjGTAbAySE5itIOb1KLaZ+QRjL3ap
yZ1Ur34u//qWYQbtk2cE5Le7ay8D7dYhfi1Kgkp5y8a7NZX8KC6mLTFPRNagCAur
S//U0Sg/GQTV+LC6j5hZ/fowGOh9N7QtdS5L2LkWBvXjchRNLJPDXwswGTE45xu2
ILFg3asMkk9et6haTBV0Va7vx5lZGakmIAVI1SllrjAuGNRJg6B3KEHODvbIIRwI
mYIIW1Wq0j439GmgkjSboKCMW85wMl6jggEHUWPsPDlSlUhWNOp4ZSYB6ooBhGQ2
BDvDvRAnzZ5wCUxXHBK8P4Mr3vua/bvpe0tZPfWITi+IB9s1UacBC4/qBT1eb62y
IIERKEpZML8FZmELRNQn
=t5aX
-----END PGP SIGNATURE-----

--0vzXIDBeUiKkjNJl--
