Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>,  linux-kernel@vger.kernel.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1467962078-30405-1-git-send-email-tomeu.vizoso@collabora.com>
Cc: "Tomeu Vizoso" <tomeu.vizoso@collabora.com>,
 "Stephen Boyd" <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
References: <1467962078-30405-1-git-send-email-tomeu.vizoso@collabora.com>
Message-ID: <146800249405.73491.14502711083969229734@resonance>
Subject: Re: [PATCH] clk: clk-conf: Fix error message when clock isn't found
Date: Fri, 08 Jul 2016 11:28:14 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Tomeu Vizoso (2016-07-08 00:14:38)
> When failing to lookup the assigned clock for setting its parents, we
> were previously printing a misleading error message that lead to think
> that it was the parent clock what couldn't be found.
> =

> Change error message to make clear that it's the assigned clock what
> couldn't be found in this case.
> =

> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>

Applied.

Regards,
Mike

> ---
>  drivers/clk/clk-conf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
> index 43a218f35b19..674785d968a3 100644
> --- a/drivers/clk/clk-conf.c
> +++ b/drivers/clk/clk-conf.c
> @@ -55,7 +55,7 @@ static int __set_clk_parents(struct device_node *node, =
bool clk_supplier)
>                 }
>                 clk =3D of_clk_get_from_provider(&clkspec);
>                 if (IS_ERR(clk)) {
> -                       pr_warn("clk: couldn't get parent clock %d for %s=
\n",
> +                       pr_warn("clk: couldn't get assigned clock %d for =
%s\n",
>                                 index, node->full_name);
>                         rc =3D PTR_ERR(clk);
>                         goto err;
> -- =

> 2.5.5
>=20
