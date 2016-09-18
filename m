Return-Path: <maxime.ripard@free-electrons.com>
Date: Sun, 18 Sep 2016 22:30:02 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] clk: sunxi-ng: sun6i-a31: Register offset and clk
 flag fixes
Message-ID: <20160918203002.GN17518@lukather>
References: <20160915065740.13664-1-wens@csie.org>
 <20160915083436.GC10128@lukather>
 <daee8cd5-c1a1-49c3-e0f8-e83bb9ed3263@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sy9WyBOsCRoUO165"
In-Reply-To: <daee8cd5-c1a1-49c3-e0f8-e83bb9ed3263@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--sy9WyBOsCRoUO165
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 15, 2016 at 04:11:32PM -0700, Stephen Boyd wrote:
> On 09/15/2016 01:34 AM, Maxime Ripard wrote:
> > Hi,
> >
> > On Thu, Sep 15, 2016 at 02:57:37PM +0800, Chen-Yu Tsai wrote:
> >> Hi,
> >>
> >> Here are 3 fixes for the new sunxi-ng clk driver for sun6i-a31 recently
> >> introduced for 4.9. The issues were noticed while working on the displ=
ay
> >> pipeline for the A31/A31s. The second patch follows what Maxime has do=
ne
> >> for the A33 CCU driver. The third issue was noticed while doing the fi=
rst
> >> patch.
> >>
> >> I hope we can get this into 4.9 as well, either right in -rc1, or in a
> >> later -rc.
> > Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> >
> > Stephen, could you apply those patches directly on top of my previous
> > PR, or do you want me to send another one?
> >
>=20
> I can apply directly to clk-next.

Awesome, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--sy9WyBOsCRoUO165
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX3vlKAAoJEBx+YmzsjxAgdUQP/0d3moEGZ+PneSkqpUaYbuBJ
lSE7jNFzQnXokHYXV0eOuqAA1ljrtzZsBqesEg06uIF1vJI0eGIsrp3ZS0/b6RrY
UkVrn8YhuVxSz/DDVA+ChiE7vpx3Ib6OTb8D35wnvQZISgQJTKiBina4RjNYqZmw
VswxpsncouJv+9Z8TN1c1PnyUcTJ6UtFmnv3aFRq53/MeEsjJp+Ix1Sxj3zkQmMv
rXs+CPvkwcuNpa2Cd3CLpM+e7FGi5tvnDmpzQln6w1ep3TwUAn/iHBZ4qukSihBg
HiAZD8IuuL3klbvTx1JTHe8qC264LmenRh3t2ktO7Spt4c+DXPq2svuzSduT/Do3
EWdqJdqM5idhMfV6BDMOxz5p3/CtXu6aGOTiiyp8KsTaQeA0lc6ES6TayyiStkXn
qpF2Mx9I939Ewxl+ohnywxgXMRSLAwhHLmjLLndnKVw/5WoNUSsHO4RWbN36Qw81
N+rWzd19/8zc6mF90nXk+y8JXmqI8vxzV+1Ohoz2F9PUc0SXr0hbGhW2mZn5x2rT
Rp7aZ0JSUilQD9wS9L0bz5Y1I0HZJ+m9+QsQqkc8HvgNaQ5VNFJJLJlwOFwmyaBT
ZFTcGJYm6Vbp/yohEH/YCcE3VlPVs129Oyk+dVdh3Hgo20RsuVWyjYs6y0QuNZk7
KKSEae2HqMvTVfkj3WOu
=EpW0
-----END PGP SIGNATURE-----

--sy9WyBOsCRoUO165--
