Return-Path: <tony@atomide.com>
Date: Thu, 1 Mar 2018 07:26:00 -0800
From: Tony Lindgren <tony@atomide.com>
To: Tero Kristo <t-kristo@ti.com>
Cc: linux-clk@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
	linux-omap@vger.kernel.org, jsarha@ti.com
Subject: Re: [PATCH 0/3] clk: ti: add CLK_SET_RATE_PARENT support for clkctrl
Message-ID: <20180301152600.GF62820@atomide.com>
References: <1519657812-15605-1-git-send-email-t-kristo@ti.com>
 <20180226220520.GI16043@atomide.com>
 <e036e793-37f5-a6ee-4347-72d27579e278@ti.com>
 <20180227164142.GA5448@atomide.com>
 <20180227164813.GB5448@atomide.com>
 <98bf01ee-f6e0-67e4-f8cc-cec4e5d37f31@ti.com>
 <20180228215850.GH5448@atomide.com>
 <7df04a6b-9ddd-7061-9a29-8620da4f61c2@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <7df04a6b-9ddd-7061-9a29-8620da4f61c2@ti.com>
List-ID: <linux-clk.vger.kernel.org>

* Tero Kristo <t-kristo@ti.com> [180301 07:05]:
> On 28/02/18 23:58, Tony Lindgren wrote:
> > Then omap_dm_timer_init_one() can configure the source clock
> > which is bit 24. My guess is that 138f7ca78f is really a
> > workaround for set_parent() not working properly for clkctrl
> > clock :)
> 
> set_parent() can't work for clkctrl clock, as it only has one parent. The
> mux is a separate component, so you need to fetch the parent of the clkctrl
> part and set the parent for that one; unless we want to implement some sort
> of composite clock support for it.

Hmm OK probably good idea to avoid any composite clocks here :)

I guess in timer1 example, clkctrl bit 0 is gate for both GPT1_FCLK
and WKUP_L4_ICLK2? And then bit 24 sets the parent of WKUP_L4_ICLK2.
Or am I still confused?

So what should we call clkctrl bit 24 then? It seems we can have
up to 8 opt clocks and also "parent" clocks for the fck.

> I'd say it is more like a transitional patch to support both legacy and
> clkctrl way of handling clocks. The patch can most likely be dropped once
> the transition is done, but this was the only way I could see how to get it
> fixed in short term.

OK

> > Then a board can specify it's desired source clock for system
> > timer(s) by configure "assigned-lcok-parents" and set it to
> > 32KiHz clock or SYS_CLK.
> 
> Yeah, that will definitely work.

We can have those aliases for the timer driver, I guess we just
need a suitable name for the clkctrl parent bit(s).

Anyways, no objections to this series of fixes, just wondering:

Acked-by: Tony Lindgren <tony@atomide.com>
