Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20170422012736.GW7065@codeaurora.org>
References: <1492624001-3758-1-git-send-email-ykaneko0929@gmail.com>
 <CAMuHMdWfouuGZqPGV7_-cXUmYe-SXd9popja8T43V5hPP+DQQw@mail.gmail.com> <20170422012736.GW7065@codeaurora.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 23 Apr 2017 22:20:54 +0200
Message-ID: <CAMuHMdXL6Ld4W0BoYVawnEv6wtNOsYpoO5yYtbCk7jfQ+dNhNA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rcar-gen3: Add Z clock divider support
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
	linux-clk <linux-clk@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On Sat, Apr 22, 2017 at 3:27 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 04/21, Geert Uytterhoeven wrote:
>> > --- a/drivers/clk/renesas/rcar-gen3-cpg.c
>> > +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
>> > +static unsigned long cpg_z_clk_recalc_rate(struct clk_hw *hw,
>> > +                                          unsigned long parent_rate)
>> > +{
>> > +       struct cpg_z_clk *zclk = to_z_clk(hw);
>> > +       unsigned int mult;
>> > +       unsigned int val;
>> > +       unsigned long rate;
>> > +
>> > +       val = (clk_readl(zclk->reg) & CPG_FRQCRC_ZFC_MASK)
>> > +           >> CPG_FRQCRC_ZFC_SHIFT;
>> > +       mult = 32 - val;
>> > +
>> > +       rate = div_u64((u64)parent_rate * mult + 16, 32);
>> > +       /* Round to closest value at 100MHz unit */
>> > +       rate = 100000000*DIV_ROUND_CLOSEST(rate, 100000000);
>>
>> Mike, Stephen: what's your opinion about such rounding tricks?
>
> What's wrong with the true rate? I'd prefer we calculate the true
> rate unless there's some reason. Typically that's what a comment
> is for, not to explain what the code is doing which is usually
> self evident from reading it.

The (intermediate) true rate may be a fractional number.
Since clock rate division and multiplication operate on integer numbers
(unsigned long), the calculated rate may deviate from the true rate due to
rounding or truncation.

The hack above is an attempt to correct that.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
