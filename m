Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jerome Brunet <jbrunet@baylibre.com>, "Stephen Boyd" <sboyd@codeaurora.org>,
 "Kevin Hilman" <khilman@baylibre.com>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20170521215958.19743-5-jbrunet@baylibre.com>
Cc: "Jerome Brunet" <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Boris Brezillon" <boris.brezillon@free-electrons.com>
References: <20170521215958.19743-1-jbrunet@baylibre.com>
 <20170521215958.19743-5-jbrunet@baylibre.com>
Message-ID: <149574365034.52617.9521289317050513324@resonance>
Subject: Re: [PATCH v2 04/11] clk: use round rate to bail out early in set_rate
Date: Thu, 25 May 2017 13:20:50 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Jerome Brunet (2017-05-21 14:59:51)
> The current implementation of clk_core_set_rate_nolock bails out early if
> the requested rate is exactly the same as the one set. It should bail out
> if the request would not result in rate a change.  This important when ra=
te
> is not exactly what is requested, which is fairly common with PLLs.
> =

> Ex: provider able to give any rate with steps of 100Hz
>  - 1st consumer request 48000Hz and gets it.
>  - 2nd consumer request 48010Hz as well. If we were to perform the usual
>    mechanism, we would get 48000Hz as well. The clock would not change so
>    there is no point performing any checks to make sure the clock can
>    change, we know it won't.
> =

> This is important to prepare the addition of the clock protection mechani=
sm

Why is this change necessary for the rate_protect feature? I don't see a
major problem with it, but not sure I want to change the expected
behavior unless it is required.

Thanks,
Mike

> =

> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/clk.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 100f72472e10..1a8c0d013238 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1570,15 +1570,34 @@ static void clk_change_rate(struct clk_core *core)
>                 clk_change_rate(core->new_child);
>  }
>  =

> +static unsigned long clk_core_req_round_rate_nolock(struct clk_core *cor=
e,
> +                                                    unsigned long req_ra=
te)
> +{
> +       int ret;
> +       struct clk_rate_request req;
> +
> +       if (!core)
> +               return 0;
> +
> +       clk_core_get_boundaries(core, &req.min_rate, &req.max_rate);
> +       req.rate =3D req_rate;
> +
> +       ret =3D clk_core_round_rate_nolock(core, &req);
> +
> +       return ret ? 0 : req.rate;
> +}
> +
>  static int clk_core_set_rate_nolock(struct clk_core *core,
>                                     unsigned long req_rate)
>  {
>         struct clk_core *top, *fail_clk;
> -       unsigned long rate =3D req_rate;
> +       unsigned long rate;
>  =

>         if (!core)
>                 return 0;
>  =

> +       rate =3D clk_core_req_round_rate_nolock(core, req_rate);
> +
>         /* bail early if nothing to do */
>         if (rate =3D=3D clk_core_get_rate_nolock(core))
>                 return 0;
> @@ -1587,7 +1606,7 @@ static int clk_core_set_rate_nolock(struct clk_core=
 *core,
>                 return -EBUSY;
>  =

>         /* calculate new rates and get the topmost changed clock */
> -       top =3D clk_calc_new_rates(core, rate);
> +       top =3D clk_calc_new_rates(core, req_rate);
>         if (!top)
>                 return -EINVAL;
>  =

> -- =

> 2.9.4
>=20
