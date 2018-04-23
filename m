Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1524473542.4026.26.camel@baylibre.com>
Subject: Re: [PATCH] clk: meson: add the video decoder clocks
From: Jerome Brunet <jbrunet@baylibre.com>
To: Maxime Jourdan <maxi.jourdan@wanadoo.fr>
Cc: Neil <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Mike Turquette <mturquette@baylibre.com>, linux-amlogic
 <linux-amlogic@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>
Date: Mon, 23 Apr 2018 10:52:22 +0200
In-Reply-To: <CAHStOZ6-jV9gAvJPfk+JKanoNWmWnYykN-u3HwpY9bgoJb1myQ@mail.gmail.com>
References: 
	<CAHStOZ7m+8xSX=k5k-LwmgZy6Ja4MFwsVjMy-FeoG=2c0rpm2g@mail.gmail.com>
	 <1524341993.2601.131.camel@baylibre.com>
	 <CAHStOZ6-jV9gAvJPfk+JKanoNWmWnYykN-u3HwpY9bgoJb1myQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Sun, 2018-04-22 at 09:43 +0200, Maxime Jourdan wrote:
> Hi Neil, Jérome,

Beware, replies should also be plain text. Some mailing list will block your
mail if it is HTML.

Also, please avoid top posting - instead reply inside the orignal mail or after.

> 
> Thanks for the answers, I'll resubmit with proper formatting.
> 
> @Jérome: very valid points. The usage of the clk will indeed be through set_clk_rate on the leaf clock within the driver, so I don't need to expose the mux. If I want the mux automatically selected to provide the nearest target clock, should I keep  CLK_SET_RATE_NO_REPARENT ?
> 

Nope, CLK_SET_RATE_NO_REPARENT tells the clock framework to *keep* the same
parent clock of a clock when it tries to achieve the requested rate. You
actually want the opposite here, so you should drop this flag.

> CLK_IGNORE_UNUSED  doesn't seem like a required property indeed for those clocks.
> 
> Maxime
> 
> 
> 
> 2018-04-21 22:19 GMT+02:00 Jerome Brunet <jbrunet@baylibre.com>:
> > On Sat, 2018-04-21 at 10:18 +0200, Maxime Jourdan wrote:
> > > In preparation for the V4L2 M2M driver, add the clocks for
> > > VDEC_1 and VDEC_HEVC to gxbb.
> > > 
> > > Signed-off-by: Maxime Jourdan <maxi.jourdan@wanadoo.fr>
> > 
> > a few other comments, in addition to what neil pointed out.
> > 
> > > ---
> > >  drivers/clk/meson/gxbb.c              | 112 ++++++++++++++++++++++++++
> > >  drivers/clk/meson/gxbb.h              |   4 +-
> > >  include/dt-bindings/clock/gxbb-clkc.h |   4 +
> > >  3 files changed, 119 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> > > index b1e4d9557610..f9d7ab9c924e 100644
> > > --- a/drivers/clk/meson/gxbb.c
> > > +++ b/drivers/clk/meson/gxbb.c
> > > @@ -1543,6 +1543,100 @@ static struct clk_regmap gxbb_vapb = {
> > >       },
> > >  };
> > >  
> > > +/* VDEC clocks */
> > > +
> > > +static const char * const gxbb_vdec_parent_names[] = {
> > > +     "fclk_div4", "fclk_div3", "fclk_div5", "fclk_div7"
> > > +};
> > > +
> > > +static struct clk_regmap gxbb_vdec_1_sel = {
> > > +     .data = &(struct clk_regmap_mux_data){
> > > +             .offset = HHI_VDEC_CLK_CNTL,
> > > +             .mask = 0x3,
> > > +             .shift = 9,

.flags = CLK_MUX_ROUND_CLOSEST,

This will tell the clock framework it is allowed to round rate up if it provides
a better/closer result than rounding down. Otherwise a mux always round down
(means select the closest parent which rate is "< requested_rate")

> > > +     },
> > > +     .hw.init = &(struct clk_init_data){
> > > +             .name = "vdec_1_sel",
> > > +             .ops = &clk_regmap_mux_ops,
> > > +             .parent_names = gxbb_vdec_parent_names,
> > > +             .num_parents = ARRAY_SIZE(gxbb_vdec_parent_names),
> > > +             .flags = CLK_SET_RATE_NO_REPARENT,

I would replace this with:

.flags = CLK_SET_RATE_PARENT,

Not strictly necessary here, but it is a good practice when nothing prevents for
using it. It tells the clock framework to propagate the rate request to the
parent clock. It is especially interesting when the input clock can be adjusted.
Here the rate propagation will stop at the fdiv clocks, since they are fixed.

> > 
> > Looks like you are/will be controlling the mux manually from your driver.
> > Any particular reason for doing so ?
> > 
> > Looking at the possible parent, you may as well call clk_set_rate() on the leaf
> > clock with 500Mhz, 666Mhz, etc ... it would accomplish the same thing but :
> > * You would need to get only one clock in your driver
> > * You don't need to manage the topology of the clock tree in your driver, which
> > could be interresting  if your driver ends up supporting more than GXBB.
> > 
> > > +     },
> > > +};
> > > +
> > > +static struct clk_regmap gxbb_vdec_1_div = {
> > > +     .data = &(struct clk_regmap_div_data){
> > > +             .offset = HHI_VDEC_CLK_CNTL,
> > > +             .shift = 0,
> > > +             .width = 7,
> > > +     },
> > > +     .hw.init = &(struct clk_init_data){
> > > +             .name = "vdec_1_div",
> > > +             .ops = &clk_regmap_divider_ops,
> > > +             .parent_names = (const char *[]){ "vdec_1_sel" },
> > > +             .num_parents = 1,
> > > +             .flags = CLK_SET_RATE_PARENT,
> > > +     },
> > > +};
> > > +
> > > +static struct clk_regmap gxbb_vdec_1 = {
> > > +     .data = &(struct clk_regmap_gate_data){
> > > +             .offset = HHI_VDEC_CLK_CNTL,
> > > +             .bit_idx = 8,
> > > +     },
> > > +     .hw.init = &(struct clk_init_data) {
> > > +             .name = "vdec_1",
> > > +             .ops = &clk_regmap_gate_ops,
> > > +             .parent_names = (const char *[]){ "vdec_1_div" },
> > > +             .num_parents = 1,
> > > +             .flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> > 
> > Any particular reason for using CLK_IGNORE_UNUSED ?
> > 
> > You should only need CLK_IGNORE_UNUSED when the clock is left on by the
> > bootloader, and you need it stay that way until the driver load.
> > 
> > It allows to skip the clk_disable_unused() mechanism of CCF but I don't think
> > the video decoder should require this, unless I missed something.
> > 
> > > +     },
> > > +};
> > > +
> > > +static struct clk_regmap gxbb_vdec_hevc_sel = {
> > > +     .data = &(struct clk_regmap_mux_data){
> > > +             .offset = HHI_VDEC2_CLK_CNTL,
> > > +             .mask = 0x3,
> > > +             .shift = 25,
> > > +     },
> > > +     .hw.init = &(struct clk_init_data){
> > > +             .name = "vdec_hevc_sel",
> > > +             .ops = &clk_regmap_mux_ops,
> > > +             .parent_names = gxbb_vdec_parent_names,
> > > +             .num_parents = ARRAY_SIZE(gxbb_vdec_parent_names),
> > > +             .flags = CLK_SET_RATE_NO_REPARENT,
> > > +     },
> > > +};
> > > +
> > > +static struct clk_regmap gxbb_vdec_hevc_div = {
> > > +     .data = &(struct clk_regmap_div_data){
> > > +             .offset = HHI_VDEC2_CLK_CNTL,
> > > +             .shift = 16,
> > > +             .width = 7,
> > > +     },
> > > +     .hw.init = &(struct clk_init_data){
> > > +             .name = "vdec_hevc_div",
> > > +             .ops = &clk_regmap_divider_ops,
> > > +             .parent_names = (const char *[]){ "vdec_hevc_sel" },
> > > +             .num_parents = 1,
> > > +             .flags = CLK_SET_RATE_PARENT,
> > > +     },
> > > +};
> > > +
> > > +static struct clk_regmap gxbb_vdec_hevc = {
> > > +     .data = &(struct clk_regmap_gate_data){
> > > +             .offset = HHI_VDEC2_CLK_CNTL,
> > > +             .bit_idx = 24,
> > > +     },
> > > +     .hw.init = &(struct clk_init_data) {
> > > +             .name = "vdec_hevc",
> > > +             .ops = &clk_regmap_gate_ops,
> > > +             .parent_names = (const char *[]){ "vdec_hevc_div" },
> > > +             .num_parents = 1,
> > > +             .flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> > > +     },
> > > +};
> > > +
> > >  /* Everything Else (EE) domain gates */
> > >  static MESON_GATE(gxbb_ddr, HHI_GCLK_MPEG0, 0);
> > >  static MESON_GATE(gxbb_dos, HHI_GCLK_MPEG0, 1);
> > > @@ -1786,6 +1880,12 @@ static struct clk_hw_onecell_data gxbb_hw_onecell_data = {
> > >               [CLKID_FCLK_DIV4_DIV]       = &gxbb_fclk_div4_div.hw,
> > >               [CLKID_FCLK_DIV5_DIV]       = &gxbb_fclk_div5_div.hw,
> > >               [CLKID_FCLK_DIV7_DIV]       = &gxbb_fclk_div7_div.hw,
> > > +             [CLKID_VDEC_1_SEL]          = &gxbb_vdec_1_sel.hw,
> > > +             [CLKID_VDEC_1_DIV]          = &gxbb_vdec_1_div.hw,
> > > +             [CLKID_VDEC_1]              = &gxbb_vdec_1.hw,
> > > +             [CLKID_VDEC_HEVC_SEL]       = &gxbb_vdec_hevc_sel.hw,
> > > +             [CLKID_VDEC_HEVC_DIV]       = &gxbb_vdec_hevc_div.hw,
> > > +             [CLKID_VDEC_HEVC]           = &gxbb_vdec_hevc.hw,
> > >               [NR_CLKS]                   = NULL,
> > >       },
> > >       .num = NR_CLKS,
> > > @@ -1942,6 +2042,12 @@ static struct clk_hw_onecell_data gxl_hw_onecell_data = {
> > >               [CLKID_FCLK_DIV4_DIV]       = &gxbb_fclk_div4_div.hw,
> > >               [CLKID_FCLK_DIV5_DIV]       = &gxbb_fclk_div5_div.hw,
> > >               [CLKID_FCLK_DIV7_DIV]       = &gxbb_fclk_div7_div.hw,
> > > +             [CLKID_VDEC_1_SEL]          = &gxbb_vdec_1_sel.hw,
> > > +             [CLKID_VDEC_1_DIV]          = &gxbb_vdec_1_div.hw,
> > > +             [CLKID_VDEC_1]              = &gxbb_vdec_1.hw,
> > > +             [CLKID_VDEC_HEVC_SEL]       = &gxbb_vdec_hevc_sel.hw,
> > > +             [CLKID_VDEC_HEVC_DIV]       = &gxbb_vdec_hevc_div.hw,
> > > +             [CLKID_VDEC_HEVC]           = &gxbb_vdec_hevc.hw,
> > >               [NR_CLKS]                   = NULL,
> > >       },
> > >       .num = NR_CLKS,
> > > @@ -2100,6 +2206,12 @@ static struct clk_regmap *const gx_clk_regmaps[] = {
> > >       &gxbb_fclk_div4,
> > >       &gxbb_fclk_div5,
> > >       &gxbb_fclk_div7,
> > > +     &gxbb_vdec_1_sel,
> > > +     &gxbb_vdec_1_div,
> > > +     &gxbb_vdec_1,
> > > +     &gxbb_vdec_hevc_sel,
> > > +     &gxbb_vdec_hevc_div,
> > > +     &gxbb_vdec_hevc,
> > >  };
> > >  
> > >  struct clkc_data {
> > > diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
> > > index 9febf3f03739..ae21d235355a 100644
> > > --- a/drivers/clk/meson/gxbb.h
> > > +++ b/drivers/clk/meson/gxbb.h
> > > @@ -204,8 +204,10 @@
> > >  #define CLKID_FCLK_DIV4_DIV    148
> > >  #define CLKID_FCLK_DIV5_DIV    149
> > >  #define CLKID_FCLK_DIV7_DIV    150
> > > +#define CLKID_VDEC_1_DIV       152
> > > +#define CLKID_VDEC_HEVC_DIV    155
> > >  
> > > -#define NR_CLKS                        151
> > > +#define NR_CLKS                        157
> > >  
> > 
> > We prefer to get the DT binding part in a separate patch, it makes the platform
> > maintainer's life easier.
> > 
> > >  /* include the CLKIDs that have been made part of the DT binding */
> > >  #include <dt-bindings/clock/gxbb-clkc.h>
> > > diff --git a/include/dt-bindings/clock/gxbb-clkc.h b/include/dt-bindings/clock/gxbb-clkc.h
> > > index 8ba99a5e3fd3..ae7f6be747e4 100644
> > > --- a/include/dt-bindings/clock/gxbb-clkc.h
> > > +++ b/include/dt-bindings/clock/gxbb-clkc.h
> > > @@ -125,5 +125,9 @@
> > >  #define CLKID_VAPB_1         138
> > >  #define CLKID_VAPB_SEL               139
> > >  #define CLKID_VAPB           140
> > > +#define CLKID_VDEC_1_SEL     151
> > > +#define CLKID_VDEC_1         153
> > > +#define CLKID_VDEC_HEVC_SEL  154
> > > +#define CLKID_VDEC_HEVC      156
> > >  
> > >  #endif /* __GXBB_CLKC_H */
> > > -- 
> > > 2.17.0
> > > 
> > > 
> > 
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
