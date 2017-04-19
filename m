Return-Path: <sboyd@codeaurora.org>
Date: Wed, 19 Apr 2017 10:16:39 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Tony Lindgren <tony@atomide.com>
Cc: Tero Kristo <t-kristo@ti.com>,
	Michael Turquette <mturquette@baylibre.com>,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-omap@vger.kernel.org, Paul Walmsley <paul@pwsan.com>
Subject: Re: [PATCHv3] Documentation: dt-bindings: Add binding documentation
 for TI clkctrl clocks
Message-ID: <20170419171639.GN7065@codeaurora.org>
References: <20170123221702.18420-1-tony@atomide.com>
 <dca1ef84-77d1-2b58-7913-91f3b69fde6d@ti.com>
 <20170419165522.GL7065@codeaurora.org>
 <20170419170246.GA19537@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170419170246.GA19537@atomide.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/19, Tony Lindgren wrote:
> * Stephen Boyd <sboyd@codeaurora.org> [170419 09:58]:
> > On 02/13, Tero Kristo wrote:
> > > On 24/01/17 00:17, Tony Lindgren wrote:
> > > 
> > > This binding works for me, so:
> > > 
> > > Acked-by: Tero Kristo <t-kristo@ti.com>
> > > 
> > 
> > This wasn't in the TI clk PR. Shall I merge this to clk-next?
> 
> Tero has this included in his clkctrl series and there's one typo
> fix needed where the doc still says #clock-cells = <4> instead of <2>.
> 
> I suggest let's wait a bit on this and let's try to get the clkctrl
> driver parts into next early after v4.12-rc1 if no issues.
> 
> It seems the clkctrl series clock driver part is pretty much
> ready to go, the remaining issues seem to be in the hwmod code.
> 

Ok thanks. I'll remove this from my queue.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
