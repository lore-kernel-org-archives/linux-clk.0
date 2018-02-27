Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:58496 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750997AbeB0QsQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 27 Feb 2018 11:48:16 -0500
Date: Tue, 27 Feb 2018 08:48:13 -0800
From: Tony Lindgren <tony@atomide.com>
To: Tero Kristo <t-kristo@ti.com>
Cc: linux-clk@vger.kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, linux-omap@vger.kernel.org, jsarha@ti.com
Subject: Re: [PATCH 0/3] clk: ti: add CLK_SET_RATE_PARENT support for clkctrl
Message-ID: <20180227164813.GB5448@atomide.com>
References: <1519657812-15605-1-git-send-email-t-kristo@ti.com>
 <20180226220520.GI16043@atomide.com>
 <e036e793-37f5-a6ee-4347-72d27579e278@ti.com>
 <20180227164142.GA5448@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180227164142.GA5448@atomide.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

* Tony Lindgren <tony@atomide.com> [180227 16:43]:
> * Tero Kristo <t-kristo@ti.com> [180227 06:35]:
> > On 27/02/18 00:05, Tony Lindgren wrote:
> > > Hmm so should we have all the timers use bit 0 in the dtsi?
> > > Or default to bit 24 for all of them?
> > 
> > Who is going to control the clkctrl clock for the timers if you just control
> > the opt clock? Also, ain't the bit 24 the clksel mux setting? Tweaking that
> > would seem wrong...
> 
> Yeah OK.

$ git grep TIMER arch/arm/boot/dts/* | grep CLKCTRL

And that shows timer1 using bit 24 for omap4, omap5 and dra7
dtsi files.

So shouldn't that then be just bit 0 instead of bit 24 for
those? And then we let omap_dm_timer_init_one() reparent it?

Regards,

Tony
