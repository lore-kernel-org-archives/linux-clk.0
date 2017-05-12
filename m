Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1494582845.21207.3.camel@baylibre.com>
Subject: Re: [RFC 1/7] clk: take the prepare lock out of clk_core_set_parent
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	 <sboyd@codeaurora.org>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
Date: Fri, 12 May 2017 11:54:05 +0200
In-Reply-To: <149228696755.88277.11390638024881688991@resonance>
References: <20170321183330.26722-1-jbrunet@baylibre.com>
	 <20170321183330.26722-2-jbrunet@baylibre.com>
	 <149228696755.88277.11390638024881688991@resonance>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Sat, 2017-04-15 at 22:09 +0200, Michael Turquette wrote:
> Hi Jerome,
> 
> Quoting Jerome Brunet (2017-03-21 19:33:24)
> > Rework set_parent core function so it can be called when the prepare lock
> > is already held by the caller.
> > 
> > This rework is done to ease the integration of the "protected" clock
> > functionality.
> > 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> >  drivers/clk/clk.c | 38 ++++++++++++++++++++------------------
> >  1 file changed, 20 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 67201f67a14a..e77f03a47da6 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -1794,23 +1794,16 @@ static int clk_core_set_parent(struct clk_core
> > *core, struct clk_core *parent)
> 
> Nitpick: rename clk_core_set_parent to clk_core_st_parent_nolock. Drop
> the clk_core_set_parent_lock name below and just call it
> clk_core_set_parent.
> 
> This matches all the other nolock patterns in clk.c.

Indeed, I should tidy up the naming regarding the "_lock" and "_no_lock"
This applies to the rest of the patches.

> 
> >         if (!core)
> >                 return 0;
> >  
> > -       /* prevent racing with updates to the clock topology */
> > -       clk_prepare_lock();
> > -
> >         if (core->parent == parent)
> > -               goto out;
> > +               return 0;
> >  
> >         /* verify ops for for multi-parent clks */
> > -       if ((core->num_parents > 1) && (!core->ops->set_parent)) {
> > -               ret = -ENOSYS;
> > -               goto out;
> > -       }
> > +       if ((core->num_parents > 1) && (!core->ops->set_parent))
> > +               return -ENOSYS;
> >  
> >         /* check that we are allowed to re-parent if the clock is in use */
> > -       if ((core->flags & CLK_SET_PARENT_GATE) && core->prepare_count) {
> > -               ret = -EBUSY;
> > -               goto out;
> > -       }
> > +       if ((core->flags & CLK_SET_PARENT_GATE) && core->prepare_count)
> > +               return -EBUSY;
> >  
> >         /* try finding the new parent index */
> >         if (parent) {
> > @@ -1818,8 +1811,7 @@ static int clk_core_set_parent(struct clk_core *core,
> > struct clk_core *parent)
> >                 if (p_index < 0) {
> >                         pr_debug("%s: clk %s can not be parent of clk %s\n",
> >                                         __func__, parent->name, core->name);
> > -                       ret = p_index;
> > -                       goto out;
> > +                       return p_index;
> >                 }
> >                 p_rate = parent->rate;
> >         }
> > @@ -1829,7 +1821,7 @@ static int clk_core_set_parent(struct clk_core *core,
> > struct clk_core *parent)
> >  
> >         /* abort if a driver objects */
> >         if (ret & NOTIFY_STOP_MASK)
> > -               goto out;
> > +               return ret;
> >  
> >         /* do the re-parent */
> >         ret = __clk_set_parent(core, parent, p_index);
> > @@ -1842,7 +1834,16 @@ static int clk_core_set_parent(struct clk_core *core,
> > struct clk_core *parent)
> >                 __clk_recalc_accuracies(core);
> >         }
> >  
> > -out:
> > +       return ret;
> 
> I do not understand the benefit of the code churn above where gotos are
> replaced with returns. This should be a few line patch but it is much
> more than that due to this churn.

I understand, the unified diff is far from being easy to read.
Gotos and labels were useful to centralize the call to clk_prepare_unlock()
on exit (including error case). With this patch, the prepare lock is no longer 
managed in this function (but one level up)

All you would have under the "out" label is "return ret;".
In such case, I think we should call directly return and get rid of the gotos.

Do you agree ? 

> 
> > +}
> > +
> > +static int clk_core_set_parent_lock(struct clk_core *core,
> > +                                   struct clk_core *parent)
> > +{
> > +       int ret;
> > +
> > +       clk_prepare_lock();
> > +       ret = clk_core_set_parent(core, parent);
> 
> Above line should be nolock.
> 
> >         clk_prepare_unlock();
> >  
> >         return ret;
> > @@ -1870,7 +1871,8 @@ int clk_set_parent(struct clk *clk, struct clk
> > *parent)
> >         if (!clk)
> >                 return 0;
> >  
> > -       return clk_core_set_parent(clk->core, parent ? parent->core : NULL);
> > +       return clk_core_set_parent_lock(clk->core,
> > +                                       parent ? parent->core : NULL);
> 
> We can avoid this line by using the nolock pattern.
> 
> Basic premise of the patch is OK though.
> 
> Regards,
> Mike
> 
> >  }
> >  EXPORT_SYMBOL_GPL(clk_set_parent);
> >  
> > @@ -2720,7 +2722,7 @@ void clk_unregister(struct clk *clk)
> >                 /* Reparent all children to the orphan list. */
> >                 hlist_for_each_entry_safe(child, t, &clk->core->children,
> >                                           child_node)
> > -                       clk_core_set_parent(child, NULL);
> > +                       clk_core_set_parent_lock(child, NULL);
> >         }
> >  
> >         hlist_del_init(&clk->core->child_node);
> > -- 
> > 2.9.3
> > 
