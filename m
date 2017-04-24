Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20170424080308.GJ30730@tbergstrom-lnx.Nvidia.com>
References: <1492624001-3758-1-git-send-email-ykaneko0929@gmail.com>
 <CAMuHMdWfouuGZqPGV7_-cXUmYe-SXd9popja8T43V5hPP+DQQw@mail.gmail.com> <20170424080308.GJ30730@tbergstrom-lnx.Nvidia.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Apr 2017 10:09:10 +0200
Message-ID: <CAMuHMdVS9ypvdN9p9G3rWP1cu933wCv+Wgd-65q4dvf-JfBPSg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rcar-gen3: Add Z clock divider support
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Peter,

On Mon, Apr 24, 2017 at 10:03 AM, Peter De Schrijver
<pdeschrijver@nvidia.com> wrote:
>> > --- a/drivers/clk/renesas/rcar-gen3-cpg.c
>> > +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
>>
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
> Is this an actual divider or a pulse skipper?

Forgive my ignorance, but what is the difference?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
