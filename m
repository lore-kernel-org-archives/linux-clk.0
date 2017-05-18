Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 18 May 2017 09:39:43 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v3 3/6] clk: sunxi-ng: Add driver for A83T CCU
Message-ID: <20170518073943.hu4bsz5qggpkvyv2@flea.home>
References: <20170518035809.15487-1-wens@csie.org>
 <20170518035809.15487-4-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hlbj42qvgqygdi2j"
In-Reply-To: <20170518035809.15487-4-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--hlbj42qvgqygdi2j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2017 at 11:58:06AM +0800, Chen-Yu Tsai wrote:
> +/*
> + * MMC2 supports both old and new timing modes. When the new timing
> + * mode is active, the output clock rate is halved by two. Here we
> + * treat it as a variable pre-divider. Note that the pre-divider is
> + * _not_ included in the possible factors during a set clock rate
> + * operation. It is only read out.
> + */
> +#define SUN8I_A83T_MMC2_REG	0x090
> +static const struct ccu_mux_var_prediv mmc2_new_timing_predivs[] =3D {
> +	{ .index =3D 0, .shift =3D 30, .width =3D 1 },
> +	{ .index =3D 1, .shift =3D 30, .width =3D 1 },
> +};
> +static struct ccu_mp mmc2_clk =3D {
> +	.enable	=3D BIT(31),
> +	.m	=3D _SUNXI_CCU_DIV(0, 4),
> +	.p	=3D _SUNXI_CCU_DIV(16, 2),
> +	.mux	=3D {
> +		.shift	=3D 24,
> +		.width	=3D 2,
> +		.var_predivs	=3D mmc2_new_timing_predivs,
> +		.n_var_predivs	=3D ARRAY_SIZE(mmc2_new_timing_predivs),
> +	},
> +	.common		=3D {
> +		.reg		=3D 0x090,
> +		.hw.init	=3D CLK_HW_INIT_PARENTS("mmc2",
> +						      mod0_default_parents,
> +						      &ccu_mp_ops,
> +						      CLK_GET_RATE_NOCACHE),
> +	},
> +};
> +
> +static SUNXI_CCU_PHASE(mmc2_sample_clk, "mmc2-sample", "mmc2",
> +		       0x090, 20, 3, 0);
> +static SUNXI_CCU_PHASE(mmc2_output_clk, "mmc2-output", "mmc2",
> +		       0x090, 8, 3, 0);

I'm sorry to be a pain for this, but we're in the exact same situation
for the A83T than the A33 or the H3. There's no reason we'd do
something different with the MMC clocks only on the A83T.

What I'd like to happen is:
  1) Get the A83T ccu driver in, without *any* of the new mode
     handling.
  2) Work on the new mode for the A33, A83T and H3 (and the other I
     might have forgotten).

This issue really isn't A83 specific, there's no reason to come up
with A83 specific code.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--hlbj42qvgqygdi2j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZHU+/AAoJEBx+YmzsjxAgQWoP/25GgswMXLmCREgEy8OaEHfT
wMOVMVO6YkOKCzFun1+cYwNitVXMoDZ7FN0urwprmi4XWCt7B8a2tsip4BN+nlTv
9AaB25oGD2pP9SsTv+2dfaOGfDvsofBhIelSGLFt0gJdxEgEtWh7BPy1RKxHL2f+
gbNNd1BCT13YO0Juerhbq8vSQ6VJsTl/s6nvfhJRS3ZlsRM/Eaq2A8zfWP7MiSlc
pRISIRoUGgnb1rRw1z3f/3GwtjPnOvlQ+sNvdXAX7IBEwSFt6lLZV0p1N9V73HZU
YrJp71+Zly3l0OYGUD7mXC04YKlp1TociN3whxAoNEXRnRZ5RqMfuDUdFQ61D4kn
xfM5BFexqoSD3axnE0QiKBZAcLMpjzkH3o/+LTZq9WO1XVckw8ZvDesi+nEKMarR
MLU/6FVDtJsRKIXzPDtiYq51i409D2/JxCcnLG2w7cUoZk3Y62F+P9ZegfQ2OwaK
qf+8MgdcbgEqkfks+rswyctPi0cojo3Xo0zu357i2rmJsF4q6+vvC7RAjPZoUQ/Q
ancnc6MT2UDhU6WYsfoAc1psQuRLmT1eUiJxYBDR1SHECfL8tBdHhX05x1FeU8m4
/8gMZ/9fQQmt1SZidNH/TzKw5VsyHoQD7Fpi9x/C/i8Q1xLh/1lQxORIrDycgj7S
B1smeffikXvfJxxdBiEp
=BSbP
-----END PGP SIGNATURE-----

--hlbj42qvgqygdi2j--
