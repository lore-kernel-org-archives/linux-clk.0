Return-Path: <sboyd@codeaurora.org>
Date: Thu, 1 Jun 2017 02:12:51 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: Re-evaluate clock rate on min/max update
Message-ID: <20170601091251.GF20170@codeaurora.org>
References: <1490103807-21821-1-git-send-email-pdeschrijver@nvidia.com>
 <20170412164605.GO7065@codeaurora.org>
 <20170413074819.GS30730@tbergstrom-lnx.Nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170413074819.GS30730@tbergstrom-lnx.Nvidia.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/13, Peter De Schrijver wrote:
> On Wed, Apr 12, 2017 at 09:46:05AM -0700, Stephen Boyd wrote:
> > On 03/21, Peter De Schrijver wrote:
> > > Whenever a user change its min or max rate limit of a clock, we need to
> > > re-evaluate the current clock rate and possibly change it if the new limits
> > > require so. To do this clk_set_rate_range() already calls
> > > clk_core_set_rate_nolock, however this won't have the intended effect
> > > because the core clock rate hasn't changed. To fix this, move the test to
> > > avoid setting the same core clock rate again, to clk_set_rate() so
> > > clk_core_set_rate_nolock() can change the clock rate when min or max have
> > > been updated, even when the core clock rate has not changed.
> > 
> > I'd expect some sort of Fixes: tag here? Or it never worked!?
> 
> I don't think this ever worked.
> 
> > 
> > > 
> > > Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> > 
> > I seem to recall some problems here around rate aggregation that
> > we fixed after the patches merged. Sorry, but I have to go back
> > and look at those conversations to refresh my memory and make
> > sure this is all fine.
> > 
> > Are you relying on the rate setting op to be called with the new
> > min/max requirements if the aggregated rate is the same? I don't
> > understand why clk drivers care.
> > 
> 
> No. But I do rely on the rate setting op to be called when a new min or max
> rate would cause the rate to be changed even when there is no new rate request.
> 
> Eg:
> 
> min = 100MHz, max = 500MHz, current rate request is 400MHz, then max changes to
> 300MHz. Today the rate setting op will not be called, while I think it should
> be called to lower the rate to 300MHz.

Ok. Can you please describe the sequence in more detail? What is
core::req_rate when the clk is registered? What is the rate of
the clk when the first rate is set?

Because I have a maintainer tag on commit 1c8e600440c of
[sboyd@codeaurora.org: set req_rate in __clk_init] which may be a
problem if the clk is orphaned when registered and thus req_rate
is totally bogus because we can't calculate the rate[1].

We will need to only set req_rate when a clk is actually parented
to something, urgh. But that definitely doesn't look to even be
the bug you're talking about. From what I can tell, the whole
design is borked, because nobody has really used or tested this
code! We should really be making sure that a clk range request
doesn't become disjoint from other consumer requests. If it does,
it will be unsatisfiable. Furthermore, we should remove the
min/max constraints on failure out of set_rate() because it
didn't work.

We have req_rate there to make sure we bring the clk rate back to
within some range when a constraint goes away, but we should
probably just evaluate the constraints before calling
clk_core_set_rate_nolock() and then clamp the req_rate to within
the min/max that we determine, leaning toward the lowest rate.
That's sort of what you're doing here, but we lost the check to
make sure we don't call the set_rate op with the same rate we
already have. I'd prefer we maintain that part of the code even
for rate constraints.

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2015-February/321467.html

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
