Return-Path: <mturquette@linaro.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Eric Anholt <eric@anholt.net>,  linux-arm-kernel@lists.infradead.org
From: Michael Turquette <mturquette@linaro.org>
In-Reply-To: <1437420787-32137-6-git-send-email-eric@anholt.net>
Cc: linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Stephen Warren" <swarren@wwwdotorg.org>, "Lee Jones" <lee@kernel.org>,
 linux-clk@vger.kernel.org, "Stephen Boyd" <sboyd@codeaurora.org>,
 "Eric Anholt" <eric@anholt.net>
References: <1437420787-32137-1-git-send-email-eric@anholt.net>
 <1437420787-32137-6-git-send-email-eric@anholt.net>
Message-ID: <20150811211946.31346.8021@quantum>
Subject: Re: [PATCH v4 5/8] clk: bcm2835: Drop the fixed sys_pclk.
Date: Tue, 11 Aug 2015 14:19:46 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Eric Anholt (2015-07-20 12:33:04)
> Nothing uses it, and I can't find any evidence that anything ever has.
> Its role is now filled by the core clock in the firmware driver.
> =

> Signed-off-by: Eric Anholt <eric@anholt.net>
> Acked-by: Stephen Warren <swarren@wwwdotorg.org>

Applied to clk-next.

Regards,
Mike

> ---
>  drivers/clk/clk-bcm2835.c | 5 -----
>  1 file changed, 5 deletions(-)
> =

> diff --git a/drivers/clk/clk-bcm2835.c b/drivers/clk/clk-bcm2835.c
> index 6b950ca..dd295e4 100644
> --- a/drivers/clk/clk-bcm2835.c
> +++ b/drivers/clk/clk-bcm2835.c
> @@ -32,11 +32,6 @@ void __init bcm2835_init_clocks(void)
>         struct clk *clk;
>         int ret;
>  =

> -       clk =3D clk_register_fixed_rate(NULL, "sys_pclk", NULL, CLK_IS_RO=
OT,
> -                                       250000000);
> -       if (IS_ERR(clk))
> -               pr_err("sys_pclk not registered\n");
> -
>         clk =3D clk_register_fixed_rate(NULL, "apb_pclk", NULL, CLK_IS_RO=
OT,
>                                         126000000);
>         if (IS_ERR(clk))
> -- =

> 2.1.4
>=20
