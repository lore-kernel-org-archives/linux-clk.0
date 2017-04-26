Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20170424194527.19426-1-eric@anholt.net>
References: <20170424194527.19426-1-eric@anholt.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Apr 2017 16:23:50 +0200
Message-ID: <CACRpkdZkz16hfW7S1m5=gY=L8fN9u47zfoHHbwrL=_HgQx=TCg@mail.gmail.com>
Subject: Re: [PATCH] drm/pl111: Register the clock divider and use it.
To: Eric Anholt <eric@anholt.net>
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, Tom Cooksey <tom.cooksey@arm.com>,
	Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Mon, Apr 24, 2017 at 9:45 PM, Eric Anholt <eric@anholt.net> wrote:

> This is required for the panel to work on bcm911360, where CLCDCLK is
> the fixed 200Mhz AXI41 clock.  The rate set is still passed up to the
> CLCDCLK, for platforms that have a settable rate on that one.
>
> Signed-off-by: Eric Anholt <eric@anholt.net>

I like this, it is pretty.

> +static int pl111_clk_div_choose_div(struct clk_hw *hw, unsigned long rate,
> +                                   unsigned long *prate, bool set_parent)
> +{
> +       int best_div = 1, div;
> +       struct clk_hw *parent = clk_hw_get_parent(hw);
> +       unsigned long best_prate = 0;
> +       unsigned long best_diff = ~0ul;
> +       int max_div = (1 << (TIM2_PCD_LO_BITS + TIM2_PCD_HI_BITS)) - 1;
> +
> +       for (div = 1; div < max_div; div++) {
> +               unsigned long this_prate, div_rate, diff;
> +
> +               if (set_parent)
> +                       this_prate = clk_hw_round_rate(parent, rate * div);
> +               else
> +                       this_prate = *prate;
> +               div_rate = DIV_ROUND_UP_ULL(this_prate, div);
> +               diff = abs(rate - div_rate);
> +
> +               if (diff < best_diff) {
> +                       best_div = div;
> +                       best_diff = diff;
> +                       best_prate = this_prate;
> +               }
> +       }
> +
> +       *prate = best_prate;
> +       return best_div;
> +}

So since this will choose a divisor using clk_hw_round_rate() on the parent
if we can set the rate of the parent...

> +static long pl111_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
> +                                    unsigned long *prate)
> +{
> +       int div = pl111_clk_div_choose_div(hw, rate, prate, true);

...which we seem to assume that we can, actually why do you pass
this parameter set_parent at all? It is always true in this code.

You should not need to know whether we can set the rate of the
parent or not: clk_hw_round_rate() will simply return the fixed
rate anyway.

And if the divider can make the set rate even more precise:
all the better!

So I think the parameter can go.

> +static int pl111_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
> +                                 unsigned long prate)
> +{
> +       struct pl111_drm_dev_private *priv =
> +               container_of(hw, struct pl111_drm_dev_private, clk_div);
> +       int div = pl111_clk_div_choose_div(hw, rate, &prate, false);
> +       u32 tim2;
> +
> +       spin_lock(&priv->tim2_lock);
> +       tim2 = readl(priv->regs + CLCD_TIM2);
> +       tim2 &= ~(TIM2_BCD | TIM2_PCD_LO_MASK | TIM2_PCD_HI_MASK);
> +
> +       if (div == 1) {
> +               tim2 |= TIM2_BCD;
> +       } else {
> +               div -= 2;
> +               tim2 |= div & TIM2_PCD_LO_MASK;
> +               tim2 |= (div >> TIM2_PCD_LO_BITS) << TIM2_PCD_HI_SHIFT;
> +       }
> +
> +       writel(tim2, priv->regs + CLCD_TIM2);
> +       spin_unlock(&priv->tim2_lock);
> +
> +       return 0;
> +}

So this will write the divisor, which is nice. But what if we also need
to change the rate of the parent?

> +static int
> +pl111_init_clock_divider(struct drm_device *drm)
> +{
> +       struct pl111_drm_dev_private *priv = drm->dev_private;
> +       struct clk *parent = devm_clk_get(drm->dev, "clcdclk");
> +       struct clk_hw *div = &priv->clk_div;
> +       const char *parent_name;
> +       struct clk_init_data init = {
> +               .name = "pl111_div",
> +               .ops = &pl111_clk_div_ops,
> +               .parent_names = &parent_name,
> +               .num_parents = 1,
> +       };

I think it is necessary to set .flags in the init data to
.flags = CLK_SET_RATE_PARENT,
for this code to work with a parent that can change rate.

>         void *regs;
> +       /* The pixel clock (a reference to our clock divider off of CLCDCLK). */
>         struct clk *clk;

Maybe we should simply rename it pixclk so it is clear what it's for,
but that can be a separate patch.

> - * - Use the internal clock divisor to reduce power consumption by
> - *   using HCLK (apb_pclk) when appropriate.
> + * - Use the CLKSEL bit to support switching between the two external
> + *   clock parents.

OK so that remains to be done. We discussed this previously
so I got a bit confused. The divisor code seems fine, after this
we only need some more code to choose the best parent for
the divided clock.

It seems that what would pe Perfect(TM) would be to calculate the
best end result using clock A and the best end result using clock B,
both utilizing the divisor, and then choose the best of those two.

I think struct clk_mux is supposed to do that so it would eventually
be:

CLK A -|\_ clk_mux --> clk_divider --> pixel clock
CLK B -|/

Yours,
Linus Walleij
