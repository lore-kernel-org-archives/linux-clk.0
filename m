Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:58482 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751093AbeB0Qmz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 27 Feb 2018 11:42:55 -0500
Date: Tue, 27 Feb 2018 08:42:48 -0800
From: Tony Lindgren <tony@atomide.com>
To: Tero Kristo <t-kristo@ti.com>
Cc: linux-clk@vger.kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, linux-omap@vger.kernel.org, jsarha@ti.com
Subject: Re: [PATCH 0/3] clk: ti: add CLK_SET_RATE_PARENT support for clkctrl
Message-ID: <20180227164142.GA5448@atomide.com>
References: <1519657812-15605-1-git-send-email-t-kristo@ti.com>
 <20180226220520.GI16043@atomide.com>
 <e036e793-37f5-a6ee-4347-72d27579e278@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <e036e793-37f5-a6ee-4347-72d27579e278@ti.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

* Tero Kristo <t-kristo@ti.com> [180227 06:35]:
> On 27/02/18 00:05, Tony Lindgren wrote:
> > Hi,
> > 
> > * Tero Kristo <t-kristo@ti.com> [180226 15:11]:
> > > This patch adds clock rate propagation support for clkctrl clocks. This
> > > is needed on am33xx beaglebone black device at least, otherwise the
> > > display does not work. Similar problem appears to be present on am43xx
> > > but haven't heard of any reports of such so far, maybe Jyri can confirm
> > > this?
> > 
> > I think I was also hitting this with the system timers with ti-sysc
> > where set_parent() would fail unless the dts has the following for
> > timers:
> > 
> > clocks = <&l4_wkup_clkctrl OMAP4_TIMER1_CLKCTRL 24>;
> > 
> > So bit 24 instead of 0.
> > 
> > Hmm so should we have all the timers use bit 0 in the dtsi?
> > Or default to bit 24 for all of them?
> 
> Who is going to control the clkctrl clock for the timers if you just control
> the opt clock? Also, ain't the bit 24 the clksel mux setting? Tweaking that
> would seem wrong...

Yeah OK.

> If you were facing problems with setting the clock source, we could maybe
> just apply the CLK_SET_RATE_PARENT globally to all clkctrl clocks (modify
> the patch #1 in this series to always set the flag, instead of clecking
> against the CLKF_xyz flag.) Any thoughts?

Sounds good to me if that keeps omap_dm_timer_init_one() working
for clk_set_parent() for configuring timer via dts :)

I think there's a reserved range for the parent clocks that is
different from the opt clocks in the clkctrl registers so it
can be maybe checked that way?

Regards,

Tony
