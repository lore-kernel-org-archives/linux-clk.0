Return-Path: <mturquette@linaro.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jim Quinlan <jim2101024@gmail.com>,  linux-clk@vger.kernel.org
From: Michael Turquette <mturquette@linaro.org>
In-Reply-To: <1431728556-620-1-git-send-email-jim2101024@gmail.com>
Cc: bcm-kernel-feedback-list@broadcom.com, "Jim Quinlan" <jim2101024@gmail.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>
References: <1431728556-620-1-git-send-email-jim2101024@gmail.com>
Message-ID: <20150523193321.9817.1715@quantum>
Subject: Re: [PATCH] clk: export function clk_disable_unused()
Date: Sat, 23 May 2015 12:33:21 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Jim Quinlan (2015-05-15 15:22:36)
> For Broadcom STB chips, clocks may come up after resume in an "on"
> state, so calling clk_disable_unused() again will turn off unused
> clocks.  This commit exports clk_disable_unused() so it may be
> called in such cases.

Jim,

Thanks for the patch.

I think a more general solution to the problem might be needed. E.g. how
do we solve for the opposite case where after a low-power suspend/resume
we turn on clocks that were enabled by drivers before suspending, but
are disabled out of reset/post-transition?

Additionally, it would be helpful to see your driver changes and how
exactly you plan to use this newly exported function.

I've Cc'd Grygorii Strashko from TI. I faintly recall that he had an
out-of-tree solution to add some .suspend/.resume callbacks to struct
clk_ops. I didn't like that solution at the time either, but maybe we
can figure out a more natural way to handle these cases.

(Grygorii: sorry in advance if this is a case of mistaken identity. I
could not find the code in question from my email archive)

Regards,
Mike

> =

> Signed-off-by: Jim Quinlan <jim2101024@gmail.com>
> ---
>  drivers/clk/clk.c   | 2 +-
>  include/linux/clk.h | 8 ++++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 459ce9d..4469f8b 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -549,7 +549,7 @@ static int __init clk_ignore_unused_setup(char *__unu=
sed)
>  }
>  __setup("clk_ignore_unused", clk_ignore_unused_setup);
>  =

> -static int clk_disable_unused(void)
> +int clk_disable_unused(void)
>  {
>         struct clk_core *clk;
>  =

> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index 68c16a6..c03822c 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -265,6 +265,14 @@ int clk_enable(struct clk *clk);
>  void clk_disable(struct clk *clk);
>  =

>  /**
> + * clk_disable_unused - turns off unused clocks.
> + *
> + * This is already called as a late initcall, but may be
> + * called again in special cases such as resuming from S3.
> + */
> +int clk_disable_unused(void);
> +
> +/**
>   * clk_get_rate - obtain the current clock rate (in Hz) for a clock sour=
ce.
>   *               This is only valid once the clock source has been enabl=
ed.
>   * @clk: clock source
> -- =

> 1.9.0.138.g2de3478
>=20
