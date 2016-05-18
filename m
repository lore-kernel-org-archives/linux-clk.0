Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 18 May 2016 23:20:18 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 15/16] clk: sunxi-ng: Add H3 clocks
Message-ID: <20160518212018.GT27618@lukather>
References: <1462737711-10017-1-git-send-email-maxime.ripard@free-electrons.com>
 <1462737711-10017-16-git-send-email-maxime.ripard@free-electrons.com>
 <20160516154739.d87e0a9891a7fb5fed051a89@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="finhkSr2yyrWw3ow"
In-Reply-To: <20160516154739.d87e0a9891a7fb5fed051a89@free.fr>
List-ID: <linux-clk.vger.kernel.org>


--finhkSr2yyrWw3ow
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, May 16, 2016 at 03:47:39PM +0200, Jean-Francois Moine wrote:
> On Sun,  8 May 2016 22:01:50 +0200
> Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>=20
> > Add the list of clocks and resets found in the H3 CCU.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/clk/sunxi-ng/Makefile        |   2 +
> >  drivers/clk/sunxi-ng/ccu-sun8i-h3.c  | 757 +++++++++++++++++++++++++++=
++++++++
> >  include/dt-bindings/clock/sun8i-h3.h | 162 ++++++++
> >  include/dt-bindings/reset/sun8i-h3.h | 103 +++++
> >  4 files changed, 1024 insertions(+)
> >  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-h3.c
> >  create mode 100644 include/dt-bindings/clock/sun8i-h3.h
> >  create mode 100644 include/dt-bindings/reset/sun8i-h3.h
> >=20
> > diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makef=
ile
> > index c794f57b6fb1..67ff6a92f124 100644
> > --- a/drivers/clk/sunxi-ng/Makefile
> > +++ b/drivers/clk/sunxi-ng/Makefile
> > @@ -13,3 +13,5 @@ obj-y +=3D ccu_nkmp.o
> >  obj-y +=3D ccu_nm.o
> >  obj-y +=3D ccu_p.o
> >  obj-y +=3D ccu_phase.o
> > +
> > +obj-y +=3D ccu-sun8i-h3.o
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c b/drivers/clk/sunxi-ng=
/ccu-sun8i-h3.c
> > new file mode 100644
> > index 000000000000..5ce699e95c32
> > --- /dev/null
> > +++ b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
> > @@ -0,0 +1,757 @@
> 	[snip]
> > +static struct ccu_nm pll_audio_base_clk =3D {
> > +	.enable		=3D BIT(31),
> > +	.lock		=3D BIT(28),
> > +
> > +	.m		=3D SUNXI_CLK_FACTOR(0, 5),
> > +	.n		=3D SUNXI_CLK_FACTOR(8, 7),
> > +
> > +	.common		=3D {
> > +		.reg		=3D 0x008,
> > +		.features	=3D CCU_FEATURE_GATE | CCU_FEATURE_LOCK,
> > +		.hw.init	=3D SUNXI_HW_INIT("pll-audio-base",
> > +						"osc24M",
> > +						&ccu_nm_ops,
> > +						0),
> > +	},
> > +};
> > +
> > +static SUNXI_CCU_M(pll_audio_clk, "pll-audio", "pll-audio-base",
> > +		   0x008, 16, 4, 0);
> > +
> > +static SUNXI_CCU_FIXED_FACTOR(pll_audio_2x_clk, "pll-audio-2x",
> > +			      "pll-audio-base", 2, 1, 0);
> > +static SUNXI_CCU_FIXED_FACTOR(pll_audio_4x_clk, "pll-audio-4x",
> > +			      "pll-audio-base", 1, 1, 0);
> > +static SUNXI_CCU_FIXED_FACTOR(pll_audio_8x_clk, "pll-audio-8x",
> > +			      "pll-audio-base", 1, 2, 0);
> > +
> 	[snip]
>=20
> The pll-audio-{2,4,8}x clocks lack the CLK_SET_RATE_PARENT.
>=20
> Also, in my implementation of the sound on HDMI, I set pll-audio as the
> parent of the i2s2 clock. Then, as the pll-audio clock is defined here,
> setting its rate is always wrong (only 'M' is changed, and with a bad
> value - BTW, DIV_ROUND_UP would be welcome in ccu_m_find_best()).
>=20
> As the pre-divider 'M' is set to 4 by default, there is no need to
> change it. Then, audio works fine for me with:
>=20
> static SUNXI_CCU_FIXED_FACTOR(pll_audio, "pll-audio",
> 			      "pll-audio-base", 4, 1,
> 				CLK_SET_RATE_PARENT);

OK. I just changed it, we can always change it later if needs be.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--finhkSr2yyrWw3ow
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXPNySAAoJEBx+YmzsjxAgKQIP/jFudU6AD9pFXsU40DK0FRit
NxLU4Qrx2XOZZ2cLCxtI0lR1FD/wjUqUwluGV4HXNyZQLj2ijmkbDk0SnQ/wOezf
FahNBJxo62+S10cWte+wrH14DIrUeXM/IVGbxksHLne/4qZD6+ayu/ltDyIELsVD
3bN0j80Oo3JX5pJ+cKNUbwRi8ahBxqqOPHAN3+RShgc8v4AdS7/wfLyFZj/nx/Ol
F75lrnglm01EoHrsz6Mu/JE6Xg/Zuwxi7wqru7TA8laVNA3ic6tF2vFXhynePAWy
emV7MtGHfKT0HjwVM1vfiPicBoID23/zH//msfT7X+KaB2B4MYhTh3tNjFsiEZFt
HPAWLv8XV+DhuHMldRUNdnm8YZ2GB/AXtIkfmWJgJszpSEg6aLtlZ5LW5xM9T0s+
mn5TccsDoqSeyZL/IDzu9QK2KdCjfcamdp7fh9tRuNlINBgc+Nmnvwy/CRC0c2q4
pHfQbirD5BGe8YOoszaEkb9UCL1ReccYT6/XEW8/KLPBB1QaRzIXZPvvRlmCETW8
5W5K2H3yoV+uKfdyTCQ/6JCjEEoq+Yb2Iq1/K9/EkaoydPE+y9G3uXZDcDkC62UK
w2nHu/WmKZn16bq9aTKQVJV9FVM3UFRKkxYcGhmJL2ozINOtw04GPwYMWr1Z+DZG
7J/120SBbf/TINy2eIi9
=oewX
-----END PGP SIGNATURE-----

--finhkSr2yyrWw3ow--
