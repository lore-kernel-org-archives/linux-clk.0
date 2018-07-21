Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <1532205745.26720.81.camel@baylibre.com>
Subject: Re: [PATCH 2/3] clk: meson: clk-pll: remove od parameters
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com
Date: Sat, 21 Jul 2018 22:42:25 +0200
In-Reply-To: <CAFBinCAcqwhJUoLF3XkhOR2gnNk3cjEgh=ChTDybeRPLHgzeSg@mail.gmail.com>
References: <20180717095617.12240-1-jbrunet@baylibre.com>
         <20180717095617.12240-3-jbrunet@baylibre.com>
         <CAFBinCAcqwhJUoLF3XkhOR2gnNk3cjEgh=ChTDybeRPLHgzeSg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sat, 2018-07-21 at 22:01 +0200, Martin Blumenstingl wrote:
> > +static struct clk_regmap gxbb_hdmi_pll_od = {
> > +       .data = &(struct clk_regmap_div_data){
> > +               .offset = HHI_HDMI_PLL_CNTL2,
> > +               .shift = 16,
> > +               .width = 2,
> > +               .flags = CLK_DIVIDER_POWER_OF_TWO,
> > +       },
> > +       .hw.init = &(struct clk_init_data){
> > +               .name = "hdmi_pll_od",
> > +               .ops = &clk_regmap_divider_ro_ops,
> > +               .parent_names = (const char *[]){ "hdmi_pll_dco" },
> > +               .num_parents = 1,
> > +               .flags = CLK_GET_RATE_NOCACHE,
> 
> why do we need CLK_GET_RATE_NOCACHE here?
> also, shouldn't all _od clocks use CLK_SET_RATE_PARENT?
> (this applies to all new _od clocks, not just this one)

The goal was to retain the original behavior of the clock.
The pll has CLK_GET_RATE_NOCACHE, which is why I put it again in the od
dividers. Same goes for ro_ops

For the particular case of the HDMI PLL, the display driver still set the pll
parameters m, n and ods directly which justify CLK_GET_RATE_NOCACHE for now.
Of course, the goal is to remove this flag someday. I think there has been some
good progress in the DRM driver to reach this goal.

If we think the use CLK_GET_RATE_NOCACHE is not justified for some other plls, I
would prefer if it was addressed in another patchset.

Regarding SET_RATE_PARENT, with the pll set with ro_ops, it does not change
anything but, I agree, it would be better to set flag for the future.

Cheers
Jerome
