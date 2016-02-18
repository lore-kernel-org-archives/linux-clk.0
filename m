Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: "Andrew F. Davis" <afd@ti.com>, "Stephen Boyd" <sboyd@codeaurora.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1455303016-8997-1-git-send-email-afd@ti.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Andrew F. Davis" <afd@ti.com>
References: <1455303016-8997-1-git-send-email-afd@ti.com>
Message-ID: <20160218005033.2278.60015@quark.deferred.io>
Subject: Re: [PATCH] clk: Make of_clk_get_from_provider() available to modules
Date: Wed, 17 Feb 2016 16:50:33 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting Andrew F. Davis (2016-02-12 10:50:16)
> Export symbol of_clk_get_from_provider so it can be used in
> loadable kernel modules
> =

> Signed-off-by: Andrew F. Davis <afd@ti.com>

Applied.

Regards,
Mike

> ---
> We will be pushing stuff that needs this next cycle.
> =

>  drivers/clk/clk.c | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index b4db67a..0a24736 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3061,6 +3061,7 @@ struct clk *of_clk_get_from_provider(struct of_phan=
dle_args *clkspec)
>  {
>         return __of_clk_get_from_provider(clkspec, NULL, __func__);
>  }
> +EXPORT_SYMBOL_GPL(of_clk_get_from_provider);
>  =

>  int of_clk_get_parent_count(struct device_node *np)
>  {
> -- =

> 2.7.1
>=20
