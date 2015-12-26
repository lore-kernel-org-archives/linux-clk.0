Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: rockchip: fix section mismatches with new child-clocks
Date: Sat, 26 Dec 2015 14:19:28 +0100
Message-ID: <1770994.rQad6eIPzW@diego>
In-Reply-To: <4280088.eoGuZl5vUh@diego>
References: <4280088.eoGuZl5vUh@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Am Samstag, 26. Dezember 2015, 14:17:40 schrieb Heiko St=FCbner:
> To model the muxes downstream of fractional dividers we introduced th=
e
> child property, allowing to describe a direct child clock.
> The first implementation seems to cause section warnings, as the core=

> clock-tree is marked as initdata while the data pointed to from the
> child element is not.
>=20
> While there may be some way to also set that missing property in the
> inline notation I didn't find it, so to actually fix the issue for no=
w
> move the sub-definitions into separate declarations that can have
> their own __initdata properties.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

something did seem to have gone wrong with my mail sending ... the mail=
 from=20
14:07 is the correct one

Sorry for the noise
Heiko

> ---
>  drivers/clk/rockchip/clk-rk3036.c | 35 ++++++++++++++------
>  drivers/clk/rockchip/clk-rk3188.c | 70
> ++++++++++++++++++++++++++++-----------
>  drivers/clk/rockchip/clk-rk3288.c | 56 ++++++++++++++++++++++-------=
--
>  drivers/clk/rockchip/clk.h        |  2 +-
>  4 files changed, 116 insertions(+), 47 deletions(-)
>=20
> diff --git a/drivers/clk/rockchip/clk-rk3036.c b/drivers/clk/rockchip=
/clk-
> rk3036.c
> index fb35263..ebce980 100644
> --- a/drivers/clk/rockchip/clk-rk3036.c
> +++ b/drivers/clk/rockchip/clk-rk3036.c
> @@ -149,6 +149,26 @@ static struct rockchip_pll_clock rk3036_pll_clks=
[]
> __initdata =3D {
>  #define DFLAGS CLK_DIVIDER_HIWORD_MASK
>  #define GFLAGS (CLK_GATE_HIWORD_MASK | CLK_GATE_SET_TO_DISABLE)
>=20
> +static struct rockchip_clk_branch rk3036_uart0_fracmux __initdata =3D=

> +=09MUX(SCLK_UART0, "sclk_uart0", mux_uart0_p, CLK_SET_RATE_PARENT,
> +=09=09=09RK2928_CLKSEL_CON(13), 8, 2, MFLAGS);
> +
> +static struct rockchip_clk_branch rk3036_uart1_fracmux __initdata =3D=

> +=09MUX(SCLK_UART1, "sclk_uart1", mux_uart1_p, CLK_SET_RATE_PARENT,
> +=09=09=09RK2928_CLKSEL_CON(14), 8, 2, MFLAGS);
> +
> +static struct rockchip_clk_branch rk3036_uart2_fracmux __initdata =3D=

> +=09MUX(SCLK_UART2, "sclk_uart2", mux_uart2_p, CLK_SET_RATE_PARENT,
> +=09=09=09RK2928_CLKSEL_CON(15), 8, 2, MFLAGS);
> +
> +static struct rockchip_clk_branch rk3036_i2s_fracmux __initdata =3D
> +=09MUX(0, "i2s_pre", mux_i2s_pre_p, CLK_SET_RATE_PARENT,
> +=09=09=09RK2928_CLKSEL_CON(3), 8, 2, MFLAGS);
> +
> +static struct rockchip_clk_branch rk3036_spdif_fracmux __initdata =3D=

> +=09MUX(SCLK_SPDIF, "sclk_spdif", mux_spdif_p, 0,
> +=09=09=09RK2928_CLKSEL_CON(5), 8, 2, MFLAGS);
> +
>  static struct rockchip_clk_branch rk3036_clk_branches[] __initdata =3D=
 {
>  =09/*
>  =09 * Clock-Architecture Diagram 1
> @@ -230,18 +250,15 @@ static struct rockchip_clk_branch
> rk3036_clk_branches[] __initdata =3D {
>  =09COMPOSITE_FRACMUX(0, "uart0_frac", "uart0_src", CLK_SET_RATE_PARE=
NT,
>  =09=09=09RK2928_CLKSEL_CON(17), 0,
>  =09=09=09RK2928_CLKGATE_CON(1), 9, GFLAGS,
> -=09MUX(SCLK_UART0, "sclk_uart0", mux_uart0_p, CLK_SET_RATE_PARENT,
> -=09=09=09RK2928_CLKSEL_CON(13), 8, 2, MFLAGS)),
> +=09=09=09&rk3036_uart0_fracmux),
>  =09COMPOSITE_FRACMUX(0, "uart1_frac", "uart1_src", CLK_SET_RATE_PARE=
NT,
>  =09=09=09RK2928_CLKSEL_CON(18), 0,
>  =09=09=09RK2928_CLKGATE_CON(1), 11, GFLAGS,
> -=09MUX(SCLK_UART1, "sclk_uart1", mux_uart1_p, CLK_SET_RATE_PARENT,
> -=09=09=09RK2928_CLKSEL_CON(14), 8, 2, MFLAGS)),
> +=09=09=09&rk3036_uart1_fracmux),
>  =09COMPOSITE_FRACMUX(0, "uart2_frac", "uart2_src", CLK_SET_RATE_PARE=
NT,
>  =09=09=09RK2928_CLKSEL_CON(19), 0,
>  =09=09=09RK2928_CLKGATE_CON(1), 13, GFLAGS,
> -=09MUX(SCLK_UART2, "sclk_uart2", mux_uart2_p, CLK_SET_RATE_PARENT,
> -=09=09=09RK2928_CLKSEL_CON(15), 8, 2, MFLAGS)),
> +=09=09=09&rk3036_uart2_fracmux),
>=20
>  =09COMPOSITE(0, "aclk_vcodec", mux_pll_src_3plls_p, 0,
>  =09=09=09RK2928_CLKSEL_CON(32), 14, 2, MFLAGS, 8, 5, DFLAGS,
> @@ -292,8 +309,7 @@ static struct rockchip_clk_branch rk3036_clk_bran=
ches[]
> __initdata =3D {
>  =09COMPOSITE_FRACMUX(0, "i2s_frac", "i2s_src", CLK_SET_RATE_PARENT,
>  =09=09=09RK2928_CLKSEL_CON(7), 0,
>  =09=09=09RK2928_CLKGATE_CON(0), 10, GFLAGS,
> -=09MUX(0, "i2s_pre", mux_i2s_pre_p, CLK_SET_RATE_PARENT,
> -=09=09=09RK2928_CLKSEL_CON(3), 8, 2, MFLAGS)),
> +=09=09=09&rk3036_i2s_fracmux),
>  =09COMPOSITE_NODIV(SCLK_I2S_OUT, "i2s_clkout", mux_i2s_clkout_p, 0,
>  =09=09=09RK2928_CLKSEL_CON(3), 12, 1, MFLAGS,
>  =09=09=09RK2928_CLKGATE_CON(0), 13, GFLAGS),
> @@ -306,8 +322,7 @@ static struct rockchip_clk_branch rk3036_clk_bran=
ches[]
> __initdata =3D {
>  =09COMPOSITE_FRACMUX(0, "spdif_frac", "spdif_src", 0,
>  =09=09=09RK2928_CLKSEL_CON(9), 0,
>  =09=09=09RK2928_CLKGATE_CON(2), 12, GFLAGS,
> -=09MUX(SCLK_SPDIF, "sclk_spdif", mux_spdif_p, 0,
> -=09=09=09RK2928_CLKSEL_CON(5), 8, 2, MFLAGS)),
> +=09=09=09&rk3036_spdif_fracmux),
>=20
>  =09GATE(SCLK_OTGPHY0, "sclk_otgphy0", "xin12m", CLK_IGNORE_UNUSED,
>  =09=09=09RK2928_CLKGATE_CON(1), 5, GFLAGS),
> diff --git a/drivers/clk/rockchip/clk-rk3188.c b/drivers/clk/rockchip=
/clk-
> rk3188.c
> index 6398a91..7f7444c 100644
> --- a/drivers/clk/rockchip/clk-rk3188.c
> +++ b/drivers/clk/rockchip/clk-rk3188.c
> @@ -247,6 +247,30 @@ static struct clk_div_table div_core_peri_t[] =3D=
 {
>  =09{ /* sentinel */ },
>  };
>=20
> +static struct rockchip_clk_branch common_hsadc_out_fracmux __initdat=
a =3D
> +=09MUX(0, "sclk_hsadc_out", mux_sclk_hsadc_p, 0,
> +=09=09=09RK2928_CLKSEL_CON(22), 4, 2, MFLAGS);
> +
> +static struct rockchip_clk_branch common_spdif_fracmux __initdata =3D=

> +=09MUX(SCLK_SPDIF, "sclk_spdif", mux_sclk_spdif_p, CLK_SET_RATE_PARE=
NT,
> +=09=09=09RK2928_CLKSEL_CON(5), 8, 2, MFLAGS);
> +
> +static struct rockchip_clk_branch common_uart0_fracmux __initdata =3D=

> +=09MUX(SCLK_UART0, "sclk_uart0", mux_sclk_uart0_p, 0,
> +=09=09=09RK2928_CLKSEL_CON(13), 8, 2, MFLAGS);
> +
> +static struct rockchip_clk_branch common_uart1_fracmux __initdata =3D=

> +=09MUX(SCLK_UART1, "sclk_uart1", mux_sclk_uart1_p, 0,
> +=09=09=09RK2928_CLKSEL_CON(14), 8, 2, MFLAGS);
> +
> +static struct rockchip_clk_branch common_uart2_fracmux __initdata =3D=

> +=09MUX(SCLK_UART2, "sclk_uart2", mux_sclk_uart2_p, 0,
> +=09=09=09RK2928_CLKSEL_CON(15), 8, 2, MFLAGS);
> +
> +static struct rockchip_clk_branch common_uart3_fracmux __initdata =3D=

> +=09MUX(SCLK_UART3, "sclk_uart3", mux_sclk_uart3_p, 0,
> +=09=09=09RK2928_CLKSEL_CON(16), 8, 2, MFLAGS);
> +
>  static struct rockchip_clk_branch common_clk_branches[] __initdata =3D=
 {
>  =09/*
>  =09 * Clock-Architecture Diagram 2
> @@ -338,8 +362,7 @@ static struct rockchip_clk_branch common_clk_bran=
ches[]
> __initdata =3D {
>  =09COMPOSITE_FRACMUX(0, "hsadc_frac", "hsadc_src", 0,
>  =09=09=09RK2928_CLKSEL_CON(23), 0,
>  =09=09=09RK2928_CLKGATE_CON(2), 7, GFLAGS,
> -=09=09MUX(0, "sclk_hsadc_out", mux_sclk_hsadc_p, 0,
> -=09=09=09=09RK2928_CLKSEL_CON(22), 4, 2, MFLAGS)),
> +=09=09=09&common_hsadc_out_fracmux),
>  =09INVERTER(SCLK_HSADC, "sclk_hsadc", "sclk_hsadc_out",
>  =09=09=09RK2928_CLKSEL_CON(22), 7, IFLAGS),
>=20
> @@ -353,8 +376,7 @@ static struct rockchip_clk_branch common_clk_bran=
ches[]
> __initdata =3D {
>  =09COMPOSITE_FRACMUX(0, "spdif_frac", "spdif_pll", CLK_SET_RATE_PARE=
NT,
>  =09=09=09RK2928_CLKSEL_CON(9), 0,
>  =09=09=09RK2928_CLKGATE_CON(0), 14, GFLAGS,
> -=09=09MUX(SCLK_SPDIF, "sclk_spdif", mux_sclk_spdif_p, CLK_SET_RATE_P=
ARENT,
> -=09=09=09=09RK2928_CLKSEL_CON(5), 8, 2, MFLAGS)),
> +=09=09=09&common_spdif_fracmux),
>=20
>  =09/*
>  =09 * Clock-Architecture Diagram 4
> @@ -388,32 +410,28 @@ static struct rockchip_clk_branch
> common_clk_branches[] __initdata =3D {
>  =09COMPOSITE_FRACMUX(0, "uart0_frac", "uart0_pre", 0,
>  =09=09=09RK2928_CLKSEL_CON(17), 0,
>  =09=09=09RK2928_CLKGATE_CON(1), 9, GFLAGS,
> -=09=09MUX(SCLK_UART0, "sclk_uart0", mux_sclk_uart0_p, 0,
> -=09=09=09=09RK2928_CLKSEL_CON(13), 8, 2, MFLAGS)),
> +=09=09=09&common_uart0_fracmux),
>  =09COMPOSITE_NOMUX(0, "uart1_pre", "uart_src", 0,
>  =09=09=09RK2928_CLKSEL_CON(14), 0, 7, DFLAGS,
>  =09=09=09RK2928_CLKGATE_CON(1), 10, GFLAGS),
>  =09COMPOSITE_FRACMUX(0, "uart1_frac", "uart1_pre", 0,
>  =09=09=09RK2928_CLKSEL_CON(18), 0,
>  =09=09=09RK2928_CLKGATE_CON(1), 11, GFLAGS,
> -=09=09MUX(SCLK_UART1, "sclk_uart1", mux_sclk_uart1_p, 0,
> -=09=09=09=09RK2928_CLKSEL_CON(14), 8, 2, MFLAGS)),
> +=09=09=09&common_uart1_fracmux),
>  =09COMPOSITE_NOMUX(0, "uart2_pre", "uart_src", 0,
>  =09=09=09RK2928_CLKSEL_CON(15), 0, 7, DFLAGS,
>  =09=09=09RK2928_CLKGATE_CON(1), 12, GFLAGS),
>  =09COMPOSITE_FRACMUX(0, "uart2_frac", "uart2_pre", 0,
>  =09=09=09RK2928_CLKSEL_CON(19), 0,
>  =09=09=09RK2928_CLKGATE_CON(1), 13, GFLAGS,
> -=09=09MUX(SCLK_UART2, "sclk_uart2", mux_sclk_uart2_p, 0,
> -=09=09=09=09RK2928_CLKSEL_CON(15), 8, 2, MFLAGS)),
> +=09=09=09&common_uart2_fracmux),
>  =09COMPOSITE_NOMUX(0, "uart3_pre", "uart_src", 0,
>  =09=09=09RK2928_CLKSEL_CON(16), 0, 7, DFLAGS,
>  =09=09=09RK2928_CLKGATE_CON(1), 14, GFLAGS),
>  =09COMPOSITE_FRACMUX(0, "uart3_frac", "uart3_pre", 0,
>  =09=09=09RK2928_CLKSEL_CON(20), 0,
>  =09=09=09RK2928_CLKGATE_CON(1), 15, GFLAGS,
> -=09=09MUX(SCLK_UART3, "sclk_uart3", mux_sclk_uart3_p, 0,
> -=09=09=09=09RK2928_CLKSEL_CON(16), 8, 2, MFLAGS)),
> +=09=09=09&common_uart3_fracmux),
>=20
>  =09GATE(SCLK_JTAG, "jtag", "ext_jtag", 0, RK2928_CLKGATE_CON(1), 3, =
GFLAGS),
>=20
> @@ -523,6 +541,18 @@ static struct clk_div_table div_aclk_cpu_t[] =3D=
 {
>  =09{ /* sentinel */ },
>  };
>=20
> +static struct rockchip_clk_branch rk3066a_i2s0_fracmux __initdata =3D=

> +=09MUX(SCLK_I2S0, "sclk_i2s0", mux_sclk_i2s0_p, 0,
> +=09=09=09RK2928_CLKSEL_CON(2), 8, 2, MFLAGS);
> +
> +static struct rockchip_clk_branch rk3066a_i2s1_fracmux __initdata =3D=

> +=09MUX(SCLK_I2S1, "sclk_i2s1", mux_sclk_i2s1_p, 0,
> +=09=09=09RK2928_CLKSEL_CON(3), 8, 2, MFLAGS);
> +
> +static struct rockchip_clk_branch rk3066a_i2s2_fracmux __initdata =3D=

> +=09MUX(SCLK_I2S2, "sclk_i2s2", mux_sclk_i2s2_p, 0,
> +=09=09=09RK2928_CLKSEL_CON(4), 8, 2, MFLAGS);
> +
>  static struct rockchip_clk_branch rk3066a_clk_branches[] __initdata =
=3D {
>  =09DIVTBL(0, "aclk_cpu_pre", "armclk", 0,
>  =09=09=09RK2928_CLKSEL_CON(1), 0, 3, DFLAGS | CLK_DIVIDER_READ_ONLY,=

> div_aclk_cpu_t),
> @@ -587,24 +617,21 @@ static struct rockchip_clk_branch
> rk3066a_clk_branches[] __initdata =3D {
>  =09COMPOSITE_FRACMUX(0, "i2s0_frac", "i2s0_pre", 0,
>  =09=09=09RK2928_CLKSEL_CON(6), 0,
>  =09=09=09RK2928_CLKGATE_CON(0), 8, GFLAGS,
> -=09=09MUX(SCLK_I2S0, "sclk_i2s0", mux_sclk_i2s0_p, 0,
> -=09=09=09=09RK2928_CLKSEL_CON(2), 8, 2, MFLAGS)),
> +=09=09=09&rk3066a_i2s0_fracmux),
>  =09COMPOSITE_NOMUX(0, "i2s1_pre", "i2s_src", 0,
>  =09=09=09RK2928_CLKSEL_CON(3), 0, 7, DFLAGS,
>  =09=09=09RK2928_CLKGATE_CON(0), 9, GFLAGS),
>  =09COMPOSITE_FRACMUX(0, "i2s1_frac", "i2s1_pre", 0,
>  =09=09=09RK2928_CLKSEL_CON(7), 0,
>  =09=09=09RK2928_CLKGATE_CON(0), 10, GFLAGS,
> -=09=09MUX(SCLK_I2S1, "sclk_i2s1", mux_sclk_i2s1_p, 0,
> -=09=09=09=09RK2928_CLKSEL_CON(3), 8, 2, MFLAGS)),
> +=09=09=09&rk3066a_i2s1_fracmux),
>  =09COMPOSITE_NOMUX(0, "i2s2_pre", "i2s_src", 0,
>  =09=09=09RK2928_CLKSEL_CON(4), 0, 7, DFLAGS,
>  =09=09=09RK2928_CLKGATE_CON(0), 11, GFLAGS),
>  =09COMPOSITE_FRACMUX(0, "i2s2_frac", "i2s2_pre", 0,
>  =09=09=09RK2928_CLKSEL_CON(8), 0,
>  =09=09=09RK2928_CLKGATE_CON(0), 12, GFLAGS,
> -=09=09MUX(SCLK_I2S2, "sclk_i2s2", mux_sclk_i2s2_p, 0,
> -=09=09=09=09RK2928_CLKSEL_CON(4), 8, 2, MFLAGS)),
> +=09=09=09&rk3066a_i2s2_fracmux),
>=20
>  =09GATE(HCLK_I2S1, "hclk_i2s1", "hclk_cpu", 0, RK2928_CLKGATE_CON(7)=
, 3,
> GFLAGS),
>  =09GATE(HCLK_I2S2, "hclk_i2s2", "hclk_cpu", 0, RK2928_CLKGATE_CON(7)=
, 4,
> GFLAGS),
> @@ -638,6 +665,10 @@ static struct clk_div_table div_rk3188_aclk_core=
_t[] =3D
> { PNAME(mux_hsicphy_p)=09=09=3D { "sclk_otgphy0", "sclk_otgphy1",
>  =09=09=09=09    "gpll", "cpll" };
>=20
> +static struct rockchip_clk_branch rk3188_i2s0_fracmux __initdata =3D=

> +=09MUX(SCLK_I2S0, "sclk_i2s0", mux_sclk_i2s0_p, 0,
> +=09=09=09RK2928_CLKSEL_CON(3), 8, 2, MFLAGS);
> +
>  static struct rockchip_clk_branch rk3188_clk_branches[] __initdata =3D=
 {
>  =09COMPOSITE_NOMUX_DIVTBL(0, "aclk_core", "armclk", CLK_IGNORE_UNUSE=
D,
>  =09=09=09RK2928_CLKSEL_CON(1), 3, 3, DFLAGS | CLK_DIVIDER_READ_ONLY,=

> @@ -694,8 +725,7 @@ static struct rockchip_clk_branch rk3188_clk_bran=
ches[]
> __initdata =3D {
>  =09COMPOSITE_FRACMUX(0, "i2s0_frac", "i2s0_pre", 0,
>  =09=09=09RK2928_CLKSEL_CON(7), 0,
>  =09=09=09RK2928_CLKGATE_CON(0), 10, GFLAGS,
> -=09=09MUX(SCLK_I2S0, "sclk_i2s0", mux_sclk_i2s0_p, 0,
> -=09=09=09=09RK2928_CLKSEL_CON(3), 8, 2, MFLAGS)),
> +=09=09=09&rk3188_i2s0_fracmux),
>=20
>  =09GATE(0, "hclk_imem0", "hclk_cpu", 0, RK2928_CLKGATE_CON(4), 14, G=
FLAGS),
>  =09GATE(0, "hclk_imem1", "hclk_cpu", 0, RK2928_CLKGATE_CON(4), 15, G=
FLAGS),
> diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip=
/clk-
> rk3288.c
> index 80065e6..984fc18 100644
> --- a/drivers/clk/rockchip/clk-rk3288.c
> +++ b/drivers/clk/rockchip/clk-rk3288.c
> @@ -225,6 +225,38 @@ static struct clk_div_table div_hclk_cpu_t[] =3D=
 {
>  #define GFLAGS (CLK_GATE_HIWORD_MASK | CLK_GATE_SET_TO_DISABLE)
>  #define IFLAGS ROCKCHIP_INVERTER_HIWORD_MASK
>=20
> +static struct rockchip_clk_branch rk3288_i2s_fracmux __initdata =3D
> +=09MUX(0, "i2s_pre", mux_i2s_pre_p, CLK_SET_RATE_PARENT,
> +=09=09=09RK3288_CLKSEL_CON(4), 8, 2, MFLAGS);
> +
> +static struct rockchip_clk_branch rk3288_spdif_fracmux __initdata =3D=

> +=09MUX(0, "spdif_mux", mux_spdif_p, CLK_SET_RATE_PARENT,
> +=09=09=09RK3288_CLKSEL_CON(5), 8, 2, MFLAGS);
> +
> +static struct rockchip_clk_branch rk3288_spdif_8ch_fracmux __initdat=
a =3D
> +=09MUX(0, "spdif_8ch_mux", mux_spdif_8ch_p, CLK_SET_RATE_PARENT,
> +=09=09=09RK3288_CLKSEL_CON(40), 8, 2, MFLAGS);
> +
> +static struct rockchip_clk_branch rk3288_uart0_fracmux __initdata =3D=

> +=09MUX(SCLK_UART0, "sclk_uart0", mux_uart0_p, CLK_SET_RATE_PARENT,
> +=09=09=09RK3288_CLKSEL_CON(13), 8, 2, MFLAGS);
> +
> +static struct rockchip_clk_branch rk3288_uart1_fracmux __initdata =3D=

> +=09MUX(SCLK_UART1, "sclk_uart1", mux_uart1_p, CLK_SET_RATE_PARENT,
> +=09=09=09RK3288_CLKSEL_CON(14), 8, 2, MFLAGS);
> +
> +static struct rockchip_clk_branch rk3288_uart2_fracmux __initdata =3D=

> +=09MUX(SCLK_UART2, "sclk_uart2", mux_uart2_p, CLK_SET_RATE_PARENT,
> +=09=09=09RK3288_CLKSEL_CON(15), 8, 2, MFLAGS);
> +
> +static struct rockchip_clk_branch rk3288_uart3_fracmux __initdata =3D=

> +=09MUX(SCLK_UART3, "sclk_uart3", mux_uart3_p, CLK_SET_RATE_PARENT,
> +=09=09=09RK3288_CLKSEL_CON(16), 8, 2, MFLAGS);
> +
> +static struct rockchip_clk_branch rk3288_uart4_fracmux __initdata =3D=

> +=09MUX(SCLK_UART4, "sclk_uart4", mux_uart4_p, CLK_SET_RATE_PARENT,
> +=09=09=09RK3288_CLKSEL_CON(3), 8, 2, MFLAGS);
> +
>  static struct rockchip_clk_branch rk3288_clk_branches[] __initdata =3D=
 {
>  =09/*
>  =09 * Clock-Architecture Diagram 1
> @@ -307,8 +339,7 @@ static struct rockchip_clk_branch rk3288_clk_bran=
ches[]
> __initdata =3D {
>  =09COMPOSITE_FRACMUX(0, "i2s_frac", "i2s_src", CLK_SET_RATE_PARENT,
>  =09=09=09RK3288_CLKSEL_CON(8), 0,
>  =09=09=09RK3288_CLKGATE_CON(4), 2, GFLAGS,
> -=09=09MUX(0, "i2s_pre", mux_i2s_pre_p, CLK_SET_RATE_PARENT,
> -=09=09=09=09RK3288_CLKSEL_CON(4), 8, 2, MFLAGS)),
> +=09=09=09&rk3288_i2s_fracmux),
>  =09COMPOSITE_NODIV(SCLK_I2S0_OUT, "i2s0_clkout", mux_i2s_clkout_p, 0=
,
>  =09=09=09RK3288_CLKSEL_CON(4), 12, 1, MFLAGS,
>  =09=09=09RK3288_CLKGATE_CON(4), 0, GFLAGS),
> @@ -323,8 +354,7 @@ static struct rockchip_clk_branch rk3288_clk_bran=
ches[]
> __initdata =3D {
>  =09COMPOSITE_FRACMUX(0, "spdif_frac", "spdif_src", CLK_SET_RATE_PARE=
NT,
>  =09=09=09RK3288_CLKSEL_CON(9), 0,
>  =09=09=09RK3288_CLKGATE_CON(4), 5, GFLAGS,
> -=09=09MUX(0, "spdif_mux", mux_spdif_p, CLK_SET_RATE_PARENT,
> -=09=09=09=09RK3288_CLKSEL_CON(5), 8, 2, MFLAGS)),
> +=09=09=09&rk3288_spdif_fracmux),
>  =09GATE(SCLK_SPDIF, "sclk_spdif", "spdif_mux", CLK_SET_RATE_PARENT,
>  =09=09=09RK3288_CLKGATE_CON(4), 6, GFLAGS),
>  =09COMPOSITE_NOMUX(0, "spdif_8ch_pre", "spdif_src", CLK_SET_RATE_PAR=
ENT,
> @@ -333,8 +363,7 @@ static struct rockchip_clk_branch rk3288_clk_bran=
ches[]
> __initdata =3D {
>  =09COMPOSITE_FRACMUX(0, "spdif_8ch_frac", "spdif_8ch_pre",
> CLK_SET_RATE_PARENT,
>  =09=09=09RK3288_CLKSEL_CON(41), 0,
>  =09=09=09RK3288_CLKGATE_CON(4), 8, GFLAGS,
> -=09=09MUX(0, "spdif_8ch_mux", mux_spdif_8ch_p, CLK_SET_RATE_PARENT,
> -=09=09=09=09RK3288_CLKSEL_CON(40), 8, 2, MFLAGS)),
> +=09=09=09&rk3288_spdif_8ch_fracmux),
>  =09GATE(SCLK_SPDIF8CH, "sclk_spdif_8ch", "spdif_8ch_mux",
> CLK_SET_RATE_PARENT,
>  =09=09=09RK3288_CLKGATE_CON(4), 9, GFLAGS),
>=20
> @@ -541,8 +570,7 @@ static struct rockchip_clk_branch rk3288_clk_bran=
ches[]
> __initdata =3D {
>  =09COMPOSITE_FRACMUX(0, "uart0_frac", "uart0_src", CLK_SET_RATE_PARE=
NT,
>  =09=09=09RK3288_CLKSEL_CON(17), 0,
>  =09=09=09RK3288_CLKGATE_CON(1), 9, GFLAGS,
> -=09=09MUX(SCLK_UART0, "sclk_uart0", mux_uart0_p, CLK_SET_RATE_PARENT=
,
> -=09=09=09=09RK3288_CLKSEL_CON(13), 8, 2, MFLAGS)),
> +=09=09=09&rk3288_uart0_fracmux),
>  =09MUX(0, "uart_src", mux_pll_src_cpll_gpll_p, 0,
>  =09=09=09RK3288_CLKSEL_CON(13), 15, 1, MFLAGS),
>  =09COMPOSITE_NOMUX(0, "uart1_src", "uart_src", 0,
> @@ -551,32 +579,28 @@ static struct rockchip_clk_branch
> rk3288_clk_branches[] __initdata =3D {
>  =09COMPOSITE_FRACMUX(0, "uart1_frac", "uart1_src", CLK_SET_RATE_PARE=
NT,
>  =09=09=09RK3288_CLKSEL_CON(18), 0,
>  =09=09=09RK3288_CLKGATE_CON(1), 11, GFLAGS,
> -=09=09MUX(SCLK_UART1, "sclk_uart1", mux_uart1_p, CLK_SET_RATE_PARENT=
,
> -=09=09=09=09RK3288_CLKSEL_CON(14), 8, 2, MFLAGS)),
> +=09=09=09&rk3288_uart1_fracmux),
>  =09COMPOSITE_NOMUX(0, "uart2_src", "uart_src", 0,
>  =09=09=09RK3288_CLKSEL_CON(15), 0, 7, DFLAGS,
>  =09=09=09RK3288_CLKGATE_CON(1), 12, GFLAGS),
>  =09COMPOSITE_FRACMUX(0, "uart2_frac", "uart2_src", CLK_SET_RATE_PARE=
NT,
>  =09=09=09RK3288_CLKSEL_CON(19), 0,
>  =09=09=09RK3288_CLKGATE_CON(1), 13, GFLAGS,
> -=09=09MUX(SCLK_UART2, "sclk_uart2", mux_uart2_p, CLK_SET_RATE_PARENT=
,
> -=09=09=09=09RK3288_CLKSEL_CON(15), 8, 2, MFLAGS)),
> +=09=09=09&rk3288_uart2_fracmux),
>  =09COMPOSITE_NOMUX(0, "uart3_src", "uart_src", 0,
>  =09=09=09RK3288_CLKSEL_CON(16), 0, 7, DFLAGS,
>  =09=09=09RK3288_CLKGATE_CON(1), 14, GFLAGS),
>  =09COMPOSITE_FRACMUX(0, "uart3_frac", "uart3_src", CLK_SET_RATE_PARE=
NT,
>  =09=09=09RK3288_CLKSEL_CON(20), 0,
>  =09=09=09RK3288_CLKGATE_CON(1), 15, GFLAGS,
> -=09=09MUX(SCLK_UART3, "sclk_uart3", mux_uart3_p, CLK_SET_RATE_PARENT=
,
> -=09=09=09=09RK3288_CLKSEL_CON(16), 8, 2, MFLAGS)),
> +=09=09=09&rk3288_uart3_fracmux),
>  =09COMPOSITE_NOMUX(0, "uart4_src", "uart_src", 0,
>  =09=09=09RK3288_CLKSEL_CON(3), 0, 7, DFLAGS,
>  =09=09=09RK3288_CLKGATE_CON(2), 12, GFLAGS),
>  =09COMPOSITE_FRACMUX(0, "uart4_frac", "uart4_src", CLK_SET_RATE_PARE=
NT,
>  =09=09=09RK3288_CLKSEL_CON(7), 0,
>  =09=09=09RK3288_CLKGATE_CON(2), 13, GFLAGS,
> -=09=09MUX(SCLK_UART4, "sclk_uart4", mux_uart4_p, CLK_SET_RATE_PARENT=
,
> -=09=09=09=09RK3288_CLKSEL_CON(3), 8, 2, MFLAGS)),
> +=09=09=09&rk3288_uart4_fracmux),
>=20
>  =09COMPOSITE(0, "mac_pll_src", mux_pll_src_npll_cpll_gpll_p, 0,
>  =09=09=09RK3288_CLKSEL_CON(21), 0, 2, MFLAGS, 8, 5, DFLAGS,
> diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
> index 3f71ee5..ff8bd23 100644
> --- a/drivers/clk/rockchip/clk.h
> +++ b/drivers/clk/rockchip/clk.h
> @@ -424,7 +424,7 @@ struct rockchip_clk_branch {
>  =09=09.gate_offset=09=3D go,=09=09=09=09\
>  =09=09.gate_shift=09=3D gs,=09=09=09=09\
>  =09=09.gate_flags=09=3D gf,=09=09=09=09\
> -=09=09.child=09=09=3D &(struct rockchip_clk_branch)ch, \
> +=09=09.child=09=09=3D ch,=09=09=09=09\
>  =09}
>=20
>  #define MUX(_id, cname, pnames, f, o, s, w, mf)=09=09=09\
