Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jun Nie <jun.nie@linaro.org>, sboyd@codeaurora.org, linux-clk@vger.kernel.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1468834877-22534-2-git-send-email-jun.nie@linaro.org>
Cc: "Jun Nie" <jun.nie@linaro.org>
References: <1468834877-22534-1-git-send-email-jun.nie@linaro.org>
 <1468834877-22534-2-git-send-email-jun.nie@linaro.org>
Message-ID: <146888697461.8780.15252981766159135683@resonance>
Subject: Re: [PATCH 2/3] clk: zx: Add clk helper and zx296718 clk method
Date: Mon, 18 Jul 2016 17:09:34 -0700
List-ID: <linux-clk.vger.kernel.org>

Hi Jun Nie,

Quoting Jun Nie (2016-07-18 02:41:16)
> +/* add a clock instance to the clock lookup table used for dt based look=
up */
> +void zx_clk_add_lookup(struct zx_clk_provider *clkp, struct clk *clk,
> +                      unsigned int id)
> +{
> +       if (clkp->clk_data.clks && id)
> +               clkp->clk_data.clks[id] =3D clk;
> +}

Can you use of_clk_hw_provider and statically initialize your clock
data? For one example of this, check out drivers/clk/meson/gxbb.c

Then you won't need this function.

> +static void __init _zx296718_clk_register_pll(struct zx_clk_provider *cl=
kp,
> +                                            struct zx_pll_clock *pll_clk,
> +                                            unsigned int nr_plls,
> +                                            void __iomem *base)
> +{
> +       struct clk_zx_pll *pll;
> +       struct clk *clk;
> +       struct clk_init_data init;
> +       unsigned int len;
> +
> +       if (pll_clk->rate_table) {
> +               pr_err("%s: fail to register clk %s as no config table\n",
> +                       __func__, pll_clk->name);
> +               return;
> +       }
> +
> +       pll =3D kzalloc(sizeof(*pll), GFP_KERNEL);
> +       if (!pll) {
> +               pr_err("%s: could not allocate pll clk %s\n",
> +                       __func__, pll_clk->name);
> +               return;
> +       }
> +
> +       init.name =3D pll_clk->name;
> +       init.flags =3D pll_clk->flags;
> +       init.parent_names =3D &pll_clk->parent_name;
> +       init.num_parents =3D pll_clk->parent_name ? 1 : 0;
> +       init.ops =3D &zx_pll_ops;
> +
> +       for (len =3D 0; pll_clk->rate_table[len].rate !=3D 0; )
> +               len++;
> +
> +       pll->count =3D len;
> +       pll->lookup_table =3D pll_clk->rate_table;
> +       pll->hw.init =3D &init;
> +       pll->reg_base =3D base + pll_clk->reg_offset;
> +       pll->pd_bit =3D pll_clk->pd_bit;
> +       pll->lock_bit =3D LOCK_FLAG;
> +
> +       clk =3D clk_register(NULL, &pll->hw);
> +       if (IS_ERR(clk)) {
> +               pr_err("%s: failed to register pll clock %s : %ld\n",
> +                       __func__, pll_clk->name, PTR_ERR(clk));
> +               kfree(pll);
> +               return;
> +       }
> +       zx_clk_add_lookup(clkp, clk, pll_clk->id);
> +}

It looks like you can get rid of all of these registration functions and
just pass your static init data into devm_clk_hw_register.

> +/*
> + * struct zx_fixed_factor_clock: information about fixed-factor clock
> + * @id: platform specific id of the clock.
> + * @name: name of this fixed-factor clock.
> + * @parent_name: parent clock name.
> + * @mult: fixed multiplication factor.
> + * @div: fixed division factor.
> + * @flags: optional fixed-factor clock flags.
> + */
> +struct zx_fixed_factor_clock {
> +       unsigned int            id;
> +       char                    *name;
> +       const char              *parent_name;
> +       unsigned long           mult;
> +       unsigned long           div;
> +       unsigned long           flags;
> +};

This sort of data type just reproduces what struct clk_fixed_factor can
already do. If you statically init the whole thing then you can store
the parent name as well. Something like:

	static struct clk_fixed_factor gxbb_fclk_div2 =3D {
		.mult =3D 1,
		.div =3D 2,
		.hw.init =3D &(struct clk_init_data){
			.name =3D "fclk_div2",
			.ops =3D &clk_fixed_factor_ops,
			.parent_names =3D (const char *[]){ "fixed_pll" },
			.num_parents =3D 1,
		},
	};

Regards,
Mike
