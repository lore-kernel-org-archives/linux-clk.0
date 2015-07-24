Return-Path: <mturquette@linaro.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Dan Carpenter <dan.carpenter@oracle.com>, 
From: Michael Turquette <mturquette@linaro.org>
In-Reply-To: <20150720214855.GA22901@mwanda>
Cc: linux-clk@vger.kernel.org, Tero Kristo <t-kristo@ti.com>
References: <20150720214855.GA22901@mwanda>
Message-ID: <20150724001848.642.48609@quantum>
Subject: re: ARM: OMAP4: clock: Convert to common clk
Date: Thu, 23 Jul 2015 17:18:48 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Dan Carpenter (2015-07-20 14:48:55)
> Hello Mike Turquette,
> =

> The patch 32cc002116b8: "ARM: OMAP4: clock: Convert to common clk"
> from Nov 10, 2012, leads to the following Smatch warning:
> =

>         drivers/clk/ti/clkt_dpll.c:213 omap2_init_dpll_parent()
>         warn: signedness bug returning '(-22)'
> =

> drivers/clk/ti/clkt_dpll.c
>    204  /* Public functions */
>    205  u8 omap2_init_dpll_parent(struct clk_hw *hw)
>         ^^
> =

>    206  {
>    207          struct clk_hw_omap *clk =3D to_clk_hw_omap(hw);
>    208          u32 v;
>    209          struct dpll_data *dd;
>    210  =

>    211          dd =3D clk->dpll_data;
>    212          if (!dd)
>    213                  return -EINVAL;
>                                ^^^^^^^
> Truncated to positive u8.

Thanks Dan.

Tero,

Looks like this still exists at line 237 in clk-next.

Regards,
Mike

> =

>    214  =

>    215          v =3D ti_clk_ll_ops->clk_readl(dd->control_reg);
>    216          v &=3D dd->enable_mask;
>    217          v >>=3D __ffs(dd->enable_mask);
>    218  =

>    219          /* Reparent the struct clk in case the dpll is in bypass =
*/
>    220          if (_omap2_dpll_is_in_bypass(v))
>    221                  return 1;
>    222  =

>    223          return 0;
>    224  }
> =

> regards,
> dan carpenter
