Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92AFDC6FD1F
	for <linux-clk@archiver.kernel.org>; Wed, 15 Mar 2023 01:09:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbjCOBJi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Mar 2023 21:09:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjCOBJh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Mar 2023 21:09:37 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4833F233F8
        for <linux-clk@vger.kernel.org>; Tue, 14 Mar 2023 18:09:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DE485B81C29
        for <linux-clk@vger.kernel.org>; Wed, 15 Mar 2023 01:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F50C433D2;
        Wed, 15 Mar 2023 01:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678842573;
        bh=3tH08speGawWaXwN0CwQOf7iVd9b8plRz/h5yYhQa64=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=nW6x/2w1xLE+fzgfUfi9ABMMlUKPhY6GxSvXsD4C831r6nnAJce20r8r/6fjGnYqW
         6pvYMhWuUj28uOvDfm5wKJZXqpDbtLhtJLH1o9IRvoX+PKclOU20qJgWmD9RFKNzE6
         0hwFEW5ZwfbMzZMUNQEqlle72hPUOJSMrPU1aTECO/RX0xvo93oUHm2JSyoS7FsfRL
         h6byZ7rZLJGUcoS169YBJ3o6LKLbhTxFGAyy+5Uo1SJJHEClQBiHjl6QLZdC6g/cV+
         1OVM3h6mpTTzzpnnsyJx00+oTvd/3N/LFR7+S0uFuQzlaX/0A4XHx82WV2SYY+J4pX
         Ue6fjWBieE6Zg==
Message-ID: <4f9e3c6c2b6d063f68b9a808e29144e8.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230112102644.28019-1-shubhrajyoti.datta@amd.com>
References: <20230112102644.28019-1-shubhrajyoti.datta@amd.com>
Subject: Re: [PATCH v2] clocking-wizard: Support higher frequency accuracy
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     git@amd.com, michal.simek@xilinx.com, mturquette@baylibre.com
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        linux-clk@vger.kernel.org
Date:   Tue, 14 Mar 2023 18:09:31 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shubhrajyoti Datta (2023-01-12 02:26:44)
> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xil=
inx/clk-xlnx-clock-wizard.c
> index eb1dfe7ecc1b..2c5f103f57a1 100644
> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> @@ -198,12 +222,144 @@ static long clk_wzrd_round_rate(struct clk_hw *hw,=
 unsigned long rate,
>         return *prate / div;
>  }
> =20
> +static int clk_wzrd_get_divisors(struct clk_hw *hw, unsigned long rate,
> +                                unsigned long parent_rate)
> +{
> +       struct clk_wzrd_divider *divider =3D to_clk_wzrd_divider(hw);
> +       u64 vco_freq, freq, diff;
> +       u32 m, d, o;
> +
> +       for (m =3D WZRD_M_MIN; m <=3D WZRD_M_MAX; m++) {
> +               for (d =3D WZRD_D_MIN; d <=3D WZRD_D_MAX; d++) {
> +                       vco_freq =3D DIV_ROUND_CLOSEST_ULL((u64)(parent_r=
ate * m), d);

Why the cast to u64?

> +                       if (vco_freq >=3D WZRD_VCO_MIN && vco_freq <=3D W=
ZRD_VCO_MAX) {
> +                               for (o =3D WZRD_O_MIN; o <=3D WZRD_O_MAX;=
 o++) {
> +                                       freq =3D DIV_ROUND_CLOSEST_ULL(vc=
o_freq, o);
> +                                       diff =3D abs(freq - rate);
> +
> +                                       if (diff < WZRD_MIN_ERR) {
> +                                               divider->valuem =3D m;
> +                                               divider->valued =3D d;
> +                                               divider->valueo =3D o;
> +                                               return 0;
> +                                       }
> +                               }
> +                       }
> +               }
> +       }
> +       return -EBUSY;
> +}
> +
> +static int clk_wzrd_dynamic_all_nolock(struct clk_hw *hw, unsigned long =
rate,
> +                                      unsigned long parent_rate)
> +{
> +       struct clk_wzrd_divider *divider =3D to_clk_wzrd_divider(hw);
> +       unsigned long vco_freq, rate_div, f, clockout0_div;
> +       u32 reg, pre, value;
> +       int err;
> +
> +       err =3D clk_wzrd_get_divisors(hw, rate, parent_rate);
> +       if (err)
> +               return err;
> +
> +       vco_freq =3D DIV_ROUND_CLOSEST((parent_rate * divider->valuem), d=
ivider->valued);

Why the extra parenthesis?

> +       rate_div =3D DIV_ROUND_CLOSEST((vco_freq * WZRD_FRAC_POINTS), rat=
e);

Why the extra parenthesis?

> +
> +       clockout0_div =3D rate_div / WZRD_FRAC_POINTS;
> +
> +       pre =3D DIV_ROUND_CLOSEST((vco_freq * WZRD_FRAC_POINTS), rate);

Why the extra parenthesis?

> +       f =3D (u32)(pre - (clockout0_div * WZRD_FRAC_POINTS));

Why the cast to u32? It's implicit via assignment.

> +       f =3D f & WZRD_CLKOUT_FRAC_MASK;

Use

	f &=3D WZRD_CLKOUT0_FRAC_MASK;

to simplify.

> +
> +       reg =3D FIELD_PREP(WZRD_CLKOUT_DIVIDE_MASK, clockout0_div) |
> +             FIELD_PREP(WZRD_CLKOUT0_FRAC_MASK, f);
> +
> +       writel(reg, divider->base + WZRD_CLK_CFG_REG(2));
> +       /* Set divisor and clear phase offset */
> +       reg =3D FIELD_PREP(WZRD_CLKFBOUT_MULT_MASK, divider->valuem) |
> +             FIELD_PREP(WZRD_DIVCLK_DIVIDE_MASK, divider->valued);
> +       writel(reg, divider->base + WZRD_CLK_CFG_REG(0));
> +       writel(divider->valueo, divider->base + WZRD_CLK_CFG_REG(2));
> +       writel(0, divider->base + WZRD_CLK_CFG_REG(3));
> +       /* Check status register */
> +       err =3D readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFF=
SET, value,
> +                                value & WZRD_DR_LOCK_BIT_MASK,
> +                                WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
> +       if (err)
> +               return -ETIMEDOUT;
> +
> +       /* Initiate reconfiguration */
> +       writel(WZRD_DR_BEGIN_DYNA_RECONF,
> +              divider->base + WZRD_DR_INIT_REG_OFFSET);
> +
> +       /* Check status register */
> +       err =3D readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFF=
SET, value,
> +                                value & WZRD_DR_LOCK_BIT_MASK,
> +                                WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
> +       if (err)
> +               return -ETIMEDOUT;
> +
> +       return 0;

How about

	return readl_poll_timeout(divider->base + ...);

> +}
> +
> +static int clk_wzrd_dynamic_all(struct clk_hw *hw, unsigned long rate,
> +                               unsigned long parent_rate)
> +{
> +       struct clk_wzrd_divider *divider =3D to_clk_wzrd_divider(hw);
> +       unsigned long flags =3D 0;
> +       int ret;
> +
> +       if (divider->lock)
> +               spin_lock_irqsave(divider->lock, flags);
> +       else
> +               __acquire(divider->lock);
> +
> +       ret =3D clk_wzrd_dynamic_all_nolock(hw, rate, parent_rate);
> +
> +       if (divider->lock)
> +               spin_unlock_irqrestore(divider->lock, flags);
> +       else
> +               __release(divider->lock);
> +
> +       return ret;
> +}
> +
> +static unsigned long clk_wzrd_recalc_rate_all(struct clk_hw *hw,
> +                                             unsigned long parent_rate)
> +{
> +       struct clk_wzrd_divider *divider =3D to_clk_wzrd_divider(hw);
> +       u32 m, d, o, div, reg, f;
> +
> +       reg =3D readl(divider->base + WZRD_CLK_CFG_REG(0));
> +       d =3D FIELD_GET(WZRD_DIVCLK_DIVIDE_MASK, reg);
> +       m =3D FIELD_GET(WZRD_CLKFBOUT_MULT_MASK, reg);
> +       reg =3D readl(divider->base + WZRD_CLK_CFG_REG(2));
> +       o =3D FIELD_GET(WZRD_DIVCLK_DIVIDE_MASK, reg);
> +       f =3D FIELD_GET(WZRD_CLKOUT0_FRAC_MASK, reg);
> +
> +       div =3D DIV_ROUND_CLOSEST(d * (WZRD_FRAC_POINTS * o + f), WZRD_FR=
AC_POINTS);
> +       return divider_recalc_rate(hw, parent_rate * m, div, divider->tab=
le,
> +                       divider->flags, divider->width);
> +}
> +
> +static long clk_wzrd_round_rate_all(struct clk_hw *hw, unsigned long rat=
e,
> +                                   unsigned long *prate)
> +{
> +       return rate;

Why can't we calculate a real rate? Callers of clk_round_rate() may want
to know the rate that is achievable.

> @@ -307,7 +463,7 @@ static struct clk *clk_wzrd_register_divf(struct devi=
ce *dev,
>         div->flags =3D clk_divider_flags;
>         div->lock =3D lock;
>         div->hw.init =3D &init;
> -       div->table =3D table;
> +       div->table =3D NULL;

Remove the line please. It's allocated with kzalloc().

> =20
>         hw =3D &div->hw;
>         ret =3D  devm_clk_hw_register(dev, hw);
> @@ -349,7 +510,7 @@ static struct clk *clk_wzrd_register_divider(struct d=
evice *dev,
>         div->flags =3D clk_divider_flags;
>         div->lock =3D lock;
>         div->hw.init =3D &init;
> -       div->table =3D table;
> +       div->table =3D NULL;

Remove the line please. It's allocated with kzalloc(). Is 'table' even
used anymore? I tried to follow it through the DIV_0 macro but got lost.

> =20
>         hw =3D &div->hw;
>         ret =3D devm_clk_hw_register(dev, hw);
> @@ -425,6 +586,7 @@ static int clk_wzrd_probe(struct platform_device *pde=
v)
>         const char *clk_name;
>         void __iomem *ctrl_reg;
>         struct clk_wzrd *clk_wzrd;
> +       const char *clkout_name;
>         struct device_node *np =3D pdev->dev.of_node;
>         int nr_outputs;
>         unsigned long flags =3D 0;
> @@ -469,6 +631,26 @@ static int clk_wzrd_probe(struct platform_device *pd=
ev)
>                 goto err_disable_clk;
>         }
> =20
> +       ret =3D of_property_read_u32(np, "xlnx,nr-outputs", &nr_outputs);
> +       if (ret || nr_outputs > WZRD_NUM_OUTPUTS) {
> +               ret =3D -EINVAL;
> +               goto err_disable_clk;
> +       }
> +
> +       clkout_name =3D kasprintf(GFP_KERNEL, "%s_out0", dev_name(&pdev->=
dev));

Probably needs to be devm_kasprintf() so that the allocation is freed on
probe failure.

> +       if (nr_outputs =3D=3D 1) {
> +               clk_wzrd->clkout[0] =3D clk_wzrd_register_divider
> +                               (&pdev->dev, clkout_name,
> +                               __clk_get_name(clk_wzrd->clk_in1), 0,
> +                               clk_wzrd->base, WZRD_CLK_CFG_REG(3),
