Return-Path: <sboyd@codeaurora.org>
Date: Thu, 18 Feb 2016 18:03:33 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, lee.jones@linaro.org,
	maxime.ripard@free-electrons.com, maxime.coquelin@st.com,
	geert@linux-m68k.org, heiko@sntech.de, andre.przywara@arm.com,
	rklein@nvidia.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v42 1/6] clk: Allow clocks to be marked as CRITICAL
Message-ID: <20160219020333.GO4847@codeaurora.org>
References: <1455225554-13267-1-git-send-email-mturquette@baylibre.com>
 <1455225554-13267-2-git-send-email-mturquette@baylibre.com>
 <20160213011403.GI4847@codeaurora.org>
 <20160215202734.2278.91610@quark.deferred.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160215202734.2278.91610@quark.deferred.io>
List-ID: <linux-clk.vger.kernel.org>

On 02/15, Michael Turquette wrote:
> Quoting Stephen Boyd (2016-02-12 17:14:03)
> > On 02/11, Michael Turquette wrote:
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > index b4db67a..993f775 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -2484,6 +2484,11 @@ static int __clk_init(struct device *dev, struct clk *clk_user)
> > >       if (core->ops->init)
> > >               core->ops->init(core->hw);
> > >  
> > > +     if (core->flags & CLK_IS_CRITICAL) {
> > > +             clk_core_prepare(core);
> > > +             clk_core_enable(core);
> > > +     }
> > 
> > What do we do if this is an orphan clk? From what I can tell
> > we're not going to increment the ref count on the parents that
> > may or may not appear at some later time when this flag is set.
> 
> I don't see how this is any different than any other orphan clock.
> __clk_set_parent_before and __clk_set_parent_after should still handle
> migration and propagation of the {prepare,enable}_count when it is
> finally re-parented.

>From what I can see we don't call __clk_set_parent_before() or
__clk_set_parent_after() when we're reparenting orphans to
registered clks. We just call clk_core_reparent() that does
mostly a list manipulation and recalc down the tree (BTW we
probably shouldn't recalc at all if a clk is still orphaned
because the rate is totally bogus).

> 
> (as an aside, that code conditionally calls clk_prepare AND clk_enable
> based solely on the prepare refcount, which seems weird to me...)

Yeah I think I was questioning why we need to call clk_enable()
there too so we should probably revisit this topic in another
thread.

> 
> > Furthermore, do we want to propagate the CLK_IS_CRITICAL flag up
> > to all the parent clocks so that the warning mechanism spits out
> > errors for parent clocks? I suppose that may not be very useful
> > assuming refcounts are correct, but it may be useful to know
> > which clocks are critical and which ones aren't during debug.
> 
> No, propagating flags is a bad idea. Existing prepare/enable ref counts
> should do the job for us.
> 
> Regarding debug, propagating the flag will hurt debug-ability. We
> already expose the clk_core->flags in sysfs, and debuggers can grep for
> the CRITICAL flag there to find any spuriously enabled clocks.
> 

Awesome.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
