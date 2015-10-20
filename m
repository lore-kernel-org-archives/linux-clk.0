Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 20 Oct 2015 09:34:50 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Emilio Lopez <emilio@elopez.com.ar>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [PATCH v5 1/5] clk: Add a basic multiplier clock
Message-ID: <20151020073450.GA2711@lukather>
References: <1445242139-20965-1-git-send-email-maxime.ripard@free-electrons.com>
 <1445242139-20965-2-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v65bZGQEHyS6UoBUsrDoJ33jYwa--BkmfomZ4AGAy0djNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="41bjdpi19TcwJlr2"
In-Reply-To: <CAGb2v65bZGQEHyS6UoBUsrDoJ33jYwa--BkmfomZ4AGAy0djNw@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--41bjdpi19TcwJlr2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2015 at 04:22:15PM +0800, Chen-Yu Tsai wrote:
> On Mon, Oct 19, 2015 at 4:08 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Some clocks are using a multiplier component, however, unlike their mux,
> > gate or divider counterpart, these factors don't have a basic clock
> > implementation.
> >
> > This leads to code duplication across platforms that want to use that k=
ind
> > of clocks, and the impossibility to use the composite clocks with such a
> > clock without defining your own rate operations.
> >
> > Create such a driver in order to remove these issues, and hopefully fac=
tor
> > the implementations, reducing code size across platforms and consolidat=
ing
> > the various implementations.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/clk/Makefile         |   1 +
> >  drivers/clk/clk-multiplier.c | 181 +++++++++++++++++++++++++++++++++++=
++++++++
> >  include/linux/clk-provider.h |  42 ++++++++++
> >  3 files changed, 224 insertions(+)
> >  create mode 100644 drivers/clk/clk-multiplier.c
> >
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > index d08b3e5985be..0b2101039508 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -6,6 +6,7 @@ obj-$(CONFIG_COMMON_CLK)        +=3D clk-divider.o
> >  obj-$(CONFIG_COMMON_CLK)       +=3D clk-fixed-factor.o
> >  obj-$(CONFIG_COMMON_CLK)       +=3D clk-fixed-rate.o
> >  obj-$(CONFIG_COMMON_CLK)       +=3D clk-gate.o
> > +obj-$(CONFIG_COMMON_CLK)       +=3D clk-multiplier.o
> >  obj-$(CONFIG_COMMON_CLK)       +=3D clk-mux.o
> >  obj-$(CONFIG_COMMON_CLK)       +=3D clk-composite.o
> >  obj-$(CONFIG_COMMON_CLK)       +=3D clk-fractional-divider.o
> > diff --git a/drivers/clk/clk-multiplier.c b/drivers/clk/clk-multiplier.c
> > new file mode 100644
> > index 000000000000..fed71de801ca
> > --- /dev/null
> > +++ b/drivers/clk/clk-multiplier.c
>=20
> <snip>
>=20
> > +static unsigned long __bestmult(struct clk_hw *hw, unsigned long rate,
> > +                               unsigned long *best_parent_rate,
> > +                               u8 width, unsigned long flags)
> > +{
> > +       unsigned long orig_parent_rate =3D *best_parent_rate;
> > +       unsigned long parent_rate, current_rate, best_rate =3D ~0;
> > +       unsigned int i, bestmult =3D 0;
> > +
> > +       if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT))
> > +               return rate / *best_parent_rate;
> > +
> > +       for (i =3D 1; i < ((1 << width) - 1); i++) {
> > +               if (rate * i =3D=3D orig_parent_rate) {
>=20
> The tested multiplier "i" is on the wrong side of the equation when
> compared to the statement "current_rate =3D parent_rate * i"
>=20
> Since this should be a clock multiplier, that test can only be true
> when i =3D=3D 1, given that rate >=3D parent_rate. In all other cases it'=
ll
> fallback to the clk_hw_round_rate() call below.
>=20
> Am I missing something?

You're totally right, I just completely forgot this comment before
sending the new version :/

I'll send a new version.

> Otherwise, this is
>=20
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--41bjdpi19TcwJlr2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWJe6aAAoJEBx+YmzsjxAgW68P/1+IrvKBu/NTOSfQNP23R9x7
DEMDrWRV1Vi4SLzJ/jwupLnZoIwgbr19YcGeAFRzooegZwpuEhniqvA1oJNXs0Ac
LVi40SJn6yOdwEV2BPmnffSl7+e9vpnCfzpRD5wTXB1SFGLYBnq3hXur0n8XPNhP
dOPe39Qv09gxoNm34xuNCNhwKdLDwa7zHpcrUSj5FUSFtvrVyVFOi2VWUDvO38/x
pDJAgzI4dKQndNIhLKdjW/V9AEilzRuqDSqzHWhSD/Td9kiXj7lGX9O/U31qaLdM
BYhJvSu+EGh6YaADc3pZ32SAWW3avE2Ug+U2rXTvxNpwUVlDQ5PqgNq1ff74lKhs
FPjVZ+1mNAnkJAA7gwA/OQnxsmnP69hkG7s6gfWG5xjE8phlRa91uw8W818Zy5Oj
djtZg6x7iYoGs2viYJKrYl2pSKR1Wary7U8y3iGxZJEuCVVrM1UhWb+t/9ZBPIWQ
/W76LvvXEf8Um4ZAPZ7xQzIpZ2f4iNYFSTZf3EZYSJcqVkEt40Z6ZjA3n4l37sSv
SDAxxtsp1uy6wZMQWR1wATAJ2thVGMosZ42S+hUDE7uUq6Tr4I2+PMkLpb/emZfI
8qcdRyggF57EJKbtdgFkR+aQ6Bc4UzsVL8LdtlUIrRNjgbE99+lmPfyr0pcWrXDT
Mgu4RdEconk2Zb6jSK84
=AJ7y
-----END PGP SIGNATURE-----

--41bjdpi19TcwJlr2--
