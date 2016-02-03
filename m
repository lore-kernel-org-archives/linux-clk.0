Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 3 Feb 2016 20:07:46 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Jens Kuske <jenskuske@gmail.com>,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 2/2] clk: sunxi: Refactor A31 PLL6 so that it can be
 reused
Message-ID: <20160203190746.GJ4652@lukather>
References: <1454008958-12655-1-git-send-email-maxime.ripard@free-electrons.com>
 <1454008958-12655-2-git-send-email-maxime.ripard@free-electrons.com>
 <20160130185714.7abcf1de9ef8108c2f48c7fe@free.fr>
 <20160201201754.GI4652@lukather>
 <20160202075239.e4318e9dced1eeed29c593f6@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QyKdZyDmv5hkaBi2"
In-Reply-To: <20160202075239.e4318e9dced1eeed29c593f6@free.fr>
List-ID: <linux-clk.vger.kernel.org>


--QyKdZyDmv5hkaBi2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 02, 2016 at 07:52:39AM +0100, Jean-Francois Moine wrote:
> On Mon, 1 Feb 2016 21:17:54 +0100
> Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>=20
> > > Also, for the H3 PLL periph1 (aka PLL8), why didn't you create a
> > > 'pll8x2' clock with 'pll8' as a divider?
> >=20
> > No one seems to use it. We can always add it later in a separate
> > patch when someone will.
>=20
> Well, then, I don't understand. The pll periph/peripheral/periph0,
> aka PLL6 works well for many SoCs and there is no need to change
> its DT definition.
>=20
> In the patch header, you wrote:
>=20
> > Remove the fixed dividers from the PLL6 driver to be able to have a
> > reusable driver that can be used across several SoCs that share the same
> > controller, but don't have the same set of dividers for this clock, and=
 to
> > also be reused multiple times in the same SoC, since we're droping the
> > clock name.
>=20
> then, for the H3, you do
> (the comment should be "until pll8 can be reused"),

No. The comment is right. Even though pll8 was just another instance
of pll6, the pll6 driver couldn't be reused because the clock name was
hardcoded in the driver, and you couldn't register two clocks with the
same name.

This was done because this driver has several outputs, the main PLL
output, plus all the various dividers it might have in the various
SoCs.

So, no. It was not working fine on "many" SoCs. And this is exactly
what this patch fixes.

> > -		/* dummy clock until pll6 can be reused */
> > -		pll8: pll8_clk {
> > +		pll8: clk@01c20044 {
> >  			#clock-cells =3D <0>;
> > -			compatible =3D "fixed-clock";
> > -			clock-frequency =3D <1>;
> > +			compatible =3D "allwinner,sun6i-a31-pll6-clk";
> > +			reg =3D <0x01c20044 0x4>;
> > +			clocks =3D <&osc24M>;
> >  			clock-output-names =3D "pll8";
> >  		};
>=20
> that is, you add the PLL8, don't you?

I guess it's just a matter of interpretation, but no, I'm just
removing the placeholder that was there.

>=20
> And, further, you change the MMC clocks:
>=20
> > @@ -243,7 +243,7 @@
> >  			#clock-cells =3D <1>;
> >  			compatible =3D "allwinner,sun4i-a10-mmc-clk";
> >  			reg =3D <0x01c20088 0x4>;
> > -			clocks =3D <&osc24M>, <&pll6 0>, <&pll8>;
> > +			clocks =3D <&osc24M>, <&pll6>, <&pll8>;
> >  			clock-output-names =3D "mmc0",
> >  					     "mmc0_output",
> >  					     "mmc0_sample";
>=20
> where the PLL8 is already used.
>=20
> So, how can you say
>=20
> > No one seems to use it. We can always add it later in a separate
> > patch when someone will.

Because I was replying to a request from you asking about
pll8x2. The code you quote is about pll8...

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--QyKdZyDmv5hkaBi2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWslACAAoJEBx+YmzsjxAgIqgP/1k7XERCB1cqOXLxfb6T1zM8
TTbuD19Nw29fhstwSNm8ef+qZiCykPNBYCLjguL8DrzLmMgmnoKIJ03HykvJz/Hs
+OxHfg9avn1/wVTB2ev0313mg9TyOqk+aWkrRC0WU1I3S6jsKjFOnAwc/kVo7kCn
RLnvs4eyHbHgDfnG55elhyzF/y0lx8by/OXvD3Qu0o+yX8vcQ3Vo/Xh9MK19E508
UOtek319aKR2KUNz5d3vfEJiTOr8bNDYEcfsHI85lKjlauCXHUzuWtIGQgHkWIRZ
JeMVKNK2vE82BrCmnecbA2FlVldHJRCyQeBb6nDiFR7Uejvd+FRBFB/+vO/xnDi2
8wWk3LFDErZXKzNXKJt/h+Gurj/BHoGqlP/VqtfLzKKhOs32PIGD0TYhCfNzXM/Q
5di8JAIkyXdPjqIipdomljDUNqebhA8tF77OU8VvBZwhX1anAEmsXaaNR89MfsRm
+rS2CKT04ur9TVg0yluezR9/cvp1BQ25nGN/+M35pmeKf1WPu+C6AgFlqe7YNYJP
P2pY1eKPPToxWmhbjuze/N50p2VTWuYS7TSXLa9ulwapJQKuUAWmgVMh3sbwcaNk
WGtfCDJQ9cmAk0kXB0KbMm1qKcjQ5dtr5sFGN4jYMtRMrLmuU6KURptDZTh72Pjr
hI2VLruysjSCeH+UfnnS
=RV9R
-----END PGP SIGNATURE-----

--QyKdZyDmv5hkaBi2--
