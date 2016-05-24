Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 24 May 2016 23:07:33 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 10/16] clk: sunxi-ng: Add M-P factor clock support
Message-ID: <20160524210733.GK27618@lukather>
References: <1462737711-10017-1-git-send-email-maxime.ripard@free-electrons.com>
 <1462737711-10017-11-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v67F3UvSCYDTxeLkCJL3FzmcpkogM4RAQgDseXMJDv7bUw@mail.gmail.com>
 <20160523171845.GC27618@lukather>
 <CAGb2v65GbZosmh56Z7wBa5gHOe1Ox2Jz3tcOq1kugBHO54OvbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QCcB5JEkX2RALVsX"
In-Reply-To: <CAGb2v65GbZosmh56Z7wBa5gHOe1Ox2Jz3tcOq1kugBHO54OvbQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--QCcB5JEkX2RALVsX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 24, 2016 at 12:14:09PM +0800, Chen-Yu Tsai wrote:
> >> > +#define SUNXI_CCU_MP_WITH_MUX_GATE(_struct, _name, _parents, _reg, =
    \
> >>
> >> We could merge _struct with _name ...
> >>
> >> > +                                  _mshift, _mwidth,                =
    \
> >> > +                                  _pshift, _pwidth,                =
    \
> >> > +                                  _muxshift, _muxwidth,            =
    \
> >> > +                                  _gate, _flags)                   =
    \
> >> > +       struct ccu_mp _struct =3D {                                 =
      \
> >>
> >> and have struct ccu_mp _name##_clk =3D {
> >
> > Unfortunately, that prevents to use dashes as clock names, which is
> > something we've done in the past. Having a separate name allows us to
> > use whatever we want.
>=20
> We could do some replacement in the register function, but that seems
> hackish

Indeed

> Also I noticed we aren't using clock-output-names from the DT
> anymore?

Yep, there's just too many clocks to be practical, and you have to
have the name in the source code anyway for the parenting
relationships.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--QCcB5JEkX2RALVsX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXRMKVAAoJEBx+YmzsjxAgaxAP+gKFirLGph56kDkxeoJfPWI3
H8OEtiI1CS+7pMnKIXyzw6dR2RgLu05i0AjLAbh6MzWZVo6/h6AlGqi43olmGvqE
d0kULySVmAYGiTCkRu4CPiFIbGsnHQsdQb05O0liXP/yP99u1sdCMbvUnVtxzguq
K0yKYIcv7JN3cyHVXoZzCCgggmoskZGEvqclaZsSXNJxBFwMZG73DyNV7k4YkG9q
v+QsQUtg6ZkTCP+veED2IJ1nh68wN3kBKuyPapXeC9JN9csGkztXCUgO2N7JyMHH
FuBXJs7SBcmyLAqbTeHhGHCiQWv2AhDx+P8ndsTi/L89/9lIulvG6hx1yjmWoVJz
fd2jP1yh3iuoQ7vvNJEZHhEngtMr7JOQQAbCR5ww9Ec8yv6k53UJPwgbSyPx7Mhm
JddHXzXdVYsOLbU2stsb+0SoZp5zdDMsNSXtcYhF6R85bgZeLxoT6S1kGwKhL3H/
eUg5ihuNnJOpqCZ7EkTvwTorOf2gj5MbLh5AndMinfAPoJVF98a6/I+GhrjAHd5g
RyHxM0b7lJu/495S6xs84wEsMdvewcTWCFHVHs1NqBbO2XsLYTv7aL/IVoOjgW/K
iQjUSLFYB8Y4G5uGPIMkkEFcYpyqO4YEsYd9PFe98IyLS02D2xhfWKbM3DvwOv0a
soPodWpRSnD8gbuENhKt
=W/b+
-----END PGP SIGNATURE-----

--QCcB5JEkX2RALVsX--
