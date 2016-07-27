Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 27 Jul 2016 09:30:05 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, dev@linux-sunxi.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/9] clk: sunxi-ng: mux: Add clk notifier functions
Message-ID: <20160727073005.GG6560@lukather>
References: <1469516671-19377-1-git-send-email-wens@csie.org>
 <1469516671-19377-8-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GdbWtwDHkcXqP16f"
In-Reply-To: <1469516671-19377-8-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--GdbWtwDHkcXqP16f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 26, 2016 at 03:04:29PM +0800, Chen-Yu Tsai wrote:
> On sunxi we support cpufreq by changing the clock rate of PLL-CPU.
> It's possible the clock output of the PLL goes out of the CPU's
> operational limits when the PLL's multipliers / dividers are changed
> and it hasn't stabilized yet. This would result in the CPU hanging.
>=20
> To circumvent this, we temporarily switch the CPU mux clock to another
> stable clock before the rate change, and switch it back after the PLL
> stabilizes. This is done with clk notifiers registered on the PLL.
>=20
> This patch adds common functions for notifiers to reparent mux clocks.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  drivers/clk/sunxi-ng/ccu_mux.c | 36 ++++++++++++++++++++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu_mux.h | 14 ++++++++++++++
>  2 files changed, 50 insertions(+)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mu=
x.c
> index f96eabb5d1f3..8a6e9065cb85 100644
> --- a/drivers/clk/sunxi-ng/ccu_mux.c
> +++ b/drivers/clk/sunxi-ng/ccu_mux.c
> @@ -8,7 +8,9 @@
>   * the License, or (at your option) any later version.
>   */
> =20
> +#include <linux/clk.h>
>  #include <linux/clk-provider.h>
> +#include <linux/delay.h>
> =20
>  #include "ccu_gate.h"
>  #include "ccu_mux.h"
> @@ -199,3 +201,37 @@ const struct clk_ops ccu_mux_ops =3D {
>  	.determine_rate	=3D __clk_mux_determine_rate,
>  	.recalc_rate	=3D ccu_mux_recalc_rate,
>  };
> +
> +/*
> + * This clock notifier is called when the frequency of the of the parent
> + * PLL clock is to be changed. The idea is to switch the parent to a
> + * stable clock, such as the main oscillator, while the PLL frequency
> + * stabilizes.
> + */
> +static int ccu_mux_notifier_cb(struct notifier_block *nb,
> +			       unsigned long event, void *data)
> +{
> +	struct ccu_mux_nb *mux =3D to_ccu_mux_nb(nb);
> +	int ret =3D 0;
> +
> +	if (event =3D=3D PRE_RATE_CHANGE) {
> +		mux->original_index =3D ccu_mux_helper_get_parent(mux->common,
> +								mux->cm);
> +		ret =3D ccu_mux_helper_set_parent(mux->common, mux->cm,
> +						mux->bypass_index);
> +	} else if (event =3D=3D POST_RATE_CHANGE) {
> +		ret =3D ccu_mux_helper_set_parent(mux->common, mux->cm,
> +						mux->original_index);
> +	}
> +
> +	udelay(mux->delay_us);

Are you sure we need that delay?

set_rate will end and notify you once the PLL rate is stable, so it
looks redundant.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--GdbWtwDHkcXqP16f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXmGL9AAoJEBx+YmzsjxAg/N0P/AjIqgBl/7aLRhDif+H/FYOg
5aDj6v03ArHwVhBKeSRKyLCmvPSLsSLfWWWx7fSIiyMjhbyShYB1mFeisjTW7GkY
/n1HCaEf7KOtS36Rzk305Hbja72KynC/GpJZCwcoQtepMU4WZ06ISErguLRfGU2C
DKKdQ8Kijx1ZBshJtYdXUP0gK2VhRMwWPeUKUUXLd/FKhHat5Y0ejNXqe2sW7p0E
5oiAytgRBr18/nSJCLESTQvZxMTtNPferv/ENaigB3mUi3FFZer09eUKL2qIr0kh
dcjJKF3qu4/XQPxB5xIR0DTszh6+RCExVkEKmup8JyFHF22kN/OZIMxSyD5Jgs2D
VmzJWnrQ1AUGoaTwTTsoyarYEKSysHPyqyLZcmaniUg4TddJkeoOc/7/fuKQT31X
vZWylK6bVMTpd18dnE7OOq3k5b8B4ZQQvJyQms8lPrfrMgO9eZPzwDaWADEXn08Q
wo5dttGRcuGXwPnU042XkG84tzeThJzXwv99fNEERCsBl+Jh2xw3jRavd3QrrToh
UHbFidh3+1GeKst5DeYKMHsZkmEAyfAbjl+ScxUJHnZlZQTulUAQItwiAHGMLlPB
7w8YLVixeVlZIi4newrNWrDHTz7Aj+ifUtabNmr9M224V4lO966pAghg+FRlZ6YR
aObKxfFjv6QPN/AaQKJI
=DOU6
-----END PGP SIGNATURE-----

--GdbWtwDHkcXqP16f--
