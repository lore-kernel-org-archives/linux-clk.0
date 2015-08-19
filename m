Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 19 Aug 2015 11:15:00 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 5/7] ARM: sun8i: Add clock indices
Message-ID: <20150819091500.GC30520@lukather>
References: <1438364782-3968-1-git-send-email-maxime.ripard@free-electrons.com>
 <1438364782-3968-6-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v64nvA1K=Ya7_99-2G1LtFjcuj+qQbO1GJaqsL+yPF+Xdw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
In-Reply-To: <CAGb2v64nvA1K=Ya7_99-2G1LtFjcuj+qQbO1GJaqsL+yPF+Xdw@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Sat, Aug 08, 2015 at 12:21:17AM +0800, Chen-Yu Tsai wrote:
> On Sat, Aug 1, 2015 at 1:46 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The A23 and A33 gates have a non continuous set of clock IDs that are
> > valid. Add the clock-indices property to the DT to express this.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  arch/arm/boot/dts/sun8i-a23-a33.dtsi | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/sun8i-a23-a33.dtsi b/arch/arm/boot/dts/s=
un8i-a23-a33.dtsi
> > index 7abd0ae3143d..c318c770b6c1 100644
> > --- a/arch/arm/boot/dts/sun8i-a23-a33.dtsi
> > +++ b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
> > @@ -180,6 +180,15 @@
> >                         compatible =3D "allwinner,sun8i-a23-ahb1-gates-=
clk";
> >                         reg =3D <0x01c20060 0x8>;
> >                         clocks =3D <&ahb1>;
> > +                       clock-indices =3D <1>, <6>,
>=20
> Turns out the A33 (and I assume the same with the A23) has
> an ahb1 clock gate for the Security System at clock-index <5>.
>=20
> This is found in the updated A33 user manual.
>=20
> > +                                       <8>, <9>, <10>,
> > +                                       <13>, <14>,
> > +                                       <19>, <20>,
> > +                                       <21>, <24>, <26>,
> > +                                       <29>, <32>, <36>,
> > +                                       <40>, <44>, <46>,
> > +                                       <52>, <54>,
>=20
> <53> is ahb1 clock gate for msgbox, again found in A33 manual.
>=20
> > +                                       <57>;
>=20
> <58> is ahb1 clock gate for SAT, which seems to be part of the
> display pipeline.
>=20
> >                         clock-output-names =3D "ahb1_mipidsi", "ahb1_dm=
a",
> >                                         "ahb1_mmc0", "ahb1_mmc1", "ahb1=
_mmc2",
> >                                         "ahb1_nand", "ahb1_sdram",
> > @@ -196,6 +205,8 @@
> >                         compatible =3D "allwinner,sun8i-a23-apb1-gates-=
clk";
> >                         reg =3D <0x01c20068 0x4>;
> >                         clocks =3D <&apb1>;
> > +                       clock-indices =3D <0>, <5>,
> > +                                       <12>, <13>;
> >                         clock-output-names =3D "apb1_codec", "apb1_pio",
> >                                         "apb1_daudio0", "apb1_daudio1";
> >                 };
> > @@ -213,6 +224,10 @@
> >                         compatible =3D "allwinner,sun8i-a23-apb2-gates-=
clk";
> >                         reg =3D <0x01c2006c 0x4>;
> >                         clocks =3D <&apb2>;
> > +                       clock-indices =3D <0>, <1>,
> > +                                       <2>, <16>,
> > +                                       <17>, <18>,
> > +                                       <19>, <20>;
> >                         clock-output-names =3D "apb2_i2c0", "apb2_i2c1",
> >                                         "apb2_i2c2", "apb2_uart0",
> >                                         "apb2_uart1", "apb2_uart2",
> > --
> > 2.4.6
> >
>=20
> Not sure if you want to add the clocks I mentioned together
> in this patch, or do a separate patch.
>=20
> The rest look good.

Thanks for your input, I'll send some new patches to deal with this.

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV1EkUAAoJEBx+YmzsjxAgBM0P/1cUYOoiiRJa5TVt90u/Odj3
3fdq/nbUYjCe3/W+MenMDqhETStalLo8rZfKl1mofx/VD6GHzui+GDGQmK1n48Mc
vtkrO6MgAYT3VTQCEkKan2mi+HI7e/MW+YhP7X3Ovx/rKmyXrBJvpluX6EtrG9lq
ZLaC4yHUT1Uh7y6VKIxc4YZ9cLxrlosOaupvuxxRrBkZ38B81Zt3Nxzr2/p1vRop
0YeC4moki5r7z9KkR1qm02/ssYduRzgUnHqeFNIHygtzd6A83kG58rbbBHEmYH7s
AgQ7JZaYXSoPDHrlma4uxNaWDHkt+srkVJeCfD/q/jchgoG+SU7BXlJwqpT8Aw8H
8qVF/nnbg8NFSV0AvGnZcm1bvBdqQJLmekxVQjdnvH4dEMHwncNwiiWWnkqJ40y5
9CknbWcSjDLCALeo9JzblOHaNbigNodaq2aFLvL3iRtxY0TP3TJSD7YrxYAdL7xQ
9m5V9IMtq+eXXadpYRcM1oYILGXgxhjktTjDAvEuk/95B9+XddDMBPLTPS/esodB
AoC4NYt2kEjGbIj8WduXkDh1GtjpDN3FqbKHO7rOxO307OyNYM/ZIY2jgFZSiTQc
dRWZeU5TyxtgFEHmJafWTvZL1/i043JmTM7+ORxa6osgM0+GTFRXaoaGd2qv92yt
50tt7SkYNYv8zT0HXyX6
=3Tjt
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--
