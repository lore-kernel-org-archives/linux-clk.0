Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20160704211220.5685-9-paul.gortmaker@windriver.com>
Cc: "Paul Gortmaker" <paul.gortmaker@windriver.com>,
 "Boris BREZILLON" <boris.brezillon@free-electrons.com>,
 "Chen-Yu Tsai" <wens@csie.org>,
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>,
 "Stephen Boyd" <sboyd@codeaurora.org>,
 "Maxime Ripard" <maxime.ripard@free-electrons.com>, linux-clk@vger.kernel.org
References: <20160704211220.5685-1-paul.gortmaker@windriver.com>
 <20160704211220.5685-9-paul.gortmaker@windriver.com>
Message-ID: <146784372723.73491.16398398871587500761@resonance>
Subject: Re: [PATCH 08/10] clk: sunxi: make clk-* explicitly non-modular
Date: Wed, 06 Jul 2016 15:22:07 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Paul Gortmaker (2016-07-04 14:12:18)
> We have the following file --> Kconfig mapping:
> =

> sunxi/clk-factors.c              obj-y
> sunxi/clk-sun6i-apb0-gates.c     CONFIG_MFD_SUN6I_PRCM (bool)
> sunxi/clk-sun6i-apb0.c           CONFIG_MFD_SUN6I_PRCM
> sunxi/clk-sun6i-ar100.c          CONFIG_MFD_SUN6I_PRCM
> sunxi/clk-sun8i-apb0.c           CONFIG_MFD_SUN6I_PRCM
> sunxi/clk-sun9i-mmc.c            obj-y
> =

> Hence none of these are being built as a module by anyone.
> =

> Lets remove the modular code that is essentially orphaned, so that
> when reading the drivers there is no doubt they are builtin-only.  All
> drivers get mostly the same changes, so they are handled in batch.
> =

> Changes are (1) convert to builtin_platform_register, (2) use the
> init.h header, (3) delete the MODULE_LICENCE/MODULE_AUTHOR and
> associated tags, and (4) delete any ".remove" functions.
> =

> There was a stray module.h in a file not using any init.h or
> module.h stuff, so we simply removed that one.
> =

> In two cases, we explicitly disallow a driver unbind, since that
> doesn't have a sensible use case anyway, and it allows us to drop
> the ".remove" code for non-modular drivers.
> =

> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
> =

> We delete the MODULE_LICENSE etc. tags since all that information
> is already contained at the top of each file in the comments.
> =

> Cc: Boris BREZILLON <boris.brezillon@free-electrons.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: "Emilio L=C3=B3pez" <emilio@elopez.com.ar>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Applied.

Regards,
Mike

> ---
>  drivers/clk/sunxi/clk-factors.c          |  1 -
>  drivers/clk/sunxi/clk-sun6i-apb0-gates.c |  9 ++-------
>  drivers/clk/sunxi/clk-sun6i-apb0.c       |  9 ++-------
>  drivers/clk/sunxi/clk-sun6i-ar100.c      | 21 +++------------------
>  drivers/clk/sunxi/clk-sun8i-apb0.c       |  9 ++-------
>  drivers/clk/sunxi/clk-sun9i-mmc.c        | 28 +++-----------------------=
--
>  6 files changed, 12 insertions(+), 65 deletions(-)
> =

> diff --git a/drivers/clk/sunxi/clk-factors.c b/drivers/clk/sunxi/clk-fact=
ors.c
> index ddefe9668863..dfe5e3e32d28 100644
> --- a/drivers/clk/sunxi/clk-factors.c
> +++ b/drivers/clk/sunxi/clk-factors.c
> @@ -12,7 +12,6 @@
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
> -#include <linux/module.h>
>  #include <linux/of_address.h>
>  #include <linux/slab.h>
>  #include <linux/string.h>
> diff --git a/drivers/clk/sunxi/clk-sun6i-apb0-gates.c b/drivers/clk/sunxi=
/clk-sun6i-apb0-gates.c
> index 68021fa5ecd9..09cdb9874636 100644
> --- a/drivers/clk/sunxi/clk-sun6i-apb0-gates.c
> +++ b/drivers/clk/sunxi/clk-sun6i-apb0-gates.c
> @@ -9,7 +9,7 @@
>   */
>  =

>  #include <linux/clk-provider.h>
> -#include <linux/module.h>
> +#include <linux/init.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> @@ -33,7 +33,6 @@ static const struct of_device_id sun6i_a31_apb0_gates_c=
lk_dt_ids[] =3D {
>         { .compatible =3D "allwinner,sun8i-a23-apb0-gates-clk", .data =3D=
 &sun8i_a23_apb0_gates },
>         { /* sentinel */ }
>  };
> -MODULE_DEVICE_TABLE(of, sun6i_a31_apb0_gates_clk_dt_ids);
>  =

>  static int sun6i_a31_apb0_gates_clk_probe(struct platform_device *pdev)
>  {
> @@ -102,8 +101,4 @@ static struct platform_driver sun6i_a31_apb0_gates_cl=
k_driver =3D {
>         },
>         .probe =3D sun6i_a31_apb0_gates_clk_probe,
>  };
> -module_platform_driver(sun6i_a31_apb0_gates_clk_driver);
> -
> -MODULE_AUTHOR("Boris BREZILLON <boris.brezillon@free-electrons.com>");
> -MODULE_DESCRIPTION("Allwinner A31 APB0 gate clocks driver");
> -MODULE_LICENSE("GPL v2");
> +builtin_platform_driver(sun6i_a31_apb0_gates_clk_driver);
> diff --git a/drivers/clk/sunxi/clk-sun6i-apb0.c b/drivers/clk/sunxi/clk-s=
un6i-apb0.c
> index e703e1895b76..b9c8d359288c 100644
> --- a/drivers/clk/sunxi/clk-sun6i-apb0.c
> +++ b/drivers/clk/sunxi/clk-sun6i-apb0.c
> @@ -9,7 +9,7 @@
>   */
>  =

>  #include <linux/clk-provider.h>
> -#include <linux/module.h>
> +#include <linux/init.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  =

> @@ -61,7 +61,6 @@ static const struct of_device_id sun6i_a31_apb0_clk_dt_=
ids[] =3D {
>         { .compatible =3D "allwinner,sun6i-a31-apb0-clk" },
>         { /* sentinel */ }
>  };
> -MODULE_DEVICE_TABLE(of, sun6i_a31_apb0_clk_dt_ids);
>  =

>  static struct platform_driver sun6i_a31_apb0_clk_driver =3D {
>         .driver =3D {
> @@ -70,8 +69,4 @@ static struct platform_driver sun6i_a31_apb0_clk_driver=
 =3D {
>         },
>         .probe =3D sun6i_a31_apb0_clk_probe,
>  };
> -module_platform_driver(sun6i_a31_apb0_clk_driver);
> -
> -MODULE_AUTHOR("Boris BREZILLON <boris.brezillon@free-electrons.com>");
> -MODULE_DESCRIPTION("Allwinner A31 APB0 clock Driver");
> -MODULE_LICENSE("GPL v2");
> +builtin_platform_driver(sun6i_a31_apb0_clk_driver);
> diff --git a/drivers/clk/sunxi/clk-sun6i-ar100.c b/drivers/clk/sunxi/clk-=
sun6i-ar100.c
> index 84a187e55360..64ca3e9e38e6 100644
> --- a/drivers/clk/sunxi/clk-sun6i-ar100.c
> +++ b/drivers/clk/sunxi/clk-sun6i-ar100.c
> @@ -10,7 +10,7 @@
>  =

>  #include <linux/bitops.h>
>  #include <linux/clk-provider.h>
> -#include <linux/module.h>
> +#include <linux/init.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/spinlock.h>
> @@ -91,32 +91,17 @@ static int sun6i_a31_ar100_clk_probe(struct platform_=
device *pdev)
>         return 0;
>  }
>  =

> -static int sun6i_a31_ar100_clk_remove(struct platform_device *pdev)
> -{
> -       struct device_node *np =3D pdev->dev.of_node;
> -       struct clk *clk =3D platform_get_drvdata(pdev);
> -
> -       sunxi_factors_unregister(np, clk);
> -
> -       return 0;
> -}
> -
>  static const struct of_device_id sun6i_a31_ar100_clk_dt_ids[] =3D {
>         { .compatible =3D "allwinner,sun6i-a31-ar100-clk" },
>         { /* sentinel */ }
>  };
> -MODULE_DEVICE_TABLE(of, sun6i_a31_ar100_clk_dt_ids);
>  =

>  static struct platform_driver sun6i_a31_ar100_clk_driver =3D {
>         .driver =3D {
>                 .name =3D "sun6i-a31-ar100-clk",
>                 .of_match_table =3D sun6i_a31_ar100_clk_dt_ids,
> +               .suppress_bind_attrs =3D true,
>         },
>         .probe =3D sun6i_a31_ar100_clk_probe,
> -       .remove =3D sun6i_a31_ar100_clk_remove,
>  };
> -module_platform_driver(sun6i_a31_ar100_clk_driver);
> -
> -MODULE_AUTHOR("Boris BREZILLON <boris.brezillon@free-electrons.com>");
> -MODULE_DESCRIPTION("Allwinner A31 AR100 clock Driver");
> -MODULE_LICENSE("GPL v2");
> +builtin_platform_driver(sun6i_a31_ar100_clk_driver);
> diff --git a/drivers/clk/sunxi/clk-sun8i-apb0.c b/drivers/clk/sunxi/clk-s=
un8i-apb0.c
> index 2ea61debffc1..a5666e1d0ce7 100644
> --- a/drivers/clk/sunxi/clk-sun8i-apb0.c
> +++ b/drivers/clk/sunxi/clk-sun8i-apb0.c
> @@ -15,7 +15,7 @@
>   */
>  =

>  #include <linux/clk-provider.h>
> -#include <linux/module.h>
> +#include <linux/init.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/platform_device.h>
> @@ -108,7 +108,6 @@ static const struct of_device_id sun8i_a23_apb0_clk_d=
t_ids[] =3D {
>         { .compatible =3D "allwinner,sun8i-a23-apb0-clk" },
>         { /* sentinel */ }
>  };
> -MODULE_DEVICE_TABLE(of, sun8i_a23_apb0_clk_dt_ids);
>  =

>  static struct platform_driver sun8i_a23_apb0_clk_driver =3D {
>         .driver =3D {
> @@ -117,8 +116,4 @@ static struct platform_driver sun8i_a23_apb0_clk_driv=
er =3D {
>         },
>         .probe =3D sun8i_a23_apb0_clk_probe,
>  };
> -module_platform_driver(sun8i_a23_apb0_clk_driver);
> -
> -MODULE_AUTHOR("Chen-Yu Tsai <wens@csie.org>");
> -MODULE_DESCRIPTION("Allwinner A23 APB0 clock Driver");
> -MODULE_LICENSE("GPL v2");
> +builtin_platform_driver(sun8i_a23_apb0_clk_driver);
> diff --git a/drivers/clk/sunxi/clk-sun9i-mmc.c b/drivers/clk/sunxi/clk-su=
n9i-mmc.c
> index 716737388b7d..6041bdba2e97 100644
> --- a/drivers/clk/sunxi/clk-sun9i-mmc.c
> +++ b/drivers/clk/sunxi/clk-sun9i-mmc.c
> @@ -16,7 +16,7 @@
>  =

>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
> -#include <linux/module.h>
> +#include <linux/init.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/reset.h>
> @@ -183,39 +183,17 @@ err_clk_register:
>         return ret;
>  }
>  =

> -static int sun9i_a80_mmc_config_clk_remove(struct platform_device *pdev)
> -{
> -       struct device_node *np =3D pdev->dev.of_node;
> -       struct sun9i_mmc_clk_data *data =3D platform_get_drvdata(pdev);
> -       struct clk_onecell_data *clk_data =3D &data->clk_data;
> -       int i;
> -
> -       reset_controller_unregister(&data->rcdev);
> -       of_clk_del_provider(np);
> -       for (i =3D 0; i < clk_data->clk_num; i++)
> -               clk_unregister(clk_data->clks[i]);
> -
> -       reset_control_assert(data->reset);
> -
> -       return 0;
> -}
> -
>  static const struct of_device_id sun9i_a80_mmc_config_clk_dt_ids[] =3D {
>         { .compatible =3D "allwinner,sun9i-a80-mmc-config-clk" },
>         { /* sentinel */ }
>  };
> -MODULE_DEVICE_TABLE(of, sun9i_a80_mmc_config_clk_dt_ids);
>  =

>  static struct platform_driver sun9i_a80_mmc_config_clk_driver =3D {
>         .driver =3D {
>                 .name =3D "sun9i-a80-mmc-config-clk",
> +               .suppress_bind_attrs =3D true,
>                 .of_match_table =3D sun9i_a80_mmc_config_clk_dt_ids,
>         },
>         .probe =3D sun9i_a80_mmc_config_clk_probe,
> -       .remove =3D sun9i_a80_mmc_config_clk_remove,
>  };
> -module_platform_driver(sun9i_a80_mmc_config_clk_driver);
> -
> -MODULE_AUTHOR("Chen-Yu Tsai <wens@csie.org>");
> -MODULE_DESCRIPTION("Allwinner A80 MMC clock/reset Driver");
> -MODULE_LICENSE("GPL v2");
> +builtin_platform_driver(sun9i_a80_mmc_config_clk_driver);
> -- =

> 2.8.4
>=20
