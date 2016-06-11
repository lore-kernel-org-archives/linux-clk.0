Return-Path: <moinejf@free.fr>
Date: Sat, 11 Jun 2016 10:27:54 +0200
From: Jean-Francois Moine <moinejf@free.fr>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-clk@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Andre
 Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Vishnu
 Patekar <vishnupatekar0510@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Boris Brezillon
 <boris.brezillon@free-electrons.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 08/15] clk: sunxi-ng: Add divider
Message-Id: <20160611102754.394c28863c2f50d5d29b94a1@free.fr>
In-Reply-To: <20160607204154.31967-9-maxime.ripard@free-electrons.com>
References: <20160607204154.31967-1-maxime.ripard@free-electrons.com>
	<20160607204154.31967-9-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

On Tue,  7 Jun 2016 22:41:47 +0200
Maxime Ripard <maxime.ripard@free-electrons.com> wrote:

> Add support for the various dividers (linear, table or pow-of-two based)
> found in the CCU.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  drivers/clk/sunxi-ng/Makefile  |   1 +
>  drivers/clk/sunxi-ng/ccu_div.c | 136 +++++++++++++++++++++++++++++++++++=
++++++
>  drivers/clk/sunxi-ng/ccu_div.h | 135 +++++++++++++++++++++++++++++++++++=
+++++
>  3 files changed, 272 insertions(+)
>  create mode 100644 drivers/clk/sunxi-ng/ccu_div.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu_div.h
>=20
> diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefile
> index c47cbd309d59..67a2559fe283 100644
> --- a/drivers/clk/sunxi-ng/Makefile
> +++ b/drivers/clk/sunxi-ng/Makefile
> @@ -3,6 +3,7 @@ obj-y +=3D ccu_reset.o
> =20
>  obj-y +=3D ccu_frac.o
> =20
> +obj-y +=3D ccu_div.o
>  obj-y +=3D ccu_fixed_factor.o
>  obj-y +=3D ccu_gate.o
>  obj-y +=3D ccu_mux.o
> diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_di=
v.c
> new file mode 100644
> index 000000000000..8659b4cb6c20
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu_div.c
> @@ -0,0 +1,136 @@
	[snip]
> diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_di=
v.h
> new file mode 100644
> index 000000000000..5edbdc1a98c8
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu_div.h
> @@ -0,0 +1,135 @@
	[snip]
> +#define SUNXI_CCU_M_WITH_GATE(_struct, _name, _parent, _reg,		\
> +			      _mshift, _mwidth,	_gate,			\
> +			      _flags)					\
> +	struct ccu_div _struct =3D {					\
> +		.enable	=3D _gate,					\
> +		.div	=3D _SUNXI_CCU_DIV(_mshift, _mwidth),		\
> +		.common	=3D {						\
> +			.reg		=3D _reg,				\
> +			.features	=3D CCU_FEATURE_GATE,		\
> +			.hw.init	=3D SUNXI_HW_INIT(_name,		\
> +							_parent,	\
> +							&ccu_div_ops,	\
> +							_flags),	\
> +		},							\
> +	}
> +
> +#define SUNXI_CCU_M(_struct, _name, _parent, _reg, _mshift, _mwidth,	\
> +		    _flags)						\
> +	SUNXI_CCU_M_WITH_GATE(_struct, _name, _parent, _reg,		\
> +			      _mshift, _mwidth, 0, _flags)
	[snip]

This shows that the flag CCU_FEATURE_GATE is perfectly useless...

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
