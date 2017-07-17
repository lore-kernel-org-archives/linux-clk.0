Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 17 Jul 2017 11:14:02 +0200
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
Subject: Re: [PATCH 03/11] clk: sunxi-ng: a83t: Support new timing mode for
 mmc2 clock
Message-ID: <20170717091402.3qb3fhdyhfbv6t66@flea>
References: <20170714064302.20383-1-wens@csie.org>
 <20170714064302.20383-4-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="om4kxkl4nhgdhtcm"
In-Reply-To: <20170714064302.20383-4-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--om4kxkl4nhgdhtcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 14, 2017 at 02:42:54PM +0800, Chen-Yu Tsai wrote:
> The MMC2 clock supports a new timing mode. When the new mode is active,
> the output clock rate is halved.
>=20
> This patch sets the feature flag for the new timing mode, and adds
> a pre-divider based on the mode bit.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  drivers/clk/sunxi-ng/ccu-sun8i-a83t.c | 38 +++++++++++++++++++++++++++--=
------
>  1 file changed, 30 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c b/drivers/clk/sunxi-ng=
/ccu-sun8i-a83t.c
> index 947f9f6e05d2..ee6688e9b361 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
> @@ -418,14 +418,36 @@ static SUNXI_CCU_PHASE(mmc1_sample_clk, "mmc1-sampl=
e", "mmc1",
>  static SUNXI_CCU_PHASE(mmc1_output_clk, "mmc1-output", "mmc1",
>  		       0x08c, 8, 3, 0);
> =20
> -/* TODO Support MMC2 clock's new timing mode. */
> -static SUNXI_CCU_MP_WITH_MUX_GATE(mmc2_clk, "mmc2", mod0_default_parents,
> -				  0x090,
> -				  0, 4,		/* M */
> -				  16, 2,	/* P */
> -				  24, 2,	/* mux */
> -				  BIT(31),	/* gate */
> -				  0);
> +/*
> + * MMC2 supports both old and new timing modes. When the new timing
> + * mode is active, the output clock rate is halved by two. Here we
> + * treat it as a variable pre-divider. Note that the pre-divider is
> + * _not_ included in the possible factors during a set clock rate
> + * operation. It is only read out.
> + */
> +static const struct ccu_mux_var_prediv mmc2_new_timing_predivs[] =3D {
> +	{ .index =3D 0, .shift =3D 30, .width =3D 1 },
> +	{ .index =3D 1, .shift =3D 30, .width =3D 1 },
> +};
> +static struct ccu_mp mmc2_clk =3D {
> +	.enable =3D BIT(31),
> +	.m      =3D _SUNXI_CCU_DIV(0, 4),
> +	.p      =3D _SUNXI_CCU_DIV(16, 2),
> +	.mux    =3D {
> +		.shift  =3D 24,
> +		.width  =3D 2,
> +		.var_predivs    =3D mmc2_new_timing_predivs,
> +		.n_var_predivs  =3D ARRAY_SIZE(mmc2_new_timing_predivs),
> +	},
> +	.common         =3D {
> +		.reg            =3D 0x090,
> +		.features	=3D CCU_FEATURE_MMC_TIMING_SWITCH,
> +		.hw.init        =3D CLK_HW_INIT_PARENTS("mmc2",
> +						      mod0_default_parents,
> +						      &ccu_mp_ops,
> +						      CLK_GET_RATE_NOCACHE),
> +	},
> +};

Treating the new bit seems a bit of a hack to me. It only works
because we're not evaluating the various pre-dividers during a
determine_rate (and set_rate), but it might change in the future, and
we will break all our eMMC controllers then.

Since they're quite special, I was thinking about creating a new MMC
clock type? We're going to use it on a number of SoCs, and we'll be
able to model it properly, without crippling the regular and generic
MP clocks.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--om4kxkl4nhgdhtcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZbH/aAAoJEBx+YmzsjxAg+tQP/102WYi/Phzgvr9gh9Q4GQ6S
w7TH3zyjrJMqjWyXccGyInKG+kskFE2jujssGvoO23nTBGbudo61Z1rcT5ejtgMG
otiwLQU9VmQYyJuoqSmAuFyXECYg4bqTln64ksDsN7OZJ7O9xsm44TeHQ6PhlhhN
VwsNuJUETaNQ6XuKVydPoFe5pLAy/aSwAzOBz3iUwAtrDzFY5D2wF5svDxkfKCtp
LNoxwGTuJMbQH4fQIMFFP+m2DHiEfE106ttO19cM3Vny12+koL6hk30pJ8bO3S9E
DDn9U+d+vpfpHVK1OsEqqyPZH//iDLzHmmYfZBMDP+Ev21OdfFp0khAanIoF8jPE
LSsQgvE5ReMz8EdR8dxBIzSCBSdheDeNY3knTZGnd7dZxEkyTsj4OEkzd+zTtArF
8NG7sZ86ryS3mwcM7JdTUU37FI5rwPSZbStluy97SDUsfMlrJUCHLnGl77z/zrBy
kwWPgkYNBIwJqc+b8ewyLRCqbcq8JUMc/iNo8bd5+CkC7XrUfXZo/11XaG6N2th+
x06MCrldbhzKpLiGshrjz2v5WpEMGUgWcvL11jB5oTxVn6ngbUcc2hB85C2nyA34
HsWg40mRkz4LFnJ7QcWXbM0h2jYpkMmT1azYwPiPhj5a+buKTrS2Djb7EnuE6MQi
KiF6OqRQ4LV2Vkpx5YZt
=ffHv
-----END PGP SIGNATURE-----

--om4kxkl4nhgdhtcm--
