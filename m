Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
References: <20180921152054.117774-1-chris.brandt@renesas.com> <20180921152054.117774-2-chris.brandt@renesas.com>
In-Reply-To: <20180921152054.117774-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Sep 2018 11:05:40 +0200
Message-ID: <CAMuHMdUWFp9nBR8EQtADHePPqGQZ-3bHrANQULz-QnXJLQy2fA@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: cpg-mssr: Add early clock support
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Chris,

On Fri, Sep 21, 2018 at 5:21 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add support for SoCs that need to register core and module clocks early in
> order to use OF drivers that exclusively use macros such as
> TIMER_OF_DECLARE.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -127,6 +127,7 @@ struct cpg_mssr_priv {
>         struct device *dev;
>         void __iomem *base;
>         spinlock_t rmw_lock;
> +       struct device_node *np;
>
>         struct clk **clks;
>         unsigned int num_core_clks;
> @@ -141,6 +142,7 @@ struct cpg_mssr_priv {
>         } smstpcr_saved[ARRAY_SIZE(smstpcr)];
>  };
>
> +struct cpg_mssr_priv *early_priv;

static

Just call the pointer cpg_mssr_priv, as you're gonna need it in both cases
(see below)?

>
>  /**
>   * struct mstp_clock - MSTP gating clock
> @@ -316,7 +318,7 @@ static void __init cpg_mssr_register_core_clk(const struct cpg_core_clk *core,
>
>         switch (core->type) {
>         case CLK_TYPE_IN:
> -               clk = of_clk_get_by_name(priv->dev->of_node, core->name);
> +               clk = of_clk_get_by_name(priv->np, core->name);
>                 break;
>
>         case CLK_TYPE_FF:
> @@ -877,42 +879,49 @@ static const struct dev_pm_ops cpg_mssr_pm = {
>  #define DEV_PM_OPS     NULL
>  #endif /* CONFIG_PM_SLEEP && CONFIG_ARM_PSCI_FW */
>
> -static int __init cpg_mssr_probe(struct platform_device *pdev)
> +static int cpg_mssr_common_init(struct device *dev, struct device_node *np,

__init

> +                               const struct cpg_mssr_info *info)
>  {
> -       struct device *dev = &pdev->dev;
> -       struct device_node *np = dev->of_node;
> -       const struct cpg_mssr_info *info;
>         struct cpg_mssr_priv *priv;
>         unsigned int nclks, i;
> -       struct resource *res;
> -       struct clk **clks;
> +       struct clk **clks = NULL;
>         int error;
> +       bool early_init = dev ? false : true;

I think this flag can be removed (see below).

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
> +       /* np is saved because dev->of_node doesn't exists during early init */

I don't think this comment is needed...

> +       priv->np = np;
> +

... nor this blank line.

>         priv->dev = dev;
>         spin_lock_init(&priv->rmw_lock);
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       priv->base = devm_ioremap_resource(dev, res);
> -       if (IS_ERR(priv->base))
> -               return PTR_ERR(priv->base);
> +       priv->base = of_iomap(np, 0);
> +       if (IS_ERR(priv->base)) {

of_iomap() returns NULL on failure, not an error code.

> +               error = PTR_ERR(priv->base);

error = -ENOMEM;

> +               goto out_err;
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
> +
> +       if (early_init)
> +               early_priv = priv;

cpg_mssr_probe() needs access to the pointer, too, so you should always
save it.

> +       else
> +               dev_set_drvdata(dev, priv);

dev_set_drvdata() should be called on SoCs with early clocks, too, so that
should be done in cpg_mssr_probe() instead.

>
> -       dev_set_drvdata(dev, priv);
>         priv->clks = clks;
>         priv->num_core_clks = info->num_total_core_clks;
>         priv->num_mod_clks = info->num_hw_mod_clks;
> @@ -923,16 +932,71 @@ static int __init cpg_mssr_probe(struct platform_device *pdev)
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
> +       if (priv->base)
> +               iounmap(priv->base);
> +       kfree(priv);
> +
> +       return error;
> +}
> +
> +void __init cpg_mssr_early_init(struct device_node *np,
> +                               const struct cpg_mssr_info *info)
> +{
> +       int error;
> +       int i;
> +
> +       error = cpg_mssr_common_init(NULL, np, info);
> +       if (error)
> +               return;
> +
> +       for (i = 0; i < info->num_early_core_clks; i++)
> +               cpg_mssr_register_core_clk(&info->early_core_clks[i], info,
> +                                          early_priv);
> +
> +       for (i = 0; i < info->num_early_mod_clks; i++)
> +               cpg_mssr_register_mod_clk(&info->early_mod_clks[i], info,
> +                                         early_priv);
> +
> +}
> +
> +static int __init cpg_mssr_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct device_node *np = dev->of_node;
> +       const struct cpg_mssr_info *info;
> +       struct cpg_mssr_priv *priv;
> +       unsigned int i;
> +       int error;
> +
> +       info = of_device_get_match_data(dev);
> +
> +       if (early_priv) {
> +               priv = early_priv;
> +               priv->dev = &pdev->dev;
> +       } else {
> +               error = cpg_mssr_common_init(dev, dev->of_node, info);

Oops, priv is not set => BOOM.
I guess you have no other hardware using the renesas-cpg-mssr driver?
You can probably still test this case on RZ/A2 without patch 2 (or with the
OF_CLK_DECLARE_DRIVER() line commented out), and with the OSTM timer hack
you posted before.

> +       }
> +
> +       if (error)
> +               return error;
> +
> +       if (!early_priv)
> +               dev_set_drvdata(dev, priv);

This should be done regardless.

For now it's fine to not move the call to cpg_mssr_add_clk_domain() from
cpg_mssr_probe() to cpg_mssr_common_init().  If/when the timer subsystem
receives some early platform_device support, this may have to be revisited.

> --- a/drivers/clk/renesas/renesas-cpg-mssr.h
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.h
> @@ -119,12 +119,16 @@ struct cpg_mssr_info {
>         unsigned int num_core_clks;
>         unsigned int last_dt_core_clk;
>         unsigned int num_total_core_clks;
> +       const struct cpg_core_clk *early_core_clks;
> +       unsigned int num_early_core_clks;

I'd put the early clocks first.
Or perhaps a separate /* Early Clocks */ block for both early core and
early module clocks at the top of struct cpg_mssr_info, so it's very clear
what applies to early clocks?

>         bool stbyctrl;
>
>         /* Module Clocks */
>         const struct mssr_mod_clk *mod_clks;
>         unsigned int num_mod_clks;
>         unsigned int num_hw_mod_clks;
> +       const struct mssr_mod_clk *early_mod_clks;
> +       unsigned int num_early_mod_clks;

Likewise.

>
>         /* Critical Module Clocks that should not be disabled */
>         const unsigned int *crit_mod_clks;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
