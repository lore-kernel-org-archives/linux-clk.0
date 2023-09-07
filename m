Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F8AEEC873F
	for <linux-clk@archiver.kernel.org>; Thu,  7 Sep 2023 15:46:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233638AbjIGPql (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Sep 2023 11:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243314AbjIGPg2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Sep 2023 11:36:28 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE7112136
        for <linux-clk@vger.kernel.org>; Thu,  7 Sep 2023 08:36:03 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3a9f87adfe1so784154b6e.1
        for <linux-clk@vger.kernel.org>; Thu, 07 Sep 2023 08:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694100957; x=1694705757; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ovU/2FxJPAjDLCUg/8wOJ1lYtXOuaSxCgEubikhoGHQ=;
        b=G6D9hHznc/TifRH0JR3p9+QwWSwTDEir/p2utA/9I0xkbW4CKSH6Hw85s4RjcFwmex
         j+00q9HQskCHwBAJU/M6IrrLTJVlLvJuXJEd+cZKk7zRxmE8o6y/hOREeh/oWlUhBjTL
         yowmgvW7JyJLkVN4NEJxmX4eg8sI1iCNiMwZf+YVGrHPnwYxOIKLKK/DIB6J3XdHjyLV
         TR3Q41nFp1Gb7XuXDd+H6OBlnlARhmFMjID+lmyvT31OP2dhTRsJm9bYzcEdZ7Nogt+N
         yM6uwZ5nf2bpkrIbQvb50m+hlkgfUW5nReiwbiY5eibOX5+4YV85UNAkriIDvPnu+PUH
         1UlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694100957; x=1694705757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ovU/2FxJPAjDLCUg/8wOJ1lYtXOuaSxCgEubikhoGHQ=;
        b=kIFTpyXEOzUWal3e106G2T0PY2xSMLBKe4AkJPhHFiEauJ1/K6MMCSOfoCGXkpLSHN
         XtFVYlKgW9J/84nIB16Yj8d6LgHYgUwgQj6rRjI2S171pf+fxqLSGJqz9ZeRdvgm4y2U
         QV30CugGhFqhAhEJ5R79avi8DvTJbFHp+Mq10fM+3T0eVfPtXC3LpIYDzzrLTVI0jITV
         QWVwfVLiMo04vdHhuuI0Lvp5S9jkKb3YDbKs/o3ACADGbUC+BsGHUZbBHt/8SRv95tjZ
         9V40f4/C1IgRw19+Gkp51E0rETBwZyMro4SPGKvzV/3wDk9BZCCF3lcQCV7qvCUdnB5o
         vFHQ==
X-Gm-Message-State: AOJu0Yzphygt9oWGezPaN9Jn1yZkp79gcFeTBKakOHf08Qn6cxyEg7z9
        WfvBSAG/CtdO3Xa/ZqVnc3eRvhuT/KybO2KXqJ8IL33QhRJuDmrppXk=
X-Google-Smtp-Source: AGHT+IGgGELYVKv2nxaDzcRi7A6G5VIgfNHh71hrLRfSFiCDzzZExTZrNatFtyjQnKvxF58qCdkuFUnRMrIuFGcEb1g=
X-Received: by 2002:a25:ad03:0:b0:d7b:8c90:ce5b with SMTP id
 y3-20020a25ad03000000b00d7b8c90ce5bmr19553639ybi.63.1694093984119; Thu, 07
 Sep 2023 06:39:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693996662.git.quic_varada@quicinc.com> <18a3bc0c5b371deec5c4bbe6ceacf8afcf0bc640.1693996662.git.quic_varada@quicinc.com>
In-Reply-To: <18a3bc0c5b371deec5c4bbe6ceacf8afcf0bc640.1693996662.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 7 Sep 2023 16:39:33 +0300
Message-ID: <CAA8EJpoZ_8zXn9RcZQ+dV+hOpYBZQtD7oUQxWQYUqfTN+X=+7A@mail.gmail.com>
Subject: Re: [PATCH v1 01/10] clk: qcom: clk-alpha-pll: introduce stromer plus ops
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     ilia.lin@kernel.org, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, rafael@kernel.org,
        viresh.kumar@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        quic_kathirav@quicinc.com, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 7 Sept 2023 at 08:22, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> Stromer plus APSS PLL does not support dynamic frequency scaling.
> To switch between frequencies, we have to shut down the PLL,
> configure the L and ALPHA values and turn on again. So introduce the
> separate set of ops for Stromer Plus PLL.
>
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 68 ++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |  1 +
>  2 files changed, 69 insertions(+)
>
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index e4ef645..2ef81f7 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -2479,3 +2479,71 @@ const struct clk_ops clk_alpha_pll_stromer_ops = {
>         .set_rate = clk_alpha_pll_stromer_set_rate,
>  };
>  EXPORT_SYMBOL_GPL(clk_alpha_pll_stromer_ops);
> +
> +static int clk_alpha_pll_stromer_plus_determine_rate(struct clk_hw *hw,
> +                                                    struct clk_rate_request *req)
> +{
> +       struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +       u32 l, alpha_width = pll_alpha_width(pll);
> +       u64 a;
> +
> +       req->rate = alpha_pll_round_rate(req->rate, req->best_parent_rate, &l,
> +                                        &a, alpha_width);
> +       return 0;
> +}

What is the plL_alpha_width on stromer_plus? Does
clk_alpha_pll_stromer_determine_rate() work for you?

> +
> +static int clk_alpha_pll_stromer_plus_set_rate(struct clk_hw *hw,
> +                                              unsigned long rate,
> +                                              unsigned long prate)
> +{
> +       struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +       u32 l, alpha_width = pll_alpha_width(pll);
> +       int ret;
> +       u64 a;
> +
> +       rate = alpha_pll_round_rate(rate, prate, &l, &a, alpha_width);
> +
> +       regmap_write(pll->clkr.regmap, PLL_MODE(pll), 0);
> +
> +       /* Delay of 2 output clock ticks required until output is disabled */
> +       udelay(1);
> +
> +       regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
> +
> +       if (alpha_width > ALPHA_BITWIDTH)
> +               a <<= alpha_width - ALPHA_BITWIDTH;
> +
> +       regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
> +       regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll),
> +                                       a >> ALPHA_BITWIDTH);
> +
> +       regmap_write(pll->clkr.regmap, PLL_MODE(pll), PLL_BYPASSNL);
> +
> +       /* Wait five micro seconds or more */
> +       udelay(5);
> +       regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_RESET_N,
> +                          PLL_RESET_N);
> +
> +       /* The lock time should be less than 50 micro seconds worst case */
> +       udelay(50);
> +
> +       ret = wait_for_pll_enable_lock(pll);
> +       if (ret) {
> +               pr_err("alpha pll running in 800 MHz with source GPLL0\n");
> +               return ret;
> +       }
> +       regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_OUTCTRL,
> +                          PLL_OUTCTRL);
> +
> +       return 0;
> +}
> +
> +const struct clk_ops clk_alpha_pll_stromer_plus_ops = {
> +       .enable = clk_alpha_pll_enable,
> +       .disable = clk_alpha_pll_disable,
> +       .is_enabled = clk_alpha_pll_is_enabled,
> +       .recalc_rate = clk_alpha_pll_recalc_rate,
> +       .determine_rate = clk_alpha_pll_stromer_plus_determine_rate,
> +       .set_rate = clk_alpha_pll_stromer_plus_set_rate,
> +};
> +EXPORT_SYMBOL_GPL(clk_alpha_pll_stromer_plus_ops);
> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
> index e4bd863..903fbab 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.h
> +++ b/drivers/clk/qcom/clk-alpha-pll.h
> @@ -152,6 +152,7 @@ extern const struct clk_ops clk_alpha_pll_postdiv_ops;
>  extern const struct clk_ops clk_alpha_pll_huayra_ops;
>  extern const struct clk_ops clk_alpha_pll_postdiv_ro_ops;
>  extern const struct clk_ops clk_alpha_pll_stromer_ops;
> +extern const struct clk_ops clk_alpha_pll_stromer_plus_ops;
>
>  extern const struct clk_ops clk_alpha_pll_fabia_ops;
>  extern const struct clk_ops clk_alpha_pll_fixed_fabia_ops;
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
