Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F2FC77B75
	for <linux-clk@archiver.kernel.org>; Tue,  9 May 2023 20:33:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbjEIUdn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 May 2023 16:33:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbjEIUdm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 May 2023 16:33:42 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25FB02122
        for <linux-clk@vger.kernel.org>; Tue,  9 May 2023 13:33:40 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-559ded5e170so93933517b3.3
        for <linux-clk@vger.kernel.org>; Tue, 09 May 2023 13:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683664419; x=1686256419;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KP7rmZOvJCmCpfoX+ax0Qp6p7fblxM/RetTiw2ZGEU0=;
        b=zhDJ8rgk00ZwGuAI3zgrRweoHBmO5cUTD9RRmc5hk+BThEdXbM8yUsUw75Qbr6YQ5T
         aZiGsapTpjFDhckEGQB/gUB1c7Uc9pzdThgULUKowYzcvvSY5fdUOngR8OGtOUpoeJuq
         pji77qHC/lWdgdiL3gykZtbP3iL+ZPqvcPLoLPxVwMxGxQneSJLdOMIEeiti9TVZi9JI
         42wZpWXfXWiCOmJCBO+AH0dIKIQkp10n+M0UUSOEgnq4R+JtwvPVHi1vy+X1/oMX1Qsg
         pot3LPTWZNONTqkfeD+HUzrYc5cpWJmvsV5qjNtqrOgj06DcGCugfBv+tDAe5OHC5JkU
         GYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683664419; x=1686256419;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KP7rmZOvJCmCpfoX+ax0Qp6p7fblxM/RetTiw2ZGEU0=;
        b=EpmZKK1HuFO2unatsuvPYhXzrOzlWPO2OYq2H7ynGc6R5kmERpwnHMsBQyInsW+y3f
         HGEUkk1Ar4PteVfQvg0fq7PSbVgr8nRW1GyAIRz/jgTEl+MT6jL5oCbcRzVQEmqVJWPW
         8FrIBf0J2d/HJG11hq0XnRDPKN/BNBgkQtOuZ4IS5THpYENCqiCyUqD028POlwyUU+ME
         g2J8Dd+slwPG7ZvfMY4z9LNJ0Slm1tSXa/mWdxE/9Z1AHYyKUssiuRt7j4wIYUQ7rSh1
         fAFZtS7NEilIvzagblOjRFVvSoL905SBI59sEWytcF71AuGS8Urxsm6QFeRGWosVDIcz
         wEhg==
X-Gm-Message-State: AC+VfDyieqnSxBoQNa8C1pQLp1wFg25/6IzLKA667kgpG0/6StOZOgZQ
        FL5Kwj/QZXONvRRQOJa0dJ/1xF7dKhN/h6iZvuJJYQ==
X-Google-Smtp-Source: ACHHUZ4neReDgJmqJHC1dgqR5Bnztdbv3WI1a7UYpjdRfBZKXYGprf/4rCj4iie42pvz4dlWsX9YhEYXq7AGH3LbMFM=
X-Received: by 2002:a25:6943:0:b0:b9d:853e:5cef with SMTP id
 e64-20020a256943000000b00b9d853e5cefmr19297675ybc.37.1683664419340; Tue, 09
 May 2023 13:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230509172148.7627-1-quic_tdas@quicinc.com> <20230509172148.7627-3-quic_tdas@quicinc.com>
In-Reply-To: <20230509172148.7627-3-quic_tdas@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 9 May 2023 23:33:28 +0300
Message-ID: <CAA8EJprHgOaiH2CFKmz_E+NvJpA+DRNE-r1wQXbSfYi+5qoBmA@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] clk: qcom: videocc-sm8450: Add video clock
 controller driver for SM8450
To:     Taniya Das <quic_tdas@quicinc.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_skakitap@quicinc.com, quic_jkona@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 9 May 2023 at 20:22, Taniya Das <quic_tdas@quicinc.com> wrote:
>
> Add support for the video clock controller driver for peripheral clock
> clients to be able to request for video cc clocks.
>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
> Changes since V3:
>  - Use lower case hex.
>  - Check the return value here and bail out early on failure in probe.
>
> Changes since V2:
>  - Update the header file name to match the latest upstream header
>    files.
>
> Changes since V1:
>  - Use DT indices instead of fw_name.
>  - Replace pm_runtime_enable with devm_pm_runtime_enable.
>  - Change license to GPL from GPL V2.
>
>  drivers/clk/qcom/Kconfig          |   9 +
>  drivers/clk/qcom/Makefile         |   1 +
>  drivers/clk/qcom/videocc-sm8450.c | 461 ++++++++++++++++++++++++++++++
>  3 files changed, 471 insertions(+)
>  create mode 100644 drivers/clk/qcom/videocc-sm8450.c

[skipped]


> +static const struct qcom_reset_map video_cc_sm8450_resets[] = {
> +       [CVP_VIDEO_CC_INTERFACE_BCR] = { 0x80e0 },
> +       [CVP_VIDEO_CC_MVS0_BCR] = { 0x8098 },
> +       [CVP_VIDEO_CC_MVS0C_BCR] = { 0x8048 },
> +       [CVP_VIDEO_CC_MVS1_BCR] = { 0x80bc },
> +       [CVP_VIDEO_CC_MVS1C_BCR] = { 0x8070 },

Can we have a common VIDEO_CC prefix here please?

> +       [VIDEO_CC_MVS0C_CLK_ARES] = { 0x8064, 2 },
> +       [VIDEO_CC_MVS1C_CLK_ARES] = { 0x808c, 2 },
> +};
> +
> +static const struct regmap_config video_cc_sm8450_regmap_config = {
> +       .reg_bits = 32,
> +       .reg_stride = 4,
> +       .val_bits = 32,
> +       .max_register = 0x9f4c,
> +       .fast_io = true,
> +};
> +
> +static struct qcom_cc_desc video_cc_sm8450_desc = {
> +       .config = &video_cc_sm8450_regmap_config,
> +       .clks = video_cc_sm8450_clocks,
> +       .num_clks = ARRAY_SIZE(video_cc_sm8450_clocks),
> +       .resets = video_cc_sm8450_resets,
> +       .num_resets = ARRAY_SIZE(video_cc_sm8450_resets),
> +       .gdscs = video_cc_sm8450_gdscs,
> +       .num_gdscs = ARRAY_SIZE(video_cc_sm8450_gdscs),
> +};
> +
> +static const struct of_device_id video_cc_sm8450_match_table[] = {
> +       { .compatible = "qcom,sm8450-videocc" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, video_cc_sm8450_match_table);
> +
> +static int video_cc_sm8450_probe(struct platform_device *pdev)
> +{
> +       struct regmap *regmap;
> +       int ret;
> +
> +       ret = devm_pm_runtime_enable(&pdev->dev);
> +       if (ret)
> +               return ret;
> +
> +       ret = pm_runtime_resume_and_get(&pdev->dev);
> +       if (ret)
> +               return ret;
> +
> +       regmap = qcom_cc_map(pdev, &video_cc_sm8450_desc);
> +       if (IS_ERR(regmap)) {
> +               pm_runtime_put(&pdev->dev);
> +               return PTR_ERR(regmap);
> +       }
> +
> +       clk_lucid_evo_pll_configure(&video_cc_pll0, regmap, &video_cc_pll0_config);
> +       clk_lucid_evo_pll_configure(&video_cc_pll1, regmap, &video_cc_pll1_config);
> +
> +       /*
> +        * Keep clocks always enabled:
> +        *      video_cc_ahb_clk
> +        *      video_cc_sleep_clk
> +        *      video_cc_xo_clk
> +        */
> +       regmap_update_bits(regmap, 0x80e4, BIT(0), BIT(0));
> +       regmap_update_bits(regmap, 0x8130, BIT(0), BIT(0));
> +       regmap_update_bits(regmap, 0x8114, BIT(0), BIT(0));
> +
> +       ret = qcom_cc_really_probe(pdev, &video_cc_sm8450_desc, regmap);
> +
> +       pm_runtime_put(&pdev->dev);
> +
> +       return ret;
> +}
> +
> +static struct platform_driver video_cc_sm8450_driver = {
> +       .probe = video_cc_sm8450_probe,
> +       .driver = {
> +               .name = "video_cc-sm8450",
> +               .of_match_table = video_cc_sm8450_match_table,
> +       },
> +};
> +
> +static int __init video_cc_sm8450_init(void)
> +{
> +       return platform_driver_register(&video_cc_sm8450_driver);
> +}
> +subsys_initcall(video_cc_sm8450_init);
> +
> +static void __exit video_cc_sm8450_exit(void)
> +{
> +       platform_driver_unregister(&video_cc_sm8450_driver);
> +}
> +module_exit(video_cc_sm8450_exit);

module_platform_driver() ?

> +
> +MODULE_DESCRIPTION("QTI VIDEO_CC SM8450 Driver");
> +MODULE_LICENSE("GPL");
> --
> 2.17.1
>


-- 
With best wishes
Dmitry
