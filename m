Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <1531989937.26720.22.camel@baylibre.com>
Subject: Re: [PATCH 2/3] clk: meson: clk-pll: remove od parameters
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 19 Jul 2018 10:45:37 +0200
In-Reply-To: <fa95a61b-3fde-1401-e2bc-f3465e5f4417@baylibre.com>
References: <20180717095617.12240-1-jbrunet@baylibre.com>
         <20180717095617.12240-3-jbrunet@baylibre.com>
         <fa95a61b-3fde-1401-e2bc-f3465e5f4417@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, 2018-07-19 at 10:42 +0200, Neil Armstrong wrote:
> > +static struct clk_regmap gxl_hdmi_pll_od = {
> > +     .data = &(struct clk_regmap_div_data){
> > +             .offset = HHI_HDMI_PLL_CNTL + 8,
> > +             .shift = 16,
> > +             .width = 2,
> > +             .flags = CLK_DIVIDER_POWER_OF_TWO,
> > +     },
> > +     .hw.init = &(struct clk_init_data){
> > +             .name = "hdmi_pll_od",
> > +             .ops = &clk_regmap_divider_ro_ops,
> > +             .parent_names = (const char *[]){ "hdmi_pll_dco" },
> > +             .num_parents = 1,
> > +             .flags = CLK_GET_RATE_NOCACHE,
> > +     },
> > +};
> 
> In my code, the GXL OD1 is at bit 21
> 
> > +
> > +static struct clk_regmap gxl_hdmi_pll_od2 = {
> > +     .data = &(struct clk_regmap_div_data){
> > +             .offset = HHI_HDMI_PLL_CNTL + 8,
> > +             .shift = 22,
> > +             .width = 2,
> > +             .flags = CLK_DIVIDER_POWER_OF_TWO,
> > +     },
> > +     .hw.init = &(struct clk_init_data){
> > +             .name = "hdmi_pll_od2",
> > +             .ops = &clk_regmap_divider_ro_ops,
> > +             .parent_names = (const char *[]){ "hdmi_pll_od" },
> > +             .num_parents = 1,
> > +             .flags = CLK_GET_RATE_NOCACHE,
> > +     },
> > +};
> 
> 
> In my code, the GXL OD3 is at bit 23
> 
> > +
> >   static struct clk_regmap gxl_hdmi_pll = {
> > -     .data = &(struct meson_clk_pll_data){
> > -             .en = {
> > -                     .reg_off = HHI_HDMI_PLL_CNTL,
> > -                     .shift   = 30,
> > -                     .width   = 1,
> > -             },
> > -             .m = {
> > -                     .reg_off = HHI_HDMI_PLL_CNTL,
> > -                     .shift   = 0,
> > -                     .width   = 9,
> > -             },
> > -             .n = {
> > -                     .reg_off = HHI_HDMI_PLL_CNTL,
> > -                     .shift   = 9,
> > -                     .width   = 5,
> > -             },
> > -             .frac = {
> > -                     /*
> > -                      * On gxl, there is a register shift due to
> > -                      * HHI_HDMI_PLL_CNTL1 which does not exist on gxbb,
> > -                      * so we compute the register offset based on the PLL
> > -                      * base to get it right
> > -                      */
> > -                     .reg_off = HHI_HDMI_PLL_CNTL + 4,
> > -                     .shift   = 0,
> > -                     .width   = 12,
> > -             },
> > -             .od = {
> > -                     .reg_off = HHI_HDMI_PLL_CNTL + 8,
> > -                     .shift   = 21,
> > -                     .width   = 2,
> > -             },
> > -             .od2 = {
> > -                     .reg_off = HHI_HDMI_PLL_CNTL + 8,
> > -                     .shift   = 23,
> > -                     .width   = 2,
> > -             },
> > -             .od3 = {
> > -                     .reg_off = HHI_HDMI_PLL_CNTL + 8,
> > -                     .shift   = 19,
> > -                     .width   = 2,
> > -             },
> > -             .l = {
> > -                     .reg_off = HHI_HDMI_PLL_CNTL,
> > -                     .shift   = 31,
> > -                     .width   = 1,
> > -             },
> > -             .rst = {
> > -                     .reg_off = HHI_HDMI_PLL_CNTL,
> > -                     .shift   = 29,
> > -                     .width   = 1,
> > -             },
> > +     .data = &(struct clk_regmap_div_data){
> > +             .offset = HHI_HDMI_PLL_CNTL + 8,
> > +             .shift = 18,
> > +             .width = 2,
> > +             .flags = CLK_DIVIDER_POWER_OF_TWO,
> 
> 
> In my code, the GXL OD3 is at bit 19
> 
> It's only a copy/paste error, the original code had the correct shifts.

Absolutely. Good catch. 
