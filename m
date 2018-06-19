Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20180619134051.16726-3-jbrunet@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org,
 David Brown <david.brown@linaro.org>, Andy Gross <andy.gross@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>
References: <20180619134051.16726-1-jbrunet@baylibre.com>
 <20180619134051.16726-3-jbrunet@baylibre.com>
Message-ID: <20180619170358.33232.26576@harbor.lan>
Subject: Re: [PATCH 2/2] clk: fix CLK_SET_RATE_GATE with clock rate protection
Date: Tue, 19 Jun 2018 10:03:58 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Jerome Brunet (2018-06-19 06:40:51)
> CLK_SET_RATE_GATE should prevent any operation which may result in a rate
> change or glitch while the clock is prepared/enabled.
> =

> IOW, the following sequence is not allowed anymore with CLK_SET_RATE_GATE:
> * clk_get()
> * clk_prepare_enable()
> * clk_get_rate()
> * clk_set_rate()
> =

> At the moment this is enforced on the leaf clock of the operation, not
> along the tree. This problematic because, if a PLL has the CLK_RATE_GATE,
> it won't be enforced if the clk_set_rate() is called on its child clocks.
> =

> Using clock rate protection, we can now enforce CLK_SET_RATE_GATE along t=
he
> clock tree
> =

> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Tested-by: Quentin Schulz <quentin.schulz@free-electrons.com>
> Tested-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Applied to clk-core-set-rate-gate.

Thanks,
Mike

> ---
>  drivers/clk/clk.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 9760b526ca31..97c09243fb21 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -691,6 +691,9 @@ static void clk_core_unprepare(struct clk_core *core)
>             "Unpreparing critical %s\n", core->name))
>                 return;
>  =

> +       if (core->flags & CLK_SET_RATE_GATE)
> +               clk_core_rate_unprotect(core);
> +
>         if (--core->prepare_count > 0)
>                 return;
>  =

> @@ -765,6 +768,16 @@ static int clk_core_prepare(struct clk_core *core)
>  =

>         core->prepare_count++;
>  =

> +       /*
> +        * CLK_SET_RATE_GATE is a special case of clock protection
> +        * Instead of a consumer claiming exclusive rate control, it is
> +        * actually the provider which prevents any consumer from making =
any
> +        * operation which could result in a rate change or rate glitch w=
hile
> +        * the clock is prepared.
> +        */
> +       if (core->flags & CLK_SET_RATE_GATE)
> +               clk_core_rate_protect(core);
> +
>         return 0;
>  unprepare:
>         clk_core_unprepare(core->parent);
> @@ -1888,9 +1901,6 @@ static int clk_core_set_rate_nolock(struct clk_core=
 *core,
>         if (clk_core_rate_is_protected(core))
>                 return -EBUSY;
>  =

> -       if ((core->flags & CLK_SET_RATE_GATE) && core->prepare_count)
> -               return -EBUSY;
> -
>         /* calculate new rates and get the topmost changed clock */
>         top =3D clk_calc_new_rates(core, req_rate);
>         if (!top)
> -- =

> 2.14.3
>=20
