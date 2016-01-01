Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
 linux-clk@vger.kernel.org, tony@atomide.com, sboyd@codeaurora.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1450447141-29936-7-git-send-email-t-kristo@ti.com>
Cc: linux-arm-kernel@lists.infradead.org
References: <1450447141-29936-1-git-send-email-t-kristo@ti.com>
 <1450447141-29936-7-git-send-email-t-kristo@ti.com>
Message-ID: <20160101054815.21738.79820@quark.deferred.io>
Subject: Re: [RFC 6/9] clk: ti: add support for omap4 module clocks
Date: Thu, 31 Dec 2015 21:48:15 -0800
List-ID: <linux-clk.vger.kernel.org>

Hi Tero,

Quoting Tero Kristo (2015-12-18 05:58:58)
> Previously, hwmod core has been used for controlling the hwmod level
> clocks. This has certain drawbacks, like being unable to share the
> clocks for multiple users, missing usecounting and generally being
> totally incompatible with common clock framework.
> =

> Add support for new clock type under the TI clock driver, which will
> be used to convert all the existing hwmdo clocks to. This helps to
> get rid of the clock related hwmod data from kernel and instead
> parsing this from DT.

I'm really happy to see this series. Looks pretty good to me.

> +static int _omap4_hwmod_clk_enable(struct clk_hw *hw)
> +{
> +       struct clk_hw_omap *clk =3D to_clk_hw_omap(hw);
> +       u32 val;
> +       int timeout =3D 0;
> +       int ret;
> +
> +       if (!clk->enable_bit)
> +               return 0;
> +
> +       if (clk->clkdm) {
> +               ret =3D ti_clk_ll_ops->clkdm_clk_enable(clk->clkdm, hw->c=
lk);
> +               if (ret) {
> +                       WARN(1,
> +                            "%s: could not enable %s's clockdomain %s: %=
d\n",
> +                            __func__, clk_hw_get_name(hw),
> +                            clk->clkdm_name, ret);
> +                       return ret;
> +               }
> +       }
> +
> +       val =3D ti_clk_ll_ops->clk_readl(clk->enable_reg);
> +
> +       val &=3D ~OMAP4_MODULEMODE_MASK;
> +       val |=3D clk->enable_bit;
> +
> +       ti_clk_ll_ops->clk_writel(val, clk->enable_reg);
> +
> +       /* Wait until module is enabled */
> +       while (!_omap4_is_ready(val)) {
> +               udelay(1);

This should really be a .prepare callback if you plan to keep the delays
in there.

Regards,
Mike
