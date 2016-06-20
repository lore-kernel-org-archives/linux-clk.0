Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Daniel Lezcano <daniel.lezcano@linaro.org>, daniel.lezcano@linaro.org,
 tglx@linutronix.de
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1464903697-3802-1-git-send-email-daniel.lezcano@linaro.org>
Cc: linux-kernel@vger.kernel.org, "Russell King" <linux@arm.linux.org.uk>,
 "open list:CLK API" <linux-clk@vger.kernel.org>
References: <1464903697-3802-1-git-send-email-daniel.lezcano@linaro.org>
Message-ID: <20160620211849.24587.73336@quark.deferred.io>
Subject: Re: [PATCH 1/6] clk: Add missing clk_get_sys() stub
Date: Mon, 20 Jun 2016 14:18:49 -0700
List-ID: <linux-clk.vger.kernel.org>

Hi Daniel,

Quoting Daniel Lezcano (2016-06-02 14:41:32)
> When compiling with the COMPILE_TEST option set, the clps711x does not
> compile because of the clk_get_sys() noop stub missing.
> =

> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

This looks OK to me. Russell maintains clkdev and the clk.h stuff, so it
would be good to get his ack. Please feel free to add:

Reviewed-by: Michael Turquette <mturquette@baylibre.com>

Regards,
Mike

> ---
>  include/linux/clk.h | 4 ++++
>  1 file changed, 4 insertions(+)
> =

> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index 0df4a51..834179f 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -461,6 +461,10 @@ static inline struct clk *clk_get_parent(struct clk =
*clk)
>         return NULL;
>  }
>  =

> +static inline struct clk *clk_get_sys(const char *dev_id, const char *co=
n_id)
> +{
> +       return NULL;
> +}
>  #endif
>  =

>  /* clk_prepare_enable helps cases using clk_enable in non-atomic context=
. */
> -- =

> 1.9.1
>=20
