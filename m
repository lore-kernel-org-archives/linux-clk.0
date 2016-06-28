Return-Path: <ricardo.ribalda@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1466499688-28625-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1466499688-28625-1-git-send-email-ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 28 Jun 2016 11:26:55 +0200
Message-ID: <CAPybu_0LZH-8dk21m_ppP-a_=duUhowt=f0snogBUAtwtJcFvg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] clk: fixed-factor: Convert into a module platform driver
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-clk@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Ping?

On Tue, Jun 21, 2016 at 11:01 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> Adds support for fixed-factor clock providers which have not been
> enabled via of_clk_init().
>
> This is required by Device trees overlays that introduce clocks
> providers.
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
> v3: Changes proposed by: Stephen Boyd <sboyd@codeaurora.org>
> -Use OF_POPULATED flag
>
> v2: Changes proposed by: Stephen Boyd <sboyd@codeaurora.org>
> -Add error check
> -CodeStyle on of_device_ide
> -Use builtin_platform_driver()
>
>  drivers/clk/clk-fixed-factor.c | 73 +++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 68 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
> index 75cd6c792cb8..80b9e440f2c3 100644
> --- a/drivers/clk/clk-fixed-factor.c
> +++ b/drivers/clk/clk-fixed-factor.c
> @@ -12,6 +12,7 @@
>  #include <linux/slab.h>
>  #include <linux/err.h>
>  #include <linux/of.h>
> +#include <linux/platform_device.h>
>
>  /*
>   * DOC: basic fixed multiplier and divider clock that cannot gate
> @@ -145,23 +146,24 @@ EXPORT_SYMBOL_GPL(clk_hw_unregister_fixed_factor);
>  /**
>   * of_fixed_factor_clk_setup() - Setup function for simple fixed factor clock
>   */
> -void __init of_fixed_factor_clk_setup(struct device_node *node)
> +struct clk *_of_fixed_factor_clk_setup(struct device_node *node)
>  {
>         struct clk *clk;
>         const char *clk_name = node->name;
>         const char *parent_name;
>         u32 div, mult;
> +       int ret;
>
>         if (of_property_read_u32(node, "clock-div", &div)) {
>                 pr_err("%s Fixed factor clock <%s> must have a clock-div property\n",
>                         __func__, node->name);
> -               return;
> +               return ERR_PTR(-EIO);
>         }
>
>         if (of_property_read_u32(node, "clock-mult", &mult)) {
>                 pr_err("%s Fixed factor clock <%s> must have a clock-mult property\n",
>                         __func__, node->name);
> -               return;
> +               return ERR_PTR(-EIO);
>         }
>
>         of_property_read_string(node, "clock-output-names", &clk_name);
> @@ -169,10 +171,71 @@ void __init of_fixed_factor_clk_setup(struct device_node *node)
>
>         clk = clk_register_fixed_factor(NULL, clk_name, parent_name, 0,
>                                         mult, div);
> -       if (!IS_ERR(clk))
> -               of_clk_add_provider(node, of_clk_src_simple_get, clk);
> +       if (IS_ERR(clk))
> +               return clk;
> +
> +       ret = of_clk_add_provider(node, of_clk_src_simple_get, clk);
> +       if (ret) {
> +               clk_unregister(clk);
> +               return ERR_PTR(ret);
> +       }
> +
> +       return clk;
> +}
> +
> +void __init of_fixed_factor_clk_setup(struct device_node *node)
> +{
> +       if (!_of_fixed_factor_clk_setup(node))
> +               of_node_set_flag(node, OF_POPULATED);
>  }
>  EXPORT_SYMBOL_GPL(of_fixed_factor_clk_setup);
>  CLK_OF_DECLARE(fixed_factor_clk, "fixed-factor-clock",
>                 of_fixed_factor_clk_setup);
> +
> +static int of_fixed_factor_clk_remove(struct platform_device *pdev)
> +{
> +       struct clk *clk = platform_get_drvdata(pdev);
> +
> +       if (clk)
> +               clk_unregister_fixed_factor(clk);
> +
> +       return 0;
> +}
> +
> +static int of_fixed_factor_clk_probe(struct platform_device *pdev)
> +{
> +       struct clk *clk;
> +
> +       /*
> +        * This function is not executed when of_fixed_factor_clk_setup
> +        * succeeded.
> +        */
> +
> +       clk = _of_fixed_factor_clk_setup(pdev->dev.of_node);
> +
> +       if (IS_ERR(clk))
> +               return PTR_ERR(clk);
> +
> +       platform_set_drvdata(pdev, clk);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id of_fixed_factor_clk_ids[] = {
> +       { .compatible = "fixed-factor-clock" },
> +       { },
> +};
> +MODULE_DEVICE_TABLE(of, of_fixed_factor_clk_ids);
> +
> +static struct platform_driver of_fixed_factor_clk_driver = {
> +       .driver = {
> +               .name = "of_fixed_factor_clk",
> +               .of_match_table = of_fixed_factor_clk_ids,
> +       },
> +       .probe = of_fixed_factor_clk_probe,
> +       .remove = of_fixed_factor_clk_remove,
> +};
> +
> +builtin_platform_driver(of_fixed_factor_clk_driver);
> +
>  #endif
> --
> 2.8.1
>



-- 
Ricardo Ribalda
