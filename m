Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jerome Brunet <jbrunet@baylibre.com>, "Stephen Boyd" <sboyd@codeaurora.org>,
 "Kevin Hilman" <khilman@baylibre.com>, "Carlo Caione" <carlo@caione.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20170309104154.28295-8-jbrunet@baylibre.com>
Cc: "Jerome Brunet" <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20170309104154.28295-1-jbrunet@baylibre.com>
 <20170309104154.28295-8-jbrunet@baylibre.com>
Message-ID: <149013848582.54062.17644077026355953692@resonance>
Subject: Re: [PATCH v2 7/9] clk: meson8b: add the mplls clocks 0, 1 and 2
Date: Tue, 21 Mar 2017 16:21:25 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Jerome Brunet (2017-03-09 02:41:52)
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Hmm, even for obvious patches like this it is still better to have some
sort of changelog :-/

Otherwise patch appears fine to me.

Regards,
Mike

> ---
>  drivers/clk/meson/meson8b.c | 103 ++++++++++++++++++++++++++++++++++++++=
++++++
>  drivers/clk/meson/meson8b.h |  20 ++++++++-
>  2 files changed, 122 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index 2937443d4505..e9985503165c 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -245,6 +245,96 @@ static struct clk_fixed_factor meson8b_fclk_div7 =3D=
 {
>         },
>  };
>  =

> +static struct meson_clk_mpll meson8b_mpll0 =3D {
> +       .sdm =3D {
> +               .reg_off =3D HHI_MPLL_CNTL7,
> +               .shift   =3D 0,
> +               .width   =3D 14,
> +       },
> +       .sdm_en =3D {
> +               .reg_off =3D HHI_MPLL_CNTL7,
> +               .shift   =3D 15,
> +               .width   =3D 1,
> +       },
> +       .n2 =3D {
> +               .reg_off =3D HHI_MPLL_CNTL7,
> +               .shift   =3D 16,
> +               .width   =3D 9,
> +       },
> +       .en =3D {
> +               .reg_off =3D HHI_MPLL_CNTL7,
> +               .shift   =3D 14,
> +               .width   =3D 1,
> +       },
> +       .lock =3D &clk_lock,
> +       .hw.init =3D &(struct clk_init_data){
> +               .name =3D "mpll0",
> +               .ops =3D &meson_clk_mpll_ops,
> +               .parent_names =3D (const char *[]){ "fixed_pll" },
> +               .num_parents =3D 1,
> +       },
> +};
> +
> +static struct meson_clk_mpll meson8b_mpll1 =3D {
> +       .sdm =3D {
> +               .reg_off =3D HHI_MPLL_CNTL8,
> +               .shift   =3D 0,
> +               .width   =3D 14,
> +       },
> +       .sdm_en =3D {
> +               .reg_off =3D HHI_MPLL_CNTL8,
> +               .shift   =3D 15,
> +               .width   =3D 1,
> +       },
> +       .n2 =3D {
> +               .reg_off =3D HHI_MPLL_CNTL8,
> +               .shift   =3D 16,
> +               .width   =3D 9,
> +       },
> +       .en =3D {
> +               .reg_off =3D HHI_MPLL_CNTL8,
> +               .shift   =3D 14,
> +               .width   =3D 1,
> +       },
> +       .lock =3D &clk_lock,
> +       .hw.init =3D &(struct clk_init_data){
> +               .name =3D "mpll1",
> +               .ops =3D &meson_clk_mpll_ops,
> +               .parent_names =3D (const char *[]){ "fixed_pll" },
> +               .num_parents =3D 1,
> +       },
> +};
> +
> +static struct meson_clk_mpll meson8b_mpll2 =3D {
> +       .sdm =3D {
> +               .reg_off =3D HHI_MPLL_CNTL9,
> +               .shift   =3D 0,
> +               .width   =3D 14,
> +       },
> +       .sdm_en =3D {
> +               .reg_off =3D HHI_MPLL_CNTL9,
> +               .shift   =3D 15,
> +               .width   =3D 1,
> +       },
> +       .n2 =3D {
> +               .reg_off =3D HHI_MPLL_CNTL9,
> +               .shift   =3D 16,
> +               .width   =3D 9,
> +       },
> +       .en =3D {
> +               .reg_off =3D HHI_MPLL_CNTL9,
> +               .shift   =3D 14,
> +               .width   =3D 1,
> +       },
> +       .lock =3D &clk_lock,
> +       .hw.init =3D &(struct clk_init_data){
> +               .name =3D "mpll2",
> +               .ops =3D &meson_clk_mpll_ops,
> +               .parent_names =3D (const char *[]){ "fixed_pll" },
> +               .num_parents =3D 1,
> +       },
> +};
> +
>  /*
>   * FIXME cpu clocks and the legacy composite clocks (e.g. clk81) are bot=
h PLL
>   * post-dividers and should be modeled with their respective PLLs via the
> @@ -491,6 +581,9 @@ static struct clk_hw_onecell_data meson8b_hw_onecell_=
data =3D {
>                 [CLKID_AO_AHB_SRAM]         =3D &meson8b_ao_ahb_sram.hw,
>                 [CLKID_AO_AHB_BUS]          =3D &meson8b_ao_ahb_bus.hw,
>                 [CLKID_AO_IFACE]            =3D &meson8b_ao_iface.hw,
> +               [CLKID_MPLL0]               =3D &meson8b_mpll0.hw,
> +               [CLKID_MPLL1]               =3D &meson8b_mpll1.hw,
> +               [CLKID_MPLL2]               =3D &meson8b_mpll2.hw,
>         },
>         .num =3D CLK_NR_CLKS,
>  };
> @@ -501,6 +594,12 @@ static struct meson_clk_pll *const meson8b_clk_plls[=
] =3D {
>         &meson8b_sys_pll,
>  };
>  =

> +static struct meson_clk_mpll *const meson8b_clk_mplls[] =3D {
> +       &meson8b_mpll0,
> +       &meson8b_mpll1,
> +       &meson8b_mpll2,
> +};
> +
>  static struct clk_gate *const meson8b_clk_gates[] =3D {
>         &meson8b_clk81,
>         &meson8b_ddr,
> @@ -609,6 +708,10 @@ static int meson8b_clkc_probe(struct platform_device=
 *pdev)
>         for (i =3D 0; i < ARRAY_SIZE(meson8b_clk_plls); i++)
>                 meson8b_clk_plls[i]->base =3D clk_base;
>  =

> +       /* Populate base address for MPLLs */
> +       for (i =3D 0; i < ARRAY_SIZE(meson8b_clk_mplls); i++)
> +               meson8b_clk_mplls[i]->base =3D clk_base;
> +
>         /* Populate the base address for CPU clk */
>         meson8b_cpu_clk.base =3D clk_base;
>  =

> diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
> index 010e9582888d..3881defc8644 100644
> --- a/drivers/clk/meson/meson8b.h
> +++ b/drivers/clk/meson/meson8b.h
> @@ -42,6 +42,21 @@
>  #define HHI_VID_PLL_CNTL               0x320 /* 0xc8 offset in data shee=
t */
>  =

>  /*
> + * MPLL register offeset taken from the S905 datasheet. Vendor kernel so=
urce
> + * confirm these are the same for the S805.
> + */
> +#define HHI_MPLL_CNTL                  0x280 /* 0xa0 offset in data shee=
t */
> +#define HHI_MPLL_CNTL2                 0x284 /* 0xa1 offset in data shee=
t */
> +#define HHI_MPLL_CNTL3                 0x288 /* 0xa2 offset in data shee=
t */
> +#define HHI_MPLL_CNTL4                 0x28C /* 0xa3 offset in data shee=
t */
> +#define HHI_MPLL_CNTL5                 0x290 /* 0xa4 offset in data shee=
t */
> +#define HHI_MPLL_CNTL6                 0x294 /* 0xa5 offset in data shee=
t */
> +#define HHI_MPLL_CNTL7                 0x298 /* 0xa6 offset in data shee=
t */
> +#define HHI_MPLL_CNTL8                 0x29C /* 0xa7 offset in data shee=
t */
> +#define HHI_MPLL_CNTL9                 0x2A0 /* 0xa8 offset in data shee=
t */
> +#define HHI_MPLL_CNTL10                        0x2A4 /* 0xa9 offset in d=
ata sheet */
> +
> +/*
>   * CLKID index values
>   *
>   * These indices are entirely contrived and do not map onto the hardware.
> @@ -142,8 +157,11 @@
>  #define CLKID_AO_AHB_SRAM      90
>  #define CLKID_AO_AHB_BUS       91
>  #define CLKID_AO_IFACE         92
> +#define CLKID_MPLL0            93
> +#define CLKID_MPLL1            94
> +#define CLKID_MPLL2            95
>  =

> -#define CLK_NR_CLKS            93
> +#define CLK_NR_CLKS            96
>  =

>  /* include the CLKIDs that have been made part of the stable DT binding =
*/
>  #include <dt-bindings/clock/meson8b-clkc.h>
> -- =

> 2.9.3
>=20
