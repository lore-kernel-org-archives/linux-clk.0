Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 27 Jul 2016 09:43:26 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, dev <dev@linux-sunxi.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 7/9] clk: sunxi-ng: mux: Add clk notifier functions
Message-ID: <20160727074326.GI6560@lukather>
References: <1469516671-19377-1-git-send-email-wens@csie.org>
 <1469516671-19377-8-git-send-email-wens@csie.org>
 <20160727073005.GG6560@lukather>
 <CAGb2v67KcvzxadXYTWSg42+gpRxt4fhNmiWmtAD5D7r0+K4T8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yzvKDKJiLNESc64M"
In-Reply-To: <CAGb2v67KcvzxadXYTWSg42+gpRxt4fhNmiWmtAD5D7r0+K4T8g@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--yzvKDKJiLNESc64M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2016 at 03:32:58PM +0800, Chen-Yu Tsai wrote:
> On Wed, Jul 27, 2016 at 3:30 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > On Tue, Jul 26, 2016 at 03:04:29PM +0800, Chen-Yu Tsai wrote:
> >> On sunxi we support cpufreq by changing the clock rate of PLL-CPU.
> >> It's possible the clock output of the PLL goes out of the CPU's
> >> operational limits when the PLL's multipliers / dividers are changed
> >> and it hasn't stabilized yet. This would result in the CPU hanging.
> >>
> >> To circumvent this, we temporarily switch the CPU mux clock to another
> >> stable clock before the rate change, and switch it back after the PLL
> >> stabilizes. This is done with clk notifiers registered on the PLL.
> >>
> >> This patch adds common functions for notifiers to reparent mux clocks.
> >>
> >> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> >> ---
> >>  drivers/clk/sunxi-ng/ccu_mux.c | 36 +++++++++++++++++++++++++++++++++=
+++
> >>  drivers/clk/sunxi-ng/ccu_mux.h | 14 ++++++++++++++
> >>  2 files changed, 50 insertions(+)
> >>
> >> diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu=
_mux.c
> >> index f96eabb5d1f3..8a6e9065cb85 100644
> >> --- a/drivers/clk/sunxi-ng/ccu_mux.c
> >> +++ b/drivers/clk/sunxi-ng/ccu_mux.c
> >> @@ -8,7 +8,9 @@
> >>   * the License, or (at your option) any later version.
> >>   */
> >>
> >> +#include <linux/clk.h>
> >>  #include <linux/clk-provider.h>
> >> +#include <linux/delay.h>
> >>
> >>  #include "ccu_gate.h"
> >>  #include "ccu_mux.h"
> >> @@ -199,3 +201,37 @@ const struct clk_ops ccu_mux_ops =3D {
> >>       .determine_rate =3D __clk_mux_determine_rate,
> >>       .recalc_rate    =3D ccu_mux_recalc_rate,
> >>  };
> >> +
> >> +/*
> >> + * This clock notifier is called when the frequency of the of the par=
ent
> >> + * PLL clock is to be changed. The idea is to switch the parent to a
> >> + * stable clock, such as the main oscillator, while the PLL frequency
> >> + * stabilizes.
> >> + */
> >> +static int ccu_mux_notifier_cb(struct notifier_block *nb,
> >> +                            unsigned long event, void *data)
> >> +{
> >> +     struct ccu_mux_nb *mux =3D to_ccu_mux_nb(nb);
> >> +     int ret =3D 0;
> >> +
> >> +     if (event =3D=3D PRE_RATE_CHANGE) {
> >> +             mux->original_index =3D ccu_mux_helper_get_parent(mux->c=
ommon,
> >> +                                                             mux->cm);
> >> +             ret =3D ccu_mux_helper_set_parent(mux->common, mux->cm,
> >> +                                             mux->bypass_index);
> >> +     } else if (event =3D=3D POST_RATE_CHANGE) {
> >> +             ret =3D ccu_mux_helper_set_parent(mux->common, mux->cm,
> >> +                                             mux->original_index);
> >> +     }
> >> +
> >> +     udelay(mux->delay_us);
> >
> > Are you sure we need that delay?
> >
> > set_rate will end and notify you once the PLL rate is stable, so it
> > looks redundant.
>=20
> The delay requirement is on the cpu mux clk, not the PLL. The
> datasheet says you should wait for up to 8 clock cycles after
> changing the parent. Not sure how this factors with the CPU
> actually doing the waiting though.
>=20
> So this is separate from the PLL lock delay.

Ok, thanks :)

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--yzvKDKJiLNESc64M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXmGYdAAoJEBx+YmzsjxAgaYkP/3lUFxkTKkFqel25vUjryh40
geJDj9YE0Q5fH1yAHU+4sc+Nvvg2hcB3UFEL2XWmYb+rY/dDxMbEm1RQBo2re7kb
uQdogCZ5hfyR/NYe8IeDFXVXwYNbZRIrfKlUAY4hBjkrPsek+rSQjgD6ATXgUn6D
nZ+fNtW4woQEkIDZOrM+Psaxqd03qj5bc8VjrypqE8t5Sdf2yLDHLri4htz+hLAT
J+x+wiqmJWeW0pJ0v549dOdjjOoXtTQTFJYEmwrvBxb2LDme4mM38B/7AZWhAEO2
FJLqYuW5TpSJpN44R8fRt0DVv3ZnPWq+T7REIzmoBsOzNxP8Yx58rdeKHH78OK2m
jioeXtCfONRnvR5+bPvddxvLdhYn1dkvXGWwp4wBPJ3fO0EZ4WQvoD9T8Z3b2IbT
ctrVK9+83LljEWTS49/uThdK9PR0b9MXtz0q+vXvFylFqnZNvl9NrlKPPMBk92LA
AsKyzeIEn/DFeplYSSVQr7olUZdrf7uOAH1jhcyWcAi/pN4W47GEvSnYGZdeStx5
KkIb5NFqLewgihIiqjQePLBZ894SKOzcg58wTNo9acBnZETDb4m8eTLgXeZsgBxo
IayGf03sippf1N7oof9uSWoc4EFtW54X15d4bizoEosCImRMH9xeAIo029uoA1R+
pAClMBK71CVp5MT9WgKV
=0Ir+
-----END PGP SIGNATURE-----

--yzvKDKJiLNESc64M--
