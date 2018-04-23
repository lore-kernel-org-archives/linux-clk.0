Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1524512283.4026.28.camel@baylibre.com>
Subject: Re: [PATCH clk-fixes] clk: meson: meson8b: fix
 meson8b_fclk_div3_div clock name
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Stephen Boyd
	 <sboyd@kernel.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
 narmstrong@baylibre.com,  linux-amlogic@lists.infradead.org
Date: Mon, 23 Apr 2018 21:38:03 +0200
In-Reply-To: <1524471797.4026.3.camel@baylibre.com>
References: <20180422102843.31238-1-martin.blumenstingl@googlemail.com>
	 <1524471797.4026.3.camel@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Mon, 2018-04-23 at 10:23 +0200, Jerome Brunet wrote:
> On Sun, 2018-04-22 at 12:28 +0200, Martin Blumenstingl wrote:
> > The names of all fclk divider gate clocks follow the naming schema
> > "fclk_divN" and the name of all fclk fixed dividers follow the naming
> > schema "fclk_divN_div".
> > There's one exception to this rule: meson8b_fclk_div3_div's name is
> > "fclk_div_div3". It's child clock meson8b_fclk_div3 however references
> > it as "fclk_div3_div" (following the naming schema explained above).
> > 
> > Fix the naming of the meson8b_fclk_div3_div clock to follow the naming
> > schema. This also fixes serial console on my Meson8m2 board because
> > "clk81" uses fclk_div3 as parent. However, since the hierarchy stops at
> > meson8b_fclk_div3 there's no known parent clock and the rate of "clk81"
> > and all of it's children (UART clock, SDIO MMC controller clock, ...)
> > are all 0.
> > 
> > Fixes: 05f814402d6174 ("clk: meson: add fdiv clock gates")
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> Oopss ... Thanks for fixing this Martin.
> 
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> 
> Stephen, Do you mind taking this directly for fixes ? I can prepare a PR if you
> prefer.

Nevermind, apparently I have another mistake of the same kind, so there is
another fix coming up.

I'ĺl make a PR 

> 
> Regards
> Jerome
> 
> > ---
> >  drivers/clk/meson/meson8b.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> > index cc2992493e0b..2c4ff6192852 100644
> > --- a/drivers/clk/meson/meson8b.c
> > +++ b/drivers/clk/meson/meson8b.c
> > @@ -253,7 +253,7 @@ static struct clk_fixed_factor meson8b_fclk_div3_div = {
> >  	.mult = 1,
> >  	.div = 3,
> >  	.hw.init = &(struct clk_init_data){
> > -		.name = "fclk_div_div3",
> > +		.name = "fclk_div3_div",
> >  		.ops = &clk_fixed_factor_ops,
> >  		.parent_names = (const char *[]){ "fixed_pll" },
> >  		.num_parents = 1,
> 
> 
