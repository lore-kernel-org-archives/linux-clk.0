Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F20BC678DB
	for <linux-clk@archiver.kernel.org>; Mon,  6 Mar 2023 01:06:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjCFBF7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 5 Mar 2023 20:05:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjCFBF6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 5 Mar 2023 20:05:58 -0500
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FCACD535
        for <linux-clk@vger.kernel.org>; Sun,  5 Mar 2023 17:05:57 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-536c02c9dfbso155388577b3.11
        for <linux-clk@vger.kernel.org>; Sun, 05 Mar 2023 17:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iXTV+ukgGZczlt36FuJ0b7ZG4x85hTYftSXbNYK5uHk=;
        b=fOOImfhLfHXcFZcHu92d/lCr17JqQdY2T9stTHCH7RCjlnPcEe+0Gim2e4qVqB7Q94
         YTNw/CJPWbXMVSE+dVYLjsVAutL13tUSdLxMda7s4ue9hqXTgoIkYaid7kABnWbflrA/
         5N/xSm4uSKLHXmLMGOvHSR5aIGFeOqKW2R1hI/69DUyAG6aEGdf0x1CikYfw3QRXF6xh
         wtjIoFXewVgyf2DAaERXmLSxfBc7xHMbUpnXZQCAGKl79UROkjytLsaq99JeNwHMW0HZ
         dEXfp2GChOlWpDXDLJomKL/GREz5iDTfrkMSCN3poJ3Tw0sdW0mDFChSrHF/Cv/W7yZc
         bm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iXTV+ukgGZczlt36FuJ0b7ZG4x85hTYftSXbNYK5uHk=;
        b=W/S5fUtjmQzx/2TS0cuK4H74hRf57YHcCOXgx7tlVgGXHJAKH3ahKjm1nb92Nuty+O
         n5KfYD3a0XCNZ++uNHOAbonY0X2C87G4/MKsZArdnql+tZ82X/0Jz/9lfofwfUH2TFTI
         rZesLbJk82u+WqV3YXWuS0h3oF+AqiuyTD9iU8iMO6r3uusIzh4mtMRp+utrfmEpYH//
         vsmmFhiZcKKW52hU+8/RLEsww9yFtvJ+Uy/tBVeHYa23nVs64BmUEMqsnpVZVrjTpe/K
         DVyuM8vrTXJwaz1M2U84H8l32aDFmEqeMe95YFV6RXQbTsZVsfswUYSibj1/t/vtr4u0
         obaw==
X-Gm-Message-State: AO0yUKWkf5pCHDOpjFrnN6OxfjgAKpZ/P/74kaPVx/5nZc1tbHnY9ive
        V8RSKIeBKajQoLvQU76jP607ev4Y/GchCe3OPZ8QPw==
X-Google-Smtp-Source: AK7set+7lvIlBhLLvJXHzgbS8cubojx3XgaQg6Z+VarHhAQh/lbPyzWpzmdpJzUCNZx+ECPmZBjiRjLApaHWLmg+5DQ=
X-Received: by 2002:a81:441e:0:b0:533:99bb:c299 with SMTP id
 r30-20020a81441e000000b0053399bbc299mr5626682ywa.3.1678064755110; Sun, 05 Mar
 2023 17:05:55 -0800 (PST)
MIME-Version: 1.0
References: <20230303-topic-rpmcc_sleep-v1-0-d9cfaf9b27a7@linaro.org> <20230303-topic-rpmcc_sleep-v1-2-d9cfaf9b27a7@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v1-2-d9cfaf9b27a7@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 6 Mar 2023 03:05:48 +0200
Message-ID: <CAA8EJpoaaVoKqb4hZhahqyAH5C1zh8Z_GdUjaffGKsV2xQ25oQ@mail.gmail.com>
Subject: Re: [PATCH RFT 02/20] clk: qcom: smd-rpm: Add .is_prepared hook
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 4 Mar 2023 at 15:27, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> From: Shawn Guo <shawn.guo@linaro.org>
>
> The RPM clocks are enabled/disabled through clk framework prepare/unprepare
> hooks.  Without .is_prepared hook, those unused RPM clocks will not be
> disabled by core function clk_unprepare_unused_subtree(), because
> clk_core_is_prepared() always returns 0.
>
> Add .is_prepared hook to clk_ops and return the clock prepare (enable)
> state, so that those unused RPM clocks can be disabled by clk framework.

Does it make any difference? Without this patch the clock framework
depends on core->prepare_count to judge whether the clock should be
unprepared. With this patch in place, it will depend on r->enabled,
which is more or less the same thing.
Probably there is one category, the prepared-but-not-enabled clocks.

>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> [Konrad: rebase, don't duplicate the enable func]
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index ecacfbc4a16c..cce7daa97c1e 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -438,6 +438,7 @@ static const struct clk_ops clk_smd_rpm_ops = {
>         .round_rate     = clk_smd_rpm_round_rate,
>         .recalc_rate    = clk_smd_rpm_recalc_rate,
>         .is_enabled     = clk_smd_rpm_is_enabled,
> +       .is_prepared    = clk_smd_rpm_is_enabled,
>  };
>
>  static const struct clk_ops clk_smd_rpm_branch_ops = {
> @@ -445,6 +446,7 @@ static const struct clk_ops clk_smd_rpm_branch_ops = {
>         .unprepare      = clk_smd_rpm_unprepare,
>         .recalc_rate    = clk_smd_rpm_recalc_rate,
>         .is_enabled     = clk_smd_rpm_is_enabled,
> +       .is_prepared    = clk_smd_rpm_is_enabled,
>  };
>
>  DEFINE_CLK_SMD_RPM_BRANCH_A(bi_tcxo, QCOM_SMD_RPM_MISC_CLK, 0, 19200000);
>
> --
> 2.39.2
>


-- 
With best wishes
Dmitry
