Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1494594482.2135.1.camel@baylibre.com>
Subject: Re: [RFC 4/7] clk: add support for clock protection
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	 <sboyd@codeaurora.org>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
Date: Fri, 12 May 2017 15:08:02 +0200
In-Reply-To: <149452951146.81039.10685895856154834071@resonance>
References: <20170321183330.26722-1-jbrunet@baylibre.com>
	 <20170321183330.26722-5-jbrunet@baylibre.com>
	 <149452951146.81039.10685895856154834071@resonance>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Thu, 2017-05-11 at 12:05 -0700, Michael Turquette wrote:
> Hi Jerome,
> 
> Quoting Jerome Brunet (2017-03-21 11:33:27)
> > The patch adds clk_protect and clk_unprotect to the CCF API. These
> > functions allow a consumer to inform the system that the rate of clock is
> > critical to for its operations and it can't tolerate other consumers
> > changing the rate or introducing glitches while the clock is protected.
> > 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> >  drivers/clk/clk.c            | 177
> > ++++++++++++++++++++++++++++++++++++++++---
> >  include/linux/clk-provider.h |   1 +
> >  include/linux/clk.h          |  29 +++++++
> >  3 files changed, 197 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index fa77a1841e0f..69db8cc15063 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -60,6 +60,7 @@ struct clk_core {
> >         bool                    orphan;
> >         unsigned int            enable_count;
> >         unsigned int            prepare_count;
> > +       unsigned int            protect_count;
> >         unsigned long           min_rate;
> >         unsigned long           max_rate;
> >         unsigned long           accuracy;
> > @@ -84,6 +85,7 @@ struct clk {
> >         const char *con_id;
> >         unsigned long min_rate;
> >         unsigned long max_rate;
> > +       unsigned long protect_ucount;
> >         struct hlist_node clks_node;
> >  };
> >  
> > @@ -160,6 +162,11 @@ static bool clk_core_is_prepared(struct clk_core *core)
> >         return core->ops->is_prepared(core->hw);
> >  }
> >  
> > +static bool clk_core_is_protected(struct clk_core *core)
> > +{
> > +       return core->protect_count;
> > +}
> > +
> >  static bool clk_core_is_enabled(struct clk_core *core)
> >  {
> >         /*
> > @@ -328,6 +335,11 @@ bool clk_hw_is_prepared(const struct clk_hw *hw)
> >         return clk_core_is_prepared(hw->core);
> >  }
> >  
> > +bool clk_hw_is_protected(const struct clk_hw *hw)
> > +{
> > +       return clk_core_is_protected(hw->core);
> > +}
> > +
> >  bool clk_hw_is_enabled(const struct clk_hw *hw)
> >  {
> >         return clk_core_is_enabled(hw->core);
> > @@ -584,6 +596,89 @@ int clk_prepare(struct clk *clk)
> >  }
> >  EXPORT_SYMBOL_GPL(clk_prepare);
> >  
> > +static void clk_core_unprotect(struct clk_core *core)
> > +{
> > +       lockdep_assert_held(&prepare_lock);
> > +
> > +       if (!core)
> > +               return;
> > +
> > +       if (WARN_ON(core->protect_count == 0))
> > +               return;
> > +
> > +       if (--core->protect_count > 0)
> > +               return;
> > +
> > +       clk_core_unprotect(core->parent);
> > +}
> > +
> > +/**
> > + * clk_unprotect - unprotect a clock source
> > + * @clk: the clk being unprotected
> > + *
> > + * clk_unprotect shall be used when a consumer no longer depends on the
> > clock
> > + * rate and can tolerate glitches. As with clk_unprepare and clk_enable,
> > calls
> > + * to clk_unprotect must be balanced with clk_protect.
> > + * clk_protect may sleep
> 
> Maybe:
> 
> """
> clk_unprotect completes a critical section during which the clock
> consumer cannot tolerate any change to the clock rate. If no other clock
> consumers have protected clocks in the parent chain, then calls to this
> function will allow the clocks in the parent chain to change rates
> freely.
> 
> Unlike the clk_set_rate_range method, which allows the rate to change
> within a given range, protected clocks cannot have their rate changed,
> either directly or indirectly due to changes further up the parent chain
> of clocks.
> 
> Calls to clk_unprotect must be balanced with calls to clk_protect. Calls
> to this function may sleep, and do not return error status.
> """

Like it ! Thx !

> 
> > + */
> > +void clk_unprotect(struct clk *clk)
> > +{
> > +       if (!clk)
> > +               return;
> > +
> > +       clk_prepare_lock();
> > +
> > +       if (WARN_ON(clk->protect_ucount <= 0)) {
> > +               /*
> > +                * There is something wrong with this consumer protect
> > count.
> > +                * Stop here before messing with the provider
> > +                */
> > +               clk_prepare_unlock();
> > +               return;
> > +       }
> > +
> > +       clk_core_unprotect(clk->core);
> > +       clk->protect_ucount--;
> > +       clk_prepare_unlock();
> > +}
> > +EXPORT_SYMBOL_GPL(clk_unprotect);
> > +
> > +static void clk_core_protect(struct clk_core *core)
> > +{
> > +       lockdep_assert_held(&prepare_lock);
> > +
> > +       if (!core)
> > +               return;
> > +
> > +       if (core->protect_count == 0)
> > +               clk_core_protect(core->parent);
> > +
> > +       core->protect_count++;
> > +}
> > +
> > +/**
> > + * clk_protect - protect a clock source
> > + * @clk: the clk being protected
> > + *
> > + * clk_protect can be used when a consumer depends on the clock rate and
> > can't
> > + * tolerate any glitches. The consumer protecting the clock can still make
> > + * adjustment to clock, if it is the only one protecting the clock. Other
> > + * consumers can still use the clock but won't be able to adjust the rate
> > or
> > + * reparent the clock while it is protected.
> > + * clk_protect may sleep.
> > + */
> 
> Maybe:
> 
> """
> clk_protect begins a critical section during which the clock consumer
> cannot tolerate any change to the clock rate. This results in all clocks
> up the parent chain to also be rate-protected.
> 
> Unlike the clk_set_rate_range method, which allows the rate to change
> within a given range, protected clocks cannot have their rate changed,
> either directly or indirectly due to changes further up the parent chain
> of clocks.
> 
> Calls to clk_protect should be balanced with calls to clk_unprotect.
> Calls to this function may sleep, and do not return error status.
> """

+1

> 
> > +void clk_protect(struct clk *clk)
> > +{
> > +       if (!clk)
> > +               return;
> > +
> > +       clk_prepare_lock();
> > +       clk_core_protect(clk->core);
> > +       clk->protect_ucount++;
> > +       clk_prepare_unlock();
> > +}
> > +EXPORT_SYMBOL_GPL(clk_protect);
> > +
> >  static void clk_core_disable(struct clk_core *core)
> >  {
> >         lockdep_assert_held(&enable_lock);
> > @@ -838,7 +933,9 @@ static int clk_core_determine_round(struct clk_core
> > *core,
> >  {
> >         long rate;
> >  
> > -       if (core->ops->determine_rate) {
> > +       if (clk_core_is_protected(core)) {
> > +               req->rate = core->rate;
> 
> Hmm, in CCF we basically re-use round_rate/determine_rate from within
> calls to clk_set_rate. The point is that clk_set_rate should set the
> same rate that is returned from either of the other two functions.
> 
> The change above breaks that subtle assumption, as a clk consumer can
> now call:
> 
> 	clk_protect(clk);
> 
> 	rate = clk_get_rate(clk);		// rate is 1234;
> 
> 	rate = clk_round_rate(clk, 5678);	// rate is STILL 1234
> 
> 	ret = clk_set_rate(clk, 5678);
> 
> 	rate = clk_get_rate(clk);		// rate is 5678
> 
> Is my understanding correct? If so then we might consider adding some
> more complex knowledge to clk_round_rate. Something like:
> 
> 	if clk_is_protected(clk) AND it is only protect by THIS clk:
> 		round the rate
> 	else:
> 		return core->rate

I may be wrong but I think it is already the way you want it. Please see below
[0]

> 
> > +       } else if (core->ops->determine_rate) {
> >                 return core->ops->determine_rate(core->hw, req);
> >         } else if (core->ops->round_rate) {
> >                 rate = core->ops->round_rate(core->hw, req->rate,
> > @@ -1381,7 +1478,7 @@ static struct clk_core *clk_calc_new_rates(struct
> > clk_core *core,
> >                 req.min_rate = min_rate;
> >                 req.max_rate = max_rate;
> >  
> > -               clk_core_init_rate_req(core, req);
> > +               clk_core_init_rate_req(core, &req);
> 
> Why isn't this change in patch #3? Seems like a bug introduced in patch
> #3 and fixed here in patch #4.

Indeed, I messed up while formatting the patches :(

> 
> >  
> >                 ret = clk_core_determine_round(core, &req);
> >                 if (ret < 0)
> > @@ -1637,8 +1734,14 @@ int clk_set_rate(struct clk *clk, unsigned long rate)
> >         /* prevent racing with updates to the clock topology */
> >         clk_prepare_lock();
> 
> The fact that a user can protect a clk AND change its rate is very
> subtle. Please update the kerneldoc for clk_set_rate, clk_set_parent and
> any other affected apis.

Will do

> 
> >  
> > +       if (clk->protect_ucount)
> > +               clk_core_unprotect(clk->core);
> 
> What happens here if two different users have both protected this same
> clk? Looks like we ignore the second user?
> 
> In other words, what happens if clk->protect_ucount == 2?

We don't really care what is the value of the consumer count, what is important
is whether it is null or not. This is linked to the point [0] above. Maybe it is
not clear but here is how it (should) goes :

Every time clock_rate_protect is called the consumer *and* core count is
incremented. (consumer_count =< core_count)

When an altering action is tried (set_rate, set_parent, ...), if the consumer
count is not null, we call clk_core_unprotect which mean that the core_count is
temporarily decremented by 1. It is safe to do so because we are holding the
prepare_lock.

When we get to 
+       if (clk_core_is_protected(core)) {
+               req->rate = core->rate;

Either the clock was only protected by the calling consumer, *and only once*,
then the protection has been temporarily removed, test is false and the usual
code will be executed, calling round/determine rate.

If the test is true, it means the clock is still protected. This happens if 
* the clock is protected and we come from an unprotected consumer
* the clock is protected by more than one consumer
* the clock is protected more than one time by the same consumer - when there is
multiple code path protecting the rate in a device driver, as previously
discussed. That's why clk_core_unprotect decrements by 1 and not by the
consumer_count.

In such case, the clock is still protected, I think it make sense to return what
is already set and not round/determine again. The clock was already
rounded/determined when it wasn't protected.

It this what you meant by :
> if clk_is_protected(clk) AND it is only protect by THIS clk:
?

Cheers
Jerome

> 
> 
> Best regards,
> Mike
> 
> > +
> >         ret = clk_core_set_rate_nolock(clk->core, rate);
> >  
> > +       if (clk->protect_ucount)
> > +               clk_core_protect(clk->core);
> > +
> >         clk_prepare_unlock();
> >  
> >         return ret;
> > @@ -1669,12 +1772,18 @@ int clk_set_rate_range(struct clk *clk, unsigned
> > long min, unsigned long max)
> >  
> >         clk_prepare_lock();
> >  
> > +       if (clk->protect_ucount)
> > +               clk_core_unprotect(clk->core);
> > +
> >         if (min != clk->min_rate || max != clk->max_rate) {
> >                 clk->min_rate = min;
> >                 clk->max_rate = max;
> >                 ret = clk_core_set_rate_nolock(clk->core, clk->core-
> > >req_rate);
> >         }
> >  
> > +       if (clk->protect_ucount)
> > +               clk_core_protect(clk->core);
> > +
> >         clk_prepare_unlock();
> >  
> >         return ret;
> > @@ -1815,6 +1924,9 @@ static int clk_core_set_parent(struct clk_core *core,
> > struct clk_core *parent)
> >         if ((core->flags & CLK_SET_PARENT_GATE) && core->prepare_count)
> >                 return -EBUSY;
> >  
> > +       if (clk_core_is_protected(core))
> > +               return -EBUSY;
> > +
> >         /* try finding the new parent index */
> >         if (parent) {
> >                 p_index = clk_fetch_parent_index(core, parent);
> > @@ -1878,11 +1990,24 @@ static int clk_core_set_parent_lock(struct clk_core
> > *core,
> >   */
> >  int clk_set_parent(struct clk *clk, struct clk *parent)
> >  {
> > +       int ret;
> > +
> >         if (!clk)
> >                 return 0;
> >  
> > -       return clk_core_set_parent_lock(clk->core,
> > -                                       parent ? parent->core : NULL);
> > +       clk_prepare_lock();
> > +
> > +       if (clk->protect_ucount)
> > +               clk_core_unprotect(clk->core);
> > +
> > +       ret = clk_core_set_parent(clk->core, parent ? parent->core : NULL);
> > +
> > +       if (clk->protect_ucount)
> > +               clk_core_protect(clk->core);
> > +
> > +       clk_prepare_unlock();
> > +
> > +       return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(clk_set_parent);
> >  
> > @@ -1893,7 +2018,10 @@ static int clk_core_set_phase(struct clk_core *core,
> > int degrees)
> >         if (!core)
> >                 return 0;
> >  
> > -       trace_clk_set_phase(clk->core, degrees);
> > +       if (clk_core_is_protected(core))
> > +               return -EBUSY;
> > +
> > +       trace_clk_set_phase(core, degrees);
> >  
> >         if (core->ops->set_phase)
> >                 ret = core->ops->set_phase(core->hw, degrees);
> > @@ -1936,7 +2064,15 @@ int clk_set_phase(struct clk *clk, int degrees)
> >                 degrees += 360;
> >  
> >         clk_prepare_lock();
> > +
> > +       if (clk->protect_ucount)
> > +               clk_core_unprotect(clk->core);
> > +
> >         ret = clk_core_set_phase(clk->core, degrees);
> > +
> > +       if (clk->protect_ucount)
> > +               clk_core_protect(clk->core);
> > +
> >         clk_prepare_unlock();
> >  
> >         return ret;
> > @@ -2023,11 +2159,12 @@ static void clk_summary_show_one(struct seq_file *s,
> > struct clk_core *c,
> >         if (!c)
> >                 return;
> >  
> > -       seq_printf(s, "%*s%-*s %11d %12d %11lu %10lu %-3d\n",
> > +       seq_printf(s, "%*s%-*s %11d %12d %12d %11lu %10lu %-3d\n",
> >                    level * 3 + 1, "",
> >                    30 - level * 3, c->name,
> > -                  c->enable_count, c->prepare_count, clk_core_get_rate(c),
> > -                  clk_core_get_accuracy(c), clk_core_get_phase(c));
> > +                  c->enable_count, c->prepare_count, c->protect_count,
> > +                  clk_core_get_rate(c), clk_core_get_accuracy(c),
> > +                  clk_core_get_phase(c));
> >  }
> >  
> >  static void clk_summary_show_subtree(struct seq_file *s, struct clk_core
> > *c,
> > @@ -2049,8 +2186,8 @@ static int clk_summary_show(struct seq_file *s, void
> > *data)
> >         struct clk_core *c;
> >         struct hlist_head **lists = (struct hlist_head **)s->private;
> >  
> > -       seq_puts(s,
> > "   clock                         enable_cnt  prepare_cnt        rate   accu
> > racy   phase\n");
> > -       seq_puts(s, "-------------------------------------------------------
> > ---------------------------------\n");
> > +       seq_puts(s,
> > "   clock                         enable_cnt  prepare_cnt  protect_cnt      
> >   rate   accuracy   phase\n");
> > +       seq_puts(s, "-------------------------------------------------------
> > ---------------------------------------------\n");
> >  
> >         clk_prepare_lock();
> >  
> > @@ -2085,6 +2222,7 @@ static void clk_dump_one(struct seq_file *s, struct
> > clk_core *c, int level)
> >         seq_printf(s, "\"%s\": { ", c->name);
> >         seq_printf(s, "\"enable_count\": %d,", c->enable_count);
> >         seq_printf(s, "\"prepare_count\": %d,", c->prepare_count);
> > +       seq_printf(s, "\"protect_count\": %d,", c->protect_count);
> >         seq_printf(s, "\"rate\": %lu,", clk_core_get_rate(c));
> >         seq_printf(s, "\"accuracy\": %lu,", clk_core_get_accuracy(c));
> >         seq_printf(s, "\"phase\": %d", clk_core_get_phase(c));
> > @@ -2191,6 +2329,11 @@ static int clk_debug_create_one(struct clk_core
> > *core, struct dentry *pdentry)
> >         if (!d)
> >                 goto err_out;
> >  
> > +       d = debugfs_create_u32("clk_protect_count", S_IRUGO, core->dentry,
> > +                       (u32 *)&core->protect_count);
> > +       if (!d)
> > +               goto err_out;
> > +
> >         d = debugfs_create_u32("clk_notifier_count", S_IRUGO, core->dentry,
> >                         (u32 *)&core->notifier_count);
> >         if (!d)
> > @@ -2747,6 +2890,11 @@ void clk_unregister(struct clk *clk)
> >         if (clk->core->prepare_count)
> >                 pr_warn("%s: unregistering prepared clock: %s\n",
> >                                         __func__, clk->core->name);
> > +
> > +       if (clk->core->protect_count)
> > +               pr_warn("%s: unregistering protected clock: %s\n",
> > +                                       __func__, clk->core->name);
> > +
> >         kref_put(&clk->core->ref, __clk_release);
> >  unlock:
> >         clk_prepare_unlock();
> > @@ -2905,6 +3053,15 @@ void __clk_put(struct clk *clk)
> >  
> >         clk_prepare_lock();
> >  
> > +       /* Protect count not balanced: warn and sanitize */
> > +       if (clk->protect_ucount) {
> > +               pr_warn("%s: releasing protected clock: %s\n",
> > +                                       __func__, clk->core->name);
> > +
> > +               for (; clk->protect_ucount; clk->protect_ucount--)
> > +                       clk_core_unprotect(clk->core);
> > +       }
> > +
> >         hlist_del(&clk->clks_node);
> >         if (clk->min_rate > clk->core->req_rate ||
> >             clk->max_rate < clk->core->req_rate)
> > diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> > index a428aec36ace..705a158d9b8f 100644
> > --- a/include/linux/clk-provider.h
> > +++ b/include/linux/clk-provider.h
> > @@ -739,6 +739,7 @@ unsigned long clk_hw_get_rate(const struct clk_hw *hw);
> >  unsigned long __clk_get_flags(struct clk *clk);
> >  unsigned long clk_hw_get_flags(const struct clk_hw *hw);
> >  bool clk_hw_is_prepared(const struct clk_hw *hw);
> > +bool clk_hw_is_protected(const struct clk_hw *hw);
> >  bool clk_hw_is_enabled(const struct clk_hw *hw);
> >  bool __clk_is_enabled(struct clk *clk);
> >  struct clk *__clk_lookup(const char *name);
> > diff --git a/include/linux/clk.h b/include/linux/clk.h
> > index e9d36b3e49de..90b72ead4411 100644
> > --- a/include/linux/clk.h
> > +++ b/include/linux/clk.h
> > @@ -265,6 +265,30 @@ struct clk *devm_clk_get(struct device *dev, const char
> > *id);
> >   */
> >  struct clk *devm_get_clk_from_child(struct device *dev,
> >                                     struct device_node *np, const char
> > *con_id);
> > +/**
> > + * clk_protect - inform the system when the clock source should be
> > protected.
> > + * @clk: clock source
> > + *
> > + * This function informs the system that the consumer protecting the clock
> > + * depends on the rate of the clock source and can't tolerate any glitches
> > + * introduced by further clock rate change or re-parenting of the clock
> > source.
> > + *
> > + * Must not be called from within atomic context.
> > + */
> > +void clk_protect(struct clk *clk);
> > +
> > +/**
> > + * clk_unprotect - release the protection of the clock source.
> > + * @clk: clock source
> > + *
> > + * This function informs the system that the consumer previously protecting
> > the
> > + * clock source can now deal with other consumer altering the clock source.
> > + *
> > + * The caller must balance the number of protect and unprotect calls.
> > + *
> > + * Must not be called from within atomic context.
> > + */
> > +void clk_unprotect(struct clk *clk);
> >  
> >  /**
> >   * clk_enable - inform the system when the clock source should be running.
> > @@ -460,6 +484,11 @@ static inline void clk_put(struct clk *clk) {}
> >  
> >  static inline void devm_clk_put(struct device *dev, struct clk *clk) {}
> >  
> > +
> > +static inline void clk_protect(struct clk *clk) {}
> > +
> > +static inline void clk_unprotect(struct clk *clk) {}
> > +
> >  static inline int clk_enable(struct clk *clk)
> >  {
> >         return 0;
> > -- 
> > 2.9.3
> > 
