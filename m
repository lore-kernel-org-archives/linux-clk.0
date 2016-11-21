Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 21 Nov 2016 22:45:52 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 6/10] clk: sunxi-ng: Add A10s CCU driver
Message-ID: <20161121214552.yvt7r4jntusb5vx3@lukather>
References: <cover.326f50aecc25fbe292184527b52a1e3172aba9cf.1478625788.git-series.maxime.ripard@free-electrons.com>
 <2110deed00d33bdb557efebe8f988976fbf5a440.1478625788.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v64cft9nWh13c+8jG8qhrD_RnVFc+s8btMTHbdDS155eQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r262yq6d7kf66is4"
In-Reply-To: <CAGb2v64cft9nWh13c+8jG8qhrD_RnVFc+s8btMTHbdDS155eQA@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--r262yq6d7kf66is4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 13, 2016 at 05:34:44PM +0800, Chen-Yu Tsai wrote:
> > +static struct ccu_nkmp pll_ve_clk =3D {
> > +       .enable         =3D BIT(31),
> > +       .n              =3D _SUNXI_CCU_MULT_OFFSET(8, 5, 0),
> > +       .k              =3D _SUNXI_CCU_MULT(4, 2),
> > +       .m              =3D _SUNXI_CCU_DIV(0, 2),
> > +       .p              =3D _SUNXI_CCU_DIV(16, 2),
>=20
> Any chance we'll support the bypass switch on this one?

I'm not sure this will be useful to have it running at 24MHz.

> > +static SUNXI_CCU_M(pll_ddr_clk, "pll-ddr", "pll-ddr-base", 0x020, 0, 2=
, 0);
>=20
> Maybe we should set CLK_IS_CRITICAL on this one as well... in case the
> bootloader uses pll-periph for mbus, and none of the dram gates are enabl=
ed.

Ack.

> > +static SUNXI_CCU_GATE(hosc_clk,        "hosc", "osc24M", 0x050, BIT(0)=
, 0);
>=20
> Why the extra "hosc" clock here? You should probably just internalize "os=
c24M".

I'd prefer to model it as it is modelled in hardware: you have two
crystals, and then a gate within the CCU.

> > +static const char * const csi_parents[] =3D { "hosc", "pll-video0", "p=
ll-video1",
> > +                                           "pll-video0-2x", "pll-video=
1-2x" };
> > +static const u8 csi_table[] =3D { 0, 1, 2, 5, 6 };
> > +static SUNXI_CCU_M_WITH_MUX_TABLE_GATE(csi_clk, "csi",
> > +                                      csi_parents, csi_table,
> > +                                      0x134, 0, 5, 24, 2, BIT(31), 0);
>=20
> Do you know if CSI needs to change the module clock?

Apparently not.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--r262yq6d7kf66is4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYM2sMAAoJEBx+YmzsjxAgIjQP/iK3875gjyMqo8zbwLEQNpYC
RHH7HmFsW+i5XPTgEQQln1zpCvolsRLUxmDoLrpLjLQyE6/CtZiBL+5CLFBjJI3D
m/+i6wcsnHc8EHVuXpL8BxAhmIBCVgfzCg8wCjq2FPQkbjq0dKNKnOk8y52d6LOv
tUxY8yL4qsF+r4rEiHQOjWqpO8gCPhQs9VxNZ/OLNDzQhfs7zrDdZf3V6cHMTpBe
z1/RfRhNa1WpXAoLmgEmmyLbz9p3nasponou3BCQS7MSLZY49KXc30Ls7KsBNDA8
HH+2r+Cpo6N42uEtFfknn8HgCwvY7Qs2ZJh656J2SdwpKSbwjYsUlvkcf9XwtaHh
7AE6xkM44hzmBqsxG/bAbAlGukOZZDmrDGeHrA2wnupZ37fYPWUwi25gV3FMyE89
YkwPt17ZM/30PsIxxBH18hSuluI8x5jEbLEyNdwQmPKZzEtzW04Y1f6NFtFngeBp
oOMXXaFtnBOUKei4raZFALZBS/IHiii5sRbPnUdD+fRp4pr2fB4Nighs1GpdQ/2U
I0RglGG1Ueu8KFoJW8HeiRhs22vgyLeYwRrqCgY+BGRJKoNM8inzYeELXA/n6cF2
N5bq97bOImkloytJPLSiffvl+UIEkWOGBofk8M0mnSHPVSJYnlJREJTmeHGDIaNb
bW4A3zqT1+KMLMtqp3on
=1IRz
-----END PGP SIGNATURE-----

--r262yq6d7kf66is4--
