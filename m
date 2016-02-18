Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Kevin Smith <kevin.smith@elecsyscorp.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1455209620-6125-1-git-send-email-kevin.smith@elecsyscorp.com>
Cc: "Kevin Smith" <kevin.smith@elecsyscorp.com>,
 "Stephen Boyd" <sboyd@codeaurora.org>,
 "Gregory CLEMENT" <gregory.clement@free-electrons.com>,
 "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
References: <1455136849-7888-1-git-send-email-kevin.smith@elecsyscorp.com>
 <1455209620-6125-1-git-send-email-kevin.smith@elecsyscorp.com>
Message-ID: <20160218011630.2278.67415@quark.deferred.io>
Subject: Re: [PATCH v3 1/2] clk: mvebu: Remove corediv clock from Armada XP
Date: Wed, 17 Feb 2016 17:16:30 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting Kevin Smith (2016-02-11 08:53:52)
> There is no corediv clock on Armada XP, so this is unnecessary.
> =

> Signed-off-by: Kevin Smith <kevin.smith@elecsyscorp.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Michael Turquette <mturquette@baylibre.com>

I'm fine to take both patches through the clk tree, or to have them go
through arm-soc. Let me know if you have a preference.

Regards,
Mike

> ---
>  drivers/clk/mvebu/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> =

> diff --git a/drivers/clk/mvebu/Kconfig b/drivers/clk/mvebu/Kconfig
> index 2769625..e1bc567 100644
> --- a/drivers/clk/mvebu/Kconfig
> +++ b/drivers/clk/mvebu/Kconfig
> @@ -29,7 +29,6 @@ config ARMADA_XP_CLK
>         bool
>         select MVEBU_CLK_COMMON
>         select MVEBU_CLK_CPU
> -       select MVEBU_CLK_COREDIV
>  =

>  config DOVE_CLK
>         bool
> -- =

> 2.4.6
