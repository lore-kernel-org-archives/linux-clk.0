Return-Path: <pdeschrijver@nvidia.com>
Date: Tue, 16 May 2017 10:38:29 +0300
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Stephen Boyd <sboyd@codeaurora.org>
CC: Michael Turquette <mturquette@baylibre.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: Re-evaluate clock rate on min/max update
Message-ID: <20170516073829.GS30730@tbergstrom-lnx.Nvidia.com>
References: <1490103807-21821-1-git-send-email-pdeschrijver@nvidia.com>
 <20170412164605.GO7065@codeaurora.org>
 <20170413074819.GS30730@tbergstrom-lnx.Nvidia.com>
 <20170428071743.GL30730@tbergstrom-lnx.Nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <20170428071743.GL30730@tbergstrom-lnx.Nvidia.com>
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On Fri, Apr 28, 2017 at 10:17:43AM +0300, Peter De Schrijver wrote:
> On Thu, Apr 13, 2017 at 10:48:19AM +0300, Peter De Schrijver wrote:
> > On Wed, Apr 12, 2017 at 09:46:05AM -0700, Stephen Boyd wrote:
> > > On 03/21, Peter De Schrijver wrote:
> > > > Whenever a user change its min or max rate limit of a clock, we need to
> > > > re-evaluate the current clock rate and possibly change it if the new limits
> > > > require so. To do this clk_set_rate_range() already calls
> > > > clk_core_set_rate_nolock, however this won't have the intended effect
> > > > because the core clock rate hasn't changed. To fix this, move the test to
> > > > avoid setting the same core clock rate again, to clk_set_rate() so
> > > > clk_core_set_rate_nolock() can change the clock rate when min or max have
> > > > been updated, even when the core clock rate has not changed.
> > > 
> > > I'd expect some sort of Fixes: tag here? Or it never worked!?
> > 
> > I don't think this ever worked.
> > 
> > > 
> > > > 
> > > > Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> > > 
> > > I seem to recall some problems here around rate aggregation that
> > > we fixed after the patches merged. Sorry, but I have to go back
> > > and look at those conversations to refresh my memory and make
> > > sure this is all fine.
> > > 
> > > Are you relying on the rate setting op to be called with the new
> > > min/max requirements if the aggregated rate is the same? I don't
> > > understand why clk drivers care.
> > > 
> > 
> > No. But I do rely on the rate setting op to be called when a new min or max
> > rate would cause the rate to be changed even when there is no new rate request.
> > 
> > Eg:
> > 
> > min = 100MHz, max = 500MHz, current rate request is 400MHz, then max changes to
> > 300MHz. Today the rate setting op will not be called, while I think it should
> > be called to lower the rate to 300MHz.
> > 
> 
> Any news on this? or do you think this is an unreasonable assumption?
> 

Ping!

Peter.
