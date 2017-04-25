Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20170425110246.GV30730@tbergstrom-lnx.Nvidia.com>
References: <1492624001-3758-1-git-send-email-ykaneko0929@gmail.com>
 <CAMuHMdWfouuGZqPGV7_-cXUmYe-SXd9popja8T43V5hPP+DQQw@mail.gmail.com>
 <20170424080308.GJ30730@tbergstrom-lnx.Nvidia.com> <CAMuHMdVS9ypvdN9p9G3rWP1cu933wCv+Wgd-65q4dvf-JfBPSg@mail.gmail.com>
 <20170425101852.GU30730@tbergstrom-lnx.Nvidia.com> <CAMuHMdWOhWEw-ot8P8r3t9erdj-uTLF32uYT4ZGfOv+sq_yspw@mail.gmail.com>
 <20170425110246.GV30730@tbergstrom-lnx.Nvidia.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Apr 2017 13:39:20 +0200
Message-ID: <CAMuHMdWHvurjVyEp+pXXNJv8rfsDXkuC=vLFywvEz3CJE6JdHA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rcar-gen3: Add Z clock divider support
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Peter,

On Tue, Apr 25, 2017 at 1:02 PM, Peter De Schrijver
<pdeschrijver@nvidia.com> wrote:
> On Tue, Apr 25, 2017 at 12:28:29PM +0200, Geert Uytterhoeven wrote:
>> On Tue, Apr 25, 2017 at 12:18 PM, Peter De Schrijver
>> <pdeschrijver@nvidia.com> wrote:
>> > On Mon, Apr 24, 2017 at 10:09:10AM +0200, Geert Uytterhoeven wrote:
>> >> On Mon, Apr 24, 2017 at 10:03 AM, Peter De Schrijver
>> >> <pdeschrijver@nvidia.com> wrote:
>> >> >> > --- a/drivers/clk/renesas/rcar-gen3-cpg.c
>> >> >> > +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
>> >> >>
>> >> >> > +static unsigned long cpg_z_clk_recalc_rate(struct clk_hw *hw,
>> >> >> > +                                          unsigned long parent_rate)
>> >> >> > +{
>> >> >> > +       struct cpg_z_clk *zclk = to_z_clk(hw);
>> >> >> > +       unsigned int mult;
>> >> >> > +       unsigned int val;
>> >> >> > +       unsigned long rate;
>> >> >> > +
>> >> >> > +       val = (clk_readl(zclk->reg) & CPG_FRQCRC_ZFC_MASK)
>> >> >> > +           >> CPG_FRQCRC_ZFC_SHIFT;
>> >> >> > +       mult = 32 - val;
>> >> >> > +
>> >> >> > +       rate = div_u64((u64)parent_rate * mult + 16, 32);
>> >> >> > +       /* Round to closest value at 100MHz unit */
>> >> >> > +       rate = 100000000*DIV_ROUND_CLOSEST(rate, 100000000);
>> >> >>
>> >> >> Mike, Stephen: what's your opinion about such rounding tricks?
>> >> >
>> >> > Is this an actual divider or a pulse skipper?
>> >>
>> >> Forgive my ignorance, but what is the difference?
>> >
>> > A pulse skipper, as the name says, skips pulses. Eg, if you configure the
>> > skipper to 3/4, it will skip 1 input clock pulse out of 4. The pulse width
>> > will be the same as the parent clock pulse width though. A divider stretches
>> > the clock pulse. So the output of a divider configured to 1/2 will have a
>> > pulse width which is twice as large as the pulse width of the input clock.
>>
>> OK, thanks! So a pulse skipper changes the duty cycle of the signal.
>
> Yes, it does.
>
>> I would expect this to be a real divider, as that would allow the Cortex A53
>> core to do work on both edges of the clock signal.
>
> Maybe. Although I know we've run A53s from skippers. One difference is that a
> real divider allows you to lower the voltage, while a skipper does not,
> because it only changes the duty cycle as you mentioned.

Then it must be a real divider, as it supports DVFS.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
