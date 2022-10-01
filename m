Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE39C433FE
	for <linux-clk@archiver.kernel.org>; Sat,  1 Oct 2022 07:03:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbiJAHD0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 1 Oct 2022 03:03:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiJAHDX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 1 Oct 2022 03:03:23 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 391CD1A0D25
        for <linux-clk@vger.kernel.org>; Sat,  1 Oct 2022 00:03:22 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-35711e5a5ceso23862717b3.13
        for <linux-clk@vger.kernel.org>; Sat, 01 Oct 2022 00:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=uAsOMusmOv9rGWfhvmdzC31+QnKZUq7RRceyu2qijc8=;
        b=cg+UZrYLhxEcM6BFlQeU7q1b0m3x2IPwY1hlYkLD+jeqOH9mJ3n5fkkurT6IHbXPSS
         PQQ2qFiJH27ckelU65TtN2ixkSzdDu3f3MlGeNLidRZP0kI6/VjJirpRHAWqIy5TNEWF
         xH6reTWFa0FHevbyh87LrpiCBAThHeNQp9w1zEeGNBzd2xw/tOJQ9v3BLqDlD49D8jec
         r/hFJA1ctPMcSfPVr6/V2n4mx2ox/8T2gPWDxGOrr15ylvbIhw7xvTmrP11wlOE+iURD
         mR9L/ASKx9UJZj87ataP2Pzu+CA8yuBe4j2bT14ZyJcagiegX4UvTodLCcyvEjHEzGRU
         KnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=uAsOMusmOv9rGWfhvmdzC31+QnKZUq7RRceyu2qijc8=;
        b=bkPp97K2mjajxQGGmsWExpX0o1/xMHZ07iryQcCCJD6FAdm1rMrEcVD6JSmdl1Dzrk
         l8KENtHYsw8Ra79AtUYUifc3TblmgC8KE4oP3WvyapzX81zkJMSFSthShlIKJDsOM0P8
         MFPnrYoeDOnAsOMvwP3hepqHkls/JWQTu1LbktR+4WW0yGJRmia9KKSiAk3iFs6HCvzn
         plIFGHwmYb8ixPMwumMmyX+N44qLU/eKGRKBYcg3Cpn+HCWKCHrQhc3H+DdhJAJgaPjS
         chzVDcVLl7NUWxpFYJHgjuIvChnLYPQU2yHCN7M1wlkYPBwcQEMfu14oZkU+PzEHaTbi
         QvoQ==
X-Gm-Message-State: ACrzQf3yS3P/tvWQCoEYU4o3AFIxsCqdx6RLPUbf+8y6K0tUGY8oZR7c
        aLcywEbI0Ri1BOyEjFYHQjYO9qcDwEkbCjvCIrXLwQ==
X-Google-Smtp-Source: AMsMyM7n7fO1bBUcoE5IZG/jROB90kg3rRYMoPnOf0GeMAK4lyaVIcKkDdm9TJmTCkMfBkAnWBg42C+pR8+cM1wM/Gw=
X-Received: by 2002:a0d:d68a:0:b0:350:a7f0:7b69 with SMTP id
 y132-20020a0dd68a000000b00350a7f07b69mr11814671ywd.132.1664607801493; Sat, 01
 Oct 2022 00:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221001030403.27659-1-quic_molvera@quicinc.com> <20221001030403.27659-5-quic_molvera@quicinc.com>
In-Reply-To: <20221001030403.27659-5-quic_molvera@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 1 Oct 2022 10:03:00 +0300
Message-ID: <CAA8EJppBfYST2VQrv6-LZBvtLcNUMkpLgXcic-fSUzFXhiYbaA@mail.gmail.com>
Subject: Re: [PATCH 4/5] clk: qcom: Add support for QDU1000 and QRU1000 RPMh clocks
To:     Melody Olvera <quic_molvera@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 1 Oct 2022 at 06:05, Melody Olvera <quic_molvera@quicinc.com> wrote:
>
> Add support for RMPh clocks for QDU1000 and QRU1000 SoCs.
>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index c07cab6905cb..27d11ffac71e 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -628,6 +628,18 @@ static const struct clk_rpmh_desc clk_rpmh_sdx65 = {
>         .num_clks = ARRAY_SIZE(sdx65_rpmh_clocks),
>  };
>
> +DEFINE_CLK_RPMH_ARC(qdru1000, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 1);
> +
> +static struct clk_hw *qdru1000_rpmh_clocks[] = {
> +       [RPMH_CXO_CLK]      = &qdru1000_bi_tcxo.hw,
> +       [RPMH_CXO_CLK_A]    = &qdru1000_bi_tcxo_ao.hw,
> +};
> +
> +static const struct clk_rpmh_desc clk_rpmh_qdru1000 = {
> +       .clks = qdru1000_rpmh_clocks,
> +       .num_clks = ARRAY_SIZE(qdru1000_rpmh_clocks),
> +};
> +
>  static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
>                                          void *data)
>  {
> @@ -723,6 +735,8 @@ static const struct of_device_id clk_rpmh_match_table[] = {
>         { .compatible = "qcom,sm8350-rpmh-clk", .data = &clk_rpmh_sm8350},
>         { .compatible = "qcom,sm8450-rpmh-clk", .data = &clk_rpmh_sm8450},
>         { .compatible = "qcom,sc7280-rpmh-clk", .data = &clk_rpmh_sc7280},
> +       { .compatible = "qcom,qdu1000-rpmh-clk", .data = &clk_rpmh_qdru1000},
> +       { .compatible = "qcom,qru1000-rpmh-clk", .data = &clk_rpmh_qdru1000},

Also the list isn't fully sorted, let's target that. Please move your
compat strings into the beginning.

>         { }
>  };
>  MODULE_DEVICE_TABLE(of, clk_rpmh_match_table);
> --
> 2.37.3
>


-- 
With best wishes
Dmitry
