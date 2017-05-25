Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jerome Brunet <jbrunet@baylibre.com>, "Stephen Boyd" <sboyd@codeaurora.org>,
 "Kevin Hilman" <khilman@baylibre.com>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20170521215958.19743-4-jbrunet@baylibre.com>
Cc: "Jerome Brunet" <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Boris Brezillon" <boris.brezillon@free-electrons.com>
References: <20170521215958.19743-1-jbrunet@baylibre.com>
 <20170521215958.19743-4-jbrunet@baylibre.com>
Message-ID: <149574323517.52617.4260102317848146827@resonance>
Subject: Re: [PATCH v2 03/11] clk: rework calls to round and determine rate callbacks
Date: Thu, 25 May 2017 13:13:55 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Jerome Brunet (2017-05-21 14:59:50)
> Rework the way the callbacks round_rate and determine_rate are called. The
> goal is to do this at a single point and make it easier to add conditions
> before calling them.
> =

> This rework is done to ease the integration of "protected" clock
> functionality.
> =

> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Looks good to me. I wonder if we should rename __clk_determine_rate to
clk_hw_determine_rate to bring it in line with clk_hw_round_rate? Only
two users of that clk provider function...

Regards,
Mike

> ---
>  drivers/clk/clk.c | 78 +++++++++++++++++++++++++++++++------------------=
------
>  1 file changed, 44 insertions(+), 34 deletions(-)
> =

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 6031fada37f9..100f72472e10 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -833,16 +833,34 @@ static int clk_disable_unused(void)
>  }
>  late_initcall_sync(clk_disable_unused);
>  =

> -static int clk_core_round_rate_nolock(struct clk_core *core,
> -                                     struct clk_rate_request *req)
> +static int clk_core_determine_round(struct clk_core *core,
> +                                   struct clk_rate_request *req)
>  {
> -       struct clk_core *parent;
>         long rate;
>  =

> -       lockdep_assert_held(&prepare_lock);
> +       if (core->ops->determine_rate) {
> +               return core->ops->determine_rate(core->hw, req);
> +       } else if (core->ops->round_rate) {
> +               rate =3D core->ops->round_rate(core->hw, req->rate,
> +                                            &req->best_parent_rate);
> +               if (rate < 0)
> +                       return rate;
>  =

> -       if (!core)
> -               return 0;
> +               req->rate =3D rate;
> +       } else {
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static void clk_core_init_rate_req(struct clk_core *core,
> +                                  struct clk_rate_request *req)
> +{
> +       struct clk_core *parent;
> +
> +       if (WARN_ON(!core || !req))
> +               return;
>  =

>         parent =3D core->parent;
>         if (parent) {
> @@ -852,22 +870,24 @@ static int clk_core_round_rate_nolock(struct clk_co=
re *core,
>                 req->best_parent_hw =3D NULL;
>                 req->best_parent_rate =3D 0;
>         }
> +}
>  =

> -       if (core->ops->determine_rate) {
> -               return core->ops->determine_rate(core->hw, req);
> -       } else if (core->ops->round_rate) {
> -               rate =3D core->ops->round_rate(core->hw, req->rate,
> -                                            &req->best_parent_rate);
> -               if (rate < 0)
> -                       return rate;
> +static int clk_core_round_rate_nolock(struct clk_core *core,
> +                                     struct clk_rate_request *req)
> +{
> +       lockdep_assert_held(&prepare_lock);
>  =

> -               req->rate =3D rate;
> -       } else if (core->flags & CLK_SET_RATE_PARENT) {
> -               return clk_core_round_rate_nolock(parent, req);
> -       } else {
> -               req->rate =3D core->rate;
> -       }
> +       if (!core)
> +               return 0;
> +
> +       clk_core_init_rate_req(core, req);
> +
> +       if (core->ops->determine_rate || core->ops->round_rate)
> +               return clk_core_determine_round(core, req);
> +       else if (core->flags & CLK_SET_RATE_PARENT)
> +               return clk_core_round_rate_nolock(core->parent, req);
>  =

> +       req->rate =3D core->rate;
>         return 0;
>  }
>  =

> @@ -1356,36 +1376,26 @@ static struct clk_core *clk_calc_new_rates(struct=
 clk_core *core,
>         clk_core_get_boundaries(core, &min_rate, &max_rate);
>  =

>         /* find the closest rate and parent clk/rate */
> -       if (core->ops->determine_rate) {
> +       if (core->ops->determine_rate || core->ops->round_rate) {
>                 struct clk_rate_request req;
>  =

>                 req.rate =3D rate;
>                 req.min_rate =3D min_rate;
>                 req.max_rate =3D max_rate;
> -               if (parent) {
> -                       req.best_parent_hw =3D parent->hw;
> -                       req.best_parent_rate =3D parent->rate;
> -               } else {
> -                       req.best_parent_hw =3D NULL;
> -                       req.best_parent_rate =3D 0;
> -               }
>  =

> -               ret =3D core->ops->determine_rate(core->hw, &req);
> +               clk_core_init_rate_req(core, &req);
> +
> +               ret =3D clk_core_determine_round(core, &req);
>                 if (ret < 0)
>                         return NULL;
>  =

>                 best_parent_rate =3D req.best_parent_rate;
>                 new_rate =3D req.rate;
>                 parent =3D req.best_parent_hw ? req.best_parent_hw->core =
: NULL;
> -       } else if (core->ops->round_rate) {
> -               ret =3D core->ops->round_rate(core->hw, rate,
> -                                           &best_parent_rate);
> -               if (ret < 0)
> -                       return NULL;
>  =

> -               new_rate =3D ret;
>                 if (new_rate < min_rate || new_rate > max_rate)
>                         return NULL;
> +
>         } else if (!parent || !(core->flags & CLK_SET_RATE_PARENT)) {
>                 /* pass-through clock without adjustable parent */
>                 core->new_rate =3D core->rate;
> -- =

> 2.9.4
>=20
