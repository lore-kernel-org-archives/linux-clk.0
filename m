Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jerome Brunet <jbrunet@baylibre.com>, "Stephen Boyd" <sboyd@codeaurora.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20171219083329.24746-1-jbrunet@baylibre.com>
Cc: "Jerome Brunet" <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20171219083329.24746-1-jbrunet@baylibre.com>
Message-ID: <151371269985.45969.1347953441522058335@resonance>
Subject: Re: [PATCH v2] clk: check ops pointer on clock register
Date: Tue, 19 Dec 2017 11:44:59 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting Jerome Brunet (2017-12-19 00:33:29)
> Nothing really prevents a provider from (trying to) register a clock
> without providing the clock ops structure.
> =

> We do check the individual fields before using them, but not the
> structure pointer itself. This may have the usual nasty consequences when
> the pointer is dereferenced, most likely when checking one the field
> during the initialization.
> =

> This is fixed by returning an error on clock register if the ops pointer
> is NULL.
> =

> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Applied to clk-check-ops-ptr

Regards,
Mike

> ---
> Changes since v1:
>  * Add WARN_ON so the error cannot be silently ignored
>  * Remove fixes tag
> =

>  drivers/clk/clk.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> =

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 8a1860a36c77..211f97e8dc65 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2683,7 +2683,13 @@ struct clk *clk_register(struct device *dev, struc=
t clk_hw *hw)
>                 ret =3D -ENOMEM;
>                 goto fail_name;
>         }
> +
> +       if (WARN_ON(!hw->init->ops)) {
> +               ret =3D -EINVAL;
> +               goto fail_ops;
> +       }
>         core->ops =3D hw->init->ops;
> +
>         if (dev && pm_runtime_enabled(dev))
>                 core->dev =3D dev;
>         if (dev && dev->driver)
> @@ -2745,6 +2751,7 @@ struct clk *clk_register(struct device *dev, struct=
 clk_hw *hw)
>                 kfree_const(core->parent_names[i]);
>         kfree(core->parent_names);
>  fail_parent_names:
> +fail_ops:
>         kfree_const(core->name);
>  fail_name:
>         kfree(core);
> -- =

> 2.14.3
>=20
