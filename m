Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Vladimir Zapolskiy <vz@mleia.com>, "Stephen Boyd" <sboyd@codeaurora.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1452136027-32076-1-git-send-email-vz@mleia.com>
Cc: "Joachim Eastwood" <manabian@gmail.com>,  linux-clk@vger.kernel.org
References: <1452136027-32076-1-git-send-email-vz@mleia.com>
Message-ID: <20160114021026.1942.82169@quark.deferred.io>
Subject: Re: [PATCH] clk: remove duplicated COMMON_CLK_NXP record from clk/Kconfig
Date: Wed, 13 Jan 2016 18:10:26 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting Vladimir Zapolskiy (2016-01-06 19:07:07)
> Presumably the second COMMON_CLK_NXP config option in
> drivers/clk/Kconfig appeared after a merge conflict resolution, remove
> the wrong record of two.
> =

> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>

Applied.

Regards,
Mike

> ---
> Hi Mike, Stephen,
> =

> I've found this issue in clk-next while working on something else,
> please consider to include this change to clk-next, no objections if
> it is squashed with f7c82a60ba2 ("clk: lpc32xx: add common clock
> framework driver").
> =

> In fact it is a revert of 8a896310a7e ("clk: lpc18xx: add NXP specific
> COMMON_CLK_NXP configuration symbol"), but this preparatory change is
> good as is.
> =

> The original change doesn't have this kind of a problem (see
> http://www.spinics.net/lists/devicetree/msg105709.html), so I
> believe it is caused by a merge conflict, probably after done
> alphabetical sorting.
> =

>  drivers/clk/Kconfig | 5 -----
>  1 file changed, 5 deletions(-)
> =

> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 41f6c7f..eca8e01 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -187,11 +187,6 @@ config COMMON_CLK_PWM
>           Adapter driver so that any PWM output can be (mis)used as clock=
 signal
>           at 50% duty cycle.
>  =

> -config COMMON_CLK_NXP
> -       def_bool COMMON_CLK && ARCH_LPC18XX
> -       ---help---
> -         Support for clock providers on NXP platforms.
> -
>  config COMMON_CLK_PXA
>         def_bool COMMON_CLK && ARCH_PXA
>         ---help---
> -- =

> 2.1.4
>=20
