Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1496050533.7514.9.camel@baylibre.com>
Subject: Re: [PATCH v2 01/11] clk: take the prepare lock out of
 clk_core_set_parent
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	 <sboyd@codeaurora.org>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, Linus
 Walleij <linus.walleij@linaro.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
Date: Mon, 29 May 2017 11:35:33 +0200
In-Reply-To: <149573849978.52617.292626696549937056@resonance>
References: <20170521215958.19743-1-jbrunet@baylibre.com>
	 <20170521215958.19743-2-jbrunet@baylibre.com>
	 <149573849978.52617.292626696549937056@resonance>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Thu, 2017-05-25 at 11:54 -0700, Michael Turquette wrote:
> Quoting Jerome Brunet (2017-05-21 14:59:48)
> > 
> > Rework set_parent core function so it can be called when the prepare lock
> > is already held by the caller.
> > 
> > This rework is done to ease the integration of the "protected" clock
> > functionality.
> > 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> 
> Applied to clk-next-protect for testing.
> 

Noted, I'll base the v3 on top of this branch

> Regards,
> Mike
> 
> > ---
> >  drivers/clk/clk.c | 39 ++++++++++++++++++---------------------
> >  1 file changed, 18 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index fc58c52a26b4..f5c371532509 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -1787,7 +1787,8 @@ bool clk_has_parent(struct clk *clk, struct clk
> > *parent)
> >  }
> >  EXPORT_SYMBOL_GPL(clk_has_parent);
> >  
> > -static int clk_core_set_parent(struct clk_core *core, struct clk_core
> > *parent)
> > +static int clk_core_set_parent_nolock(struct clk_core *core,
> > +                                     struct clk_core *parent)
> >  {
> >         int ret = 0;
> >         int p_index = 0;
> > @@ -1796,23 +1797,16 @@ static int clk_core_set_parent(struct clk_core
> > *core, struct clk_core *parent)
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
> > @@ -1820,8 +1814,7 @@ static int clk_core_set_parent(struct clk_core *core,
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
> > @@ -1831,7 +1824,7 @@ static int clk_core_set_parent(struct clk_core *core,
> > struct clk_core *parent)
> >  
> >         /* abort if a driver objects */
> >         if (ret & NOTIFY_STOP_MASK)
> > -               goto out;
> > +               return ret;
> >  
> >         /* do the re-parent */
> >         ret = __clk_set_parent(core, parent, p_index);
> > @@ -1844,9 +1837,6 @@ static int clk_core_set_parent(struct clk_core *core,
> > struct clk_core *parent)
> >                 __clk_recalc_accuracies(core);
> >         }
> >  
> > -out:
> > -       clk_prepare_unlock();
> > -
> >         return ret;
> >  }
> >  
> > @@ -1869,10 +1859,17 @@ static int clk_core_set_parent(struct clk_core
> > *core, struct clk_core *parent)
> >   */
> >  int clk_set_parent(struct clk *clk, struct clk *parent)
> >  {
> > +       int ret;
> > +
> >         if (!clk)
> >                 return 0;
> >  
> > -       return clk_core_set_parent(clk->core, parent ? parent->core : NULL);
> > +       clk_prepare_lock();
> > +       ret = clk_core_set_parent_nolock(clk->core,
> > +                                        parent ? parent->core : NULL);
> > +       clk_prepare_unlock();
> > +
> > +       return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(clk_set_parent);
> >  
> > @@ -2753,7 +2750,7 @@ void clk_unregister(struct clk *clk)
> >                 /* Reparent all children to the orphan list. */
> >                 hlist_for_each_entry_safe(child, t, &clk->core->children,
> >                                           child_node)
> > -                       clk_core_set_parent(child, NULL);
> > +                       clk_core_set_parent_nolock(child, NULL);
> >         }
> >  
> >         hlist_del_init(&clk->core->child_node);
> > -- 
> > 2.9.4
> > 
