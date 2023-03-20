Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE41BC6FD1C
	for <linux-clk@archiver.kernel.org>; Mon, 20 Mar 2023 21:21:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjCTVVG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Mar 2023 17:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjCTVVG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Mar 2023 17:21:06 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF62D5BA2
        for <linux-clk@vger.kernel.org>; Mon, 20 Mar 2023 14:21:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 98F13B810BC
        for <linux-clk@vger.kernel.org>; Mon, 20 Mar 2023 21:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3805AC433EF;
        Mon, 20 Mar 2023 21:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679347261;
        bh=x6I9S1lGK6o4MSuZSnmVynR5hopBiJy13ULWh3RzYf8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BEzZGUoQyXqtBfGHFMl0DsdwZ0XWZ7KyKudFj/5yPhv06SHPG8wpaZ+0Ctiu6e+Kk
         /nDyV/4CdIPCviPjnxBHTWetb+JgoSXYbsRuYLpXzL5J/lyxYCKvR9yqP55d1JdfKE
         eFCfv7/jbhckOwfnnLvK90CwgX/Sl8ZBHj+3dM+VzHb83lUzwOlki67wz+2KZpNkax
         JcmQBVOtyVG/o5nrUEIJAf1iDndWhnrWORLbdlSjR3Zm3O/XvV4/3hG3vLLCXf7fJJ
         TXAArrPxCyDGvtVamWRaxCAjnzqMgqqaBWi96H4Jx2+InH+nLqW97WqmqALlZh9fjC
         5TZ97dYBfz3Zw==
Message-ID: <b76168cc3f328235bbb8bf9f195dbaf4.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230317073539.13288-1-shubhrajyoti.datta@amd.com>
References: <20230317073539.13288-1-shubhrajyoti.datta@amd.com>
Subject: Re: [PATCH v3] clocking-wizard: Support higher frequency accuracy
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     git@amd.com, mturquette@baylibre.com, michal.simek@xilinx.com
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        linux-clk@vger.kernel.org
Date:   Mon, 20 Mar 2023 14:20:58 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shubhrajyoti Datta (2023-03-17 00:35:39)
> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xil=
inx/clk-xlnx-clock-wizard.c
> index c495d709f9e2..6828911b6342 100644
> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> @@ -107,6 +129,9 @@ struct clk_wzrd_divider {
>         u8 width;
>         u8 flags;
>         const struct clk_div_table *table;
> +       u32 valuem;
> +       u32 valued;
> +       u32 valueo;

Can this just be 'm, d, o'? That 'value' prefix is not helpful.

>         spinlock_t *lock;  /* divider lock */
>  };
> =20
[...]
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
> +       vco_freq =3D DIV_ROUND_CLOSEST(parent_rate * divider->valuem, div=
ider->valued);
> +       rate_div =3D DIV_ROUND_CLOSEST_ULL((vco_freq * WZRD_FRAC_POINTS),=
 rate);
> +
> +       clockout0_div =3D div_u64(rate_div,  WZRD_FRAC_POINTS);
> +
> +       pre =3D DIV_ROUND_CLOSEST_ULL(vco_freq * WZRD_FRAC_POINTS, rate);
> +       f =3D (u32)(pre - (clockout0_div * WZRD_FRAC_POINTS));

Make 'f' a u32 instead of unsigned long and then drop the cast.

> +       f &=3D WZRD_CLKOUT_FRAC_MASK;
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
> +       return readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFS=
ET, value,
> +                                value & WZRD_DR_LOCK_BIT_MASK,
> +                                WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
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

Is there always a lock? Can we just always lock?

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

This needs to do math to figure out what the rate is going to be. We
can't just return the rate passed in.

> +}
> +
>  static const struct clk_ops clk_wzrd_clk_divider_ops =3D {
>         .round_rate =3D clk_wzrd_round_rate,
>         .set_rate =3D clk_wzrd_dynamic_reconfig,
>         .recalc_rate =3D clk_wzrd_recalc_rate,
>  };
>
