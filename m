Return-Path: <sboyd@codeaurora.org>
Date: Thu, 3 Aug 2017 17:32:49 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v3 04/10] clk: use round rate to bail out early in
 set_rate
Message-ID: <20170804003249.GV2146@codeaurora.org>
References: <20170612194438.12298-1-jbrunet@baylibre.com>
 <20170612194438.12298-5-jbrunet@baylibre.com>
 <20170712020041.GU22780@codeaurora.org>
 <1501089183.2401.28.camel@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1501089183.2401.28.camel@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/26, Jerome Brunet wrote:
> On Tue, 2017-07-11 at 19:00 -0700, Stephen Boyd wrote:
> > On 06/12, Jerome Brunet wrote:
> > 
> > > 
> > > Ex: provider able to give any rate with steps of 100Hz
> > >  - 1st consumer request 48000Hz and gets it.
> > >  - 2nd consumer request 48010Hz as well. If we were to perform the usual
> > >    mechanism, we would get 48000Hz as well. The clock would not change so
> > >    there is no point performing any checks to make sure the clock can
> > >    change, we know it won't.
> > 
> > I think Peter reported a similar problem as to what you're
> > describing. Can you further explain a problem situation that this
> > patch is fixing based on that thread (I can find the link if
> > needed)?
> > Some of this series if fixing rate constraints actually,
> > so please Cc him on future patch sets.
> 
> I had not seen the thread you referring to.
> I assume Peter is Peter De Schrijver and the thread is:
> 
> http://lkml.kernel.org/r/1490103807-21821-1-git-send-email-pdeschrijver@nvidia.c
> om
> 
> Peter is right, There is indeed a problem when the current rate is out of the
> requested range.

Yes. Thanks for figuring out my vague statement.

> 
> I'm not sure about the proposed solution though. Even the rate set by
> set_rate_range() should go trough the bail-out mechanism because of the use-case 
> I have explained here.
> 
> After spending some time on it, I realized that patch 7 is useless, as the call
> to clk_core_set_rate_nolock() with core->req_rate is a no-op and will never
> fail.
> 
> We could request the rate to be changed to nearest rate range limit (here is a
> candidate fix doing that [0]
> 
> But then we get to a more fundamental issue of the rate range mechanism.
> 
> Take the example of Peter:
> * You had 500Mhz and you set a range of [100-300] MHz
> * The logical thing to do would be to request the clock rate to change to
> 300MHz, right ?
> * Hw capabilities being what they are, the rate is unfortunately rounded to
> 301Mhz.
> * In the end, you are out of the range and the call fails.
> 
> That is when the clock only implement round_rate(). If it implement
> determine_rate(), it could take the range into account when rounding the rate.
> However, I doubt many clock drivers are taking care of this corner case, if any.
> 
> The clean way to address this would be to have all clock drivers use
> determine_rate() and make sure they all that the case into account, and delete
> the round_rate() ... not happening tomorrow.

Yes the migration path is to use determine_rate() and have
providers handle min/max adjustments themselves. I don't think we
really can do anything about the problem you mention though. If
someone wants to use rate range setting, then the provider clks
need to handle the ranges appropriately. We can't do anything
more in the framework if they only implement round_rate() and
that returns something out of range.

> 
> The consistent way would be to systematically fail if the current rate is out of
> the requested range ... a bit rude maybe.
> 
> The proposed patch [0] does it's best to change the rate, but may fail as
> explained above ... 
> 
> For now, I have dropped patch 7 and pushed patch [0] at the end of the queue.
> Since It is really related to the clock protect mechanism, we should probably
> discuss this in another thread. 

Ok.

> 
> [0]: https://github.com/jeromebrunet/linux/commit/235e477f346a9e8d115dda257f9f73
> 834151bd7f
> 
> > 
> > > 
> > > This is important to prepare the addition of the clock protection
> > > mechanism
> > > 
> > > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > > ---
> > >  drivers/clk/clk.c | 23 +++++++++++++++++++++--
> > >  1 file changed, 21 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > index 8cc4672414be..163cb9832f10 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -1570,15 +1570,34 @@ static void clk_change_rate(struct clk_core *core)
> > >  		clk_change_rate(core->new_child);
> > >  }
> > >  
> > > +static unsigned long clk_core_req_round_rate_nolock(struct clk_core *core,
> > > +						     unsigned long
> > > req_rate)
> > > +{
> > > +	int ret;
> > > +	struct clk_rate_request req;
> > > +
> > > +	if (!core)
> > > +		return 0;
> > 
> > This is impossible because the only call site checks for core
> > being NULL already.
> > 
> 
> This more or less like the previous comments on lockdep_assert.
> Most (should be all) "_no_lock" function check the prepare_lock and the core
> pointer. Even when it is not strictly necessary, I think we should be consistent
>  about it.
> 
> In the unlikely event this function is used some place else, it would avoid bad
> surprise
> 
> So if it is OK with you, I would prefer to keep this check and add the check of
> the prepare lock. Maybe I could go over the other "_nolock" functions in clk.c
> to verify they are all doing it ? What do you think ?

Please don't send a patch to make things consistent. I'm ok with
the NULL check here.

> 
> > > +
> > > +	clk_core_get_boundaries(core, &req.min_rate, &req.max_rate);
> > > +	req.rate = req_rate;
> > > +
> > > +	ret = clk_core_round_rate_nolock(core, &req);
> > > +
> > > +	return ret ? 0 : req.rate;
> > 
> > What if the return value is negative?
> 
> Here we are trying to return a rate, so unsigned long.
> I think (and I remember discussing it with Mike sometimes ago) that a 0 clock
> rate quite often represent an error. 
> 
> 
> > We should bail the set rate
> > call instead of continuing on?
> 
> I don't think this for this particular function to decide. It should try compute
> what the rate would be. It's up to the calling function to decide what do with
> this 0 (error)
> 
> To answer your question, I think that if we can't figure out the what the rate
> would be, we should not error right away and just let the regular process happen
> (no bail-out) ... If there is a problem, it will error anyway 
> 
> > 
> 

Hmm. Ok. I seem to recall that if set_rate fails in the middle of
the tree we won't report it as an error. Maybe I'm misremembering
though so if I'm wrong then everything is good.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
