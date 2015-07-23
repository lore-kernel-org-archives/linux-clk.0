Return-Path: <mturquette@linaro.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jim Quinlan <jim2101024@gmail.com>,  linux-clk@vger.kernel.org
From: Michael Turquette <mturquette@linaro.org>
In-Reply-To: <1432327996-10256-1-git-send-email-jim2101024@gmail.com>
Cc: bcm-kernel-feedback-list@broadcom.com, "Jim Quinlan" <jim2101024@gmail.com>
References: <1432327996-10256-1-git-send-email-jim2101024@gmail.com>
Message-ID: <20150723191714.642.57691@quantum>
Subject: Re: [PATCH] clk: multiplier: introduce configurable clock multiplier
Date: Thu, 23 Jul 2015 12:17:14 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Jim Quinlan (2015-05-22 13:53:16)
> Broadcom STB SoCs come with a handful of configurable clock multipliers.
> Although care must be taken to change them, they are configurable
> nonetheless.  This commit introduces a configurable multiplier clock,
> and it is essentially the mirror of clk-divider.c.
> =

> Signed-off-by: Jim Quinlan <jim2101024@gmail.com>

Hi Jim,

Thanks for the patch. Stephen and I are still figuring out what to do
with these basic clock types. They represent a lot problems from a
maintainability point of view.

For now I'd like to hold off on merging this (nothing wrong with it
technically) until we figure out how to handle these common building
blocks a bit better.

Thanks,
Mike

> ---
>  drivers/clk/Makefile         |   1 +
>  drivers/clk/clk-multiplier.c | 440 +++++++++++++++++++++++++++++++++++++=
++++++
>  include/linux/clk-provider.h |  81 ++++++++
>  3 files changed, 522 insertions(+)
>  create mode 100644 drivers/clk/clk-multiplier.c
> =

> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 3d00c25..29682e4 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -3,6 +3,7 @@ obj-$(CONFIG_HAVE_CLK)          +=3D clk-devres.o
>  obj-$(CONFIG_CLKDEV_LOOKUP)    +=3D clkdev.o
>  obj-$(CONFIG_COMMON_CLK)       +=3D clk.o
>  obj-$(CONFIG_COMMON_CLK)       +=3D clk-divider.o
> +obj-$(CONFIG_COMMON_CLK)       +=3D clk-multiplier.o
>  obj-$(CONFIG_COMMON_CLK)       +=3D clk-fixed-factor.o
>  obj-$(CONFIG_COMMON_CLK)       +=3D clk-fixed-rate.o
>  obj-$(CONFIG_COMMON_CLK)       +=3D clk-gate.o
> diff --git a/drivers/clk/clk-multiplier.c b/drivers/clk/clk-multiplier.c
> new file mode 100644
> index 0000000..de2d594
> --- /dev/null
> +++ b/drivers/clk/clk-multiplier.c
> @@ -0,0 +1,440 @@
> +/*
> + * Copyright (C) 2015 Jim Quinlan, Broadcom <jim2101024@gmail.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * Adjustable multiplier clock implementation.  This is essentially
> + * the mirror of clk-divider.c.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/io.h>
> +#include <linux/err.h>
> +#include <linux/string.h>
> +#include <linux/log2.h>
> +
> +/*
> + * DOC: basic adjustable multiplier clock that cannot gate
> + *
> + * Traits of this clock:
> + * prepare - clk_prepare only ensures that parents are prepared
> + * enable - clk_enable only ensures that parents are enabled
> + * rate - rate is adjustable.  clk->rate =3D (parent->rate * multiplier)
> + * parent - fixed parent.  No clk_set_parent support
> + */
> +
> +#define to_clk_multiplier(_hw) container_of(_hw, struct clk_multiplier, =
hw)
> +
> +#define mult_mask(width)       ((1 << (width)) - 1)
> +
> +static unsigned int _get_table_maxmult(const struct clk_mult_table *tabl=
e)
> +{
> +       unsigned int maxmult =3D 0;
> +       const struct clk_mult_table *clkt;
> +
> +       for (clkt =3D table; clkt->mult; clkt++)
> +               if (clkt->mult > maxmult)
> +                       maxmult =3D clkt->mult;
> +       return maxmult;
> +}
> +
> +static unsigned int _get_table_minmult(const struct clk_mult_table *tabl=
e)
> +{
> +       unsigned int minmult =3D UINT_MAX;
> +       const struct clk_mult_table *clkt;
> +
> +       for (clkt =3D table; clkt->mult; clkt++)
> +               if (clkt->mult < minmult)
> +                       minmult =3D clkt->mult;
> +       return minmult;
> +}
> +
> +static unsigned int _get_maxmult(const struct clk_mult_table *table, u8 =
width,
> +                                unsigned long flags)
> +{
> +       if (flags & CLK_MULTIPLIER_ONE_BASED)
> +               return mult_mask(width);
> +       if (flags & CLK_MULTIPLIER_POWER_OF_TWO)
> +               return 1 << mult_mask(width);
> +       if (table)
> +               return _get_table_maxmult(table);
> +       return mult_mask(width) + 1;
> +}
> +
> +static unsigned int _get_minmult(const struct clk_mult_table *table)
> +{
> +       if (table)
> +               return _get_table_minmult(table);
> +       return 1;
> +}
> +
> +static unsigned int _get_table_mult(const struct clk_mult_table *table,
> +                                   unsigned int val)
> +{
> +       const struct clk_mult_table *clkt;
> +
> +       for (clkt =3D table; clkt->mult; clkt++)
> +               if (clkt->val =3D=3D val)
> +                       return clkt->mult;
> +       return 0;
> +}
> +
> +static unsigned int _get_mult(const struct clk_mult_table *table,
> +                             u8 width, unsigned int val, unsigned long f=
lags)
> +{
> +       if (flags & CLK_MULTIPLIER_ONE_BASED)
> +               return val;
> +       if (flags & CLK_MULTIPLIER_POWER_OF_TWO)
> +               return 1 << val;
> +       if (flags & CLK_MULTIPLIER_MAX_MULT_AT_ZERO)
> +               return val ? val : mult_mask(width) + 1;
> +       if (table)
> +               return _get_table_mult(table, val);
> +       return val + 1;
> +}
> +
> +static unsigned int _get_table_val(const struct clk_mult_table *table,
> +                                  unsigned int mult)
> +{
> +       const struct clk_mult_table *clkt;
> +
> +       for (clkt =3D table; clkt->mult; clkt++)
> +               if (clkt->mult =3D=3D mult)
> +                       return clkt->val;
> +       return 0;
> +}
> +
> +static unsigned int _get_val(const struct clk_mult_table *table,
> +                            u8 width, unsigned int mult, unsigned long f=
lags)
> +{
> +       if (flags & CLK_MULTIPLIER_ONE_BASED)
> +               return mult;
> +       if (flags & CLK_MULTIPLIER_POWER_OF_TWO)
> +               return __ffs(mult);
> +       if (flags & CLK_MULTIPLIER_MAX_MULT_AT_ZERO)
> +               return (mult =3D=3D mult_mask(width) + 1)
> +                       ? 0 : mult;
> +       if (table)
> +               return  _get_table_val(table, mult);
> +       return mult - 1;
> +}
> +
> +unsigned long multiplier_recalc_rate(struct clk_hw *hw,
> +                                    unsigned long parent_rate,
> +                                    unsigned int val,
> +                                    const struct clk_mult_table *table,
> +                                    unsigned long flags)
> +{
> +       struct clk_multiplier *multiplier =3D to_clk_multiplier(hw);
> +       unsigned int mult;
> +
> +       mult =3D _get_mult(table, multiplier->width, val, flags);
> +       if (!mult) {
> +               WARN(!(flags & CLK_MULTIPLIER_ALLOW_ZERO),
> +                       "%s: Zero multiplier and CLK_MULTIPLIER_ALLOW_ZER=
O not set\n",
> +                       __clk_get_name(hw->clk));
> +               return parent_rate;
> +       }
> +
> +       return parent_rate * mult;
> +}
> +EXPORT_SYMBOL_GPL(multiplier_recalc_rate);
> +
> +static unsigned long clk_multiplier_recalc_rate(struct clk_hw *hw,
> +               unsigned long parent_rate)
> +{
> +       struct clk_multiplier *multiplier =3D to_clk_multiplier(hw);
> +       unsigned int val;
> +
> +       val =3D clk_readl(multiplier->reg) >> multiplier->shift;
> +       val &=3D mult_mask(multiplier->width);
> +
> +       return multiplier_recalc_rate(hw, parent_rate, val, multiplier->t=
able,
> +                                  multiplier->flags);
> +}
> +
> +static bool _is_valid_table_mult(const struct clk_mult_table *table,
> +                                                        unsigned int mul=
t)
> +{
> +       const struct clk_mult_table *clkt;
> +
> +       for (clkt =3D table; clkt->mult; clkt++)
> +               if (clkt->mult =3D=3D mult)
> +                       return true;
> +       return false;
> +}
> +
> +static bool _is_valid_mult(const struct clk_mult_table *table,
> +                          unsigned int mult, unsigned long flags)
> +{
> +       if (flags & CLK_MULTIPLIER_POWER_OF_TWO)
> +               return is_power_of_2(mult);
> +       if (table)
> +               return _is_valid_table_mult(table, mult);
> +       return true;
> +}
> +
> +static int clk_multiplier_bestmult(struct clk_hw *hw, unsigned long rate,
> +                              unsigned long *best_parent_rate,
> +                              const struct clk_mult_table *table, u8 wid=
th,
> +                              unsigned long flags)
> +{
> +       int i, bestmult =3D 0;
> +       unsigned long parent_rate, best =3D 0, now, maxmult, minmult;
> +       unsigned long parent_rate_saved =3D *best_parent_rate;
> +
> +       if (!rate)
> +               rate =3D 1;
> +
> +       minmult =3D _get_minmult(table);
> +       maxmult =3D _get_maxmult(table, width, flags);
> +
> +       if (!(__clk_get_flags(hw->clk) & CLK_SET_RATE_PARENT)) {
> +               parent_rate =3D *best_parent_rate;
> +               bestmult =3D rate / parent_rate;
> +               bestmult =3D bestmult =3D=3D 0 ? minmult : bestmult;
> +               bestmult =3D bestmult > maxmult ? maxmult : bestmult;
> +               return bestmult;
> +       }
> +
> +       /*
> +        * The maximum multiplier we can use without overflowing
> +        * unsigned long in rate * i below
> +        */
> +       maxmult =3D min(ULONG_MAX / parent_rate_saved, maxmult);
> +
> +       for (i =3D 1; i <=3D maxmult; i++) {
> +               if (!_is_valid_mult(table, i, flags))
> +                       continue;
> +               if (rate =3D=3D parent_rate_saved * i) {
> +                       /*
> +                        * It's the most ideal case if the requested rate=
 can be
> +                        * multiplied from parent clock without needing to
> +                        * change the parent rate, so return the multipli=
er
> +                        * immediately.
> +                        */
> +                       *best_parent_rate =3D parent_rate_saved;
> +                       return i;
> +               }
> +               parent_rate =3D __clk_round_rate(__clk_get_parent(hw->clk=
),
> +                                              rate / i);
> +               now =3D parent_rate * i;
> +               if (now <=3D rate && now > best) {
> +                       bestmult =3D i;
> +                       best =3D now;
> +                       *best_parent_rate =3D parent_rate;
> +               }
> +       }
> +
> +       if (!bestmult) {
> +               bestmult =3D _get_minmult(table);
> +               *best_parent_rate
> +                       =3D __clk_round_rate(__clk_get_parent(hw->clk), 1=
);
> +       }
> +
> +       return bestmult;
> +}
> +
> +long multiplier_round_rate(struct clk_hw *hw, unsigned long rate,
> +                          unsigned long *prate,
> +                          const struct clk_mult_table *table,
> +                          u8 width, unsigned long flags)
> +{
> +       int mult;
> +
> +       mult =3D clk_multiplier_bestmult(hw, rate, prate, table, width, f=
lags);
> +
> +       return *prate * mult;
> +}
> +EXPORT_SYMBOL_GPL(multiplier_round_rate);
> +
> +static long clk_multiplier_round_rate(struct clk_hw *hw, unsigned long r=
ate,
> +                               unsigned long *prate)
> +{
> +       struct clk_multiplier *multiplier =3D to_clk_multiplier(hw);
> +       int bestmult;
> +
> +       /* if read only, just return current value */
> +       if (multiplier->flags & CLK_MULTIPLIER_READ_ONLY) {
> +               bestmult =3D readl(multiplier->reg) >> multiplier->shift;
> +               bestmult &=3D mult_mask(multiplier->width);
> +               bestmult =3D _get_mult(multiplier->table, multiplier->wid=
th,
> +                                    bestmult, multiplier->flags);
> +               if ((__clk_get_flags(hw->clk) & CLK_SET_RATE_PARENT))
> +                       *prate =3D __clk_round_rate(__clk_get_parent(hw->=
clk),
> +                                                 rate);
> +               return *prate * bestmult;
> +       }
> +
> +       return multiplier_round_rate(hw, rate, prate, multiplier->table,
> +                                 multiplier->width, multiplier->flags);
> +}
> +
> +int multiplier_get_val(unsigned long rate, unsigned long parent_rate,
> +                   const struct clk_mult_table *table, u8 width,
> +                   unsigned long flags)
> +{
> +       unsigned int mult, value;
> +
> +       mult =3D rate / parent_rate;
> +       value =3D _get_val(table, width, mult, flags);
> +       return min_t(unsigned int, value, mult_mask(width));
> +}
> +EXPORT_SYMBOL_GPL(multiplier_get_val);
> +
> +static int clk_multiplier_set_rate(struct clk_hw *hw, unsigned long rate,
> +                               unsigned long parent_rate)
> +{
> +       struct clk_multiplier *multiplier =3D to_clk_multiplier(hw);
> +       unsigned int value;
> +       unsigned long flags =3D 0;
> +       u32 val;
> +
> +       value =3D multiplier_get_val(rate, parent_rate, multiplier->table,
> +                               multiplier->width, multiplier->flags);
> +
> +       if (multiplier->lock)
> +               spin_lock_irqsave(multiplier->lock, flags);
> +
> +       if (multiplier->flags & CLK_MULTIPLIER_HIWORD_MASK) {
> +               val =3D mult_mask(multiplier->width) << (multiplier->shif=
t + 16);
> +       } else {
> +               val =3D clk_readl(multiplier->reg);
> +               val &=3D ~(mult_mask(multiplier->width) << multiplier->sh=
ift);
> +       }
> +       val |=3D value << multiplier->shift;
> +       clk_writel(val, multiplier->reg);
> +
> +       if (multiplier->lock)
> +               spin_unlock_irqrestore(multiplier->lock, flags);
> +
> +       return 0;
> +}
> +
> +const struct clk_ops clk_multiplier_ops =3D {
> +       .recalc_rate =3D clk_multiplier_recalc_rate,
> +       .round_rate =3D clk_multiplier_round_rate,
> +       .set_rate =3D clk_multiplier_set_rate,
> +};
> +EXPORT_SYMBOL_GPL(clk_multiplier_ops);
> +
> +const struct clk_ops clk_multiplier_ro_ops =3D {
> +       .recalc_rate =3D clk_multiplier_recalc_rate,
> +};
> +EXPORT_SYMBOL_GPL(clk_multiplier_ro_ops);
> +
> +static struct clk *_register_multiplier(struct device *dev, const char *=
name,
> +               const char *parent_name, unsigned long flags,
> +               void __iomem *reg, u8 shift, u8 width,
> +               u8 clk_multiplier_flags, const struct clk_mult_table *tab=
le,
> +               spinlock_t *lock)
> +{
> +       struct clk_multiplier *mult;
> +       struct clk *clk;
> +       struct clk_init_data init;
> +
> +       if (clk_multiplier_flags & CLK_MULTIPLIER_HIWORD_MASK) {
> +               if (width + shift > 16) {
> +                       pr_warn("multiplier value exceeds LOWORD field\n"=
);
> +                       return ERR_PTR(-EINVAL);
> +               }
> +       }
> +
> +       /* allocate the multiplier */
> +       mult =3D kzalloc(sizeof(struct clk_multiplier), GFP_KERNEL);
> +       if (!mult)
> +               return ERR_PTR(-ENOMEM);
> +
> +       init.name =3D name;
> +       if (clk_multiplier_flags & CLK_MULTIPLIER_READ_ONLY)
> +               init.ops =3D &clk_multiplier_ro_ops;
> +       else
> +               init.ops =3D &clk_multiplier_ops;
> +       init.flags =3D flags | CLK_IS_BASIC;
> +       init.parent_names =3D (parent_name ? &parent_name : NULL);
> +       init.num_parents =3D (parent_name ? 1 : 0);
> +
> +       /* struct clk_multiplier assignments */
> +       mult->reg =3D reg;
> +       mult->shift =3D shift;
> +       mult->width =3D width;
> +       mult->flags =3D clk_multiplier_flags;
> +       mult->lock =3D lock;
> +       mult->hw.init =3D &init;
> +       mult->table =3D table;
> +
> +       /* register the clock */
> +       clk =3D clk_register(dev, &mult->hw);
> +
> +       if (IS_ERR(clk))
> +               kfree(mult);
> +
> +       return clk;
> +}
> +
> +/**
> + * clk_register_multiplier - register a multiplier clock with the clock =
framework
> + * @dev: device registering this clock
> + * @name: name of this clock
> + * @parent_name: name of clock's parent
> + * @flags: framework-specific flags
> + * @reg: register address to adjust multiplier
> + * @shift: number of bits to shift the bitfield
> + * @width: width of the bitfield
> + * @clk_multiplier_flags: multiplier-specific flags for this clock
> + * @lock: shared register lock for this clock
> + */
> +struct clk *clk_register_multiplier(struct device *dev, const char *name,
> +               const char *parent_name, unsigned long flags,
> +               void __iomem *reg, u8 shift, u8 width,
> +               u8 clk_multiplier_flags, spinlock_t *lock)
> +{
> +       return _register_multiplier(dev, name, parent_name, flags, reg, s=
hift,
> +                       width, clk_multiplier_flags, NULL, lock);
> +}
> +EXPORT_SYMBOL_GPL(clk_register_multiplier);
> +
> +/**
> + * clk_register_multiplier_table - register a table based multiplier clo=
ck with
> + * the clock framework
> + * @dev: device registering this clock
> + * @name: name of this clock
> + * @parent_name: name of clock's parent
> + * @flags: framework-specific flags
> + * @reg: register address to adjust multiplier
> + * @shift: number of bits to shift the bitfield
> + * @width: width of the bitfield
> + * @clk_multiplier_flags: multiplier-specific flags for this clock
> + * @table: array of multiplier/value pairs ending with a mult set to 0
> + * @lock: shared register lock for this clock
> + */
> +struct clk *clk_register_multiplier_table(struct device *dev, const char=
 *name,
> +               const char *parent_name, unsigned long flags,
> +               void __iomem *reg, u8 shift, u8 width,
> +               u8 clk_multiplier_flags, const struct clk_mult_table *tab=
le,
> +               spinlock_t *lock)
> +{
> +       return _register_multiplier(dev, name, parent_name, flags, reg, s=
hift,
> +                       width, clk_multiplier_flags, table, lock);
> +}
> +EXPORT_SYMBOL_GPL(clk_register_multiplier_table);
> +
> +void clk_unregister_multiplier(struct clk *clk)
> +{
> +       struct clk_multiplier *mult;
> +       struct clk_hw *hw;
> +
> +       hw =3D __clk_get_hw(clk);
> +       if (!hw)
> +               return;
> +
> +       mult =3D to_clk_multiplier(hw);
> +
> +       clk_unregister(clk);
> +       kfree(mult);
> +}
> +EXPORT_SYMBOL_GPL(clk_unregister_multiplier);
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index df69531..e35f6d7 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -383,6 +383,87 @@ struct clk *clk_register_divider_table(struct device=
 *dev, const char *name,
>                 spinlock_t *lock);
>  void clk_unregister_divider(struct clk *clk);
>  =

> +
> +struct clk_mult_table {
> +       unsigned int    val;
> +       unsigned int    mult;
> +};
> +
> +/**
> + * struct clk_multiplier - adjustable multiplier clock
> + *
> + * @hw:                handle between common and hardware-specific inter=
faces
> + * @reg:       register containing the multiplier
> + * @shift:     shift to the multiplier bit field
> + * @width:     width of the multiplier bit field
> + * @table:     array of value/multiplier pairs, last entry should have m=
ult =3D 0
> + * @lock:      register lock
> + *
> + * Clock with an adjustable multiplier affecting its output frequency.
> + * Implements .recalc_rate, .set_rate and .round_rate
> + *
> + * Flags:
> + * CLK_MULTIPLIER_ONE_BASED - by default the muliplier is the value read=
 from
> + *     the register plus one.  If CLK_MULTIPLIER_ONE_BASED is set then t=
he
> + *     multiplier is the raw value read from the register, with the valu=
e of
> + *     zero considered invalid, unless CLK_MULTIPLIER_ALLOW_ZERO is set.
> + * CLK_MULTIPLIER_POWER_OF_TWO - clock muliplier is 2 raised to the value
> + *     read from the hardware register
> + * CLK_MULTIPLIER_ALLOW_ZERO - Allow zero mulipliers.  For multipliers w=
hich
> + *     have CLK_MULTIPLIER_ONE_BASED set, it is possible to end up with =
a zero
> + *     muliplier.  Some hardware implementations gracefully handle this =
case
> + *     and allow a zero muliplier by not modifying their input clock
> + *     (multiply by one / bypass).
> + * CLK_MULTIPLIER_HIWORD_MASK - The multiplier settings are only in lowe=
r 16-bit
> + *     of this register, and mask of multiplier bits are in higher 16-bi=
t of
> + *     this register.  While setting the multiplier bits, higher 16-bit =
should
> + *     also be updated to indicate changing multiplier bits.
> + * CLK_MULTIPLIER_READ_ONLY - The multiplier settings are preconfigured =
and
> + *     should not be changed by the clock framework.
> + * CLK_MULTIPLIER_MAX_AT_ZERO - For multipliers which are like
> + *     CLK_MULTIPLIER_ONE_BASED except when the value read from the regi=
ster
> + *     is zero, the multiplier is 2^width of the field.
> + */
> +struct clk_multiplier {
> +       struct clk_hw   hw;
> +       void __iomem    *reg;
> +       u8              shift;
> +       u8              width;
> +       u8              flags;
> +       const struct clk_mult_table     *table;
> +       spinlock_t      *lock;
> +};
> +
> +#define CLK_MULTIPLIER_ONE_BASED       BIT(0)
> +#define CLK_MULTIPLIER_POWER_OF_TWO    BIT(1)
> +#define CLK_MULTIPLIER_ALLOW_ZERO      BIT(2)
> +#define CLK_MULTIPLIER_HIWORD_MASK     BIT(3)
> +#define CLK_MULTIPLIER_READ_ONLY       BIT(4)
> +#define CLK_MULTIPLIER_MAX_MULT_AT_ZERO        BIT(5)
> +
> +extern const struct clk_ops clk_multiplier_ops;
> +
> +unsigned long multiplier_recalc_rate(struct clk_hw *hw,
> +               unsigned long parent_rate, unsigned int val,
> +               const struct clk_mult_table *table, unsigned long flags);
> +long multiplier_round_rate(struct clk_hw *hw, unsigned long rate,
> +               unsigned long *prate, const struct clk_mult_table *table,
> +               u8 width, unsigned long flags);
> +int multiplier_get_val(unsigned long rate, unsigned long parent_rate,
> +               const struct clk_mult_table *table, u8 width,
> +               unsigned long flags);
> +
> +struct clk *clk_register_multiplier(struct device *dev, const char *name,
> +               const char *parent_name, unsigned long flags,
> +               void __iomem *reg, u8 shift, u8 width,
> +               u8 clk_multiplier_flags, spinlock_t *lock);
> +struct clk *clk_register_multiplier_table(struct device *dev, const char=
 *name,
> +               const char *parent_name, unsigned long flags,
> +               void __iomem *reg, u8 shift, u8 width,
> +               u8 clk_multiplier_flags, const struct clk_mult_table *tab=
le,
> +               spinlock_t *lock);
> +void clk_unregister_multiplier(struct clk *clk);
> +
>  /**
>   * struct clk_mux - multiplexer clock
>   *
> -- =

> 1.9.0.138.g2de3478
>=20
