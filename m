Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E648AEB64D9
	for <linux-clk@archiver.kernel.org>; Sat, 17 Jun 2023 04:51:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230350AbjFQEvC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 17 Jun 2023 00:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbjFQEvB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 17 Jun 2023 00:51:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA19B10C1;
        Fri, 16 Jun 2023 21:50:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 397A4602F9;
        Sat, 17 Jun 2023 04:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D24C433C0;
        Sat, 17 Jun 2023 04:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686977458;
        bh=/aWGA4s/FeMvvOrvWAXJ7yS9FfI2srk9041Ke8B/zdY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=noLtYmsOLbs0CCzTkVEBydFLuMoyXS0gyYje4jESOXirci7AVATbr/q1EDRophJhj
         3JtdN3Iq8UYXECLQyLwL12eEj4nKHXm0zP6NIjg4G736F7KM59Z7SCymouGNZDIRLY
         xzsyybJAkV4f4JVyoTerdx/ofCxPiEYL8xhAzZuuyo2R35+534AXXGHsN+EttqPru3
         Dam43dussvEoSYfMJf0tch6FCXPUhJV5xnvSGBB1QKy7NksVZ82jjadOdEO9c/AjhS
         e+CIJ/ocC/enKi8lnmpuUC0vt9SY+jqdoxRBldXyU54ApZ3gwFJkqvmVOdkDkJ3z9x
         6Q5P6qzcpos/Q==
Message-ID: <e115cf2b1f2feebee894d9755cc1a8f1.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230606105016.31364-3-shubhrajyoti.datta@amd.com>
References: <20230606105016.31364-1-shubhrajyoti.datta@amd.com> <20230606105016.31364-3-shubhrajyoti.datta@amd.com>
Subject: Re: [PATCH v4 2/2] clocking-wizard: Add support for versal clocking wizard
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     git@amd.com, devicetree@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, michal.simek@xilinx.com,
        mturquette@baylibre.com
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        linux-clk@vger.kernel.org
Date:   Fri, 16 Jun 2023 21:50:56 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shubhrajyoti Datta (2023-06-06 03:50:16)
> The Clocking Wizard for Versal adaptive compute acceleration platforms.
> Add Versal clocking wizard support.

Maybe you can elaborate on the differences from the existing device
support here. The register layout is slightly different? How so?

>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
>=20
> Changes in v4:
> Update changelog
> Fix warn
> Previously we had tried to upstream [1] separate driver for
> clocking wizard. It was decided to add support to the current
> driver. So abandoning the series.
> [1] https://lore.kernel.org/all/20221122121255.6823-1-shubhrajyoti.datta@=
amd.com/
>=20
> Changes in v3:
> rename the clocks to clk_in1 and s_axi_clk dt
> rename the clocks to clk_in1 and s_axi_clk in driver
>=20
> Changes in v2:
> rename the clocks clk_in1 to in1 and s_axi_clk to s_axi in dt
> rename the clocks clk_in1 to in1 and s_axi_clk to s_axi in driver
> update the warn
> Update the compatible to reflect versal
>=20
>  drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 507 ++++++++++++++++-----
>  1 file changed, 402 insertions(+), 105 deletions(-)
>=20
> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xil=
inx/clk-xlnx-clock-wizard.c
> index e83f104fad02..737ab31678c1 100644
> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> @@ -23,15 +23,41 @@
>  #define WZRD_NUM_OUTPUTS       7
>  #define WZRD_ACLK_MAX_FREQ     250000000UL
> =20
> -#define WZRD_CLK_CFG_REG(n)    (0x200 + 4 * (n))
> +#define WZRD_CLK_CFG_REG(v, n) (0x200 + 0x130 * (v) + 4 * (n))

'v' is for 'is_versal' so I'm trying to figure out why the 'base' isn't
adjusted instead?

> =20
>  #define WZRD_CLKOUT0_FRAC_EN   BIT(18)
> -#define WZRD_CLKFBOUT_FRAC_EN  BIT(26)
> +#define WZRD_CLKFBOUT_1                0
> +#define WZRD_CLKFBOUT_2                1
> +#define WZRD_CLKOUT0_1         2
> +#define WZRD_CLKOUT0_2         3
> +#define WZRD_DESKEW_2          20
[...]
> @@ -152,23 +195,42 @@ static unsigned long clk_wzrd_recalc_rate(struct cl=
k_hw *hw,
>  {
>         struct clk_wzrd_divider *divider =3D to_clk_wzrd_divider(hw);
>         void __iomem *div_addr =3D divider->base + divider->offset;
> -       unsigned int val;
> +       u32 div, p5en, edge, prediv2, all;
> +       unsigned int val, vall, valh;
> =20
> -       val =3D readl(div_addr) >> divider->shift;
> -       val &=3D div_mask(divider->width);
> +       if (!divider->is_versal) {
> +               val =3D readl(div_addr) >> divider->shift;
> +               val &=3D div_mask(divider->width);
> =20
> -       return divider_recalc_rate(hw, parent_rate, val, divider->table,
> -                       divider->flags, divider->width);
> +               return divider_recalc_rate(hw, parent_rate, val, divider-=
>table,
> +                               divider->flags, divider->width);
> +       }
> +
> +       edge =3D !!(readl(div_addr) & WZRD_CLKFBOUT_EDGE);
> +       p5en =3D !!(readl(div_addr) & WZRD_P5EN);
> +       prediv2 =3D !!(readl(div_addr) & WZRD_CLKOUT0_PREDIV2);
> +       vall =3D readl(div_addr + 4) & WZRD_CLKFBOUT_L_MASK;
> +       valh =3D readl(div_addr + 4) >> WZRD_CLKFBOUT_H_SHIFT;
> +       all =3D valh + vall + edge;
> +       if (!all)
> +               all =3D 1;
> +
> +       if (prediv2)
> +               div =3D 2 * all + prediv2 * p5en;
> +       else
> +               div =3D all;
> +
> +       return DIV_ROUND_UP_ULL((u64)parent_rate, div);

This looks very different. Can we just have two different set of clk_ops
instead? They can and should share code if they can, but try to avoid
pushing an 'is_versal' condition throughout the code. It makes it
impossible to read and fairly messy.

>  }
> =20
>  static int clk_wzrd_dynamic_reconfig(struct clk_hw *hw, unsigned long ra=
te,
>                                      unsigned long parent_rate)
>  {
> -       int err;
> -       u32 value;
> -       unsigned long flags =3D 0;
>         struct clk_wzrd_divider *divider =3D to_clk_wzrd_divider(hw);
>         void __iomem *div_addr =3D divider->base + divider->offset;
> +       u32 value, regh, edged, p5en, p5fedge, regval, regval1;
> +       unsigned long flags =3D 0;
> +       int err;
> =20
>         if (divider->lock)
>                 spin_lock_irqsave(divider->lock, flags);
> @@ -177,26 +239,54 @@ static int clk_wzrd_dynamic_reconfig(struct clk_hw =
*hw, unsigned long rate,
> =20
>         value =3D DIV_ROUND_CLOSEST(parent_rate, rate);
> =20
> -       /* Cap the value to max */
> -       min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);
> -
> -       /* Set divisor and clear phase offset */
> -       writel(value, div_addr);
> -       writel(0x00, div_addr + WZRD_DR_DIV_TO_PHASE_OFFSET);
> -
> -       /* Check status register */
> -       err =3D readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFF=
SET,
> -                                value, value & WZRD_DR_LOCK_BIT_MASK,
> -                                WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
> -       if (err)
> -               goto err_reconfig;
> -
> -       /* Initiate reconfiguration */
> -       writel(WZRD_DR_BEGIN_DYNA_RECONF_5_2,
> -              divider->base + WZRD_DR_INIT_REG_OFFSET);
> -       writel(WZRD_DR_BEGIN_DYNA_RECONF1_5_2,
> -              divider->base + WZRD_DR_INIT_REG_OFFSET);
> -
> +       if (!divider->is_versal) {
> +               /* Cap the value to max */
> +               min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);
> +
> +               /* Set divisor and clear phase offset */
> +               writel(value, div_addr);
> +               writel(0x00, div_addr + WZRD_DR_DIV_TO_PHASE_OFFSET);
> +
> +               /* Check status register */
> +               err =3D readl_poll_timeout(divider->base + WZRD_DR_STATUS=
_REG_OFFSET,
> +                                        value, value & WZRD_DR_LOCK_BIT_=
MASK,
> +                                        WZRD_USEC_POLL, WZRD_TIMEOUT_POL=
L);
> +               if (err)
> +                       goto err_reconfig;
> +
> +               /* Initiate reconfiguration */
> +               writel(WZRD_DR_BEGIN_DYNA_RECONF_5_2,
> +                      divider->base + WZRD_DR_INIT_REG_OFFSET);
> +               writel(WZRD_DR_BEGIN_DYNA_RECONF1_5_2,
> +                      divider->base + WZRD_DR_INIT_REG_OFFSET);
> +
> +       } else {
> +               regh =3D (value / 4);
> +               regval1 =3D readl(div_addr);
> +               regval1 |=3D WZRD_CLKFBOUT_PREDIV2;
> +               regval1 =3D regval1 & ~(WZRD_CLKFBOUT_EDGE | WZRD_P5EN | =
WZRD_P5FEDGE);
> +               if (value % 4 > 1) {
> +                       edged =3D 1;
> +                       regval1 |=3D (edged << WZRD_EDGE_SHIFT);
> +               }
> +               p5fedge =3D value % 2;
> +               p5en =3D value % 2;
> +               regval1 =3D regval1 | p5en << WZRD_P5EN_SHIFT | p5fedge <=
< WZRD_P5FEDGE_SHIFT;
> +               writel(regval1, div_addr);
> +
> +               regval =3D regh | regh << WZRD_CLKFBOUT_H_SHIFT;
> +               writel(regval, div_addr + 4);
> +               /* Check status register */
> +               err =3D readl_poll_timeout(divider->base + WZRD_DR_STATUS=
_REG_OFFSET,
> +                                        value, value & WZRD_DR_LOCK_BIT_=
MASK,
> +                                        WZRD_USEC_POLL, WZRD_TIMEOUT_POL=
L);
> +               if (err)
> +                       goto err_reconfig;
> +
> +               /* Initiate reconfiguration */
> +               writel(WZRD_DR_BEGIN_DYNA_RECONF,
> +                      divider->base + WZRD_DR_INIT_VERSAL_OFFSET);
> +       }
>         /* Check status register */
>         err =3D readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFF=
SET,
>                                  value, value & WZRD_DR_LOCK_BIT_MASK,

This function could also be split and duplication extracted to some
common function instead of sticking an if-else into it.

> @@ -227,14 +317,35 @@ static int clk_wzrd_get_divisors(struct clk_hw *hw,=
 unsigned long rate,
>                                  unsigned long parent_rate)
>  {
>         struct clk_wzrd_divider *divider =3D to_clk_wzrd_divider(hw);
> -       unsigned long vco_freq, freq, diff;
> +       u64 vco_freq, freq, diff, vcomin, vcomax;
>         u32 m, d, o;
> +       u32 mmin, mmax, dmin, dmax, omin, omax;
> +
> +       if (divider->is_versal) {
> +               mmin =3D VER_WZRD_M_MIN;
> +               mmax =3D VER_WZRD_M_MAX;
> +               dmin =3D VER_WZRD_D_MIN;
> +               dmax =3D VER_WZRD_D_MAX;
> +               omin =3D VER_WZRD_O_MIN;
> +               omax =3D VER_WZRD_O_MAX;
> +               vcomin =3D VER_WZRD_VCO_MIN;
> +               vcomax =3D VER_WZRD_VCO_MAX;
> +       } else {
> +               mmin =3D WZRD_M_MIN;
> +               mmax =3D WZRD_M_MAX;
> +               dmin =3D WZRD_D_MIN;
> +               dmax =3D WZRD_D_MAX;
> +               omin =3D WZRD_O_MIN;
> +               omax =3D WZRD_O_MAX;
> +               vcomin =3D WZRD_VCO_MIN;
> +               vcomax =3D WZRD_VCO_MAX;
> +       }

Same?

> =20
> -       for (m =3D WZRD_M_MIN; m <=3D WZRD_M_MAX; m++) {
> -               for (d =3D WZRD_D_MIN; d <=3D WZRD_D_MAX; d++) {
> +       for (m =3D mmin; m <=3D mmax; m++) {
> +               for (d =3D dmin; d <=3D dmax; d++) {
>                         vco_freq =3D DIV_ROUND_CLOSEST((parent_rate * m),=
 d);
> -                       if (vco_freq >=3D WZRD_VCO_MIN && vco_freq <=3D W=
ZRD_VCO_MAX) {
> -                               for (o =3D WZRD_O_MIN; o <=3D WZRD_O_MAX;=
 o++) {
> +                       if (vco_freq >=3D vcomin && vco_freq <=3D vcomax)=
 {
> +                               for (o =3D omin; o <=3D omax; o++) {
>                                         freq =3D DIV_ROUND_CLOSEST_ULL(vc=
o_freq, o);
>                                         diff =3D abs(freq - rate);
> =20
> @@ -588,18 +816,34 @@ static int __maybe_unused clk_wzrd_resume(struct de=
vice *dev)
>  static SIMPLE_DEV_PM_OPS(clk_wzrd_dev_pm_ops, clk_wzrd_suspend,
>                          clk_wzrd_resume);
> =20
> +static const struct versal_clk_data versal_data =3D {
> +       .is_versal      =3D true,
> +};
> +
> +static const struct of_device_id clk_wzrd_ids[] =3D {
> +       { .compatible =3D "xlnx,versal-clk-wizard", .data =3D &versal_dat=
a },
> +       { .compatible =3D "xlnx,clocking-wizard"   },
> +       { .compatible =3D "xlnx,clocking-wizard-v5.2"   },
> +       { .compatible =3D "xlnx,clocking-wizard-v6.0"  },
> +       { },
> +};
> +MODULE_DEVICE_TABLE(of, clk_wzrd_ids);
> +
>  static int clk_wzrd_probe(struct platform_device *pdev)
>  {
> +       const char *clkout_name, *clk_name, *clk_mul_name;
> +       u32 regl, regh, edge, regld, reghd, edged, div;
> +       const struct versal_clk_data *data;
> +       const struct of_device_id *match;
>         int i, ret;
>         u32 reg, reg_f, mult;
>         unsigned long rate;
> -       const char *clk_name;
>         void __iomem *ctrl_reg;
>         struct clk_wzrd *clk_wzrd;
> -       const char *clkout_name;
>         struct device_node *np =3D pdev->dev.of_node;
>         int nr_outputs;
>         unsigned long flags =3D 0;
> +       bool is_versal =3D 0;
> =20
>         clk_wzrd =3D devm_kzalloc(&pdev->dev, sizeof(*clk_wzrd), GFP_KERN=
EL);
>         if (!clk_wzrd)
> @@ -647,27 +891,61 @@ static int clk_wzrd_probe(struct platform_device *p=
dev)
>                 goto err_disable_clk;
>         }
> =20
> +       match =3D of_match_node(clk_wzrd_ids, np);

Use device_get_match_data() instead so we don't have to move the match
table. The match data could simply be a bool too that gets casted to a
pointer in the match table.

> +       if (!match) {
> +               dev_err(&pdev->dev, "of_match_node failed\n");
> +               ret =3D -ENODEV;
> +               goto err_disable_clk;
> +       }
> +
> +       data =3D match->data;
> +       if (data)
> +               is_versal =3D data->is_versal;
> +
>         clkout_name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s_out0",=
 dev_name(&pdev->dev));
>         if (nr_outputs =3D=3D 1) {
>                 clk_wzrd->clkout[0] =3D clk_wzrd_register_divider
>                                 (&pdev->dev, clkout_name,
>                                 __clk_get_name(clk_wzrd->clk_in1), 0,
> -                               clk_wzrd->base, WZRD_CLK_CFG_REG(3),
> +                               clk_wzrd->base, WZRD_CLK_CFG_REG(is_versa=
l, 3),
>                                 WZRD_CLKOUT_DIVIDE_SHIFT,
>                                 WZRD_CLKOUT_DIVIDE_WIDTH,
>                                 CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW=
_ZERO,
> -                               DIV_ALL, &clkwzrd_lock);
> +                               DIV_ALL, is_versal, &clkwzrd_lock);
> =20
>                 goto out;
>         }
> -
> -       reg =3D readl(clk_wzrd->base + WZRD_CLK_CFG_REG(0));
> -       reg_f =3D reg & WZRD_CLKFBOUT_FRAC_MASK;
> -       reg_f =3D  reg_f >> WZRD_CLKFBOUT_FRAC_SHIFT;
> -
> -       reg =3D reg & WZRD_CLKFBOUT_MULT_MASK;
> -       reg =3D  reg >> WZRD_CLKFBOUT_MULT_SHIFT;
> -       mult =3D (reg * 1000) + reg_f;
> +       if (is_versal) {
> +               /* register multiplier */
> +               edge =3D !!(readl(clk_wzrd->base + WZRD_CLK_CFG_REG(is_ve=
rsal, 0)) &
> +                               BIT(8));
> +               regl =3D (readl(clk_wzrd->base + WZRD_CLK_CFG_REG(is_vers=
al, 1)) &
> +                            WZRD_CLKFBOUT_L_MASK) >> WZRD_CLKFBOUT_L_SHI=
FT;
> +               regh =3D (readl(clk_wzrd->base + WZRD_CLK_CFG_REG(is_vers=
al, 1)) &
> +                            WZRD_CLKFBOUT_H_MASK) >> WZRD_CLKFBOUT_H_SHI=
FT;
> +               mult =3D regl + regh + edge;
> +               if (!mult)
> +                       mult =3D 1;
> +               mult =3D mult * WZRD_FRAC_GRADIENT;
> +
> +               regl =3D readl(clk_wzrd->base + WZRD_CLK_CFG_REG(is_versa=
l, 51)) &
> +                            WZRD_CLKFBOUT_FRAC_EN;
> +               if (regl) {
> +                       regl =3D readl(clk_wzrd->base + WZRD_CLK_CFG_REG(=
is_versal, 48)) &
> +                               WZRD_VERSAL_FRAC_MASK;
> +                       mult =3D mult + regl;
> +               }
> +               div =3D 64;
> +       } else {
> +               reg =3D readl(clk_wzrd->base + WZRD_CLK_CFG_REG(is_versal=
, 0));
> +               reg_f =3D reg & WZRD_CLKFBOUT_FRAC_MASK;
> +               reg_f =3D  reg_f >> WZRD_CLKFBOUT_FRAC_SHIFT;
> +
> +               reg =3D reg & WZRD_CLKFBOUT_MULT_MASK;
> +               reg =3D  reg >> WZRD_CLKFBOUT_MULT_SHIFT;
> +               mult =3D (reg * 1000) + reg_f;
> +               div =3D 1000;
> +       }
>         clk_name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s_mul", dev=
_name(&pdev->dev));
>         if (!clk_name) {
>                 ret =3D -ENOMEM;
> @@ -793,14 +1098,6 @@ static void clk_wzrd_remove(struct platform_device =
*pdev)
>         clk_disable_unprepare(clk_wzrd->axi_clk);
>  }
> =20
> -static const struct of_device_id clk_wzrd_ids[] =3D {
> -       { .compatible =3D "xlnx,clocking-wizard" },
> -       { .compatible =3D "xlnx,clocking-wizard-v5.2" },
> -       { .compatible =3D "xlnx,clocking-wizard-v6.0" },
> -       { },
> -};
> -MODULE_DEVICE_TABLE(of, clk_wzrd_ids);

Don't move this.
