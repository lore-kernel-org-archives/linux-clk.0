Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 6 Dec 2017 16:56:08 +0100
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
Message-ID: <20171206155608.tuw73ht6gq7hyrho@flea.lan>
References: <20171204051912.7485-1-wens@csie.org>
 <20171204051912.7485-3-wens@csie.org>
 <20171205195956.xdil2dsbtfwx35jj@flea.lan>
 <CAGb2v67=2BbOGWpRyujaR-pn6ZEfb1rSRtmzP-kUzXRn_y+iNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u6z2gdt534iux7ua"
In-Reply-To: <CAGb2v67=2BbOGWpRyujaR-pn6ZEfb1rSRtmzP-kUzXRn_y+iNg@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--u6z2gdt534iux7ua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 06, 2017 at 10:30:26AM +0800, Chen-Yu Tsai wrote:
> On Wed, Dec 6, 2017 at 3:59 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Hi,
> >
> > On Mon, Dec 04, 2017 at 01:19:12PM +0800, Chen-Yu Tsai wrote:
> >> On the A64, the MMC module clocks are fixed in the new timing mode,
> >> i.e. they do not have a bit to select the mode. These clocks have
> >> a 2x divider somewhere between the clock and the MMC module.
> >>
> >> To be consistent with other SoCs supporting the new timing mode,
> >> we model the 2x divider as a fixed post-divider on the MMC module
> >> clocks.
> >>
> >> This patch adds the post-dividers to the MMC clocks.
> >>
> >> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> >
> > I had a doubt applying that one... sorry.
> >
> >> ---
> >>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 57 +++++++++++++++++++++++---=
---------
> >>  1 file changed, 37 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi=
-ng/ccu-sun50i-a64.c
> >> index 2bb4cabf802f..ee9c12cf3f08 100644
> >> --- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> >> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> >> @@ -400,28 +400,45 @@ static SUNXI_CCU_MP_WITH_MUX_GATE(nand_clk, "nan=
d", mod0_default_parents, 0x080,
> >>                                 BIT(31),      /* gate */
> >>                                 0);
> >>
> >> +/*
> >> + * MMC clocks are the new timing mode (see A83T & H3) variety, but wi=
thout
> >> + * the mode switch. This means they have a 2x post divider between th=
e clock
> >> + * and the MMC module. This is not documented in the manual, but is t=
aken
> >> + * into consideration when setting the mmc module clocks in the BSP k=
ernel.
> >> + * Without it, MMC performance is degraded.
> >> + *
> >> + * We model it here to be consistent with other SoCs supporting this =
mode.
> >> + * The alternative would be to add the 2x multiplier when setting the=
 MMC
> >> + * module clock in the MMC driver, just for the A64.
> >> + */
> >>  static const char * const mmc_default_parents[] =3D { "osc24M", "pll-=
periph0-2x",
> >>                                                   "pll-periph1-2x" };
> >> -static SUNXI_CCU_MP_WITH_MUX_GATE(mmc0_clk, "mmc0", mmc_default_paren=
ts, 0x088,
> >> -                               0, 4,         /* M */
> >> -                               16, 2,        /* P */
> >> -                               24, 2,        /* mux */
> >> -                               BIT(31),      /* gate */
> >> -                               0);
> >> -
> >> -static SUNXI_CCU_MP_WITH_MUX_GATE(mmc1_clk, "mmc1", mmc_default_paren=
ts, 0x08c,
> >> -                               0, 4,         /* M */
> >> -                               16, 2,        /* P */
> >> -                               24, 2,        /* mux */
> >> -                               BIT(31),      /* gate */
> >> -                               0);
> >> -
> >> -static SUNXI_CCU_MP_WITH_MUX_GATE(mmc2_clk, "mmc2", mmc_default_paren=
ts, 0x090,
> >> -                               0, 4,         /* M */
> >> -                               16, 2,        /* P */
> >> -                               24, 2,        /* mux */
> >> -                               BIT(31),      /* gate */
> >> -                               0);
> >> +static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc0_clk, "mmc0",
> >> +                                       mmc_default_parents, 0x088,
> >> +                                       0, 4,         /* M */
> >> +                                       16, 2,        /* P */
> >> +                                       24, 2,        /* mux */
> >> +                                       BIT(31),      /* gate */
> >> +                                       2,            /* post-div */
> >> +                                       0);
> >> +
> >> +static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc1_clk, "mmc1",
> >> +                                       mmc_default_parents, 0x08c,
> >> +                                       0, 4,         /* M */
> >> +                                       16, 2,        /* P */
> >> +                                       24, 2,        /* mux */
> >> +                                       BIT(31),      /* gate */
> >> +                                       2,            /* post-div */
> >> +                                       0);
> >> +
> >
> > Are you sure that the divider there for the non-eMMC clocks? Usually,
> > the new mode is only here for the eMMC, so we would divide the rate by
> > two in the non-eMMC case.
>=20
> The new mode is there for all MMC controllers. The other two MMC
> controllers even have the old/new timing mode switch. In case you
> forgot we have ".need_new_timings" set for the A64 compatible.

But then, shouldn't we model them as such, using the work you did on
the A83t clocks?

> But to eliminate any doubts or concerns, I've rerun tests for the
> micro SD card, instead of the eMMC. And yes the results are the same,
> 2x improvement (12 MB/s vs 23.7 MB/s).

Ok, good.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--u6z2gdt534iux7ua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlooExQACgkQ0rTAlCFN
r3QvPA//fGUo/xiLoSzXQ/FtCpChj9aMzlU+f4h7hJodU7yvpze42gF7IN7CMXBc
5T4W8q6ljPjc8t5GZFHgKacmyRu/+TFSzw/L5aBZJFRRelS7Cu7shjU+O/Em7VQx
TtSyEeTXqmrGKOMxG8DyM+v2kaNyKIVXPZmCsJywFL3YNHvia355Sa2ck/sTTKHE
qIWBQNH4owRVBApXM7pIzKGDP9m6ch48Huunb0ghlEU43LmZsAyNxFauYCMU7RRu
ueOnghxcUfrtURv+6D76ZaV5cH0RzZNABmEw+JdFScuTaZ5tkWzOHeYbostwOutS
B4mefj96pGEo4kO+fhfAg+O9iqzsr4rUn2y1BpnklBl15hfWk4t+XamqQ/0ObSxV
VAOz+qJ/lalEkEOeHXGcc9NT8kc6HQoG1ELvwA22zH3LBEyO7t9Hf1e67YYi2pOS
vTHINB4hsybmJYC/wXVsU1ptjUew3Kfi60/U8dAnvLkb4vR2vss66ntDCX0GsuAS
PsFYltiuO/S/vzDS0R60Jf9jFXAjKQ9kLF8urEGudafP8zHRmoY35JvBbAEe5cjK
TDz7opmDHAzu3vY2KZVZ1VtdkYfwIydtIoaAwN0IY7MN+0NfvJQ0WUwBjUE3GZ2W
xota/Thlr94d/yTIZvFYcKuZcu6fiz71erkfeNtoqyIjXSUg1vY=
=96wz
-----END PGP SIGNATURE-----

--u6z2gdt534iux7ua--
