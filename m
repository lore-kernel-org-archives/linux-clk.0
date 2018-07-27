Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Amit Daniel Kachhap <amit.kachhap@arm.com>,
 linux-arm-kernel@lists.infradead.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1532700112-11852-1-git-send-email-amit.kachhap@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amit Daniel Kachhap <amit.kachhap@arm.com>
References: <1532700112-11852-1-git-send-email-amit.kachhap@arm.com>
Message-ID: <153270946725.48062.11195853363758024681@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: scmi: Fix the rounding of clock rate
Date: Fri, 27 Jul 2018 09:37:47 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Amit Daniel Kachhap (2018-07-27 07:01:52)
> This fix rounds the clock rate properly by using quotient and not
> remainder in the calculation. This issue was found while testing HDMI
> in the Juno platform.
> =

> Signed-off-by: Amit Daniel Kachhap <amit.kachhap@arm.com>

Any Fixes: tag here?

> ---
>  drivers/clk/clk-scmi.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> index bb2a6f2..a985bf5 100644
> --- a/drivers/clk/clk-scmi.c
> +++ b/drivers/clk/clk-scmi.c
> @@ -60,9 +59,9 @@ static long scmi_clk_round_rate(struct clk_hw *hw, unsi=
gned long rate,
>  =

>         ftmp =3D rate - fmin;
>         ftmp +=3D clk->info->range.step_size - 1; /* to round up */
> -       step =3D do_div(ftmp, clk->info->range.step_size);
> +       do_div(ftmp, clk->info->range.step_size);
>  =

> -       return step * clk->info->range.step_size + fmin;
> +       return ftmp * clk->info->range.step_size + fmin;

Good catch.
