Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 "Stephen Boyd" <sboyd@codeaurora.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1450852439-366-1-git-send-email-sudipm.mukherjee@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 "Sudip Mukherjee" <sudipm.mukherjee@gmail.com>
References: <1450852439-366-1-git-send-email-sudipm.mukherjee@gmail.com>
Message-ID: <20160101053228.21738.40065@quark.deferred.io>
Subject: Re: [PATCH] clk: gpio: fix memory leak
Date: Thu, 31 Dec 2015 21:32:28 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting Sudip Mukherjee (2015-12-22 22:33:59)
> If we fail to allocate parent_name then we are returning but we missed
> freeing data which has already been allocated.
> =

> Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>

Applied.

Thanks,
Mike

> ---
>  drivers/clk/clk-gpio.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
> index 335322d..c1baa89 100644
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

> 1.9.1
>=20
