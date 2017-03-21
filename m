Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Neil Armstrong <narmstrong@baylibre.com>, sboyd@codeaurora.org,
 khilman@baylibre.com, carlo@caione.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1489064027-18004-3-git-send-email-narmstrong@baylibre.com>
Cc: "Neil Armstrong" <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <1489064027-18004-1-git-send-email-narmstrong@baylibre.com>
 <1489064027-18004-3-git-send-email-narmstrong@baylibre.com>
Message-ID: <149013907135.54062.15157425339137707641@resonance>
Subject: Re: [PATCH v3 2/3] clk: meson-gxbb: Add MALI clocks
Date: Tue, 21 Mar 2017 16:31:11 -0700
List-ID: <linux-clk.vger.kernel.org>

Hi Neil,

Quoting Neil Armstrong (2017-03-09 04:53:46)
> The Mali is clocked by two identical clock paths behind a glitch free mux
> to safely change frequency while running.
> =

> The two "mali_0" and "mali_1" clocks are composed of a mux, divider and g=
ate.
> Expose these two clocks trees using generic clocks.
> Finally the glitch free mux is added as "mali" clock.
> =

> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/clk/meson/gxbb.c | 139 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 139 insertions(+)
> =

> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index 5059c7b..d9f7fef 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -634,6 +634,131 @@
>         },
>  };
>  =

> +/*
> + * The MALI IP is clocked by two identical clocks (mali_0 and mali_1)
> + * muxed by a glitch-free switch.
> + */
> +
> +static u32 mux_table_mali_0_1[] =3D {0, 1, 2, 3, 4, 5, 6, 7};
> +static const char *gxbb_mali_0_1_parent_names[] =3D {
> +       "xtal", "gp0_pll", "mpll2", "mpll1", "fclk_div7",
> +       "fclk_div4", "fclk_div3", "fclk_div5"
> +};
> +
> +static struct clk_mux gxbb_mali_0_sel =3D {
> +       .reg =3D (void *)HHI_MALI_CLK_CNTL,
> +       .mask =3D 0x7,
> +       .shift =3D 9,
> +       .table =3D mux_table_mali_0_1,
> +       .lock =3D &clk_lock,
> +       .hw.init =3D &(struct clk_init_data){
> +               .name =3D "mali_0_sel",
> +               .ops =3D &clk_mux_ops,
> +               /*
> +                * bits 10:9 selects from 8 possible parents:
> +                * xtal, gp0_pll, mpll2, mpll1, fclk_div7,
> +                * fclk_div4, fclk_div3, fclk_div5
> +                */
> +               .parent_names =3D gxbb_mali_0_1_parent_names,
> +               .num_parents =3D 8,
> +               .flags =3D (CLK_SET_RATE_NO_REPARENT | CLK_IGNORE_UNUSED),

Are all of these CLK_IGNORE_UNUSED flags necessary? If so, why? I'm just
wondering if this is yet another display-related use case where a
hand-off mechanism would work better?

Thanks,
Mike

> +       },
> +};
> +
> +static struct clk_divider gxbb_mali_0_div =3D {
> +       .reg =3D (void *)HHI_MALI_CLK_CNTL,
> +       .shift =3D 0,
> +       .width =3D 7,
> +       .lock =3D &clk_lock,
> +       .hw.init =3D &(struct clk_init_data){
> +               .name =3D "mali_0_div",
> +               .ops =3D &clk_divider_ops,
> +               .parent_names =3D (const char *[]){ "mali_0_sel" },
> +               .num_parents =3D 1,
> +               .flags =3D (CLK_SET_RATE_NO_REPARENT | CLK_IGNORE_UNUSED),
> +       },
> +};
> +
> +static struct clk_gate gxbb_mali_0 =3D {
> +       .reg =3D (void *)HHI_MALI_CLK_CNTL,
> +       .bit_idx =3D 8,
> +       .lock =3D &clk_lock,
> +       .hw.init =3D &(struct clk_init_data){
> +               .name =3D "mali_0",
> +               .ops =3D &clk_gate_ops,
> +               .parent_names =3D (const char *[]){ "mali_0_div" },
> +               .num_parents =3D 1,
> +               .flags =3D (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
> +       },
> +};
> +
> +static struct clk_mux gxbb_mali_1_sel =3D {
> +       .reg =3D (void *)HHI_MALI_CLK_CNTL,
> +       .mask =3D 0x7,
> +       .shift =3D 25,
> +       .table =3D mux_table_mali_0_1,
> +       .lock =3D &clk_lock,
> +       .hw.init =3D &(struct clk_init_data){
> +               .name =3D "mali_1_sel",
> +               .ops =3D &clk_mux_ops,
> +               /*
> +                * bits 10:9 selects from 8 possible parents:
> +                * xtal, gp0_pll, mpll2, mpll1, fclk_div7,
> +                * fclk_div4, fclk_div3, fclk_div5
> +                */
> +               .parent_names =3D gxbb_mali_0_1_parent_names,
> +               .num_parents =3D 8,
> +               .flags =3D (CLK_SET_RATE_NO_REPARENT | CLK_IGNORE_UNUSED),
> +       },
> +};
> +
> +static struct clk_divider gxbb_mali_1_div =3D {
> +       .reg =3D (void *)HHI_MALI_CLK_CNTL,
> +       .shift =3D 16,
> +       .width =3D 7,
> +       .lock =3D &clk_lock,
> +       .hw.init =3D &(struct clk_init_data){
> +               .name =3D "mali_1_div",
> +               .ops =3D &clk_divider_ops,
> +               .parent_names =3D (const char *[]){ "mali_1_sel" },
> +               .num_parents =3D 1,
> +               .flags =3D (CLK_SET_RATE_NO_REPARENT | CLK_IGNORE_UNUSED),
> +       },
> +};
> +
> +static struct clk_gate gxbb_mali_1 =3D {
> +       .reg =3D (void *)HHI_MALI_CLK_CNTL,
> +       .bit_idx =3D 24,
> +       .lock =3D &clk_lock,
> +       .hw.init =3D &(struct clk_init_data){
> +               .name =3D "mali_1",
> +               .ops =3D &clk_gate_ops,
> +               .parent_names =3D (const char *[]){ "mali_1_div" },
> +               .num_parents =3D 1,
> +               .flags =3D (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
> +       },
> +};
> +
> +static u32 mux_table_mali[] =3D {0, 1};
> +static const char *gxbb_mali_parent_names[] =3D {
> +       "mali_0", "mali_1"
> +};
> +
> +static struct clk_mux gxbb_mali =3D {
> +       .reg =3D (void *)HHI_MALI_CLK_CNTL,
> +       .mask =3D 1,
> +       .shift =3D 31,
> +       .table =3D mux_table_mali,
> +       .lock =3D &clk_lock,
> +       .hw.init =3D &(struct clk_init_data){
> +               .name =3D "mali",
> +               .ops =3D &clk_mux_ops,
> +               .parent_names =3D gxbb_mali_parent_names,
> +               .num_parents =3D 2,
> +               .flags =3D (CLK_SET_RATE_NO_REPARENT | CLK_IGNORE_UNUSED),
> +       },
> +};
> +
>  /* Everything Else (EE) domain gates */
>  static MESON_GATE(gxbb_ddr, HHI_GCLK_MPEG0, 0);
>  static MESON_GATE(gxbb_dos, HHI_GCLK_MPEG0, 1);
> @@ -827,6 +952,13 @@
>                 [CLKID_SAR_ADC_CLK]         =3D &gxbb_sar_adc_clk.hw,
>                 [CLKID_SAR_ADC_SEL]         =3D &gxbb_sar_adc_clk_sel.hw,
>                 [CLKID_SAR_ADC_DIV]         =3D &gxbb_sar_adc_clk_div.hw,
> +               [CLKID_MALI_0_SEL]          =3D &gxbb_mali_0_sel.hw,
> +               [CLKID_MALI_0_DIV]          =3D &gxbb_mali_0_div.hw,
> +               [CLKID_MALI_0]              =3D &gxbb_mali_0.hw,
> +               [CLKID_MALI_1_SEL]          =3D &gxbb_mali_1_sel.hw,
> +               [CLKID_MALI_1_DIV]          =3D &gxbb_mali_1_div.hw,
> +               [CLKID_MALI_1]              =3D &gxbb_mali_1.hw,
> +               [CLKID_MALI]                =3D &gxbb_mali.hw,
>         },
>         .num =3D NR_CLKS,
>  };
> @@ -930,16 +1062,23 @@
>         &gxbb_emmc_b,
>         &gxbb_emmc_c,
>         &gxbb_sar_adc_clk,
> +       &gxbb_mali_0,
> +       &gxbb_mali_1,
>  };
>  =

>  static struct clk_mux *const gxbb_clk_muxes[] =3D {
>         &gxbb_mpeg_clk_sel,
>         &gxbb_sar_adc_clk_sel,
> +       &gxbb_mali_0_sel,
> +       &gxbb_mali_1_sel,
> +       &gxbb_mali,
>  };
>  =

>  static struct clk_divider *const gxbb_clk_dividers[] =3D {
>         &gxbb_mpeg_clk_div,
>         &gxbb_sar_adc_clk_div,
> +       &gxbb_mali_0_div,
> +       &gxbb_mali_1_div,
>  };
>  =

>  static int gxbb_clkc_probe(struct platform_device *pdev)
> -- =

> 1.9.1
>=20
