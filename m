Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jerome Brunet <jbrunet@baylibre.com>, "Stephen Boyd" <sboyd@codeaurora.org>,
 "Kevin Hilman" <khilman@baylibre.com>, "Carlo Caione" <carlo@caione.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20170309104154.28295-6-jbrunet@baylibre.com>
Cc: "Jerome Brunet" <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20170309104154.28295-1-jbrunet@baylibre.com>
 <20170309104154.28295-6-jbrunet@baylibre.com>
Message-ID: <149013838063.54062.4258647016605052547@resonance>
Subject: Re: [PATCH v2 5/9] clk: meson: mpll: add rw operation
Date: Tue, 21 Mar 2017 16:19:40 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Jerome Brunet (2017-03-09 02:41:50)
> This patch adds new callbacks to the meson-mpll driver to control
> and set the pll rate. For this, we also need to add the enable bit and
> sdm enable bit. The corresponding parameters are added to mpll data
> structure.
> =

> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Patch looks good to me. I'm really happy to see the mpll's get sorted
out finally!

Regards,
Mike

> ---
>  drivers/clk/meson/clk-mpll.c | 152 +++++++++++++++++++++++++++++++++++++=
++++--
>  drivers/clk/meson/clkc.h     |   4 +-
>  drivers/clk/meson/gxbb.c     |  30 +++++++++
>  3 files changed, 180 insertions(+), 6 deletions(-)
> =

> diff --git a/drivers/clk/meson/clk-mpll.c b/drivers/clk/meson/clk-mpll.c
> index 03af79005ddb..342b85d4e22a 100644
> --- a/drivers/clk/meson/clk-mpll.c
> +++ b/drivers/clk/meson/clk-mpll.c
> @@ -64,16 +64,50 @@
>  #include <linux/clk-provider.h>
>  #include "clkc.h"
>  =

> -#define SDM_MAX 16384
> +#define SDM_DEN 16384
> +#define SDM_MIN 1
> +#define SDM_MAX 16383
> +#define N2_MIN 4
> +#define N2_MAX 127
>  =

>  #define to_meson_clk_mpll(_hw) container_of(_hw, struct meson_clk_mpll, =
hw)
>  =

> +static unsigned long rate_from_params(unsigned long parent_rate,
> +                                     unsigned long sdm,
> +                                     unsigned long n2)
> +{
> +       return (parent_rate * SDM_DEN) / ((SDM_DEN * n2) + sdm);
> +}
> +
> +static void params_from_rate(unsigned long requested_rate,
> +                            unsigned long parent_rate,
> +                            unsigned long *sdm,
> +                            unsigned long *n2)
> +{
> +       uint64_t div =3D parent_rate;
> +       unsigned long rem =3D do_div(div, requested_rate);
> +
> +       if (div < N2_MIN) {
> +               *n2 =3D N2_MIN;
> +               *sdm =3D SDM_MIN;
> +       } else if (div > N2_MAX) {
> +               *n2 =3D N2_MAX;
> +               *sdm =3D SDM_MAX;
> +       } else {
> +               *n2 =3D div;
> +               *sdm =3D DIV_ROUND_UP(rem * SDM_DEN, requested_rate);
> +               if (*sdm < SDM_MIN)
> +                       *sdm =3D SDM_MIN;
> +               else if (*sdm > SDM_MAX)
> +                       *sdm =3D SDM_MAX;
> +       }
> +}
> +
>  static unsigned long mpll_recalc_rate(struct clk_hw *hw,
>                 unsigned long parent_rate)
>  {
>         struct meson_clk_mpll *mpll =3D to_meson_clk_mpll(hw);
>         struct parm *p;
> -       unsigned long rate =3D 0;
>         unsigned long reg, sdm, n2;
>  =

>         p =3D &mpll->sdm;
> @@ -84,11 +118,119 @@ static unsigned long mpll_recalc_rate(struct clk_hw=
 *hw,
>         reg =3D readl(mpll->base + p->reg_off);
>         n2 =3D PARM_GET(p->width, p->shift, reg);
>  =

> -       rate =3D (parent_rate * SDM_MAX) / ((SDM_MAX * n2) + sdm);
> +       return rate_from_params(parent_rate, sdm, n2);
> +}
> +
> +static long mpll_round_rate(struct clk_hw *hw,
> +                           unsigned long rate,
> +                           unsigned long *parent_rate)
> +{
> +       unsigned long sdm, n2;
> +
> +       params_from_rate(rate, *parent_rate, &sdm, &n2);
> +       return rate_from_params(*parent_rate, sdm, n2);
> +}
> +
> +static int mpll_set_rate(struct clk_hw *hw,
> +                        unsigned long rate,
> +                        unsigned long parent_rate)
> +{
> +       struct meson_clk_mpll *mpll =3D to_meson_clk_mpll(hw);
> +       struct parm *p;
> +       unsigned long reg, sdm, n2;
> +       unsigned long flags =3D 0;
> +
> +       params_from_rate(rate, parent_rate, &sdm, &n2);
> +
> +       if (mpll->lock)
> +               spin_lock_irqsave(mpll->lock, flags);
> +       else
> +               __acquire(mpll->lock);
> +
> +       p =3D &mpll->sdm;
> +       reg =3D readl(mpll->base + p->reg_off);
> +       reg =3D PARM_SET(p->width, p->shift, reg, sdm);
> +       writel(reg, mpll->base + p->reg_off);
> +
> +       p =3D &mpll->sdm_en;
> +       reg =3D readl(mpll->base + p->reg_off);
> +       reg =3D PARM_SET(p->width, p->shift, reg, 1);
> +       writel(reg, mpll->base + p->reg_off);
> +
> +       p =3D &mpll->n2;
> +       reg =3D readl(mpll->base + p->reg_off);
> +       reg =3D PARM_SET(p->width, p->shift, reg, n2);
> +       writel(reg, mpll->base + p->reg_off);
> +
> +       if (mpll->lock)
> +               spin_unlock_irqrestore(mpll->lock, flags);
> +       else
> +               __release(mpll->lock);
>  =

> -       return rate;
> +       return 0;
> +}
> +
> +static void mpll_enable_core(struct clk_hw *hw, int enable)
> +{
> +       struct meson_clk_mpll *mpll =3D to_meson_clk_mpll(hw);
> +       struct parm *p;
> +       unsigned long reg;
> +       unsigned long flags =3D 0;
> +
> +       if (mpll->lock)
> +               spin_lock_irqsave(mpll->lock, flags);
> +       else
> +               __acquire(mpll->lock);
> +
> +       p =3D &mpll->en;
> +       reg =3D readl(mpll->base + p->reg_off);
> +       reg =3D PARM_SET(p->width, p->shift, reg, enable ? 1 : 0);
> +       writel(reg, mpll->base + p->reg_off);
> +
> +       if (mpll->lock)
> +               spin_unlock_irqrestore(mpll->lock, flags);
> +       else
> +               __release(mpll->lock);
> +}
> +
> +
> +static int mpll_enable(struct clk_hw *hw)
> +{
> +       mpll_enable_core(hw, 1);
> +
> +       return 0;
> +}
> +
> +static void mpll_disable(struct clk_hw *hw)
> +{
> +       mpll_enable_core(hw, 0);
> +}
> +
> +static int mpll_is_enabled(struct clk_hw *hw)
> +{
> +       struct meson_clk_mpll *mpll =3D to_meson_clk_mpll(hw);
> +       struct parm *p;
> +       unsigned long reg;
> +       int en;
> +
> +       p =3D &mpll->en;
> +       reg =3D readl(mpll->base + p->reg_off);
> +       en =3D PARM_GET(p->width, p->shift, reg);
> +
> +       return en;
>  }
>  =

>  const struct clk_ops meson_clk_mpll_ro_ops =3D {
> -       .recalc_rate =3D mpll_recalc_rate,
> +       .recalc_rate    =3D mpll_recalc_rate,
> +       .round_rate     =3D mpll_round_rate,
> +       .is_enabled     =3D mpll_is_enabled,
> +};
> +
> +const struct clk_ops meson_clk_mpll_ops =3D {
> +       .recalc_rate    =3D mpll_recalc_rate,
> +       .round_rate     =3D mpll_round_rate,
> +       .set_rate       =3D mpll_set_rate,
> +       .enable         =3D mpll_enable,
> +       .disable        =3D mpll_disable,
> +       .is_enabled     =3D mpll_is_enabled,
>  };
> diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
> index c6be77dd8694..ad254675edd8 100644
> --- a/drivers/clk/meson/clkc.h
> +++ b/drivers/clk/meson/clkc.h
> @@ -92,8 +92,9 @@ struct meson_clk_mpll {
>         struct clk_hw hw;
>         void __iomem *base;
>         struct parm sdm;
> +       struct parm sdm_en;
>         struct parm n2;
> -       /* FIXME ssen gate control? */
> +       struct parm en;
>         spinlock_t *lock;
>  };
>  =

> @@ -116,5 +117,6 @@ extern const struct clk_ops meson_clk_pll_ro_ops;
>  extern const struct clk_ops meson_clk_pll_ops;
>  extern const struct clk_ops meson_clk_cpu_ops;
>  extern const struct clk_ops meson_clk_mpll_ro_ops;
> +extern const struct clk_ops meson_clk_mpll_ops;
>  =

>  #endif /* __CLKC_H */
> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index 79e9313e6703..79fb8989f8dd 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -441,11 +441,21 @@ static struct meson_clk_mpll gxbb_mpll0 =3D {
>                 .shift   =3D 0,
>                 .width   =3D 14,
>         },
> +       .sdm_en =3D {
> +               .reg_off =3D HHI_MPLL_CNTL7,
> +               .shift   =3D 15,
> +               .width   =3D 1,
> +       },
>         .n2 =3D {
>                 .reg_off =3D HHI_MPLL_CNTL7,
>                 .shift   =3D 16,
>                 .width   =3D 9,
>         },
> +       .en =3D {
> +               .reg_off =3D HHI_MPLL_CNTL7,
> +               .shift   =3D 14,
> +               .width   =3D 1,
> +       },
>         .lock =3D &clk_lock,
>         .hw.init =3D &(struct clk_init_data){
>                 .name =3D "mpll0",
> @@ -461,11 +471,21 @@ static struct meson_clk_mpll gxbb_mpll1 =3D {
>                 .shift   =3D 0,
>                 .width   =3D 14,
>         },
> +       .sdm_en =3D {
> +               .reg_off =3D HHI_MPLL_CNTL8,
> +               .shift   =3D 15,
> +               .width   =3D 1,
> +       },
>         .n2 =3D {
>                 .reg_off =3D HHI_MPLL_CNTL8,
>                 .shift   =3D 16,
>                 .width   =3D 9,
>         },
> +       .en =3D {
> +               .reg_off =3D HHI_MPLL_CNTL8,
> +               .shift   =3D 14,
> +               .width   =3D 1,
> +       },
>         .lock =3D &clk_lock,
>         .hw.init =3D &(struct clk_init_data){
>                 .name =3D "mpll1",
> @@ -481,11 +501,21 @@ static struct meson_clk_mpll gxbb_mpll2 =3D {
>                 .shift   =3D 0,
>                 .width   =3D 14,
>         },
> +       .sdm_en =3D {
> +               .reg_off =3D HHI_MPLL_CNTL9,
> +               .shift   =3D 15,
> +               .width   =3D 1,
> +       },
>         .n2 =3D {
>                 .reg_off =3D HHI_MPLL_CNTL9,
>                 .shift   =3D 16,
>                 .width   =3D 9,
>         },
> +       .en =3D {
> +               .reg_off =3D HHI_MPLL_CNTL9,
> +               .shift   =3D 14,
> +               .width   =3D 1,
> +       },
>         .lock =3D &clk_lock,
>         .hw.init =3D &(struct clk_init_data){
>                 .name =3D "mpll2",
> -- =

> 2.9.3
>=20
