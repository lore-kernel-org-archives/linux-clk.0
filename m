Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC071F4735;
	Tue,  7 Jan 2025 20:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736281443; cv=none; b=CQ3gBQ1rVVpIlGz4w2gB2eFkmzER7okmmn0QIMVAIMsMG7OQue4RA+aavsNvZklouqbUga5a+HlguVUtBZ5kuM7KbTd6DNBe1dqRgNaEjO41geWNt/1LIpLemmwsAoHBAgp1L3SfBK6E3pFGV70TnNVUbuOnz0sS6ZUFrJUguW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736281443; c=relaxed/simple;
	bh=AGK21nJDJqln4qp3F++5HFB9eqH6QBeEwHDVcONqlfo=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=e3nUZvA7XWNXOqG3yFp3EXSYRrp96vZFBlk8fgaI4CgLDxOHm+FJzcc1T+xLmYT/W4wOjwIKqQh1/9kudprflBCGwGzovyteanciUoClae+CfSu/rjHBXt0L7nd48P1LziXeQqlyBQgFzL8klQQP098AZVa0lejs5cIFvblxJGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YwrW8sJT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YwrW8sJT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F2C3C4CED6;
	Tue,  7 Jan 2025 20:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736281442;
	bh=AGK21nJDJqln4qp3F++5HFB9eqH6QBeEwHDVcONqlfo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=YwrW8sJTzQ1ADc7SCIYLtWfOqJ0BHflh4LLnUU8Ho2W6qeJye0EPYwKivZXmEnGq/
	 InM1irgp3dYKzoh9TisxXZwjk+U9HDauIPB0CnFVZ3tg6zEN+xX2Ut09A07+WNQJxo
	 Td4+TWFo/jvsSRxkfBbptTAWjtGhPxk802uUnflrR5+y0FHoKmIqbuCym9ozxp4I0I
	 SPYEFPuhRyVQuqrDXsUh4CqYR7bQ9OGnoETxizTO7OyaqkfL7PRcsNe62jsTcMgGYA
	 hAMBQhVZvK3jxdIaPPIuxY95dQ71GJkOKBHMXV2afhUdQ0XjSOIE9/IgnP9Pa7NptU
	 6uQW6ztmcGpeQ==
Message-ID: <24f5db9f33ba52cf34288411a27c700b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241231202018.3956166-3-paulha@opensource.cirrus.com>
References: <20241231202018.3956166-1-paulha@opensource.cirrus.com> <20241231202018.3956166-3-paulha@opensource.cirrus.com>
Subject: Re: [RESEND PATCH v5 2/2] clk: cs2600: Add Fractional-N clock driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: patches@opensource.cirrus.com, Paul Handrigan <paulha@opensource.cirrus.com>
To: Paul Handrigan <paulha@opensource.cirrus.com>, conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, linux-clk@vger.kernel.org, mturquette@baylibre.com, robh@kernel.org
Date: Tue, 07 Jan 2025 12:24:00 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Paul Handrigan (2024-12-31 12:20:18)
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 713573b6c86c..6b279ebf9c80 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -209,6 +209,15 @@ config COMMON_CLK_CS2000_CP
>         help
>           If you say yes here you get support for the CS2000 clock multip=
lier.
> =20
> +config COMMON_CLK_CS2600
> +       tristate "Clock driver for CS2600 Fractional-N Clock Synthesizer =
& Clock Multiplier"
> +       depends on I2C
> +       depends on OF

Drop this as I don't see how it has a build time dependency.

> +       select REGMAP_I2C
> +       help
> +         If you say yes here you get support for the CS2600 clock synthe=
sizer
> +         and multiplier.
> +
>  config COMMON_CLK_EN7523
>         bool "Clock driver for Airoha EN7523 SoC system clocks"
>         depends on OF
> diff --git a/drivers/clk/clk-cs2600.c b/drivers/clk/clk-cs2600.c
> new file mode 100644
> index 000000000000..3623ba67f87c
> --- /dev/null
> +++ b/drivers/clk/clk-cs2600.c
> @@ -0,0 +1,1177 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// CS2600  --  CIRRUS LOGIC Fractional-N Clock Synthesizer & Clock Multi=
plier
> +//
> +// Copyright (C) 2024 Cirrus Logic, Inc. and
> +//                    Cirrus Logic International Semiconductor Ltd.
> +
> +#include <linux/clk.h>

This shouldn't be included as this is a clk provider, not a consumer.

> +#include <linux/clk-provider.h>
> +#include <linux/container_of.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +
> +#include "clk-cs2600.h"

Please inline the contents of this header into the one driver.

> +
> +#define hw_to_cs2600_clk(_hw)  container_of(_hw, struct cs2600_clk_hw, h=
w)
> +
[...]
> +
> +
> +static int cs2600_pll_out_is_prepared(struct clk_hw *hw)
> +{
> +       struct cs2600_clk_hw *clk_hw =3D hw_to_cs2600_clk(hw);
> +       struct regmap *regmap =3D clk_hw->priv->regmap;
> +
> +       return regmap_test_bits(regmap, CS2600_PLL_CFG1, CS2600_PLL_EN1);
> +}
> +
> +

Nitpick: Remove extra newline.

> +static int cs2600_pll_out_prepare(struct clk_hw *hw)
> +{
> +       struct cs2600_clk_hw *clk_hw =3D hw_to_cs2600_clk(hw);
> +       struct regmap *regmap =3D clk_hw->priv->regmap;
> +       struct cs2600 *cs2600 =3D clk_hw->priv;
> +       int i;
> +
> +       if (regmap_test_bits(regmap, CS2600_PLL_CFG1, CS2600_PLL_EN1))
> +               return 0;
> +
> +       cs2600_set_freeze(cs2600);
> +       regmap_set_bits(regmap, CS2600_PLL_CFG1, CS2600_PLL_EN1);
> +       cs2600_clear_freeze(cs2600);
> +       regmap_set_bits(regmap, CS2600_PLL_CFG2, CS2600_PLL_EN2);
> +
> +       regmap_write(regmap, CS2600_UNLOCK_INDICATORS, CS2600_CLEAR_INDIC=
ATORS);
> +
> +       usleep_range(1000, 1100);
> +       for (i =3D 0; i < CS2600_LOCK_ATTEMPTS_MAX; i++) {
> +               if (!regmap_test_bits(regmap, CS2600_UNLOCK_INDICATORS,
> +                                     CS2600_F_UNLOCK_STICKY))
> +                       return 0;
> +
> +               regmap_write(regmap, CS2600_UNLOCK_INDICATORS,
> +                            CS2600_CLEAR_INDICATORS);
> +               usleep_range(200, 300);
> +       }
> +
> +       cs2600_set_freeze(cs2600);
> +       regmap_clear_bits(regmap, CS2600_PLL_CFG1, CS2600_PLL_EN1);
> +       cs2600_clear_freeze(cs2600);
> +       regmap_clear_bits(regmap, CS2600_PLL_CFG2, CS2600_PLL_EN2);
> +
> +       dev_err(cs2600->dev, "PLL did not lock\n");
> +       return -ETIMEDOUT;
> +}
> +
> +

Nitpick: Remove extra newline.

> +static void cs2600_pll_out_unprepare(struct clk_hw *hw)
> +{
> +       struct cs2600_clk_hw *clk_hw =3D hw_to_cs2600_clk(hw);
> +       struct regmap *regmap =3D clk_hw->priv->regmap;
> +       struct cs2600 *cs2600 =3D clk_hw->priv;
> +
> +       cs2600_set_freeze(cs2600);
> +       regmap_clear_bits(regmap, CS2600_PLL_CFG1, CS2600_PLL_EN1);
> +       cs2600_clear_freeze(cs2600);
> +       regmap_clear_bits(regmap, CS2600_PLL_CFG2, CS2600_PLL_EN2);
> +}
> +
> +static int cs2600_pll_out_set_parent(struct clk_hw *hw, u8 index)
> +{
> +       struct cs2600_clk_hw *clk_hw =3D hw_to_cs2600_clk(hw);
> +       struct regmap *regmap =3D clk_hw->priv->regmap;
> +       struct cs2600 *cs2600 =3D clk_hw->priv;
> +
> +       /*CLK_IN is always the parent in smart mode */
> +       if (cs2600_is_smart_mode(cs2600))
> +               return 0;
> +
> +       if (index > CS2600_CLK_IN_INPUT) {
> +               dev_err(cs2600->dev, "Invalid parent index %d", index);
> +               return -EINVAL;
> +       }
> +
> +       cs2600_set_freeze(cs2600);
> +       regmap_update_bits(regmap, CS2600_PLL_CFG2,
> +                          CS2600_PLL_MODE_SEL, index);
> +       cs2600_clear_freeze(cs2600);
> +
> +       return 0;
> +}
> +
> +static u8 cs2600_pll_out_get_parent(struct clk_hw *hw)
> +{
> +       struct cs2600_clk_hw *clk_hw =3D hw_to_cs2600_clk(hw);
> +       struct regmap *regmap =3D clk_hw->priv->regmap;
> +       struct cs2600 *cs2600 =3D clk_hw->priv;
> +
> +       if (cs2600_is_smart_mode(cs2600))
> +               return CS2600_CLK_IN_INPUT;
> +
> +       return (u8)regmap_test_bits(regmap, CS2600_PLL_CFG2,
> +                                   CS2600_PLL_MODE_SEL);
> +}
> +
> +static int cs2600_clk_out_prepare(struct clk_hw *hw)
> +{
> +       struct cs2600_clk_hw *clk_hw =3D hw_to_cs2600_clk(hw);
> +       struct regmap *regmap =3D clk_hw->priv->regmap;
> +       struct cs2600 *cs2600 =3D clk_hw->priv;
> +
> +       cs2600_set_freeze(cs2600);
> +       regmap_clear_bits(regmap, CS2600_PLL_CFG1, CS2600_CLK_OUT_DIS);
> +       cs2600_clear_freeze(cs2600);
> +
> +       return 0;
> +}
> +
> +static void cs2600_clk_out_unprepare(struct clk_hw *hw)
> +{
> +       struct cs2600_clk_hw *clk_hw =3D hw_to_cs2600_clk(hw);
> +       struct regmap *regmap =3D clk_hw->priv->regmap;
> +       struct cs2600 *cs2600 =3D clk_hw->priv;
> +
> +       cs2600_set_freeze(cs2600);
> +       regmap_set_bits(regmap, CS2600_PLL_CFG1, CS2600_CLK_OUT_DIS);
> +       cs2600_clear_freeze(cs2600);
> +}
> +
> +static int cs2600_clk_out_is_prepared(struct clk_hw *hw)
> +{
> +       struct cs2600_clk_hw *clk_hw =3D hw_to_cs2600_clk(hw);
> +       struct regmap *regmap =3D clk_hw->priv->regmap;
> +
> +       return !regmap_test_bits(regmap, CS2600_PLL_CFG1, CS2600_CLK_OUT_=
DIS);
> +}
> +
> +struct cs2600_clk_div {
> +       int div;
> +       unsigned int val;
> +};

Use struct clk_div_table? Doubtful the 'div' needs to be signed.

> +
> +static const struct cs2600_clk_div cs2600_bclk_div[] =3D {
> +       { 1, CS2600_BCLK_DIV(0x0) },
> +       { 2, CS2600_BCLK_DIV(0x1) },
> +       { 3, CS2600_BCLK_DIV(0x2) },
> +       { 4, CS2600_BCLK_DIV(0x3) },
> +       { 6, CS2600_BCLK_DIV(0x4) },
> +       { 8, CS2600_BCLK_DIV(0x5) },
> +       { 12, CS2600_BCLK_DIV(0x6) },
> +       { 16, CS2600_BCLK_DIV(0x7) },
> +       { 24, CS2600_BCLK_DIV(0x8) },
> +       { 32, CS2600_BCLK_DIV(0x9) },
> +       { 48, CS2600_BCLK_DIV(0xA) }
> +};
> +
[...]
> +
> +static int cs2600_fsync_determine_rate(struct clk_hw *hw,
> +                                      struct clk_rate_request *req)
> +{
> +       struct cs2600_clk_hw *clk_hw =3D hw_to_cs2600_clk(hw);
> +       unsigned long parent_rate, freq_var, calc_rate;
> +       unsigned long ppm =3D CS2600_12_20_PPM;
> +       struct cs2600 *cs2600 =3D clk_hw->priv;
> +       int i;
> +
> +       if (req->rate > CS2600_FSYNC_OUT_MAX

Style nitpick, the || goes on the line above.

> +           || req->rate < CS2600_FSYNC_OUT_MIN) {
> +               dev_err(cs2600->dev, "Invalid fsync rate %lu", req->rate);

These error messages need newlines in them.

> +               return -EINVAL;
> +       }
> +
> +       if (regmap_test_bits(cs2600->regmap, CS2600_PLL_CFG3, CS2600_RATI=
O_CFG))
> +               ppm =3D CS2600_20_12_PPM;
> +
> +       freq_var =3D cs2600_get_freq_variation(cs2600, req->rate, ppm);
> +
> +       for (i =3D 0; i < ARRAY_SIZE(cs2600_fsync_div); i++) {
> +               calc_rate =3D req->best_parent_rate / cs2600_fsync_div[i]=
.div;
> +               if (in_range(req->rate, calc_rate - freq_var,
> +                   calc_rate + freq_var))
> +                       return 0;
> +       }
> +
> +       if (req->best_parent_rate) {
> +               dev_err(cs2600->dev,
> +                       "FSYNC_OUT cannot be derived from the parent rate=
");
> +               return -EPERM;
> +       }
> +
> +       /* Change parent rate to accommodate the FSYNC rate */
> +
> +       for (i =3D 0; i < ARRAY_SIZE(cs2600_fsync_div); i++) {
> +               parent_rate =3D req->rate * cs2600_fsync_div[i].div;
> +               if (parent_rate > CS2600_CLK_OUT_MAX ||
> +                   parent_rate < CS2600_CLK_OUT_MIN)
> +                       continue;
> +
> +               req->best_parent_rate =3D parent_rate;
> +               return 0;
> +       }
> +
> +       dev_err(cs2600->dev, "Cannot determine parent rate\n");
> +       return -EINVAL;
> +}
> +
> +static unsigned long cs2600_fsync_recalc_rate(struct clk_hw *hw,
> +                                             unsigned long parent_rate)
> +{
> +       struct cs2600_clk_hw *clk_hw =3D hw_to_cs2600_clk(hw);
> +       struct regmap *regmap =3D clk_hw->priv->regmap;
> +       struct cs2600 *cs2600 =3D clk_hw->priv;
> +       unsigned int val;
> +       int i;
> +
> +       regmap_read(regmap, CS2600_OUTPUT_CFG1, &val);
> +
> +       for (i =3D 0; i < ARRAY_SIZE(cs2600_fsync_div); i++) {
> +               if (cs2600_fsync_div[i].val =3D=3D (val & CS2600_FSYNC_DI=
V_MASK))
> +                       return (parent_rate / cs2600_fsync_div[i].div);
> +       }
> +
> +       dev_err(cs2600->dev, "Cannot find fsync divide value\n");
> +       return 0;
> +}
> +
> +static int cs2600_fsync_prepare(struct clk_hw *hw)
> +{
> +       struct cs2600_clk_hw *clk_hw =3D hw_to_cs2600_clk(hw);
> +       struct regmap *regmap =3D clk_hw->priv->regmap;
> +       struct cs2600 *cs2600 =3D clk_hw->priv;
> +
> +       regmap_set_bits(regmap, CS2600_PHASE_ALIGNMENT_CFG1,
> +                       CS2600_PHASE_ALIGN_EN | CS2600_PHASE_ALIGN_STB_EN=
);
> +
> +       cs2600_set_freeze(cs2600);
> +       regmap_clear_bits(regmap, CS2600_OUTPUT_CFG1, CS2600_FSYNC_OUT_DI=
S);
> +       cs2600_clear_freeze(cs2600);
> +
> +       return 0;
> +}
> +
> +static void cs2600_fsync_unprepare(struct clk_hw *hw)
> +{
> +       struct cs2600_clk_hw *clk_hw =3D hw_to_cs2600_clk(hw);
> +       struct regmap *regmap =3D clk_hw->priv->regmap;
> +       struct cs2600 *cs2600 =3D clk_hw->priv;
> +
> +       if (regmap_test_bits(regmap, CS2600_OUTPUT_CFG1, CS2600_BCLK_OUT_=
DIS))
> +               regmap_clear_bits(regmap, CS2600_PHASE_ALIGNMENT_CFG1,
> +                                 CS2600_PHASE_ALIGN_EN |
> +                                 CS2600_PHASE_ALIGN_STB_EN);
> +
> +       cs2600_set_freeze(cs2600);
> +       regmap_set_bits(regmap, CS2600_OUTPUT_CFG1, CS2600_FSYNC_OUT_DIS);

Does regmap support an unlock and lock sequence? Maybe the regmap can
have cs2600_set_freeze() as the "lock" callback and
cs2600_clear_freeze() as the "unlock" callback? That could grab a mutex
as well. Then we can just have regmap calls here instead of the
set/clear braces.

> +       cs2600_clear_freeze(cs2600);
> +}
> +
> +static int cs2600_fsync_is_prepared(struct clk_hw *hw)
> +{
> +       struct cs2600_clk_hw *clk_hw =3D hw_to_cs2600_clk(hw);
> +       struct regmap *regmap =3D clk_hw->priv->regmap;
> +
> +       return !regmap_test_bits(regmap, CS2600_OUTPUT_CFG1,
> +                                CS2600_FSYNC_OUT_DIS);
> +}
> +
[...]
> +
> +static int cs2600_clk_get(struct cs2600 *cs2600)
> +{
> +       struct clk *clk_in, *ref_clk;
> +
> +       clk_in =3D devm_clk_get_optional(cs2600->dev, "clk_in");
> +       if (IS_ERR(clk_in))
> +               return PTR_ERR(clk_in);
> +
> +       ref_clk =3D devm_clk_get_optional(cs2600->dev, "xti");
> +       if (IS_ERR(ref_clk))
> +               return PTR_ERR(ref_clk);
> +
> +       cs2600->ref_clk =3D ref_clk;
> +       cs2600->clk_in =3D clk_in;
> +
> +       return 0;
> +}
> +
> +static struct clk_hw *cs2600_of_clk_get(struct of_phandle_args *clkspec,
> +                                       void *data)
> +{
> +       unsigned int idx =3D clkspec->args[0];
> +       struct cs2600 *cs2600 =3D data;
> +
> +       /* PLL_OUT is an internal clock */
> +       if (idx > CS2600_OUT_CLK_MAX - 1) {
> +               dev_err(cs2600->dev, "Invalid clock index %d\n", idx);
> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       return &cs2600->hw[idx].hw;
> +}
> +
> +static int cs2600_clk_register(struct cs2600 *cs2600)
> +{
> +       struct device_node *np =3D cs2600->dev->of_node;
> +       static const char *parent_names[2];
> +       int ret, i, input_num =3D 0;
> +       const char *name;
> +
> +       if (cs2600->ref_clk)
> +               parent_names[input_num++] =3D __clk_get_name(cs2600->ref_=
clk);
> +
> +       if (cs2600->clk_in)
> +               parent_names[input_num++] =3D __clk_get_name(cs2600->clk_=
in);

Use struct clk_parent_data with dt index numbers instead of clk_get()
and __clk_get_name().

> +
> +       cs2600->hw[CS2600_PLL_OUT].init.name =3D cs2600_clks[CS2600_PLL_O=
UT].name;
> +       cs2600->hw[CS2600_PLL_OUT].init.ops =3D &cs2600_clks[CS2600_PLL_O=
UT].ops;
> +       cs2600->hw[CS2600_PLL_OUT].init.parent_names =3D parent_names;
> +       cs2600->hw[CS2600_PLL_OUT].init.num_parents =3D input_num;
> +       cs2600->hw[CS2600_PLL_OUT].hw.init =3D &cs2600->hw[CS2600_PLL_OUT=
].init;
> +       cs2600->hw[CS2600_PLL_OUT].priv =3D cs2600;
> +
> +       ret =3D devm_clk_hw_register(cs2600->dev, &cs2600->hw[CS2600_PLL_=
OUT].hw);
> +       if (ret)
> +               return ret;
> +
> +       for (i =3D 1; i < ARRAY_SIZE(cs2600->hw); i++) {
> +               if (of_property_read_string_index(np, "clock-output-names=
",
> +                   i - 1, &name))
> +                       name =3D cs2600_clks[i].name;

Preferably this isn't used, because the property should be optional. Can
you make up some name by combining the device name and the clk name?

> +
> +               cs2600->hw[i].init.name =3D name;
> +               cs2600->hw[i].init.ops =3D &cs2600_clks[i].ops;
> +
> +               /* CLK_OUT is the only parent for BCLK_OUT and FSYNC_OUT =
*/
> +               cs2600->hw[i].init.parent_names =3D
> +                                       &cs2600->hw[CS2600_PLL_OUT].init.=
name;
> +               cs2600->hw[i].init.num_parents =3D 1;
> +               cs2600->hw[i].init.flags =3D cs2600_clks[i].flags;
> +               cs2600->hw[i].hw.init =3D &cs2600->hw[i].init;
> +               cs2600->hw[i].priv =3D cs2600;
> +
> +               ret =3D devm_clk_hw_register(cs2600->dev, &cs2600->hw[i].=
hw);
> +               if (ret)
> +                       return ret;

No dev_err_probe() for this one?

> +       }
> +
> +       return devm_of_clk_add_hw_provider(cs2600->dev, cs2600_of_clk_get,
> +                                          cs2600);

No dev_err_probe() for this one?

> +}
> +
> +static int cs2600_set_mode(struct cs2600 *cs2600, const char *mode)
> +{
> +       if (!strncmp(mode, "smart_mode", sizeof("smart_mode")))
> +               cs2600->mode =3D CS2600_SMART_MODE;
> +       else if (!strncmp(mode, "smart_clkin_only_mode",
> +                sizeof("SMART_CLKIN_ONLY_MODE")))
> +               cs2600->mode =3D CS2600_SMART_CLKIN_ONLY_MODE;
> +       else
> +               return dev_err_probe(cs2600->dev, -EINVAL,
> +                                    "Invalid clock mode %s\n", mode);
> +
> +       return 0;
> +}
> +
> +static int cs2600_set_aux_output(struct cs2600 *cs2600, const char *aux_=
out)
> +{
> +       unsigned int val;
> +
> +       if (!strncmp(aux_out, "freq_unlock", sizeof("freq_unlock")))
> +               val =3D CS2600_AUX_OUT_FREQ_UNLOCK_VAL;
> +       else if (!strncmp(aux_out, "phase_unlock", sizeof("phase_unlock")=
))
> +               val =3D CS2600_AUX_OUT_PHASE_UNLOCK_VAL;
> +       else if (!strncmp(aux_out, "no_clkin", sizeof("no_clkin")))
> +               val =3D CS2600_AUX_OUT_NO_CLKIN_VAL;
> +       else
> +               return dev_err_probe(cs2600->dev, -EINVAL,
> +                                    "Invalid aux output %s\n", aux_out);
> +
> +       return regmap_update_bits(cs2600->regmap, CS2600_OUTPUT_CFG2,
> +                                 CS2600_AUX1OUT_SEL, CS2600_AUXOUT1_SRC(=
val));
> +}
> +
> +static int cs2600_parse_dt_params(struct cs2600 *cs2600)
> +{
> +       struct regmap *regmap =3D cs2600->regmap;
> +       struct device *dev =3D cs2600->dev;
> +       const char *val;
> +       int ret =3D 0;
> +
> +       cs2600_set_freeze(cs2600);
> +       if (!device_property_read_string(dev, "cirrus,aux-output-source",=
 &val)) {

It looks like we can use device_property_match_property_string() instead an=
d then
the code is clearer because we can index into the array. Hopefully a
NULL entry also works so we can have something like

	const char * const output_source[] =3D {
		[CS2600_AUX_OUT_FREQ_UNLOCK_VAL] =3D "freq_unlock",
		[CS2600_AUX_OUT_PHASE_UNLOCK_VAL] =3D "phase_unlock",
		[CS2600_AUX_OUT_NO_CLKIN_VAL] =3D "no_clkin"
	};

	val =3D device_property_match_property_string(dev, "cirrus,aux-output-sour=
ce",=20
		output_source, ARRAY_SIZE(output_source);
	if (val < 0)
		return val;

	ret =3D cs2600_set_aux_output(cs2600, val);

> +               ret =3D cs2600_set_aux_output(cs2600, val);
> +               if (ret) {
> +                       cs2600_clear_freeze(cs2600);
> +                       return ret;
> +               }
> +       } else {
> +               /* Set to HiZ if not used */
> +               regmap_set_bits(regmap, CS2600_PLL_CFG1, CS2600_AUX1_OUT_=
DIS);
> +       }
> +
> +       if (!device_property_read_string(dev, "cirrus,clock-mode", &val))
> +               ret =3D cs2600_set_mode(cs2600, val);
> +
> +       cs2600_clear_freeze(cs2600);
> +
> +       return ret;
> +}
> +
> +static int cs2600_check_device_id(struct cs2600 *cs2600)
> +{
> +       struct device *dev =3D cs2600->dev;
> +       unsigned int dev_id, rev;
> +       int ret;
> +
> +       ret =3D regmap_read(cs2600->regmap, CS2600_DEVICE_ID1, &dev_id);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Can't read device ID\n");
> +
> +       if (dev_id !=3D CS2600_DEVICE_ID_VALUE)
> +               return dev_err_probe(dev, -ENODEV, "Invalid device id 0x%=
x\n",
> +                                    dev_id);
> +
> +       ret =3D regmap_read(cs2600->regmap, CS2600_DEVICE_ID2, &rev);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Can't read device revisio=
n\n");
> +
> +       dev_dbg(dev, "Device ID %x Rev %x", dev_id, rev);
> +
> +       return 0;
> +}
> +
> +static int cs2600_i2c_probe(struct i2c_client *client)
> +{
> +       struct device *dev =3D &client->dev;
> +       struct cs2600 *cs2600;
> +       int ret;
> +
> +       cs2600 =3D devm_kzalloc(dev, sizeof(*cs2600), GFP_KERNEL);
> +       if (!cs2600)
> +               return -ENOMEM;
> +
> +       ret =3D devm_regulator_get_enable(dev, "vdd");
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Error with vdd supply\n");
> +
> +       cs2600->dev =3D dev;
> +       i2c_set_clientdata(client, cs2600);
> +
> +       cs2600->regmap =3D devm_regmap_init_i2c(client, &cs2600_regmap_co=
nfig);
> +       if (IS_ERR(cs2600->regmap))
> +               return dev_err_probe(dev, PTR_ERR(cs2600->regmap),
> +                                    "Regmap not created\n");
> +
> +       /* Required to wait at least 20ms after vdd is enabled */
> +       usleep_range(20000, 21000);
> +       ret =3D cs2600_check_device_id(cs2600);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D regmap_write(cs2600->regmap, CS2600_SW_RESET, CS2600_SW_R=
ST_VAL);
> +       if (ret)
> +               return ret;
> +
> +       /* Required to wait at least 5ms after software reset */
> +       usleep_range(5000, 6000);

Please use async probe if we're going to sleep in probe.

> +       ret =3D cs2600_clk_get(cs2600);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Invalid parent clocks\n");
> +
> +       /* Set output clocks to HiZ */
> +       cs2600_set_freeze(cs2600);
> +       regmap_set_bits(cs2600->regmap, CS2600_PLL_CFG1, CS2600_CLK_OUT_D=
IS);
> +       regmap_set_bits(cs2600->regmap, CS2600_OUTPUT_CFG1,
> +                       CS2600_BCLK_OUT_DIS | CS2600_FSYNC_OUT_DIS);
> +       cs2600_clear_freeze(cs2600);
> +
> +       ret =3D cs2600_parse_dt_params(cs2600);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Cannot parse dt params\n"=
);
> +
> +       ret =3D cs2600_clk_register(cs2600);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Cannot register clocks\n"=
);
> +
> +       if (cs2600->ref_clk) {
> +               cs2600->refclk_rate =3D clk_get_rate(cs2600->ref_clk);

The ref clk rate should be parent_rate in the clk_ops::set_rate().

> +               regmap_update_bits(cs2600->regmap, CS2600_PLL_CFG3,
> +                                  CS2600_SYSCLK_SRC_MASK,
> +                                  CS2600_SYSCLK_SRC_REFCLK);
> +       } else {
> +               cs2600->refclk_rate =3D CS2600_INTERNAL_OSC_RATE;
> +               regmap_update_bits(cs2600->regmap, CS2600_PLL_CFG3,
> +                                  CS2600_SYSCLK_SRC_MASK,
> +                                  CS2600_SYSCLK_SRC_OSC);
> +       }
