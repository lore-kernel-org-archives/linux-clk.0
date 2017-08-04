Return-Path: <sboyd@codeaurora.org>
Date: Thu, 3 Aug 2017 17:18:36 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v3 05/10] clk: add support for clock protection
Message-ID: <20170804001836.GU2146@codeaurora.org>
References: <20170612194438.12298-1-jbrunet@baylibre.com>
 <20170612194438.12298-6-jbrunet@baylibre.com>
 <20170726001217.GC2146@codeaurora.org>
 <1501089516.2401.29.camel@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1501089516.2401.29.camel@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/26, Jerome Brunet wrote:
> On Tue, 2017-07-25 at 17:12 -0700, Stephen Boyd wrote:
> > On 06/12, Jerome Brunet wrote:
> > > +	if (WARN_ON(clk->protect_count <= 0))
> > > +		goto out;
> > > +
> > > +	clk_core_rate_unprotect(clk->core);
> > 
> > Can we make this stuff non-recursive? I know that this is
> > basically a copy paste of prepare/unprepare code and recursion is
> > nice and elegant, but we really don't need to do it when we could
> > have a loop that's the same and doesn't blow up our stack frame
> > usage. I'll send a patch for prepare/enable so you get the idea.
> 
> I think we should not be doing the same thing differently inside the framework.
> If enable and disable are recursive, protect should be too. The stack can handle
> enable and prepare, why would it not handle protect ?
> 
> Of course, If your patch to "stack-ify" enable and prepare merges first, I'll
> copy the mechanism. The important thing for me is keep things consistent.
> 
> On a more general note, your idea is no light change ...
> Are the trees really that tall that it is becoming a problem ?
> I see in your patch comment that there is still a few question to be answered,
> right ?

I see it more of a problem when set_rate in the middle of
recursion needs to call enable/prepare and then goes and stacks a
bunch more frames again, and that has already been called deep in
a stack by a driver. I admit I haven't seen a problem, but I'd
rather not find out later that it was a problem.

> 
> Could we take this one step at time and keep the recursion for now?
> When the whole CCF moves to a stack approach, I'll be happy to help.

Sounds fine. We can take this up on another thread.

> 
> > 
> > > +	clk->protect_count--;
> > > +out:
> > > +	clk_prepare_unlock();
> > > +}
> > > +EXPORT_SYMBOL_GPL(clk_rate_unprotect);
> > 
> > [..]
> > > +
> > > @@ -2952,6 +3134,17 @@ void __clk_put(struct clk *clk)
> > >  
> > >  	clk_prepare_lock();
> > >  
> > > +	/*
> > > +	 * Before calling clk_put, all calls to clk_rate_protect from a
> > > given
> > > +	 * user must be balanced with calls to clk_rate_unprotect and by
> > > that
> > > +	 * same user
> > > +	 */
> > > +	WARN_ON(clk->protect_count);
> > > +
> > > +	/* We voiced our concern, let's sanitize the situation */
> > > +	for (; clk->protect_count; clk->protect_count--)
> > > +		clk_core_rate_unprotect(clk->core);
> > 
> > Does this do anything different than:
> > 
> > 	clk->core->protect_count -= clk->protect_count;
> > 	clk->protect_count = 1;
> 
> this looks really hacky !
> 
> > 	clk_core_rate_unprotect(clk->core);
> > 
> > Just seems better to not do a loop here.
> 
> A loop a easy to understand.
> This code should actually never run, so readability looks more important to me
> than optimisation.
> If you really insist on this, I'll yield but I'm not a big fan.

Well I'm suggesting this because the same loop looked to be
repeated in a couple of other places, and in those cases it was
always run, so looping through it all the time to decrement is
sort of odd. Maybe it could be a small function?

	int clk_core_rate_unprotect_force(struct clk_core *core)
	{
		int count = core->protect_count;

		if (count) {
			core->protect_count = 1;
			clk_core_rate_unprotect(core);
		}

		return count;
	}

And then call-site would be

	if (clk_core_rate_unprotect_force(clk->core))
		clk->protect_count = 0;

and the other call-site where we temporarily remove it we can
have unprotect force and then protect_force restore the value
returned.

> 
> > 
> > > diff --git a/include/linux/clk.h b/include/linux/clk.h
> > > index 91bd464f4c9b..b60c36f2e6b0 100644
> > > --- a/include/linux/clk.h
> > > +++ b/include/linux/clk.h
> > > @@ -331,6 +331,30 @@ struct clk *devm_clk_get(struct device *dev, const char
> > > *id);
> > >   */
> > >  struct clk *devm_get_clk_from_child(struct device *dev,
> > >  				    struct device_node *np, const char
> > > *con_id);
> > > +/**
> > > + * clk_rate_protect - inform the system when the clock rate must be
> > > protected.
> > > + * @clk: clock source
> > > + *
> > > + * This function informs the system that the consumer protecting the clock
> > > + * depends on the rate of the clock source and can't tolerate any glitches
> > > + * introduced by further clock rate change or re-parenting of the clock
> > > source.
> > > + *
> > > + * Must not be called from within atomic context.
> > > + */
> > > +void clk_rate_protect(struct clk *clk);
> > 
> > Is there any plan to use this clk_rate_protect() API? It seems
> > inherently racy for a clk consumer to call clk_set_rate() and
> > then this clk_rate_protect() API after that to lock the rate in.
> > How about we leave this out of the consumer API until a user
> > needs it?
> 
> Having this API available is whole reason I've been working on this for so long.
> By the now, you may have forgot but I explained the use-case in first RFC [0]
> Here is an example (wip) of usage [1]
> 
> [0]: http://lkml.kernel.org/r/20170302173835.18313-1-jbrunet@baylibre.com
> [1]: https://github.com/jeromebrunet/linux/commits/amlogic/wip/audio-clk-lock

If we're forgetting why something is introduced then it means the
commit text is missing information. Please clearly describe the
need for the API in the commit text for the patch that introduces
it.

> 
> > 
> > Finally, When does a consumer want the rate of a clk to change
> > after they call clk_set_rate() on it? I would guess that very few
> > consumers would be willing to accept that. Which begs the
> > question, if anyone will keep calling clk_set_rate() after this
> > API (and the clk_set_rate_protect() API) is added. It almost
> > seems like we would want it to be opt-out, instead of opt-in, so
> > that consumers would call clk_set_rate() and expect it to be a
> > stable clk rate after that, and they would call
> > clk_set_rate_trample_on_me() or something properly named when
> > they don't care what the rate is after they call the API.
> > 
> 
> Indeed, we generally don't want our rate to change, but:
> - This is mostly for leaf clocks, the internal path would generally not care, as
> long as the leaf are happy.
> - Even a leaf may be open (be able to deal with) to small glitches, pll relock,
> re parenting
> 
> Actually, if all the clock could not tolerate any glitches, there would have
> been a lot of complains about CCF by now, it does not prevent glitches at all.

Well some devices handle glitches in the hardware, so the details
of glitch free rate changes are hidden from clk consumers, and
the software in general, on those devices.

> 
> If you go over the initial RFC, the point is also for the CCF to favor other
> (unused parent) when several (sometimes with the same capabilities) are
> available. I think this is also a fairly common use case. That's something
> rate_range won't do either, as far as I understood.

Fair enough, but why do we want consumers to need to know that
there are sometimes unused parents that aren't getting chosen for
a particular frequency? I see this as exposing the internals of
the clk tree to consumers when they shouldn't need to care. Of
course, sometimes clk consumers really do care about internals,
for example if some PLL is used for a display controller and it's
also routed out of the chip on the display phy pins to encode
data or something. Then perhaps we really want to use one
particular PLL instead of a generic one that may also be a parent
of the display controller clk. Making sure clk_set_rate() doesn't
trample on clks deep in the tree seems different than this
though.

Going back to your RFC series cover letter though, I see three
PLLs (mppl0,1,2) and two users of the PLLs (amclk and mclk_i958).
Is anything else using these PLLs in the system? Why are we doing
all this stuff instead of hard-coding the parents for these clks
to be different PLLs? If we want it to be flexible we could
assign parents to the cts_amclk_sel and cts_mclk_i958_sel to be
different PLLs in DT via assigned clock parents. Or it could just
be hard-coded in the clk driver during probe.

If there's really sharing going on, and you can't hardcode the
parents, please indicate why that's the case in the commit text.
I don't want to introduce another consumer API just because we
didn't want to restrict the available parents for a couple clks.

> 
> Last but not least, it allows consumer to set the rate in a sort of critical
> section and have the guarantee that nobody will be able to change the rate
> between the clk_set_rate() call and prepare_enable(). That's something we don't
> have at the moment.
> 

Right, but clk_rate_protect() doesn't close the critical section
between clk_set_rate() and clk_rate_protect() if another
consumers changes the frequency, or if that consumer changes the
frequency of some parent of the clk. This is why I'm asking what
the use of this API is for. Shouldn't we want consumers to use
clk_set_rate_protect() so they can be sure they got the rate they
wanted, instead of hoping that something else hasn't come in
between the set_rate and the protect calls and changed the
frequency?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
