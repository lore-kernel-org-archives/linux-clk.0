Return-Path: <narmstrong@baylibre.com>
Return-Path: <narmstrong@baylibre.com>
Subject: Re: [PATCH] clk: meson: add the video decoder clocks
To: Maxime Jourdan <maxi.jourdan@wanadoo.fr>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-clk <linux-clk@vger.kernel.org>
References: <CAHStOZ7m+8xSX=k5k-LwmgZy6Ja4MFwsVjMy-FeoG=2c0rpm2g@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <928202bc-0dea-5eb4-264b-7774b5a31de1@baylibre.com>
Date: Sat, 21 Apr 2018 14:50:06 +0200
MIME-Version: 1.0
In-Reply-To: <CAHStOZ7m+8xSX=k5k-LwmgZy6Ja4MFwsVjMy-FeoG=2c0rpm2g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi Maxime,

On 21/04/2018 10:18, Maxime Jourdan wrote:
> In preparation for the V4L2 M2M driver, add the clocks for
> VDEC_1 and VDEC_HEVC to gxbb.
> 
> Signed-off-by: Maxime Jourdan <maxi.jourdan@wanadoo.fr <mailto:maxi.jourdan@wanadoo.fr>>

Send it in text-only, HTML is forbidden ! It breaks all the formatting and other stuff.

Use git- send-email for that, or other tools like patman or git-series.

Next time also CC linux-kernel@vger.kernel.org and linux-arm-kernel@lists.infradead.org !

> ---
>  drivers/clk/meson/gxbb.c              | 112 ++++++++++++++++++++++++++
>  drivers/clk/meson/gxbb.h              |   4 +-
>  include/dt-bindings/clock/gxbb-clkc.h |   4 +
>  3 files changed, 119 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index b1e4d9557610..f9d7ab9c924e 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -1543,6 +1543,100 @@ static struct clk_regmap gxbb_vapb = {
>  },
>  };
>  
> +/* VDEC clocks */
> +
> +static const char * const gxbb_vdec_parent_names[] = {
> +"fclk_div4", "fclk_div3", "fclk_div5", "fclk_div7"
> +};
> +
> +static struct clk_regmap gxbb_vdec_1_sel = {
> +.data = &(struct clk_regmap_mux_data){
> +.offset = HHI_VDEC_CLK_CNTL,
> +.mask = 0x3,
> +.shift = 9,
> +},
> +.hw.init = &(struct clk_init_data){
> +.name = "vdec_1_sel",
> +.ops = &clk_regmap_mux_ops,
> +.parent_names = gxbb_vdec_parent_names,
> +.num_parents = ARRAY_SIZE(gxbb_vdec_parent_names),
> +.flags = CLK_SET_RATE_NO_REPARENT,
> +},
> +};
> +
> +static struct clk_regmap gxbb_vdec_1_div = {
> +.data = &(struct clk_regmap_div_data){
> +.offset = HHI_VDEC_CLK_CNTL,
> +.shift = 0,
> +.width = 7,
> +},
> +.hw.init = &(struct clk_init_data){
> +.name = "vdec_1_div",
> +.ops = &clk_regmap_divider_ops,
> +.parent_names = (const char *[]){ "vdec_1_sel" },
> +.num_parents = 1,
> +.flags = CLK_SET_RATE_PARENT,
> +},
> +};
> +
> +static struct clk_regmap gxbb_vdec_1 = {
> +.data = &(struct clk_regmap_gate_data){
> +.offset = HHI_VDEC_CLK_CNTL,
> +.bit_idx = 8,
> +},
> +.hw.init = &(struct clk_init_data) {
> +.name = "vdec_1",
> +.ops = &clk_regmap_gate_ops,
> +.parent_names = (const char *[]){ "vdec_1_div" },
> +.num_parents = 1,
> +.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +},
> +};
> +
> +static struct clk_regmap gxbb_vdec_hevc_sel = {
> +.data = &(struct clk_regmap_mux_data){
> +.offset = HHI_VDEC2_CLK_CNTL,
> +.mask = 0x3,
> +.shift = 25,
> +},
> +.hw.init = &(struct clk_init_data){
> +.name = "vdec_hevc_sel",
> +.ops = &clk_regmap_mux_ops,
> +.parent_names = gxbb_vdec_parent_names,
> +.num_parents = ARRAY_SIZE(gxbb_vdec_parent_names),
> +.flags = CLK_SET_RATE_NO_REPARENT,
> +},
> +};
> +
> +static struct clk_regmap gxbb_vdec_hevc_div = {
> +.data = &(struct clk_regmap_div_data){
> +.offset = HHI_VDEC2_CLK_CNTL,
> +.shift = 16,
> +.width = 7,
> +},
> +.hw.init = &(struct clk_init_data){
> +.name = "vdec_hevc_div",
> +.ops = &clk_regmap_divider_ops,
> +.parent_names = (const char *[]){ "vdec_hevc_sel" },
> +.num_parents = 1,
> +.flags = CLK_SET_RATE_PARENT,
> +},
> +};
> +
> +static struct clk_regmap gxbb_vdec_hevc = {
> +.data = &(struct clk_regmap_gate_data){
> +.offset = HHI_VDEC2_CLK_CNTL,
> +.bit_idx = 24,
> +},
> +.hw.init = &(struct clk_init_data) {
> +.name = "vdec_hevc",
> +.ops = &clk_regmap_gate_ops,
> +.parent_names = (const char *[]){ "vdec_hevc_div" },
> +.num_parents = 1,
> +.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +},
> +};
> +
>  /* Everything Else (EE) domain gates */
>  static MESON_GATE(gxbb_ddr, HHI_GCLK_MPEG0, 0);
>  static MESON_GATE(gxbb_dos, HHI_GCLK_MPEG0, 1);
> @@ -1786,6 +1880,12 @@ static struct clk_hw_onecell_data gxbb_hw_onecell_data = {
>  [CLKID_FCLK_DIV4_DIV]    = &gxbb_fclk_div4_div.hw,
>  [CLKID_FCLK_DIV5_DIV]    = &gxbb_fclk_div5_div.hw,
>  [CLKID_FCLK_DIV7_DIV]    = &gxbb_fclk_div7_div.hw,
> +[CLKID_VDEC_1_SEL]    = &gxbb_vdec_1_sel.hw,
> +[CLKID_VDEC_1_DIV]    = &gxbb_vdec_1_div.hw,
> +[CLKID_VDEC_1]    = &gxbb_vdec_1.hw,
> +[CLKID_VDEC_HEVC_SEL]    = &gxbb_vdec_hevc_sel.hw,
> +[CLKID_VDEC_HEVC_DIV]    = &gxbb_vdec_hevc_div.hw,
> +[CLKID_VDEC_HEVC]    = &gxbb_vdec_hevc.hw,
>  [NR_CLKS]    = NULL,
>  },
>  .num = NR_CLKS,
> @@ -1942,6 +2042,12 @@ static struct clk_hw_onecell_data gxl_hw_onecell_data = {
>  [CLKID_FCLK_DIV4_DIV]    = &gxbb_fclk_div4_div.hw,
>  [CLKID_FCLK_DIV5_DIV]    = &gxbb_fclk_div5_div.hw,
>  [CLKID_FCLK_DIV7_DIV]    = &gxbb_fclk_div7_div.hw,
> +[CLKID_VDEC_1_SEL]    = &gxbb_vdec_1_sel.hw,
> +[CLKID_VDEC_1_DIV]    = &gxbb_vdec_1_div.hw,
> +[CLKID_VDEC_1]    = &gxbb_vdec_1.hw,
> +[CLKID_VDEC_HEVC_SEL]    = &gxbb_vdec_hevc_sel.hw,
> +[CLKID_VDEC_HEVC_DIV]    = &gxbb_vdec_hevc_div.hw,
> +[CLKID_VDEC_HEVC]    = &gxbb_vdec_hevc.hw,
>  [NR_CLKS]    = NULL,
>  },
>  .num = NR_CLKS,
> @@ -2100,6 +2206,12 @@ static struct clk_regmap *const gx_clk_regmaps[] = {
>  &gxbb_fclk_div4,
>  &gxbb_fclk_div5,
>  &gxbb_fclk_div7,
> +&gxbb_vdec_1_sel,
> +&gxbb_vdec_1_div,
> +&gxbb_vdec_1,
> +&gxbb_vdec_hevc_sel,
> +&gxbb_vdec_hevc_div,
> +&gxbb_vdec_hevc,
>  };
>  
>  struct clkc_data {
> diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
> index 9febf3f03739..ae21d235355a 100644
> --- a/drivers/clk/meson/gxbb.h
> +++ b/drivers/clk/meson/gxbb.h
> @@ -204,8 +204,10 @@
>  #define CLKID_FCLK_DIV4_DIV  148
>  #define CLKID_FCLK_DIV5_DIV  149
>  #define CLKID_FCLK_DIV7_DIV  150
> +#define CLKID_VDEC_1_DIV  152
> +#define CLKID_VDEC_HEVC_DIV  155
>  
> -#define NR_CLKS  151
> +#define NR_CLKS  157
>  
>  /* include the CLKIDs that have been made part of the DT binding */
>  #include <dt-bindings/clock/gxbb-clkc.h>
> diff --git a/include/dt-bindings/clock/gxbb-clkc.h b/include/dt-bindings/clock/gxbb-clkc.h
> index 8ba99a5e3fd3..ae7f6be747e4 100644
> --- a/include/dt-bindings/clock/gxbb-clkc.h
> +++ b/include/dt-bindings/clock/gxbb-clkc.h
> @@ -125,5 +125,9 @@
>  #define CLKID_VAPB_1138
>  #define CLKID_VAPB_SEL139
>  #define CLKID_VAPB140
> +#define CLKID_VDEC_1_SEL151
> +#define CLKID_VDEC_1153
> +#define CLKID_VDEC_HEVC_SEL154
> +#define CLKID_VDEC_HEVC156
>  
>  #endif /* __GXBB_CLKC_H */
> -- 
> 2.17.0
> 
> 

Otherwise, looks good for me !

Simply resend with "[PATCH RESEND]" in the subject so I can apply it to the clk-meson tree.

Neil
