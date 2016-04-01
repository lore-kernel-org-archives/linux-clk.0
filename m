Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Neil Armstrong <narmstrong@baylibre.com>, linux-clk@vger.kernel.org,
 sjan@baylibre.com, ahaslam@baylibre.com, abailon@baylibre.com
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1459510635-8204-2-git-send-email-narmstrong@baylibre.com>
Cc: "Neil Armstrong" <narmstrong@baylibre.com>
References: <1459510635-8204-1-git-send-email-narmstrong@baylibre.com>
 <1459510635-8204-2-git-send-email-narmstrong@baylibre.com>
Message-ID: <20160401161330.23150.65023@quark.deferred.io>
Subject: Re: [PATCH 1/5] clk: Switch clk handling to signed long and introduce
 Quantum State
Date: Fri, 01 Apr 2016 09:13:30 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Neil Armstrong (2016-04-01 04:37:11)
> In order to handle the quantum clock state for rate, accuracy and phase,
> switch all core functions to signed long.
> =

> Also add QUATUM state flag and QUANTUM return value.

s/QUATUM/QUANTUM/

Otherwise looks good. I fixed up locally and applied. We should have
quantum clocks in linux-next some time this week.

Regards,
Mike

> =

> Set QUANTUM default state in clk_core_init.
> =

> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/clk/clk.c            | 104 +++++++++++++++++++++++--------------=
------
>  include/linux/clk-provider.h |  12 +++--
>  include/linux/clk.h          |  22 ++++-----
>  3 files changed, 74 insertions(+), 64 deletions(-)
> =

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index fb74dc1..db7eced 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -51,9 +51,9 @@ struct clk_core {
>         struct clk_core         **parents;
>         u8                      num_parents;
>         u8                      new_parent_index;
> -       unsigned long           rate;
> -       unsigned long           req_rate;
> -       unsigned long           new_rate;
> +       long                    rate;
> +       long                    req_rate;
> +       long                    new_rate;
>         struct clk_core         *new_parent;
>         struct clk_core         *new_child;
>         unsigned long           flags;
> @@ -62,7 +62,7 @@ struct clk_core {
>         unsigned int            prepare_count;
>         unsigned long           min_rate;
>         unsigned long           max_rate;
> -       unsigned long           accuracy;
> +       long                    accuracy;
>         int                     phase;
>         struct hlist_head       children;
>         struct hlist_node       child_node;
> @@ -82,8 +82,8 @@ struct clk {
>         struct clk_core *core;
>         const char *dev_id;
>         const char *con_id;
> -       unsigned long min_rate;
> -       unsigned long max_rate;
> +       long min_rate;
> +       long max_rate;
>         struct hlist_node clks_node;
>  };
>  =

> @@ -374,9 +374,9 @@ unsigned int __clk_get_enable_count(struct clk *clk)
>         return !clk ? 0 : clk->core->enable_count;
>  }
>  =

> -static unsigned long clk_core_get_rate_nolock(struct clk_core *core)
> +static long clk_core_get_rate_nolock(struct clk_core *core)
>  {
> -       unsigned long ret;
> +       long ret;
>  =

>         if (!core) {
>                 ret =3D 0;
> @@ -395,13 +395,13 @@ out:
>         return ret;
>  }
>  =

> -unsigned long clk_hw_get_rate(const struct clk_hw *hw)
> +long clk_hw_get_rate(const struct clk_hw *hw)
>  {
>         return clk_core_get_rate_nolock(hw->core);
>  }
>  EXPORT_SYMBOL_GPL(clk_hw_get_rate);
>  =

> -static unsigned long __clk_get_accuracy(struct clk_core *core)
> +static long __clk_get_accuracy(struct clk_core *core)
>  {
>         if (!core)
>                 return 0;
> @@ -440,8 +440,8 @@ bool __clk_is_enabled(struct clk *clk)
>  }
>  EXPORT_SYMBOL_GPL(__clk_is_enabled);
>  =

> -static bool mux_is_better_rate(unsigned long rate, unsigned long now,
> -                          unsigned long best, unsigned long flags)
> +static bool mux_is_better_rate(long rate, long now,
> +                          long best, unsigned long flags)
>  {
>         if (flags & CLK_MUX_ROUND_CLOSEST)
>                 return abs(now - rate) < abs(best - rate);
> @@ -455,7 +455,7 @@ clk_mux_determine_rate_flags(struct clk_hw *hw, struc=
t clk_rate_request *req,
>  {
>         struct clk_core *core =3D hw->core, *parent, *best_parent =3D NUL=
L;
>         int i, num_parents, ret;
> -       unsigned long best =3D 0;
> +       long best =3D 0;
>         struct clk_rate_request parent_req =3D *req;
>  =

>         /* if NO_REPARENT flag set, pass through to current parent */
> @@ -520,8 +520,8 @@ struct clk *__clk_lookup(const char *name)
>  }
>  =

>  static void clk_core_get_boundaries(struct clk_core *core,
> -                                   unsigned long *min_rate,
> -                                   unsigned long *max_rate)
> +                                   long *min_rate,
> +                                   long *max_rate)
>  {
>         struct clk *clk_user;
>  =

> @@ -535,8 +535,8 @@ static void clk_core_get_boundaries(struct clk_core *=
core,
>                 *max_rate =3D min(*max_rate, clk_user->max_rate);
>  }
>  =

> -void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
> -                          unsigned long max_rate)
> +void clk_hw_set_rate_range(struct clk_hw *hw, long min_rate,
> +                          long max_rate)
>  {
>         hw->core->min_rate =3D min_rate;
>         hw->core->max_rate =3D max_rate;
> @@ -839,7 +839,7 @@ int __clk_determine_rate(struct clk_hw *hw, struct cl=
k_rate_request *req)
>  }
>  EXPORT_SYMBOL_GPL(__clk_determine_rate);
>  =

> -unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate)
> +long clk_hw_round_rate(struct clk_hw *hw, long rate)
>  {
>         int ret;
>         struct clk_rate_request req;
> @@ -864,7 +864,7 @@ EXPORT_SYMBOL_GPL(clk_hw_round_rate);
>   * use which is then returned.  If clk doesn't support round_rate operat=
ion
>   * then the parent rate is returned.
>   */
> -long clk_round_rate(struct clk *clk, unsigned long rate)
> +long clk_round_rate(struct clk *clk, long rate)
>  {
>         struct clk_rate_request req;
>         int ret;
> @@ -902,7 +902,7 @@ EXPORT_SYMBOL_GPL(clk_round_rate);
>   * a driver returns that.
>   */
>  static int __clk_notify(struct clk_core *core, unsigned long msg,
> -               unsigned long old_rate, unsigned long new_rate)
> +               long old_rate, long new_rate)
>  {
>         struct clk_notifier *cn;
>         struct clk_notifier_data cnd;
> @@ -933,7 +933,7 @@ static int __clk_notify(struct clk_core *core, unsign=
ed long msg,
>   */
>  static void __clk_recalc_accuracies(struct clk_core *core)
>  {
> -       unsigned long parent_accuracy =3D 0;
> +       long parent_accuracy =3D 0;
>         struct clk_core *child;
>  =

>         lockdep_assert_held(&prepare_lock);
> @@ -953,7 +953,7 @@ static void __clk_recalc_accuracies(struct clk_core *=
core)
>  =

>  static long clk_core_get_accuracy(struct clk_core *core)
>  {
> -       unsigned long accuracy;
> +       long accuracy;
>  =

>         clk_prepare_lock();
>         if (core && (core->flags & CLK_GET_ACCURACY_NOCACHE))
> @@ -983,8 +983,8 @@ long clk_get_accuracy(struct clk *clk)
>  }
>  EXPORT_SYMBOL_GPL(clk_get_accuracy);
>  =

> -static unsigned long clk_recalc(struct clk_core *core,
> -                               unsigned long parent_rate)
> +static long clk_recalc(struct clk_core *core,
> +                       long parent_rate)
>  {
>         if (core->ops->recalc_rate)
>                 return core->ops->recalc_rate(core->hw, parent_rate);
> @@ -1005,8 +1005,8 @@ static unsigned long clk_recalc(struct clk_core *co=
re,
>   */
>  static void __clk_recalc_rates(struct clk_core *core, unsigned long msg)
>  {
> -       unsigned long old_rate;
> -       unsigned long parent_rate =3D 0;
> +       long old_rate;
> +       long parent_rate =3D 0;
>         struct clk_core *child;
>  =

>         lockdep_assert_held(&prepare_lock);
> @@ -1029,9 +1029,9 @@ static void __clk_recalc_rates(struct clk_core *cor=
e, unsigned long msg)
>                 __clk_recalc_rates(child, msg);
>  }
>  =

> -static unsigned long clk_core_get_rate(struct clk_core *core)
> +static long clk_core_get_rate(struct clk_core *core)
>  {
> -       unsigned long rate;
> +       long rate;
>  =

>         clk_prepare_lock();
>  =

> @@ -1052,7 +1052,7 @@ static unsigned long clk_core_get_rate(struct clk_c=
ore *core)
>   * is set, which means a recalc_rate will be issued.
>   * If clk is NULL then returns 0.
>   */
> -unsigned long clk_get_rate(struct clk *clk)
> +long clk_get_rate(struct clk *clk)
>  {
>         if (!clk)
>                 return 0;
> @@ -1219,10 +1219,10 @@ static int __clk_set_parent(struct clk_core *core=
, struct clk_core *parent,
>   * take on the rate of its parent.
>   */
>  static int __clk_speculate_rates(struct clk_core *core,
> -                                unsigned long parent_rate)
> +                                long parent_rate)
>  {
>         struct clk_core *child;
> -       unsigned long new_rate;
> +       long new_rate;
>         int ret =3D NOTIFY_DONE;
>  =

>         lockdep_assert_held(&prepare_lock);
> @@ -1249,7 +1249,7 @@ out:
>         return ret;
>  }
>  =

> -static void clk_calc_subtree(struct clk_core *core, unsigned long new_ra=
te,
> +static void clk_calc_subtree(struct clk_core *core, long new_rate,
>                              struct clk_core *new_parent, u8 p_index)
>  {
>         struct clk_core *child;
> @@ -1273,14 +1273,14 @@ static void clk_calc_subtree(struct clk_core *cor=
e, unsigned long new_rate,
>   * changed.
>   */
>  static struct clk_core *clk_calc_new_rates(struct clk_core *core,
> -                                          unsigned long rate)
> +                                          long rate)
>  {
>         struct clk_core *top =3D core;
>         struct clk_core *old_parent, *parent;
> -       unsigned long best_parent_rate =3D 0;
> -       unsigned long new_rate;
> -       unsigned long min_rate;
> -       unsigned long max_rate;
> +       long best_parent_rate =3D 0;
> +       long new_rate;
> +       long min_rate;
> +       long max_rate;
>         int p_index =3D 0;
>         long ret;
>  =

> @@ -1412,8 +1412,8 @@ static void clk_change_rate(struct clk_core *core)
>  {
>         struct clk_core *child;
>         struct hlist_node *tmp;
> -       unsigned long old_rate;
> -       unsigned long best_parent_rate =3D 0;
> +       long old_rate;
> +       long best_parent_rate =3D 0;
>         bool skip_set_rate =3D false;
>         struct clk_core *old_parent;
>  =

> @@ -1491,10 +1491,10 @@ static void clk_change_rate(struct clk_core *core)
>  }
>  =

>  static int clk_core_set_rate_nolock(struct clk_core *core,
> -                                   unsigned long req_rate)
> +                                   long req_rate)
>  {
>         struct clk_core *top, *fail_clk;
> -       unsigned long rate =3D req_rate;
> +       long rate =3D req_rate;
>         int ret =3D 0;
>  =

>         if (!core)
> @@ -1550,7 +1550,7 @@ static int clk_core_set_rate_nolock(struct clk_core=
 *core,
>   *
>   * Returns 0 on success, -EERROR otherwise.
>   */
> -int clk_set_rate(struct clk *clk, unsigned long rate)
> +int clk_set_rate(struct clk *clk, long rate)
>  {
>         int ret;
>  =

> @@ -1576,7 +1576,7 @@ EXPORT_SYMBOL_GPL(clk_set_rate);
>   *
>   * Returns success (0) or negative errno.
>   */
> -int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long=
 max)
> +int clk_set_rate_range(struct clk *clk, long min, long max)
>  {
>         int ret =3D 0;
>  =

> @@ -1611,7 +1611,7 @@ EXPORT_SYMBOL_GPL(clk_set_rate_range);
>   *
>   * Returns success (0) or negative errno.
>   */
> -int clk_set_min_rate(struct clk *clk, unsigned long rate)
> +int clk_set_min_rate(struct clk *clk, long rate)
>  {
>         if (!clk)
>                 return 0;
> @@ -1627,7 +1627,7 @@ EXPORT_SYMBOL_GPL(clk_set_min_rate);
>   *
>   * Returns success (0) or negative errno.
>   */
> -int clk_set_max_rate(struct clk *clk, unsigned long rate)
> +int clk_set_max_rate(struct clk *clk, long rate)
>  {
>         if (!clk)
>                 return 0;
> @@ -1722,7 +1722,7 @@ static int clk_core_set_parent(struct clk_core *cor=
e, struct clk_core *parent)
>  {
>         int ret =3D 0;
>         int p_index =3D 0;
> -       unsigned long p_rate =3D 0;
> +       long p_rate =3D 0;
>  =

>         if (!core)
>                 return 0;
> @@ -2258,7 +2258,7 @@ static int __clk_core_init(struct clk_core *core)
>         int i, ret =3D 0;
>         struct clk_core *orphan;
>         struct hlist_node *tmp2;
> -       unsigned long rate;
> +       long rate;
>  =

>         if (!core)
>                 return -EINVAL;
> @@ -2347,6 +2347,8 @@ static int __clk_core_init(struct clk_core *core)
>                                         __clk_get_accuracy(core->parent));
>         else if (core->parent)
>                 core->accuracy =3D core->parent->accuracy;
> +       else if ((core->flags & CLK_STATE_IS_QUANTUM))
> +               core->accuracy =3D -EQUANTUM_STATE;
>         else
>                 core->accuracy =3D 0;
>  =

> @@ -2357,6 +2359,8 @@ static int __clk_core_init(struct clk_core *core)
>          */
>         if (core->ops->get_phase)
>                 core->phase =3D core->ops->get_phase(core->hw);
> +       else if ((core->flags & CLK_STATE_IS_QUANTUM))
> +               core->phase =3D -EQUANTUM_STATE;
>         else
>                 core->phase =3D 0;
>  =

> @@ -2371,6 +2375,8 @@ static int __clk_core_init(struct clk_core *core)
>                                 clk_core_get_rate_nolock(core->parent));
>         else if (core->parent)
>                 rate =3D core->parent->rate;
> +       else if ((core->flags & CLK_STATE_IS_QUANTUM))
> +               rate =3D -EQUANTUM_STATE;
>         else
>                 rate =3D 0;
>         core->rate =3D core->req_rate =3D rate;
> @@ -2423,7 +2429,7 @@ struct clk *__clk_create_clk(struct clk_hw *hw, con=
st char *dev_id,
>         clk->core =3D hw->core;
>         clk->dev_id =3D dev_id;
>         clk->con_id =3D con_id;
> -       clk->max_rate =3D ULONG_MAX;
> +       clk->max_rate =3D LONG_MAX;
>  =

>         clk_prepare_lock();
>         hlist_add_head(&clk->clks_node, &hw->core->clks);
> @@ -2475,7 +2481,7 @@ struct clk *clk_register(struct device *dev, struct=
 clk_hw *hw)
>         core->flags =3D hw->init->flags;
>         core->num_parents =3D hw->init->num_parents;
>         core->min_rate =3D 0;
> -       core->max_rate =3D ULONG_MAX;
> +       core->max_rate =3D LONG_MAX;
>         hw->core =3D core;
>  =

>         /* allocate local copy in case parent_names is __initdata */
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index da95258..03f96db 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -32,6 +32,10 @@
>  #define CLK_GET_ACCURACY_NOCACHE BIT(8) /* do not use the cached clk acc=
uracy */
>  #define CLK_RECALC_NEW_RATES   BIT(9) /* recalc rates after notification=
s */
>  #define CLK_SET_RATE_UNGATE    BIT(10) /* clock needs to run to set rate=
 */
> +#define CLK_STATE_IS_QUANTUM   BIT(11) /* Clock in a quantum state */
> +
> +/* Quantum State clock status report for rate, accuracy and phase */
> +#define EQUANTUM_STATE         (LONG_MAX)
>  =

>  struct clk;
>  struct clk_hw;
> @@ -667,7 +671,7 @@ struct clk_hw *clk_hw_get_parent(const struct clk_hw =
*hw);
>  struct clk_hw *clk_hw_get_parent_by_index(const struct clk_hw *hw,
>                                           unsigned int index);
>  unsigned int __clk_get_enable_count(struct clk *clk);
> -unsigned long clk_hw_get_rate(const struct clk_hw *hw);
> +long clk_hw_get_rate(const struct clk_hw *hw);
>  unsigned long __clk_get_flags(struct clk *clk);
>  unsigned long clk_hw_get_flags(const struct clk_hw *hw);
>  bool clk_hw_is_prepared(const struct clk_hw *hw);
> @@ -680,8 +684,8 @@ int __clk_determine_rate(struct clk_hw *core, struct =
clk_rate_request *req);
>  int __clk_mux_determine_rate_closest(struct clk_hw *hw,
>                                      struct clk_rate_request *req);
>  void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent);
> -void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
> -                          unsigned long max_rate);
> +void clk_hw_set_rate_range(struct clk_hw *hw, long min_rate,
> +                          long max_rate);
>  =

>  static inline void __clk_hw_set_clk(struct clk_hw *dst, struct clk_hw *s=
rc)
>  {
> @@ -692,7 +696,7 @@ static inline void __clk_hw_set_clk(struct clk_hw *ds=
t, struct clk_hw *src)
>  /*
>   * FIXME clock api without lock protection
>   */
> -unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate);
> +long clk_hw_round_rate(struct clk_hw *hw, long rate);
>  =

>  struct of_device_id;
>  =

> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index 0df4a51..1d3ee61 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -74,8 +74,8 @@ struct clk_notifier {
>   */
>  struct clk_notifier_data {
>         struct clk              *clk;
> -       unsigned long           old_rate;
> -       unsigned long           new_rate;
> +       long            old_rate;
> +       long            new_rate;
>  };
>  =

>  /**
> @@ -269,7 +269,7 @@ void clk_disable(struct clk *clk);
>   *               This is only valid once the clock source has been enabl=
ed.
>   * @clk: clock source
>   */
> -unsigned long clk_get_rate(struct clk *clk);
> +long clk_get_rate(struct clk *clk);
>  =

>  /**
>   * clk_put     - "free" the clock source
> @@ -322,7 +322,7 @@ void devm_clk_put(struct device *dev, struct clk *clk=
);
>   *
>   * Returns rounded clock rate in Hz, or negative errno.
>   */
> -long clk_round_rate(struct clk *clk, unsigned long rate);
> +long clk_round_rate(struct clk *clk, long rate);
>  =

>  /**
>   * clk_set_rate - set the clock rate for a clock source
> @@ -331,7 +331,7 @@ long clk_round_rate(struct clk *clk, unsigned long ra=
te);
>   *
>   * Returns success (0) or negative errno.
>   */
> -int clk_set_rate(struct clk *clk, unsigned long rate);
> +int clk_set_rate(struct clk *clk, long rate);
>  =

>  /**
>   * clk_has_parent - check if a clock is a possible parent for another
> @@ -353,7 +353,7 @@ bool clk_has_parent(struct clk *clk, struct clk *pare=
nt);
>   *
>   * Returns success (0) or negative errno.
>   */
> -int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long=
 max);
> +int clk_set_rate_range(struct clk *clk, long min, long max);
>  =

>  /**
>   * clk_set_min_rate - set a minimum clock rate for a clock source
> @@ -362,7 +362,7 @@ int clk_set_rate_range(struct clk *clk, unsigned long=
 min, unsigned long max);
>   *
>   * Returns success (0) or negative errno.
>   */
> -int clk_set_min_rate(struct clk *clk, unsigned long rate);
> +int clk_set_min_rate(struct clk *clk, long rate);
>  =

>  /**
>   * clk_set_max_rate - set a maximum clock rate for a clock source
> @@ -371,7 +371,7 @@ int clk_set_min_rate(struct clk *clk, unsigned long r=
ate);
>   *
>   * Returns success (0) or negative errno.
>   */
> -int clk_set_max_rate(struct clk *clk, unsigned long rate);
> +int clk_set_max_rate(struct clk *clk, long rate);
>  =

>  /**
>   * clk_set_parent - set the parent clock source for this clock
> @@ -431,17 +431,17 @@ static inline int clk_enable(struct clk *clk)
>  =

>  static inline void clk_disable(struct clk *clk) {}
>  =

> -static inline unsigned long clk_get_rate(struct clk *clk)
> +static inline long clk_get_rate(struct clk *clk)
>  {
>         return 0;
>  }
>  =

> -static inline int clk_set_rate(struct clk *clk, unsigned long rate)
> +static inline int clk_set_rate(struct clk *clk, long rate)
>  {
>         return 0;
>  }
>  =

> -static inline long clk_round_rate(struct clk *clk, unsigned long rate)
> +static inline long clk_round_rate(struct clk *clk, long rate)
>  {
>         return 0;
>  }
> -- =

> 1.9.1
>=20
