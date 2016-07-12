Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: <jiada_wang@mentor.com>,  sboyd@codeaurora.org,  linux-clk@vger.kernel.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1468215208-14576-1-git-send-email-jiada_wang@mentor.com>
Cc: linux-kernel@vger.kernel.org, joshua_frkuska@mentor.com,
 vladimir_zapolskiy@mentor.com, jiada_wang@mentor.com
References: <1468215208-14576-1-git-send-email-jiada_wang@mentor.com>
Message-ID: <146836257017.73491.10485892804134671614@resonance>
Subject: Re: [RFC PATCH v2] clk: move check of CLK_SET_RATE_GATE flag to
 clk_propagate_rate_change()
Date: Tue, 12 Jul 2016 15:29:30 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting jiada_wang@mentor.com (2016-07-10 22:33:28)
> From: Jiada Wang <jiada_wang@mentor.com>
> =

> Previously CLK_SET_RATE_GATE flag is only checked in clk_set_rate()
> which only ensures the clock being called by clk_set_rate() won't
> change rate when it has been prepared if CLK_SET_RATE_GATE flag is set.
> But a clk_set_rate() request may propagate rate change to these clocks
> from the requested clock's topmost parent clock to all its offsprings,
> when any one of these clocks has CLK_SET_RATE_GATE flag set
> and it has been prepared, the clk_set_rate() request should fail.
> =

> This patch moves check of CLK_SET_RATE_GATE flag to
> clk_propagate_rate_change() to ensure all affected clocks will
> be checked if their rate will be changed after clk_set_rate().
> =

> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> ---

What's different in version 2? It's tradition to put a little version
changelog here, below the "---" line and above the "diff --git a/..."
line.

Regards,
Mike

>  drivers/clk/clk.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 820a939..2f930c8 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1437,6 +1437,9 @@ static struct clk_core *clk_propagate_rate_change(s=
truct clk_core *core,
>         if (core->rate =3D=3D core->new_rate)
>                 return NULL;
>  =

> +       if ((core->flags & CLK_SET_RATE_GATE) && core->prepare_count)
> +               return core;
> +
>         if (core->notifier_count) {
>                 ret =3D __clk_notify(core, event, core->rate, core->new_r=
ate);
>                 if (ret & NOTIFY_STOP_MASK)
> @@ -1571,9 +1574,6 @@ static int clk_core_set_rate_nolock(struct clk_core=
 *core,
>         if (rate =3D=3D clk_core_get_rate_nolock(core))
>                 return 0;
>  =

> -       if ((core->flags & CLK_SET_RATE_GATE) && core->prepare_count)
> -               return -EBUSY;
> -
>         /* calculate new rates and get the topmost changed clock */
>         top =3D clk_calc_new_rates(core, rate);
>         if (!top)
> -- =

> 1.7.9.5
> =

>=20
