Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 7 Dec 2017 10:10:42 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [PATCH 2/2] clk: sunxi-ng: sun50i: a64: Add 2x fixed
 post-divider to MMC module clocks
Message-ID: <20171207091042.fqoh7utt2ookqozj@flea.lan>
References: <20171204051912.7485-1-wens@csie.org>
 <20171204051912.7485-3-wens@csie.org>
 <20171205195956.xdil2dsbtfwx35jj@flea.lan>
 <CAGb2v67=2BbOGWpRyujaR-pn6ZEfb1rSRtmzP-kUzXRn_y+iNg@mail.gmail.com>
 <20171206155608.tuw73ht6gq7hyrho@flea.lan>
 <CAGb2v64sxLK5fQ7Rmyy355diqq=0OYk8wRvOqjVJkdMWURwRUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wc6v23sgtnnjoopq"
In-Reply-To: <CAGb2v64sxLK5fQ7Rmyy355diqq=0OYk8wRvOqjVJkdMWURwRUQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--wc6v23sgtnnjoopq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2017 at 12:10:39AM +0800, Chen-Yu Tsai wrote:
> On Wed, Dec 6, 2017 at 11:56 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Hi,
> >
> > On Wed, Dec 06, 2017 at 10:30:26AM +0800, Chen-Yu Tsai wrote:
> >> On Wed, Dec 6, 2017 at 3:59 AM, Maxime Ripard
> >> <maxime.ripard@free-electrons.com> wrote:
> >> > Hi,
> >> >
> >> > On Mon, Dec 04, 2017 at 01:19:12PM +0800, Chen-Yu Tsai wrote:
> >> >> On the A64, the MMC module clocks are fixed in the new timing mode,
> >> >> i.e. they do not have a bit to select the mode. These clocks have
> >> >> a 2x divider somewhere between the clock and the MMC module.
> >> >>
> >> >> To be consistent with other SoCs supporting the new timing mode,
> >> >> we model the 2x divider as a fixed post-divider on the MMC module
> >> >> clocks.
> >> >>
> >> >> This patch adds the post-dividers to the MMC clocks.
> >> >>
> >> >> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> >> >
> >> > I had a doubt applying that one... sorry.
> >> >
> >> >> ---
> >> >>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 57 +++++++++++++++++++++++=
------------
> >> >>  1 file changed, 37 insertions(+), 20 deletions(-)
> >> >>
> >> >> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/su=
nxi-ng/ccu-sun50i-a64.c
> >> >> index 2bb4cabf802f..ee9c12cf3f08 100644
> >> >> --- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> >> >> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> >> >> @@ -400,28 +400,45 @@ static SUNXI_CCU_MP_WITH_MUX_GATE(nand_clk, "=
nand", mod0_default_parents, 0x080,
> >> >>                                 BIT(31),      /* gate */
> >> >>                                 0);
> >> >>
> >> >> +/*
> >> >> + * MMC clocks are the new timing mode (see A83T & H3) variety, but=
 without
> >> >> + * the mode switch. This means they have a 2x post divider between=
 the clock
> >> >> + * and the MMC module. This is not documented in the manual, but i=
s taken
> >> >> + * into consideration when setting the mmc module clocks in the BS=
P kernel.
> >> >> + * Without it, MMC performance is degraded.
> >> >> + *
> >> >> + * We model it here to be consistent with other SoCs supporting th=
is mode.
> >> >> + * The alternative would be to add the 2x multiplier when setting =
the MMC
> >> >> + * module clock in the MMC driver, just for the A64.
> >> >> + */
> >> >>  static const char * const mmc_default_parents[] =3D { "osc24M", "p=
ll-periph0-2x",
> >> >>                                                   "pll-periph1-2x" =
};
> >> >> -static SUNXI_CCU_MP_WITH_MUX_GATE(mmc0_clk, "mmc0", mmc_default_pa=
rents, 0x088,
> >> >> -                               0, 4,         /* M */
> >> >> -                               16, 2,        /* P */
> >> >> -                               24, 2,        /* mux */
> >> >> -                               BIT(31),      /* gate */
> >> >> -                               0);
> >> >> -
> >> >> -static SUNXI_CCU_MP_WITH_MUX_GATE(mmc1_clk, "mmc1", mmc_default_pa=
rents, 0x08c,
> >> >> -                               0, 4,         /* M */
> >> >> -                               16, 2,        /* P */
> >> >> -                               24, 2,        /* mux */
> >> >> -                               BIT(31),      /* gate */
> >> >> -                               0);
> >> >> -
> >> >> -static SUNXI_CCU_MP_WITH_MUX_GATE(mmc2_clk, "mmc2", mmc_default_pa=
rents, 0x090,
> >> >> -                               0, 4,         /* M */
> >> >> -                               16, 2,        /* P */
> >> >> -                               24, 2,        /* mux */
> >> >> -                               BIT(31),      /* gate */
> >> >> -                               0);
> >> >> +static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc0_clk, "mmc0",
> >> >> +                                       mmc_default_parents, 0x088,
> >> >> +                                       0, 4,         /* M */
> >> >> +                                       16, 2,        /* P */
> >> >> +                                       24, 2,        /* mux */
> >> >> +                                       BIT(31),      /* gate */
> >> >> +                                       2,            /* post-div */
> >> >> +                                       0);
> >> >> +
> >> >> +static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc1_clk, "mmc1",
> >> >> +                                       mmc_default_parents, 0x08c,
> >> >> +                                       0, 4,         /* M */
> >> >> +                                       16, 2,        /* P */
> >> >> +                                       24, 2,        /* mux */
> >> >> +                                       BIT(31),      /* gate */
> >> >> +                                       2,            /* post-div */
> >> >> +                                       0);
> >> >> +
> >> >
> >> > Are you sure that the divider there for the non-eMMC clocks? Usually,
> >> > the new mode is only here for the eMMC, so we would divide the rate =
by
> >> > two in the non-eMMC case.
> >>
> >> The new mode is there for all MMC controllers. The other two MMC
> >> controllers even have the old/new timing mode switch. In case you
> >> forgot we have ".need_new_timings" set for the A64 compatible.
> >
> > But then, shouldn't we model them as such, using the work you did on
> > the A83t clocks?
>=20
> On the A64, the clocks don't have the switch. Only the MMC controller
> does. On the A83T, both do.

Ah, right. I've applied both patches.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--wc6v23sgtnnjoopq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlopBY8ACgkQ0rTAlCFN
r3Tz5Q/9FDzw+MlrI0U/RXXY/Kxhf09hjMv9RUunxa/TobK6xtslJivC3i/JHXkI
sy5/C7KgOeqttQdOM/6z7OdOOyW9WiDGsHUgmj0gqMIBT1f5yrtGMDMf/5pTbxt1
a7PFqoha0NMacoogJH3XMcydbTt0J/pmwL0V8KllRd3bWcT898KueQOGVo7D0BMt
ni3n4PxpkzNXZqHHMRRYPdR1z61Y6tlsdSoYWPgVwHCl4YlDZcUTRkN+nU8nbFNy
RrGufYCSV+HWz44+9CjrYfD4JAGOLKNUi7cWU5sL92UQYXFCo2XCasRc5DJn4n3P
dfgnX1jQAF0DQjW3HboQjrjUUYftn/4m+UbkTYhp5O9bDRlEnICQc/4/WlE94K+I
lmhTViHets5bJzEyAUm/mPB19cVmo2KSov6EZlTa3Fh78RysV5+b1zrF4djZryLz
Md79NNdkXjQgBxhszviWdS5b3rtT4nGDgpdnVKSa7Cs3j0s6xAObZkvP+/96rgz8
zOeC9/L2m373W6EzHRXXpaDJLH3Fk2sNRwkdA29U+XHHpMkwJROisld26JJ2jc2K
/FohDA4/KNdu18CLvSYbqnV8jfo6yA3Ag+0PGj5z57mQgpS0WW6TJOci1LzP/RTq
+UMHUi+MPs9xfaJdw/SBAQ0Sk2+YSf1cb1mmgbW7dTRK3FENsAo=
=ehsY
-----END PGP SIGNATURE-----

--wc6v23sgtnnjoopq--
