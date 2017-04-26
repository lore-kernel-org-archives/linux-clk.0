Return-Path: <eric@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list\:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, Tom Cooksey <tom.cooksey@arm.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>, "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/pl111: Register the clock divider and use it.
In-Reply-To: <CACRpkdZkz16hfW7S1m5=gY=L8fN9u47zfoHHbwrL=_HgQx=TCg@mail.gmail.com>
References: <20170424194527.19426-1-eric@anholt.net> <CACRpkdZkz16hfW7S1m5=gY=L8fN9u47zfoHHbwrL=_HgQx=TCg@mail.gmail.com>
Date: Wed, 26 Apr 2017 09:54:32 -0700
Message-ID: <8737cvkt2v.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

Linus Walleij <linus.walleij@linaro.org> writes:

> On Mon, Apr 24, 2017 at 9:45 PM, Eric Anholt <eric@anholt.net> wrote:
>> +static long pl111_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
>> +                                    unsigned long *prate)
>> +{
>> +       int div = pl111_clk_div_choose_div(hw, rate, prate, true);
>
> ...which we seem to assume that we can, actually why do you pass
> this parameter set_parent at all? It is always true in this code.

Because the other caller just below passes false: When we're being asked
to set_rate, the parent rate has been set by the core and we just need
to choose our best divider given that.

>> +static int pl111_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
>> +                                 unsigned long prate)
>> +{
>> +       struct pl111_drm_dev_private *priv =
>> +               container_of(hw, struct pl111_drm_dev_private, clk_div);
>> +       int div = pl111_clk_div_choose_div(hw, rate, &prate, false);
>> +       u32 tim2;
>> +
>> +       spin_lock(&priv->tim2_lock);
>> +       tim2 = readl(priv->regs + CLCD_TIM2);
>> +       tim2 &= ~(TIM2_BCD | TIM2_PCD_LO_MASK | TIM2_PCD_HI_MASK);
>> +
>> +       if (div == 1) {
>> +               tim2 |= TIM2_BCD;
>> +       } else {
>> +               div -= 2;
>> +               tim2 |= div & TIM2_PCD_LO_MASK;
>> +               tim2 |= (div >> TIM2_PCD_LO_BITS) << TIM2_PCD_HI_SHIFT;
>> +       }
>> +
>> +       writel(tim2, priv->regs + CLCD_TIM2);
>> +       spin_unlock(&priv->tim2_lock);
>> +
>> +       return 0;
>> +}
>
> So this will write the divisor, which is nice. But what if we also need
> to change the rate of the parent?

The clk core will have already done that.

>> +static int
>> +pl111_init_clock_divider(struct drm_device *drm)
>> +{
>> +       struct pl111_drm_dev_private *priv = drm->dev_private;
>> +       struct clk *parent = devm_clk_get(drm->dev, "clcdclk");
>> +       struct clk_hw *div = &priv->clk_div;
>> +       const char *parent_name;
>> +       struct clk_init_data init = {
>> +               .name = "pl111_div",
>> +               .ops = &pl111_clk_div_ops,
>> +               .parent_names = &parent_name,
>> +               .num_parents = 1,
>> +       };
>
> I think it is necessary to set .flags in the init data to
> .flags = CLK_SET_RATE_PARENT,
> for this code to work with a parent that can change rate.

I was thinking this flag was used internally in things like
clk-divider.c, but the core uses it too.  I'll fix that, thanks!

>> - * - Use the internal clock divisor to reduce power consumption by
>> - *   using HCLK (apb_pclk) when appropriate.
>> + * - Use the CLKSEL bit to support switching between the two external
>> + *   clock parents.
>
> OK so that remains to be done. We discussed this previously
> so I got a bit confused. The divisor code seems fine, after this
> we only need some more code to choose the best parent for
> the divided clock.
>
> It seems that what would pe Perfect(TM) would be to calculate the
> best end result using clock A and the best end result using clock B,
> both utilizing the divisor, and then choose the best of those two.
>
> I think struct clk_mux is supposed to do that so it would eventually
> be:
>
> CLK A -|\_ clk_mux --> clk_divider --> pixel clock
> CLK B -|/

I agree.  This patch got things going for this platform, without needing
the bindings change (and helped confirm for me that I do understand the
platform design correctly).

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkA0MgACgkQtdYpNtH8
nuj1zxAAj+MdIpqzAEp0YNc9ehHjf7/sDnraDcxwDs121DWatBH+nb1EvNHW3dVG
msNrngJpKwSW5a3my39P2R6Ua5W5690SRm3Mh53+dThvX+gT8IYYKl0IRZJPsOv9
WkBzKMEUTB9n6JAxoCwKDgUUuOtha0/sAsZ1hct7tvjv1m6rAIECoWgt1IzLd7gP
A8tLHrK59PMTERLZw2cX11T850DE/t67AeZN7mNxRff/Y6OxMTYkPY1C46ztURkY
VTJ++uAcNBNlDnwX8uMhtvUw8j+sgDU3c5boHMlj/RkpO+QCEALFhyYr5DGJs1mG
NYwZ+CarpomFS7gZh40asowD4aYngBEEorVUuFvzf24BFmIpY+C/YdEqWFkwVqxl
XuqBkV3ytrNX7HLT1VaE2ccCB0E5U+8tlw9vC3CGaMB4ZTP8FLgM8dlQVOJLvJSL
rs9p7JTRLSGH8kReVGxNwy41exivSoV0YgLZUuE6V4YHl0Jke3E2qzeIdjw3mrEf
pST0Sg0C3hUjJBUQj2xE9HQCQyY17yhJp2gBM4eHIi36eQmKpCnLtK9yjT2ZskVp
A5qy3/h/YWfNsIM7XHb/ghZwZXsr2x57rKg6A2H2crQZxDqK+wYEB84suaINH6ay
2V8IJk97EnYWDSKavKgXVf3Dr1yH956rZo76ALYODMoY0qjytD0=
=Pmel
-----END PGP SIGNATURE-----
--=-=-=--
