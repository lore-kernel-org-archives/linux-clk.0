Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 17 Jul 2017 11:09:45 +0200
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
Subject: Re: [PATCH 02/11] clk: sunxi-ng: Add interface to query or configure
 MMC timing modes.
Message-ID: <20170717090945.qh2uekguzgv5lo36@flea>
References: <20170714064302.20383-1-wens@csie.org>
 <20170714064302.20383-3-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="okw2fn4jzuimsdrc"
In-Reply-To: <20170714064302.20383-3-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--okw2fn4jzuimsdrc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 14, 2017 at 02:42:53PM +0800, Chen-Yu Tsai wrote:
> Starting with the A83T SoC, Allwinner introduced a new timing mode for
> its MMC clocks. The new mode changes how the MMC controller sample and
> output clocks are delayed to match chip and board specifics. There are
> two controls for this, one on the CCU side controlling how the clocks
> behave, and one in the MMC controller controlling what inputs to take
> and how to route them.
>=20
> In the old mode, the MMC clock had 2 child clocks providing the output
> and sample clocks, which could be delayed by a number of clock cycles
> measured from the MMC clock's parent.
>=20
> With the new mode, the 2 delay clocks are no longer active. Instead,
> the delays and associated controls are moved into the MMC controller.
> The output of the MMC clock is also halved.
>=20
> The difference in how things are wired between the modes means that the
> clock controls and the MMC controls must match. To achieve this in a
> clear, explicit way, we introduce two functions for the MMC driver to
> use: one queries the hardware for the current mode set, and the other
> allows the MMC driver to request a mode.
>=20
> With newer SoCs such as the A64, the old mode is all but removed. Hence
> we support two variations, one where the mode can be toggled, and the
> other where the clock is fixed in the new mode.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  drivers/clk/sunxi-ng/Makefile         |  1 +
>  drivers/clk/sunxi-ng/ccu_common.h     |  2 +
>  drivers/clk/sunxi-ng/ccu_mmc_timing.c | 73 +++++++++++++++++++++++++++++=
++++++
>  include/linux/clk/sunxi-ng.h          | 20 ++++++++++
>  4 files changed, 96 insertions(+)
>  create mode 100644 drivers/clk/sunxi-ng/ccu_mmc_timing.c
>  create mode 100644 include/linux/clk/sunxi-ng.h
>=20
> diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefile
> index 0c45fa50283d..45a5910379a5 100644
> --- a/drivers/clk/sunxi-ng/Makefile
> +++ b/drivers/clk/sunxi-ng/Makefile
> @@ -1,5 +1,6 @@
>  # Common objects
>  lib-$(CONFIG_SUNXI_CCU)		+=3D ccu_common.o
> +lib-$(CONFIG_SUNXI_CCU)		+=3D ccu_mmc_timing.o
>  lib-$(CONFIG_SUNXI_CCU)		+=3D ccu_reset.o
> =20
>  # Base clock types
> diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-ng/ccu=
_common.h
> index d6fdd7a789aa..88981e7fd978 100644
> --- a/drivers/clk/sunxi-ng/ccu_common.h
> +++ b/drivers/clk/sunxi-ng/ccu_common.h
> @@ -23,6 +23,8 @@
>  #define CCU_FEATURE_FIXED_POSTDIV	BIT(3)
>  #define CCU_FEATURE_ALL_PREDIV		BIT(4)
>  #define CCU_FEATURE_LOCK_REG		BIT(5)
> +#define CCU_FEATURE_MMC_TIMING_SWITCH	BIT(6)
> +#define CCU_FEATURE_MMC_ALWAYS_NEW	BIT(7)

I'm not really sure we need the ALWAYS_NEW bit here. In the case where
the clocks cannot operate in the old mode any more, we won't even
query the clocks, since we know that it's not needed at all.

Pretty much just like what we're doing for old-mode-only clocks at the
moment.

I guess the only thing we should indentify is whether the clock can
switch between the two, or not, and the MMC_TIMING_SWITCH bit is
already perfect for that.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--okw2fn4jzuimsdrc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZbH7ZAAoJEBx+YmzsjxAg7RoP/jFqqQqF7gr/6mFDmS9JelsZ
74NsUiruGeks8cxq8V+ZKCBv5RjQOwP+o3psua+9yapsljAIbH6Cwc24e2SvNfMt
kOdeST6eRNmP7J4+bnvEQyvrIOLPl87Oy5XQCWUEtyvmeE6yh4OEyF63j6ZHJqsh
zACErzIWExcBRqQHCs7o3xQanzDOSt4qF+Oj4iyM/FrBQQeFXGtXvbaP/gS7V8Ls
zaXInbMh3RGtQkfn9I4Mb1aOOXN92zw0OmBhNMiDO5dnj4sOhIErBzk/rWnKLT6/
v+Q+YhCVQE+P+03B7zI5rTmnn+jikLs47TpIjhzQvCIWR504+DpJpUUaiZ8vB3i0
H/ttX9/6yleWkqAezdT69X2O8BiFtf9B961YCFwJT95Vhx2T0vUmFG5mDwk7xofV
2S8aXS/Sj9bqXKAZaqCQokfM/1PmxsPeFo9s91JrI0JTLhztcDhDfO+iUOUCpshk
/A7CLFlGgPCuDjdiJfpNz+hGEjVsHkxOiVv+GuL7p3lsakUml5hmrYCKkwOKC1RZ
IxANtmHihsdObnRy7n2bUihVyrNuyRilHEeCj+p4DaHT18zgOk0q/4D6kuommn7Q
8z+HAobdbakgM6TfRlg6iZuS5d1IiJw69la6tXvm3JihAS9kbz9SEXRpmjDsEACa
mFCiwTwyxIgMpjZxeXDm
=dU1S
-----END PGP SIGNATURE-----

--okw2fn4jzuimsdrc--
