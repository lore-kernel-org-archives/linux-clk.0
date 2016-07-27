Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 27 Jul 2016 09:40:20 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
	dev@linux-sunxi.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/9] clk: sunxi-ng: mux: Add support for mux tables
Message-ID: <20160727074020.GH6560@lukather>
References: <1469516671-19377-1-git-send-email-wens@csie.org>
 <1469516671-19377-5-git-send-email-wens@csie.org>
 <20160726194306.9b6aadd3d1669bd6f5a54d99@free.fr>
 <20160727065934.GD6560@lukather>
 <20160727091827.e26f72701ce5758fa29aff7a@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="o71xDhNo7p97+qVi"
In-Reply-To: <20160727091827.e26f72701ce5758fa29aff7a@free.fr>
List-ID: <linux-clk.vger.kernel.org>


--o71xDhNo7p97+qVi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2016 at 09:18:27AM +0200, Jean-Francois Moine wrote:
> On Wed, 27 Jul 2016 08:59:34 +0200
> Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>=20
> > On Tue, Jul 26, 2016 at 07:43:06PM +0200, Jean-Francois Moine wrote:
> > > On Tue, 26 Jul 2016 15:04:26 +0800
> > > Chen-Yu Tsai <wens@csie.org> wrote:
> > >=20
> > > > Some clock muxes have holes, i.e. invalid or unconnected inputs,
> > > > between parent mux values.
> > > >=20
> > > > Add support for specifying a mux table to map clock parents to
> > > > mux values.
> > >=20
> > > Putting empty strings in the holes should work. No?
> > > Ex:
> > >=20
> > > static const char * const csi_mclk_parents[] =3D
> > > 	{ "pll-video0", "pll-video1", "", "", "", "osc24M" };
> >=20
> > Not really. The clock would be declared as orphan, while it's really
> > not.
> >=20
> > Parenting functions would also not work as expected,
> > clk_hw_get_parent_by_index being the obvious example, in that case
> > returning the empty string for an invalid parent, while it should
> > really return NULL.
>=20
> I don't see why the clock should be orphan.
> Then, when a parent is "", clk_hw_get_parent_by_index() returns NULL.

Why? It should return NULL when there's no parent, while you
explicitly registered a parent.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--o71xDhNo7p97+qVi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXmGVkAAoJEBx+YmzsjxAgtmgP/jF9L2OeR+JIzVLUdw1NyWnm
lBK83DnBzsHToogO9fCuxx9dXrCv9FVHEYV5gwpZhJIlTrtgxny7PR6YqB6rQ6jB
70PjALVu2rf48KI2TDIsrHNZHuGojFJVkn/t1EOIE88a/BFMnt3olv4hvzUDbNCo
vHonLeiRkvwRb+b9zHz+tE+nyRwxf/BNOAF0gnbPTqh3MEPu/dD9gmxpIe/oAaXR
xcERCNWg1CbtAW0oDwO11x6Lu0yJrcot3ey3CxE4eG07NB029SptGxOqUUT1JXwV
bNa3v2B6xUbfi1z+cYJEcLQIzucGfqzDYA9EW79+E38827wQ2eddj2st6rElTv9A
mTuLYrRS4kveMaM7a+e6IiTUGafOAoKMmN/cRIvUHaKC2aVitArxbAQ/05MJewpa
cdpzTMxPZ86JyCfv8chm+yMybtrY3mMeHzDyui75mo7d0NbjSroR7YnoQOeg6JP+
kMtcXMLlEB7n0JR/PMK1G/4F4fZqwP868wbjK8hhTTOKD+k0zxdLDYgMVJbp9Uf3
MjrUYbhO4ZASYLfwp+nL5wDN2aF2AKMxshGwNW+SSDwCQwg+8V2poMZqm5lf79MK
1w08CQPlIiplWLSYSX27hIeTUFEAbT4jDBiMPQn8Bk9GMjq50v/Akd3ApZUd81/z
5tvdVEwTAsB1f0QqXODE
=Pqgq
-----END PGP SIGNATURE-----

--o71xDhNo7p97+qVi--
