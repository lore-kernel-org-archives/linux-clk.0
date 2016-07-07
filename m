Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "Russell King" <linux@armlinux.org.uk>, "Rob Herring" <robh@kernel.org>,
 "Mark Brown" <broonie@kernel.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <87wpl2yyuw.wl%kuninori.morimoto.gx@renesas.com>
Cc: "Linux-Kernel" <linux-kernel@vger.kernel.org>,
 "Linux-DT" <devicetree@vger.kernel.org>,
 "Linux-ARM" <linux-arm-kernel@lists.infradead.org>,
 "Linux-ALSA" <alsa-devel@alsa-project.org>, linux-clk@vger.kernel.org
References: <87wpl2yyuw.wl%kuninori.morimoto.gx@renesas.com>
Message-ID: <146785219147.73491.2827268663638530377@resonance>
Subject: Re: [PATCH v2] clkdev: add devm_of_clk_get()
Date: Wed, 06 Jul 2016 17:43:11 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Kuninori Morimoto (2016-07-03 18:36:50)
> +struct clk *devm_of_clk_get(struct device *dev,
> +                           struct device_node *np, int index)

Any reason not to use devm_clk_get? Why do we need this helper?

Thanks,
Mike

> +{
> +       struct clk **ptr, *clk;
> +
> +       ptr =3D devres_alloc(devm_of_clk_release, sizeof(*ptr), GFP_KERNE=
L);
> +       if (!ptr)
> +               return ERR_PTR(-ENOMEM);
> +
> +       clk =3D of_clk_get(np, index);
> +       if (!IS_ERR(clk)) {
> +               *ptr =3D clk;
> +               devres_add(dev, ptr);
> +       } else {
> +               devres_free(ptr);
> +       }
> +
> +       return clk;
> +}
> +EXPORT_SYMBOL(devm_of_clk_get);
> +
>  static struct clk *__of_clk_get_by_name(struct device_node *np,
>                                         const char *dev_id,
>                                         const char *name)
> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index a89ba4e..33cd540 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -502,6 +502,8 @@ struct of_phandle_args;
>  =

>  #if defined(CONFIG_OF) && defined(CONFIG_COMMON_CLK)
>  struct clk *of_clk_get(struct device_node *np, int index);
> +struct clk *devm_of_clk_get(struct device *dev,
> +                           struct device_node *np, int index);
>  struct clk *of_clk_get_by_name(struct device_node *np, const char *name);
>  struct clk *of_clk_get_from_provider(struct of_phandle_args *clkspec);
>  #else
> @@ -509,6 +511,11 @@ static inline struct clk *of_clk_get(struct device_n=
ode *np, int index)
>  {
>         return ERR_PTR(-ENOENT);
>  }
> +static inline struct clk *devm_of_clk_get(struct device *dev,
> +                           struct device_node *np, int index)
> +{
> +       return ERR_PTR(-ENOENT);
> +}
>  static inline struct clk *of_clk_get_by_name(struct device_node *np,
>                                              const char *name)
>  {
> -- =

> 1.9.1
>=20
