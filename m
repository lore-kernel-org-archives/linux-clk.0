Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jerome Brunet <jbrunet@baylibre.com>, "Stephen Boyd" <sboyd@codeaurora.org>,
 "Kevin Hilman" <khilman@baylibre.com>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20170521215958.19743-6-jbrunet@baylibre.com>
Cc: "Jerome Brunet" <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
 linux-amlogic@lists.infradead.org, "Russell King" <linux@armlinux.org.uk>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Boris Brezillon" <boris.brezillon@free-electrons.com>
References: <20170521215958.19743-1-jbrunet@baylibre.com>
 <20170521215958.19743-6-jbrunet@baylibre.com>
Message-ID: <149574593212.52617.14333843834487739920@resonance>
Subject: Re: [PATCH v2 05/11] clk: add support for clock protection
Date: Thu, 25 May 2017 13:58:52 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Jerome Brunet (2017-05-21 14:59:52)
> The patch adds clk_protect and clk_unprotect to the CCF API. These
> functions allow a consumer to inform the system that the rate of clock is
> critical to for its operations and it can't tolerate other consumers
> changing the rate or introducing glitches while the clock is protected.
> =

> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/clk.c            | 207 +++++++++++++++++++++++++++++++++++++=
++++--
>  include/linux/clk-provider.h |   1 +
>  include/linux/clk.h          |  29 ++++++
>  3 files changed, 230 insertions(+), 7 deletions(-)
> =

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 1a8c0d013238..a0524e3bfaca 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -60,6 +60,7 @@ struct clk_core {
>         bool                    orphan;
>         unsigned int            enable_count;
>         unsigned int            prepare_count;
> +       unsigned int            protect_count;
>         unsigned long           min_rate;
>         unsigned long           max_rate;
>         unsigned long           accuracy;
> @@ -84,6 +85,7 @@ struct clk {
>         const char *con_id;
>         unsigned long min_rate;
>         unsigned long max_rate;
> +       unsigned long protect_count;
>         struct hlist_node clks_node;
>  };
>  =

> @@ -160,6 +162,11 @@ static bool clk_core_is_prepared(struct clk_core *co=
re)
>         return core->ops->is_prepared(core->hw);
>  }
>  =

> +static bool clk_core_rate_is_protected(struct clk_core *core)
> +{
> +       return core->protect_count;
> +}
> +
>  static bool clk_core_is_enabled(struct clk_core *core)
>  {
>         /*
> @@ -328,6 +335,11 @@ bool clk_hw_is_prepared(const struct clk_hw *hw)
>         return clk_core_is_prepared(hw->core);
>  }
>  =

> +bool clk_hw_rate_is_protected(const struct clk_hw *hw)
> +{
> +       return clk_core_rate_is_protected(hw->core);
> +}
> +
>  bool clk_hw_is_enabled(const struct clk_hw *hw)
>  {
>         return clk_core_is_enabled(hw->core);
> @@ -584,6 +596,102 @@ int clk_prepare(struct clk *clk)
>  }
>  EXPORT_SYMBOL_GPL(clk_prepare);
>  =

> +static void clk_core_rate_unprotect(struct clk_core *core)
> +{
> +       lockdep_assert_held(&prepare_lock);
> +
> +       if (!core)
> +               return;
> +
> +       if (WARN_ON(core->protect_count =3D=3D 0))
> +               return;
> +
> +       if (--core->protect_count > 0)
> +               return;
> +
> +       clk_core_rate_unprotect(core->parent);
> +}
> +
> +/**
> + * clk_rate_unprotect - unprotect the rate of a clock source
> + * @clk: the clk being unprotected
> + *
> + * clk_unprotect completes a critical section during which the clock
> + * consumer cannot tolerate any change to the clock rate. If no other cl=
ock
> + * consumers have protected clocks in the parent chain, then calls to th=
is
> + * function will allow the clocks in the parent chain to change rates
> + * freely.
> + *
> + * Unlike the clk_set_rate_range method, which allows the rate to change
> + * within a given range, protected clocks cannot have their rate changed,
> + * either directly or indirectly due to changes further up the parent ch=
ain
> + * of clocks.
> + *
> + * Calls to clk_unprotect must be balanced with calls to clk_protect. Ca=
lls
> + * to this function may sleep, and do not return error status.
> + */
> +void clk_rate_unprotect(struct clk *clk)
> +{
> +       if (!clk)
> +               return;
> +
> +       clk_prepare_lock();
> +
> +       /*
> +        * if there is something wrong with this consumer protect count, =
stop
> +        * here before messing with the provider
> +        */
> +       if (WARN_ON(clk->protect_count <=3D 0))
> +               goto out;
> +
> +       clk_core_rate_unprotect(clk->core);
> +       clk->protect_count--;
> +out:
> +       clk_prepare_unlock();
> +}
> +EXPORT_SYMBOL_GPL(clk_rate_unprotect);
> +
> +static void clk_core_rate_protect(struct clk_core *core)
> +{
> +       lockdep_assert_held(&prepare_lock);
> +
> +       if (!core)
> +               return;
> +
> +       if (core->protect_count =3D=3D 0)
> +               clk_core_rate_protect(core->parent);
> +
> +       core->protect_count++;
> +}
> +
> +/**
> + * clk_rate_protect - protect a clock source
> + * @clk: the clk being protected
> + *
> + * clk_protect begins a critical section during which the clock consumer
> + * cannot tolerate any change to the clock rate. This results in all clo=
cks
> + * up the parent chain to also be rate-protected.
> + *
> + * Unlike the clk_set_rate_range method, which allows the rate to change
> + * within a given range, protected clocks cannot have their rate changed,
> + * either directly or indirectly due to changes further up the parent ch=
ain
> + * of clocks.
> + *
> + * Calls to clk_protect should be balanced with calls to clk_unprotect.
> + * Calls to this function may sleep, and do not return error status.
> + */
> +void clk_rate_protect(struct clk *clk)
> +{
> +       if (!clk)
> +               return;
> +
> +       clk_prepare_lock();
> +       clk_core_rate_protect(clk->core);
> +       clk->protect_count++;
> +       clk_prepare_unlock();
> +}
> +EXPORT_SYMBOL_GPL(clk_rate_protect);
> +
>  static void clk_core_disable(struct clk_core *core)
>  {
>         lockdep_assert_held(&enable_lock);
> @@ -838,7 +946,15 @@ static int clk_core_determine_round(struct clk_core =
*core,
>  {
>         long rate;
>  =

> -       if (core->ops->determine_rate) {
> +       /*
> +        * At this point, core protection will be disabled if
> +        * - if the provider is not protected at all
> +        * - if the calling consumer is the only one protecting the
> +        *   provider (and only once)
> +        */
> +       if (clk_core_rate_is_protected(core)) {
> +               req->rate =3D core->rate;
> +       } else if (core->ops->determine_rate) {
>                 return core->ops->determine_rate(core->hw, req);
>         } else if (core->ops->round_rate) {
>                 rate =3D core->ops->round_rate(core->hw, req->rate,
> @@ -944,10 +1060,17 @@ long clk_round_rate(struct clk *clk, unsigned long=
 rate)
>  =

>         clk_prepare_lock();
>  =

> +       if (clk->protect_count)
> +               clk_core_rate_unprotect(clk->core);
> +
>         clk_core_get_boundaries(clk->core, &req.min_rate, &req.max_rate);
>         req.rate =3D rate;
>  =

>         ret =3D clk_core_round_rate_nolock(clk->core, &req);
> +
> +       if (clk->protect_count)
> +               clk_core_rate_protect(clk->core);
> +
>         clk_prepare_unlock();
>  =

>         if (ret)
> @@ -1575,15 +1698,24 @@ static unsigned long clk_core_req_round_rate_nolo=
ck(struct clk_core *core,

There are way too many round_rate and determine_rate functions.

Here is a list of round_rate and determine_rate "helpers":

static int clk_core_determine_round(struct clk_core *core,
                                    struct clk_rate_request *req)
(called by clk_core_round_rate_nolock and clk_calc_new_rates)

static int clk_core_round_rate_nolock(struct clk_core *core,
                                      struct clk_rate_request *req)
(called in several places)

int __clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
(called by a few provider drivers. Should probably be renamed as I
mentioned in my previous response)

unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate)
(used a whole lot)

static unsigned long clk_core_req_round_rate_nolock(struct clk_core *core,
                                                     unsigned long req_rate)
(only called by clk_core_set_rate_nolock. Can we replace with one of the
options above? Probably clk_core_round_rate_nolock)

>  {
>         int ret;
>         struct clk_rate_request req;
> +       unsigned int cnt =3D core->protect_count;
>  =

>         if (!core)
>                 return 0;
>  =

> +       /* simulate what the rate would be if it could be freely set */
> +       while (core->protect_count)
> +               clk_core_rate_unprotect(core);

Gross. Why do this here and not in similar functions like
clk_core_round_rate_nolock?

> +
>         clk_core_get_boundaries(core, &req.min_rate, &req.max_rate);
>         req.rate =3D req_rate;
>  =

>         ret =3D clk_core_round_rate_nolock(core, &req);
>  =

> +       /* restore the protection */
> +       while (core->protect_count < cnt)
> +               clk_core_rate_protect(core);
> +
>         return ret ? 0 : req.rate;
>  }
>  =

> @@ -1602,6 +1734,10 @@ static int clk_core_set_rate_nolock(struct clk_cor=
e *core,
>         if (rate =3D=3D clk_core_get_rate_nolock(core))
>                 return 0;
>  =

> +       /* fail on a direct rate set of a protected provider */
> +       if (clk_core_rate_is_protected(core))
> +               return -EBUSY;

Again, why bother unrolling the protected clocks in
clk_core_req_round_rate_nolock if any protection will cause the
operation to fail here?

Best regards,
Mike

> +
>         if ((core->flags & CLK_SET_RATE_GATE) && core->prepare_count)
>                 return -EBUSY;
>  =

> @@ -1658,8 +1794,14 @@ int clk_set_rate(struct clk *clk, unsigned long ra=
te)
>         /* prevent racing with updates to the clock topology */
>         clk_prepare_lock();
>  =

> +       if (clk->protect_count)
> +               clk_core_rate_unprotect(clk->core);
> +
>         ret =3D clk_core_set_rate_nolock(clk->core, rate);
>  =

> +       if (clk->protect_count)
> +               clk_core_rate_protect(clk->core);
> +
>         clk_prepare_unlock();
>  =

>         return ret;
> @@ -1690,12 +1832,18 @@ int clk_set_rate_range(struct clk *clk, unsigned =
long min, unsigned long max)
>  =

>         clk_prepare_lock();
>  =

> +       if (clk->protect_count)
> +               clk_core_rate_unprotect(clk->core);
> +
>         if (min !=3D clk->min_rate || max !=3D clk->max_rate) {
>                 clk->min_rate =3D min;
>                 clk->max_rate =3D max;
>                 ret =3D clk_core_set_rate_nolock(clk->core, clk->core->re=
q_rate);
>         }
>  =

> +       if (clk->protect_count)
> +               clk_core_rate_protect(clk->core);
> +
>         clk_prepare_unlock();
>  =

>         return ret;
> @@ -1837,6 +1985,9 @@ static int clk_core_set_parent_nolock(struct clk_co=
re *core,
>         if ((core->flags & CLK_SET_PARENT_GATE) && core->prepare_count)
>                 return -EBUSY;
>  =

> +       if (clk_core_rate_is_protected(core))
> +               return -EBUSY;
> +
>         /* try finding the new parent index */
>         if (parent) {
>                 p_index =3D clk_fetch_parent_index(core, parent);
> @@ -1894,8 +2045,16 @@ int clk_set_parent(struct clk *clk, struct clk *pa=
rent)
>                 return 0;
>  =

>         clk_prepare_lock();
> +
> +       if (clk->protect_count)
> +               clk_core_rate_unprotect(clk->core);
> +
>         ret =3D clk_core_set_parent_nolock(clk->core,
>                                          parent ? parent->core : NULL);
> +
> +       if (clk->protect_count)
> +               clk_core_rate_protect(clk->core);
> +
>         clk_prepare_unlock();
>  =

>         return ret;
> @@ -1909,7 +2068,10 @@ static int clk_core_set_phase_nolock(struct clk_co=
re *core, int degrees)
>         if (!core)
>                 return 0;
>  =

> -       trace_clk_set_phase(clk->core, degrees);
> +       if (clk_core_rate_is_protected(core))
> +               return -EBUSY;
> +
> +       trace_clk_set_phase(core, degrees);
>  =

>         if (core->ops->set_phase)
>                 ret =3D core->ops->set_phase(core->hw, degrees);
> @@ -1952,7 +2114,15 @@ int clk_set_phase(struct clk *clk, int degrees)
>                 degrees +=3D 360;
>  =

>         clk_prepare_lock();
> +
> +       if (clk->protect_count)
> +               clk_core_rate_unprotect(clk->core);
> +
>         ret =3D clk_core_set_phase_nolock(clk->core, degrees);
> +
> +       if (clk->protect_count)
> +               clk_core_rate_protect(clk->core);
> +
>         clk_prepare_unlock();
>  =

>         return ret;
> @@ -2039,11 +2209,12 @@ static void clk_summary_show_one(struct seq_file =
*s, struct clk_core *c,
>         if (!c)
>                 return;
>  =

> -       seq_printf(s, "%*s%-*s %11d %12d %11lu %10lu %-3d\n",
> +       seq_printf(s, "%*s%-*s %11d %12d %12d %11lu %10lu %-3d\n",
>                    level * 3 + 1, "",
>                    30 - level * 3, c->name,
> -                  c->enable_count, c->prepare_count, clk_core_get_rate(c=
),
> -                  clk_core_get_accuracy(c), clk_core_get_phase(c));
> +                  c->enable_count, c->prepare_count, c->protect_count,
> +                  clk_core_get_rate(c), clk_core_get_accuracy(c),
> +                  clk_core_get_phase(c));
>  }
>  =

>  static void clk_summary_show_subtree(struct seq_file *s, struct clk_core=
 *c,
> @@ -2065,8 +2236,8 @@ static int clk_summary_show(struct seq_file *s, voi=
d *data)
>         struct clk_core *c;
>         struct hlist_head **lists =3D (struct hlist_head **)s->private;
>  =

> -       seq_puts(s, "   clock                         enable_cnt  prepare=
_cnt        rate   accuracy   phase\n");
> -       seq_puts(s, "----------------------------------------------------=
------------------------------------\n");
> +       seq_puts(s, "   clock                         enable_cnt  prepare=
_cnt  protect_cnt        rate   accuracy   phase\n");
> +       seq_puts(s, "----------------------------------------------------=
------------------------------------------------\n");
>  =

>         clk_prepare_lock();
>  =

> @@ -2101,6 +2272,7 @@ static void clk_dump_one(struct seq_file *s, struct=
 clk_core *c, int level)
>         seq_printf(s, "\"%s\": { ", c->name);
>         seq_printf(s, "\"enable_count\": %d,", c->enable_count);
>         seq_printf(s, "\"prepare_count\": %d,", c->prepare_count);
> +       seq_printf(s, "\"protect_count\": %d,", c->protect_count);
>         seq_printf(s, "\"rate\": %lu,", clk_core_get_rate(c));
>         seq_printf(s, "\"accuracy\": %lu,", clk_core_get_accuracy(c));
>         seq_printf(s, "\"phase\": %d", clk_core_get_phase(c));
> @@ -2231,6 +2403,11 @@ static int clk_debug_create_one(struct clk_core *c=
ore, struct dentry *pdentry)
>         if (!d)
>                 goto err_out;
>  =

> +       d =3D debugfs_create_u32("clk_protect_count", S_IRUGO, core->dent=
ry,
> +                       (u32 *)&core->protect_count);
> +       if (!d)
> +               goto err_out;
> +
>         d =3D debugfs_create_u32("clk_notifier_count", S_IRUGO, core->den=
try,
>                         (u32 *)&core->notifier_count);
>         if (!d)
> @@ -2794,6 +2971,11 @@ void clk_unregister(struct clk *clk)
>         if (clk->core->prepare_count)
>                 pr_warn("%s: unregistering prepared clock: %s\n",
>                                         __func__, clk->core->name);
> +
> +       if (clk->core->protect_count)
> +               pr_warn("%s: unregistering protected clock: %s\n",
> +                                       __func__, clk->core->name);
> +
>         kref_put(&clk->core->ref, __clk_release);
>  unlock:
>         clk_prepare_unlock();
> @@ -2952,6 +3134,17 @@ void __clk_put(struct clk *clk)
>  =

>         clk_prepare_lock();
>  =

> +       /*
> +        * Before calling clk_put, all calls to clk_rate_protect from a g=
iven
> +        * user must be balanced with calls to clk_rate_unprotect and by =
that
> +        * same user
> +        */
> +       WARN_ON(clk->protect_count);
> +
> +       /* We voiced our concern, let's sanitize the situation */
> +       for (; clk->protect_count; clk->protect_count--)
> +               clk_core_rate_unprotect(clk->core);
> +
>         hlist_del(&clk->clks_node);
>         if (clk->min_rate > clk->core->req_rate ||
>             clk->max_rate < clk->core->req_rate)
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index a428aec36ace..ebd7df5f375f 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -739,6 +739,7 @@ unsigned long clk_hw_get_rate(const struct clk_hw *hw=
);
>  unsigned long __clk_get_flags(struct clk *clk);
>  unsigned long clk_hw_get_flags(const struct clk_hw *hw);
>  bool clk_hw_is_prepared(const struct clk_hw *hw);
> +bool clk_hw_rate_is_protected(const struct clk_hw *hw);
>  bool clk_hw_is_enabled(const struct clk_hw *hw);
>  bool __clk_is_enabled(struct clk *clk);
>  struct clk *__clk_lookup(const char *name);
> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index 024cd07870d0..85d73e02df40 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -265,6 +265,30 @@ struct clk *devm_clk_get(struct device *dev, const c=
har *id);
>   */
>  struct clk *devm_get_clk_from_child(struct device *dev,
>                                     struct device_node *np, const char *c=
on_id);
> +/**
> + * clk_rate_protect - inform the system when the clock rate must be prot=
ected.
> + * @clk: clock source
> + *
> + * This function informs the system that the consumer protecting the clo=
ck
> + * depends on the rate of the clock source and can't tolerate any glitch=
es
> + * introduced by further clock rate change or re-parenting of the clock =
source.
> + *
> + * Must not be called from within atomic context.
> + */
> +void clk_rate_protect(struct clk *clk);
> +
> +/**
> + * clk_rate_unprotect - release the protection of the clock source.
> + * @clk: clock source
> + *
> + * This function informs the system that the consumer previously protect=
ing the
> + * clock rate can now deal with other consumer altering the clock source=
 rate
> + *
> + * The caller must balance the number of rate_protect and rate_unprotect=
 calls.
> + *
> + * Must not be called from within atomic context.
> + */
> +void clk_rate_unprotect(struct clk *clk);
>  =

>  /**
>   * clk_enable - inform the system when the clock source should be runnin=
g.
> @@ -460,6 +484,11 @@ static inline void clk_put(struct clk *clk) {}
>  =

>  static inline void devm_clk_put(struct device *dev, struct clk *clk) {}
>  =

> +
> +static inline void clk_protect(struct clk *clk) {}
> +
> +static inline void clk_unprotect(struct clk *clk) {}
> +
>  static inline int clk_enable(struct clk *clk)
>  {
>         return 0;
> -- =

> 2.9.4
> =

> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
