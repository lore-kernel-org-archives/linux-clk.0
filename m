Return-Path: <carlo@endlessm.com>
MIME-Version: 1.0
In-Reply-To: <20150611152046.GG12192@mwanda>
References: <20150611152046.GG12192@mwanda>
Date: Thu, 11 Jun 2015 17:26:07 +0200
Message-ID: <CAL9uMOF=i1QZ22yh344j-p-SXBZU96MjrjVWVA30gDZopN=x7g@mail.gmail.com>
Subject: Re: [patch] clk: meson: add some error handling in meson_clk_register_cpu()
From: Carlo Caione <carlo@endlessm.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jun 11, 2015 at 5:20 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> This error handling hopefully isn't needed but it make the static
> checkers happy.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/clk/meson/clk-cpu.c b/drivers/clk/meson/clk-cpu.c
> index 148e99f..71ad493 100644
> --- a/drivers/clk/meson/clk-cpu.c
> +++ b/drivers/clk/meson/clk-cpu.c
> @@ -213,22 +213,30 @@ struct clk *meson_clk_register_cpu(const struct clk_conf *clk_conf,
>         if (!pclk) {
>                 pr_err("%s: could not lookup parent clock %s\n",
>                                 __func__, clk_conf->clks_parent[0]);
> -               return ERR_PTR(-EINVAL);
> +               ret = -EINVAL;
> +               goto free_clk;
>         }
>
>         ret = clk_notifier_register(pclk, &clk_cpu->clk_nb);
>         if (ret) {
>                 pr_err("%s: failed to register clock notifier for %s\n",
>                                 __func__, clk_conf->clk_name);
> -               return ERR_PTR(-EINVAL);
> +               goto free_clk;
>         }
>
>         clk = clk_register(NULL, &clk_cpu->hw);
>         if (IS_ERR(clk)) {
> -               clk_notifier_unregister(pclk, &clk_cpu->clk_nb);
> -               kfree(clk_cpu);
> +               ret = PTR_ERR(clk);
> +               goto unregister_clk_nb;
>         }
>
>         return clk;
> +
> +unregister_clk_nb:
> +       clk_notifier_unregister(pclk, &clk_cpu->clk_nb);
> +free_clk:
> +       kfree(clk_cpu);
> +
> +       return ERR_PTR(ret);
>  }
>

Thanks Dan,

Acked-by: Carlo Caione <carlo@endlessm.com>

-- 
Carlo Caione  |  +39.340.80.30.096  |  Endless
