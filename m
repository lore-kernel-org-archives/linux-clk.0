Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D10C4332F
	for <linux-clk@archiver.kernel.org>; Tue,  4 Oct 2022 18:30:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbiJDS1R (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Oct 2022 14:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbiJDS07 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Oct 2022 14:26:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65122696C0;
        Tue,  4 Oct 2022 11:26:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EA7A2614F8;
        Tue,  4 Oct 2022 18:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DCD3C433D6;
        Tue,  4 Oct 2022 18:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664908016;
        bh=zgnqROChjdTQLc4YoSzOMSbYGywiltP1DM97WmjV2pI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hQSN0WkARapCjhs95AbBbQcHlGNEKKcturyB3Z78Tk1ad/vIL/xfpOoYy2UxOMuoR
         2/NFEfm1ct2LzVuffvcle2c4Z4Da20XolhuBFmH3jg9lJUIA2DBYiNN1gmzDL15etW
         vkplJIfha1K7mcVpUwKPs5KtOf1+JMYD3BqlVzGZsrz6ODYro0pZU/+bbB16TnmZmx
         1o2OJPE0Epm3sSJy8IiWoqQl5WPrCiZEs0Ez9b49xhGw0hzvkt6MpS6rpE7Kk+WK3+
         QW6XxB9hE4Uic7A3V0sFUbA2ACjhAUK8U9EWFSHVXjauQMgkmFeMUBW6tWG4qDydIz
         zj8NLtw/qCvCw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220924174517.458657-1-marex@denx.de>
References: <20220924174517.458657-1-marex@denx.de>
Subject: Re: [PATCH v4] clk: Introduce 'always-on-clocks' property
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Vasut <marex@denx.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date:   Tue, 04 Oct 2022 11:26:52 -0700
User-Agent: alot/0.10
Message-Id: <20221004182656.4DCD3C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2022-09-24 10:45:17)
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index b70769d0db99f..6b07f1a086277 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3900,6 +3900,48 @@ static void clk_core_free_parent_map(struct clk_co=
re *core)
>         kfree(core->parents);
>  }
> =20
> +static void
> +__clk_register_critical_clock(struct clk_core *core, struct clk_hw *hw)
> +{
> +       struct device_node *np =3D core->of_node;
> +       struct of_phandle_args clkspec;
> +       u32 clksize, clktotal;
> +       int ret, i, index;
> +
> +       if (!np)
> +               return;
> +
> +       if (of_property_read_u32(np, "#clock-cells", &clksize))
> +               return;
> +
> +       /* Clock node with #clock-cells =3D <0> uses always-on-clocks; */
> +       if (clksize =3D=3D 0) {
> +               if (of_property_read_bool(np, "always-on-clocks"))
> +                       core->flags |=3D CLK_IS_CRITICAL;

Why must we set the CLK_IS_CRITICAL flag like this? Instead, when the
clk provider is registered, parse the node of the provider and get the
clks to call clk_prepare_enable() on. We can set the critical flag or
make a new flag that causes clk_disable_unprepare() to not actually turn
the clk off, if we have some sort of underflow issue with other
consumers. Does that fail somehow?

> +               return;
> +       }
> +
> +       if (!core->ops->match_clkspec)
> +               return;
> +
> +       clkspec.np =3D np;
> +       clktotal =3D of_property_count_u32_elems(np, "always-on-clocks");
> +       clktotal /=3D clksize;
> +       for (index =3D 0; index < clktotal; index++) {
> +               for (i =3D 0; i < clksize; i++) {

I'm mainly thinking that we're going to spin on this loop constantly for
any clk providers that have many clks to register, but only a few to
keep always on. It would be best to avoid that and only run through the
DT property once.

> +                       ret =3D of_property_read_u32_index(np, "always-on=
-clocks",
> +                                                        (index * clksize=
) + i,
> +                                                        &(clkspec.args[i=
]));
> +                       if (ret) {
> +                               pr_warn("Skipping always-on-clocks index =
%d (ret=3D%d)\n",
> +                                       i, ret);
> +                       }
> +               }
> +               if (!core->ops->match_clkspec(hw, &clkspec))

This callback is provider specific, and not necessarily clk_hw specific.
For example, the clk_ops could be for a generic gate bit, but the
provider wants to keep that gate always on. To implement such a clk we
would have to copy the generic gate clk_ops and set this match_clkspec
op. I'd like to avoid that if possible. If the clk_op must exist, then
perhaps it should be in clk_init_data, which is sort of the place where
we put provider specific information for a clk, i.e. clk_parent_data.

> +                       core->flags |=3D CLK_IS_CRITICAL;
> +       }
> +}
> +
>  static struct clk *
>  __clk_register(struct device *dev, struct device_node *np, struct clk_hw=
 *hw)
>  {
