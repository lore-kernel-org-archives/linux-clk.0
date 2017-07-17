Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 17 Jul 2017 11:17:47 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 05/11] mmc: sunxi: Support controllers that can use both
 old and new timings
Message-ID: <20170717091747.kcrlifbp7meihszm@flea>
References: <20170714064302.20383-1-wens@csie.org>
 <20170714064302.20383-6-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gafuwlarzvwcaion"
In-Reply-To: <20170714064302.20383-6-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--gafuwlarzvwcaion
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 14, 2017 at 02:42:56PM +0800, Chen-Yu Tsai wrote:
> On the SoCs that introduced the new timing mode for MMC controllers,
> both the old (where the clock delays are set in the CCU) and new
> (where the clock delays are set in the MMC controller) timing modes
> are available, and we have to support them both. However there are
> two bits that control which mode is active. One is in the CCU, the
> other is in the MMC controller. The settings on both sides must be
> the same, or nothing will work.
>=20
> The CCU's get/set_phase callbacks return -ENOTSUPP when the new
> timing mode is active. This provides a way to know which mode is
> active on that side, and we can set the bit on the MMC controller
> side accordingly.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  drivers/mmc/host/sunxi-mmc.c | 34 ++++++++++++++++++++++++++++++----
>  1 file changed, 30 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
> index 0fb4e4c119e1..56e45c65b52d 100644
> --- a/drivers/mmc/host/sunxi-mmc.c
> +++ b/drivers/mmc/host/sunxi-mmc.c
> @@ -22,6 +22,7 @@
>  #include <linux/err.h>
> =20
>  #include <linux/clk.h>
> +#include <linux/clk/sunxi-ng.h>
>  #include <linux/gpio.h>
>  #include <linux/platform_device.h>
>  #include <linux/spinlock.h>
> @@ -259,7 +260,7 @@ struct sunxi_mmc_cfg {
>  	/* Does DATA0 needs to be masked while the clock is updated */
>  	bool mask_data0;
> =20
> -	bool needs_new_timings;
> +	bool has_new_timings;

I think we should have both, it's a bit different. Newer SoCs like the
A64 can only operate using new timings, while the older ones can
operate in both modes.

In one case, we're forced to use it, in the other one it's a
policy. We should differentiate both cases.

Looks good otherwise, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--gafuwlarzvwcaion
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZbIC7AAoJEBx+YmzsjxAgsg0P/3+iLOhJJ5gHijY+qT51XDxp
ZDkDGQO3myu2wAFwcSyTR+765/89iazPdsU4BVBiGLavW9YLsqm6Y8ADvpebNMsN
XZ3PZ2t69q6DX/9BPsoxf1+LegiorNNAooqZ2h49NjqremDoS2WjSCB0u3/ikVg/
AU6sbwCSaQMxFJSQJEV2wCOCasugG64uX0+LITkSF3op6lZwqcROwAkaKGUSm9vT
MMZVXVlKuKOeAWKfkLU48BV0HSDjcSEZWJl3JX/8jG8V7E+hhxdh3RTvbk4ZyvMm
t2GiBiHwkgOZmY34u4Et7zdmj55/5SKO/j6ZXhaefZV/3bi0p7qxB3s8M9TTuKXu
g4NWgCVrPkNcBdbEy5Yqw/WnoPy37Ic9wAVbirPP//RiURCmRkOxok0AQAsY01UI
+aCe4rhdbkgeSBhYm/MEbzCOpxAHQXnE3hJGEU9HvEgh6uP7NLN7x2rXXK0WaGPQ
vwXOFLDj5oBsxisEG83bBqRBqTYgGGRysypTnczgDmEYnv3m+qS+ccPaX2c0xdzR
qLnrxHX7wfv+mPFenYnum3LGmU0EU4Uqi365izhtOqJs48sp6uvG4H6fM76ZE3vP
YrlCq9yj4lUZQgE0QBZuQAfiE4qQowfxTVXR7bT7wr1lsWWIM8ezIrTrVcGlghjs
hBz0mExCRsJLsga1xYbB
=MbUc
-----END PGP SIGNATURE-----

--gafuwlarzvwcaion--
