Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Guodong Xu <guodong.xu@linaro.org>, sboyd@codeaurora.org,
 jorge.ramirez-ortiz@linaro.org, xinliang.liu@linaro.org,
 guodong.xu@linaro.org, john.stultz@linaro.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1467189955-21694-2-git-send-email-guodong.xu@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <1467189955-21694-1-git-send-email-guodong.xu@linaro.org>
 <1467189955-21694-2-git-send-email-guodong.xu@linaro.org>
Message-ID: <146784139106.73491.6417383579004254897@resonance>
Subject: Re: [PATCH v2 2/2] clk: hi6220: initialize UART1 clock to 150MHz
Date: Wed, 06 Jul 2016 14:43:11 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Guodong Xu (2016-06-29 01:45:55)
> From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> =

> Early at boot, during the sys_clk initialization, make sure UART1 uses
> the higher frequency clock, 150MHz.
> =

> This enables support for higher baud rates (up to 3Mbps) in UART1, which
> is required by faster bluetooth transfers.
> =

> v2: use clk_set_rate() to propergate clock settings.
> =

> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
> ---
>  drivers/clk/hisilicon/clk-hi6220.c | 4 ++++
>  1 file changed, 4 insertions(+)
> =

> diff --git a/drivers/clk/hisilicon/clk-hi6220.c b/drivers/clk/hisilicon/c=
lk-hi6220.c
> index a36ffcb..631c56f 100644
> --- a/drivers/clk/hisilicon/clk-hi6220.c
> +++ b/drivers/clk/hisilicon/clk-hi6220.c
> @@ -12,6 +12,7 @@
>  =

>  #include <linux/kernel.h>
>  #include <linux/clk-provider.h>
> +#include <linux/clk.h>
>  #include <linux/clkdev.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
> @@ -192,6 +193,9 @@ static void __init hi6220_clk_sys_init(struct device_=
node *np)
>  =

>         hi6220_clk_register_divider(hi6220_div_clks_sys,
>                         ARRAY_SIZE(hi6220_div_clks_sys), clk_data);
> +
> +       if (clk_set_rate(clk_data->clk_data.clks[HI6220_UART1_SRC], 15000=
0000))
> +               pr_err("failed to set uart1 clock rate\n");

Why doesn't the UART driver call clk_get and then clk_set_rate on this
clock? Why do it in the clk provider driver?

Thanks,
Mike

>  }
>  CLK_OF_DECLARE(hi6220_clk_sys, "hisilicon,hi6220-sysctrl", hi6220_clk_sy=
s_init);
>  =

> -- =

> 1.9.1
>=20
