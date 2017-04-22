Return-Path: <sboyd@codeaurora.org>
Date: Fri, 21 Apr 2017 18:27:36 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] clk: renesas: rcar-gen3: Add Z clock divider support
Message-ID: <20170422012736.GW7065@codeaurora.org>
References: <1492624001-3758-1-git-send-email-ykaneko0929@gmail.com>
 <CAMuHMdWfouuGZqPGV7_-cXUmYe-SXd9popja8T43V5hPP+DQQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAMuHMdWfouuGZqPGV7_-cXUmYe-SXd9popja8T43V5hPP+DQQw@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/21, Geert Uytterhoeven wrote:
> 
> > --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> > +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> 
> > +static unsigned long cpg_z_clk_recalc_rate(struct clk_hw *hw,
> > +                                          unsigned long parent_rate)
> > +{
> > +       struct cpg_z_clk *zclk = to_z_clk(hw);
> > +       unsigned int mult;
> > +       unsigned int val;
> > +       unsigned long rate;
> > +
> > +       val = (clk_readl(zclk->reg) & CPG_FRQCRC_ZFC_MASK)
> > +           >> CPG_FRQCRC_ZFC_SHIFT;
> > +       mult = 32 - val;
> > +
> > +       rate = div_u64((u64)parent_rate * mult + 16, 32);
> > +       /* Round to closest value at 100MHz unit */
> > +       rate = 100000000*DIV_ROUND_CLOSEST(rate, 100000000);
> 
> Mike, Stephen: what's your opinion about such rounding tricks?
> 

What's wrong with the true rate? I'd prefer we calculate the true
rate unless there's some reason. Typically that's what a comment
is for, not to explain what the code is doing which is usually
self evident from reading it.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
