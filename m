Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ABA7C433EF
	for <linux-clk@archiver.kernel.org>; Mon,  4 Apr 2022 10:14:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244605AbiDDKQj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Apr 2022 06:16:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244282AbiDDKQi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Apr 2022 06:16:38 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EA242B1A6
        for <linux-clk@vger.kernel.org>; Mon,  4 Apr 2022 03:14:42 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id t25so16280509lfg.7
        for <linux-clk@vger.kernel.org>; Mon, 04 Apr 2022 03:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1u8sTNMQs2L/ZaOIByfE6JlFjQsvK2xKVc8qvoFdOPw=;
        b=QAVV3BjX88n2qMfMXixENf5xkuSaHNTxdWe0us6dP3B7yytOw/9vC3+0Lacw4YPmze
         Dr8c9nlgamXB3VyWl7j/NXmZMcRNq/tVyfiAnKsTZZrexrnmnJ0JS+cu3EjjSXLdbNQA
         Yk8aaUghMqt6nLpf8do2a1PEohg8sv3yWP4oSRKwEp0XCWFVoKa9u2Aa1J7oUiGEgB0T
         cUwITkvmS4++5xzqtni2Fna1kaloNV+a1IeyKo4sIBMi61W426I0fhon2+rhSmh5uL2z
         qdMgyBRjydTnfxQlU8JSE6i3bZECOMfCiCz8LrYn8FWn8l1ykNEFSZ62PGZH3Bs/m35X
         9NwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1u8sTNMQs2L/ZaOIByfE6JlFjQsvK2xKVc8qvoFdOPw=;
        b=4uXMZHja4vsLXRtfTQVir8//B6fb8IwsPC/QTZlMxIBtMjdtFh7mwK/wtdSpzjYizL
         okc6rH/90qPhNylYPJbobTSEbullovEjRVBF08Jkturqir5S8ctnn2fpzyw4ajyIctsd
         DEwJgpa93ZcWWNlatlrDbaC/VKJ7LuYEhTm54Ddar8vHM1bE76HSWC6DHKTtRrekiLXN
         YE8H6djAOGiFVpoNZCmlZdoYMMHoetesIa5ar1qKf7+Y7oMSe91t9KCZ4K5I4xk06UtM
         HpdQePQdPddBgeU4qNr4XaWHjLGfp5qyo141uiU1tWIlgC9Q/olJkxmjGlhCfcBakzFk
         Y5qg==
X-Gm-Message-State: AOAM530SSVBSds3UBcgxrvf3DgVMdqEiOv8t2cLopmx/rni13zdpGMOG
        Bk8LMV289KahWNuib/dAKhxezypV6/M/2aTV8bvOTg==
X-Google-Smtp-Source: ABdhPJwZImNew4tdoLpboVkwsg9nsiyhiSo0IFSMOa9PMe2LtpSbzDPRS4CnYEjWLznvW2sphO+/GM5PoF18NELcRW0=
X-Received: by 2002:a05:6512:2627:b0:44a:f55c:ded9 with SMTP id
 bt39-20020a056512262700b0044af55cded9mr5548447lfb.373.1649067280512; Mon, 04
 Apr 2022 03:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220319225156.1451636-1-linus.walleij@linaro.org> <20220319225156.1451636-6-linus.walleij@linaro.org>
In-Reply-To: <20220319225156.1451636-6-linus.walleij@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 4 Apr 2022 12:14:04 +0200
Message-ID: <CAPDyKFqm8BbBLOsc92aSoa1u0_DMo3KUxbq0tGavEwnQNHDHew@mail.gmail.com>
Subject: Re: [PATCH 5/5 v2] clk: ux500: Implement the missing CLKOUT clocks
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 20 Mar 2022 at 00:00, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This implements the two missing CLKOUT clocks for the ux500
> (well really U8500/DB8500) SoC.
>
> The clocks are initialized using a specific parent and
> divider and these are specified in the device tree, see
> the separate binding patch.
>
> The implementation is a bit different in that it will only
> create the clock in the clock framework if a user appears
> in the device tree, rather than it being registered upfront
> like most of the other clocks. This is because the clock
> needs parameters for source and divider from the consumer
> phandle for the clock to be set up properly when the clock
> is registered.
>
> There could be more than one user of a CLKOUT clock, but
> we have not seen this in practice. If this happens the
> framework prints and info and returns the previously
> registered clock.
>
> Using the clocks requires also muxing the CLKOUT1 or
> CLKOUT2 to the appropriate pad. In practice this is
> achived in a pinctrl handle in the DTS node for the device
> using the CLKOUT clock, so this muxing is done separately
> from the clock itself. Example:
>
>   haptic@49 {
>     compatible = "immersion,isa1200";
>     reg = <0x49>;
>     (...)
>     /* clkout1 from ACLK divided by 8 */
>     clocks = <&clkout_clk DB8500_CLKOUT_1 DB8500_CLKOUT_SRC_ACLK 8>;
>     pinctrl-names = "default";
>     pinctrl-0 = <&isa1200_janice_default>;
>   };
>
>   isa1200_janice_default: isa1200_janice {
>     /* Bring out clkout1 on pin GPIO227 pin AH7 */
>     janice_mux {
>       function = "clkout";
>       groups = "clkout1_a_1";
>     };
>     janice_cfg1 {
>       pins = "GPIO227_AH7";
>       ste,config = <&out_lo>;
>     };
>   (...)
>
> This was tested successfully with the Immersion ISA1200
> haptic feedback unit on the Samsung Galaxy S Advance GT-I9070
> (Janice) mobile phone.
>
> As the CLKOUT clocks need some undefined fixed rate parent
> clocks that are currently missing from the PRCMU clock
> implementation, the three simplest are added in this patch:
> clk38m_to_clkgen, aclk and sysclk. The only parent not yet
> available in the implementation is clk009, which is a kind
> of special muxed and divided clock which isn't even
> implemented in the vendor clock driver.
>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Drop the custom software .is_enabled tracking.
> - Drop the custom software .is_prepared tracking.
> - Use clk_hw_* calls and struct clk_hw all over.
> - Fix const-correctness with const * const on the parent
>   table
> - Use u32 for the DT cell values, drop pointless < 0 check
> - Reference ab8500_sysclk rather than creating a second
>   instance of sysclk
> - Drop extra paranthesis around expressions in
>    if ((divider == 0) || (divider > 63))
> ---
>  drivers/clk/ux500/clk-prcmu.c    | 115 +++++++++++++++++++++++++++++++
>  drivers/clk/ux500/clk.h          |   5 ++
>  drivers/clk/ux500/u8500_of_clk.c |  88 +++++++++++++++++++++--
>  3 files changed, 201 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/clk/ux500/clk-prcmu.c b/drivers/clk/ux500/clk-prcmu.c
> index 4c1f3a6f5eb5..4c3ea84c9474 100644
> --- a/drivers/clk/ux500/clk-prcmu.c
> +++ b/drivers/clk/ux500/clk-prcmu.c

[...]

> +static unsigned long clk_prcmu_clkout_recalc_rate(struct clk_hw *hw,
> +                                                 unsigned long parent_rate)
> +{
> +       struct clk_prcmu_clkout *clk = to_clk_prcmu_clkout(hw);
> +
> +       if (!clk->divider)
> +               return 0;

Nitpick: clk->divider can't be 0, as a clock with such configuration
is prevented from being registered.

> +       return (parent_rate / clk->divider);
> +}

[...]

Other than this very minor thing, this looks good to me.

Kind regards
Uffe
