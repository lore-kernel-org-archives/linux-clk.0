Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>,
 "Stephen Boyd" <sboyd@codeaurora.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1450290511-14442-1-git-send-email-computersforpeace@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Brian Norris" <computersforpeace@gmail.com>, "Jyri Sarha" <jsarha@ti.com>,
 "Sergej Sawazki" <ce3a@gmx.de>
References: <1450290511-14442-1-git-send-email-computersforpeace@gmail.com>
Message-ID: <20160101055632.21738.88763@quark.deferred.io>
Subject: Re: [PATCH] clk: gpio: fix memory leak in of_gpio_clk_setup()
Date: Thu, 31 Dec 2015 21:56:32 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting Brian Norris (2015-12-16 10:28:31)
> Reported by Coverity.
> =

> Fixes: f66541ba02d5 ("clk: gpio: Get parent clk names in of_gpio_clk_setu=
p()")
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Jyri Sarha <jsarha@ti.com>
> Cc: Sergej Sawazki <ce3a@gmx.de>
> Cc: Stephen Boyd <sboyd@codeaurora.org>

Thanks for the fix. I already applied this one:

http://lkml.kernel.org/r/<1450852439-366-1-git-send-email-sudipm.mukherjee@=
gmail.com>

Regards,
Mike

> ---
>  drivers/clk/clk-gpio.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
> index 335322dc403f..c1baa89cbf91 100644
> --- a/drivers/clk/clk-gpio.c
> +++ b/drivers/clk/clk-gpio.c
> @@ -294,8 +294,10 @@ static void __init of_gpio_clk_setup(struct device_n=
ode *node,
>         num_parents =3D of_clk_get_parent_count(node);
>  =

>         parent_names =3D kcalloc(num_parents, sizeof(char *), GFP_KERNEL);
> -       if (!parent_names)
> +       if (!parent_names) {
> +               kfree(data);
>                 return;
> +       }
>  =

>         for (i =3D 0; i < num_parents; i++)
>                 parent_names[i] =3D of_clk_get_parent_name(node, i);
> -- =

> 2.6.0.rc2.230.g3dd15c0
>=20
