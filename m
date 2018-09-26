Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
References: <20180924164937.36536-1-chris.brandt@renesas.com> <20180924164937.36536-2-chris.brandt@renesas.com>
In-Reply-To: <20180924164937.36536-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Sep 2018 11:23:53 +0200
Message-ID: <CAMuHMdWhO0A6_wQR44QrB9TkOy6ka417cJN-9bkx8=_k=kfVAQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] clk: renesas: cpg-mssr: Add early clock support
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Chris,

On Mon, Sep 24, 2018 at 6:50 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add support for SoCs that need to register core and module clocks early in
> order to use OF drivers that exclusively use macros such as
> TIMER_OF_DECLARE.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
>  * List early clocks first
>  * Renamed early_priv to cpg_mssr_priv and make it static
>  * Always set cpg_mssr_priv(early_priv) because it is used for early and
>    non-early cases.
>  * of_iomap returns NULL on error, not negative number
>  * Removed various unnecessary comments
>  * Add __init to cpg_mssr_common_init
>  * fixed dev_set_drvdata was not being called for early drivers

Thanks for the update!
Works fine on R-Car Gen2 and Gen3.

> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c

> @@ -877,42 +879,43 @@ static const struct dev_pm_ops cpg_mssr_pm = {
>  #define DEV_PM_OPS     NULL
>  #endif /* CONFIG_PM_SLEEP && CONFIG_ARM_PSCI_FW */
>
> -static int __init cpg_mssr_probe(struct platform_device *pdev)
> +static int __init cpg_mssr_common_init(struct device *dev,
> +                                      struct device_node *np,
> +                                      const struct cpg_mssr_info *info)
>  {
> -       struct device *dev = &pdev->dev;
> -       struct device_node *np = dev->of_node;
> -       const struct cpg_mssr_info *info;
>         struct cpg_mssr_priv *priv;
>         unsigned int nclks, i;
> -       struct resource *res;
>         struct clk **clks;

In v1, you initialized clks to NULL, which was needed ...

>         int error;
>
> -       info = of_device_get_match_data(dev);
>         if (info->init) {
>                 error = info->init(dev);
>                 if (error)
>                         return error;
>         }
>
> -       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       priv = kzalloc(sizeof(*priv), GFP_KERNEL);
>         if (!priv)
>                 return -ENOMEM;
>
> +       priv->np = np;
>         priv->dev = dev;
>         spin_lock_init(&priv->rmw_lock);
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       priv->base = devm_ioremap_resource(dev, res);
> -       if (IS_ERR(priv->base))
> -               return PTR_ERR(priv->base);
> +       priv->base = of_iomap(np, 0);
> +       if (!priv->base) {
> +               error = -ENOMEM;
> +               goto out_err;

... because else it's still uninitialized here ...
> +       }
>
>         nclks = info->num_total_core_clks + info->num_hw_mod_clks;
> -       clks = devm_kmalloc_array(dev, nclks, sizeof(*clks), GFP_KERNEL);
> -       if (!clks)
> -               return -ENOMEM;
> +       clks = kmalloc_array(nclks, sizeof(*clks), GFP_KERNEL);
> +       if (!clks) {
> +               error = -ENOMEM;
> +               goto out_err;
> +       }
>
> -       dev_set_drvdata(dev, priv);
> +       cpg_mssr_priv = priv;
>         priv->clks = clks;
>         priv->num_core_clks = info->num_total_core_clks;
>         priv->num_mod_clks = info->num_hw_mod_clks;
> @@ -923,16 +926,68 @@ static int __init cpg_mssr_probe(struct platform_device *pdev)
>         for (i = 0; i < nclks; i++)
>                 clks[i] = ERR_PTR(-ENOENT);
>
> +       error = of_clk_add_provider(np, cpg_mssr_clk_src_twocell_get, priv);
> +       if (error)
> +               goto out_err;
> +
> +       return 0;
> +
> +out_err:
> +       kfree(clks);

... and freed here.

> +       if (priv->base)
> +               iounmap(priv->base);
> +       kfree(priv);
> +
> +       return error;
> +}

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v4.20, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
