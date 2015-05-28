Return-Path: <mturquette@linaro.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 linux-arm-kernel@lists.infradead.org
From: Michael Turquette <mturquette@linaro.org>
In-Reply-To: <1432565608-26036-18-git-send-email-tomeu.vizoso@collabora.com>
Cc: =?utf-8?q?St=C3=A9phane_Marchesin?= <stephane.marchesin@gmail.com>,
 "Thierry Reding" <thierry.reding@gmail.com>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Alexander Holler" <holler@ahsoftware.de>,
 "Grant Likely" <grant.likely@linaro.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Tomeu Vizoso" <tomeu.vizoso@collabora.com>,
 "Stephen Boyd" <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1432565608-26036-1-git-send-email-tomeu.vizoso@collabora.com>
 <1432565608-26036-18-git-send-email-tomeu.vizoso@collabora.com>
Message-ID: <20150528061643.22384.27268@quantum>
Subject: Re: [PATCH 17/21] clk: Probe clk providers on demand
Date: Wed, 27 May 2015 23:16:43 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Tomeu Vizoso (2015-05-25 07:53:21)
> When looking up a clk through its DT node, ensure that the corresponding
> device has been registered.
> =

> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>

Ack.

Regards,
Mike

> ---
>  drivers/clk/clk.c | 3 +++
>  1 file changed, 3 insertions(+)
> =

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 5b0f418..f9e8a8d 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -18,6 +18,7 @@
>  #include <linux/list.h>
>  #include <linux/slab.h>
>  #include <linux/of.h>
> +#include <linux/of_platform.h>
>  #include <linux/device.h>
>  #include <linux/init.h>
>  #include <linux/sched.h>
> @@ -2985,6 +2986,8 @@ struct clk *__of_clk_get_from_provider(struct of_ph=
andle_args *clkspec,
>         if (!clkspec)
>                 return ERR_PTR(-EINVAL);
>  =

> +       of_platform_device_ensure(clkspec->np);
> +
>         /* Check if we have such a provider in our array */
>         mutex_lock(&of_clk_mutex);
>         list_for_each_entry(provider, &of_clk_providers, link) {
> -- =

> 2.4.1
>=20
