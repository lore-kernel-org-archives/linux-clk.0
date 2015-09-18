Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 18 Sep 2015 14:20:25 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [PATCH 1/5] ARM: sunxi: Add R8 support
Message-ID: <20150918122025.GR4684@lukather>
References: <1442566130-3497-1-git-send-email-maxime.ripard@free-electrons.com>
 <1442566130-3497-2-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v65hHJDS6-Sz5Hi4a_F_cHTdBkFUzRR3a0JSE43AbDYmcw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cGn0fZIJon5R7R2H"
In-Reply-To: <CAGb2v65hHJDS6-Sz5Hi4a_F_cHTdBkFUzRR3a0JSE43AbDYmcw@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--cGn0fZIJon5R7R2H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2015 at 05:47:44PM +0800, Chen-Yu Tsai wrote:
> On Fri, Sep 18, 2015 at 4:48 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The R8 is a new Allwinner SoC based on the A13. While both are very
> > similar, there's still a few differences. Introduce a new compatible to
> > deal with them.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  arch/arm/mach-sunxi/sunxi.c   | 3 ++-
> >  drivers/clk/sunxi/clk-sunxi.c | 1 +
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/mach-sunxi/sunxi.c b/arch/arm/mach-sunxi/sunxi.c
> > index 65bab2876343..8583a9ca86bd 100644
> > --- a/arch/arm/mach-sunxi/sunxi.c
> > +++ b/arch/arm/mach-sunxi/sunxi.c
> > @@ -26,10 +26,11 @@ static const char * const sunxi_board_dt_compat[] =
=3D {
> >         "allwinner,sun4i-a10",
> >         "allwinner,sun5i-a10s",
> >         "allwinner,sun5i-a13",
> > +       "allwinner,sun5i-r8",
> >         NULL,
> >  };
> >
> > -DT_MACHINE_START(SUNXI_DT, "Allwinner A1X (Device Tree)")
> > +DT_MACHINE_START(SUNXI_DT, "Allwinner sun4i/sun5i Families")
>=20
> Nit: might want to mention the rename.

Indeed, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--cGn0fZIJon5R7R2H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV/AGJAAoJEBx+YmzsjxAg43UP/jqgHJwi1tC+wP/FCJUsGiSf
8c+qT56Y7fOn5eIPLXWZtQ2eDrxpFJVjH8oj9RiROeoPOu3HjcLR+746e8R68pLX
do0xx1fxzNLrLmxfrzbihLQy3XWbVs8fxiWE48HoPg4/6IAezQPHk0E5yMQQlQZc
5DBERfa0ns7oJKhmonrQmw7C4w3Um5ViQTbFemCRUtDIMP2IksKJv6CbaEIxvxyy
DDj731hI7qr8ElmkcKgtMoJT82VZkBk2k73efRdoMGzjqiT7mbCFMekgwdWLC01S
wGHQm88hO4eZEUdEbxDOj/+d2SpzUhXd+rqgXzJW9BXRUcDzm8+6h8sJknS7+NG4
lbLqgzodm2CvUoFjazU5+cAM3YZu1i20sQiEOL++wnt2+kFNeMtyAhn54eNFvh/E
DLhDAzdyhvEbjGaSmmx3VxV08A5UGxL+69s/umiE8wP5jtaVVG7oqP42duPxG9C7
5K/zZ/ibh65HOBpujEbxkR81eciZyF6+DoiovC9KThAvGMa90lCKR+10AeuYL3Il
QujLcduRtrTSGYu4zZ+/7ot60+7HfXzkAqjnRo66smV/VSnsD4MLPEUmTgLBMUTx
iaQHg1E/N+hfwRTt2vHF56kwI2iWeOY45pSAt8Az7iv1txqbaeZMcGVuCSnpNlCI
Ojbt2g/O3O2jBBP/5LGH
=DoL0
-----END PGP SIGNATURE-----

--cGn0fZIJon5R7R2H--
