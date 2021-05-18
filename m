Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F043C433B4
	for <linux-clk@archiver.kernel.org>; Tue, 18 May 2021 11:53:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 197D7610A2
	for <linux-clk@archiver.kernel.org>; Tue, 18 May 2021 11:53:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241238AbhERLyg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 May 2021 07:54:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234037AbhERLyf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 May 2021 07:54:35 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 465F8C061573
        for <linux-clk@vger.kernel.org>; Tue, 18 May 2021 04:53:18 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id t11so5399312pjm.0
        for <linux-clk@vger.kernel.org>; Tue, 18 May 2021 04:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0TfeDQyHWj4oKTaKj8LGDXCpRIr4k/j7+3Dkvrcc07w=;
        b=wl4NKH6Vjja3kuY1a1E7dzq1Z4ASA9Cij6cQ6/v3cXzkwc2Sw8a5zOsirRMEAeEp3d
         WV3IOUl7fTcXX6x+jyuTsnkJrcMq/J7dvb6l+z8XdqHyT6HkL2ijRdgyzk/rSkJbkhR/
         BtjUIcQoM4isOTmXO01CVX/aldLqjct+lXR2HVR0EDJpfVd6z6AnwQ8wCRDpMyMPDDE7
         tyrSl1DSij/lPvKZMDeOD+i9N2sHbjD/OhqrSjXwyFFbZ6E8bbfINyqDZdso9Zt4rSIe
         72m5OTq+LeOmMsUpEVFfYCuCnnN2Qm2+G7QZ8NwQrkobGNjUqlAyNI9nga3pGN5WQB+H
         CJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0TfeDQyHWj4oKTaKj8LGDXCpRIr4k/j7+3Dkvrcc07w=;
        b=KL1m10DzVDnTKDFRkz8pFEmS6DDiaaMUFmIgyx+yuhd+bEIq6v2H00CysF60kom95G
         4kI05E2NnoFgq9hgnoSee9UHjP4iS/jrFDbWSYWErl02AFAPGL0/s0mQSynaN5TdqptT
         y0TCvg7qGRz1bQkYQQIwIhHZgMfgy4lvAvdzIyJsnYRNiyS7S7eYq5d/61zmsZhkdUej
         N9ayjodngKffME0kgoovMbNGAXNGoXESrGnNVEsgxKqo3BhR56RmJX32Y9dbcNWIY7us
         vlvjpBdnjdI/pkIagCAVh0dRjbKhvWhgigYQo5xMinidrb9ZvWa4SChCv+as7tN6NPIL
         a5tw==
X-Gm-Message-State: AOAM533ZE8F7IAqEzqK3SSP/nzXAFHFihOXXuFyLUSTb79k3X7WhYAlo
        ap0mq/htiCTGQSFo1B9tg0s/0ZEgdwAu7RKF30igCw==
X-Google-Smtp-Source: ABdhPJy3rSzMyFWipspVEjmV9ElAMh8/p4l4BpXqxgWLCVNE2KuxzNypqWqnlNhPFbIXAVoyMo3F1k8W2r3lsWZPR+g=
X-Received: by 2002:a17:90a:7e8f:: with SMTP id j15mr5136253pjl.19.1621338797784;
 Tue, 18 May 2021 04:53:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210513195617.15068-1-jonathan@marek.ca>
In-Reply-To: <20210513195617.15068-1-jonathan@marek.ca>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 18 May 2021 13:53:06 +0200
Message-ID: <CAG3jFyvn8Jn2hCgWYunB_=_jKYJ9GpDZyP+Pqjdxx_0n32rJtw@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: qcom: add support for SM8350 DISPCC
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hey Jonathan,

Thanks for submitting this.

On Thu, 13 May 2021 at 21:56, Jonathan Marek <jonathan@marek.ca> wrote:
>
> Add support to the SM8350 display clock controller by extending the SM8250
> display clock controller, which is almost identical but has some minor
> differences.
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/clk/qcom/Kconfig         |  4 +-
>  drivers/clk/qcom/dispcc-sm8250.c | 84 +++++++++++++++++++++++++++-----
>  2 files changed, 75 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 45646b867cdb..cc60e6ee1654 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -484,11 +484,11 @@ config SDX_GCC_55
>           SPI, I2C, USB, SD/UFS, PCIe etc.
>
>  config SM_DISPCC_8250
> -       tristate "SM8150 and SM8250 Display Clock Controller"
> +       tristate "SM8150/SM8250/SM8350 Display Clock Controller"
>         depends on SM_GCC_8150 || SM_GCC_8250
>         help
>           Support for the display clock controller on Qualcomm Technologies, Inc
> -         SM8150 and SM8250 devices.
> +         SM8150/SM8250/SM8350 devices.
>           Say Y if you want to support display devices and functionality such as
>           splash screen.
>
> diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
> index de09cd5c209f..1fcf8085a109 100644
> --- a/drivers/clk/qcom/dispcc-sm8250.c
> +++ b/drivers/clk/qcom/dispcc-sm8250.c
> @@ -36,6 +36,10 @@ static struct pll_vco vco_table[] = {
>         { 249600000, 2000000000, 0 },
>  };
>
> +static struct pll_vco lucid_5lpe_vco[] = {
> +       { 249600000, 1750000000, 0 },
> +};
> +
>  static struct alpha_pll_config disp_cc_pll0_config = {
>         .l = 0x47,
>         .alpha = 0xE000,
> @@ -1039,6 +1043,7 @@ static const struct qcom_cc_desc disp_cc_sm8250_desc = {
>  static const struct of_device_id disp_cc_sm8250_match_table[] = {
>         { .compatible = "qcom,sm8150-dispcc" },
>         { .compatible = "qcom,sm8250-dispcc" },
> +       { .compatible = "qcom,sm8350-dispcc" },
>         { }
>  };
>  MODULE_DEVICE_TABLE(of, disp_cc_sm8250_match_table);
> @@ -1051,19 +1056,76 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
>         if (IS_ERR(regmap))
>                 return PTR_ERR(regmap);
>
> -       /* note: trion == lucid, except for the prepare() op */
> -       BUILD_BUG_ON(CLK_ALPHA_PLL_TYPE_TRION != CLK_ALPHA_PLL_TYPE_LUCID);
> -       if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8150-dispcc")) {

I'm having a quick look at this patch, and of_device_is_compatible had
2 cases previously, sm8150 & sm8250. Now three cases (sm8150, sm8250 &
sm8350) are possible, but sm8150 & sm8250 have been lumped together.
Is this correct?

> -               disp_cc_pll0_config.config_ctl_hi_val = 0x00002267;
> -               disp_cc_pll0_config.config_ctl_hi1_val = 0x00000024;
> -               disp_cc_pll0_config.user_ctl_hi1_val = 0x000000D0;
> -               disp_cc_pll0_init.ops = &clk_alpha_pll_trion_ops;
> -               disp_cc_pll1_config.config_ctl_hi_val = 0x00002267;
> -               disp_cc_pll1_config.config_ctl_hi1_val = 0x00000024;
> -               disp_cc_pll1_config.user_ctl_hi1_val = 0x000000D0;
> -               disp_cc_pll1_init.ops = &clk_alpha_pll_trion_ops;
> +       /* SM8350 has _SRC clocks offset by 4, and some other differences */
> +       if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8350-dispcc")) {
> +               static struct clk_rcg2* const rcgs[] = {
> +                       &disp_cc_mdss_byte0_clk_src,
> +                       &disp_cc_mdss_byte1_clk_src,
> +                       &disp_cc_mdss_dp_aux1_clk_src,
> +                       &disp_cc_mdss_dp_aux_clk_src,
> +                       &disp_cc_mdss_dp_link1_clk_src,
> +                       &disp_cc_mdss_dp_link_clk_src,
> +                       &disp_cc_mdss_dp_pixel1_clk_src,
> +                       &disp_cc_mdss_dp_pixel2_clk_src,
> +                       &disp_cc_mdss_dp_pixel_clk_src,
> +                       &disp_cc_mdss_esc0_clk_src,
> +                       &disp_cc_mdss_mdp_clk_src,
> +                       &disp_cc_mdss_pclk0_clk_src,
> +                       &disp_cc_mdss_pclk1_clk_src,
> +                       &disp_cc_mdss_rot_clk_src,
> +                       &disp_cc_mdss_vsync_clk_src,
> +               };
> +               static struct clk_regmap_div* const divs[] = {
> +                       &disp_cc_mdss_byte0_div_clk_src,
> +                       &disp_cc_mdss_byte1_div_clk_src,
> +                       &disp_cc_mdss_dp_link1_div_clk_src,
> +                       &disp_cc_mdss_dp_link_div_clk_src,
> +               };
> +               unsigned i;
> +               static bool offset_applied = false;
> +
> +               /* only apply the offsets once (in case of deferred probe) */
> +               if (!offset_applied) {
> +                       for (i = 0; i < ARRAY_SIZE(rcgs); i++)
> +                               rcgs[i]->cmd_rcgr -= 4;
> +
> +                       for (i = 0; i < ARRAY_SIZE(divs); i++) {
> +                               divs[i]->reg -= 4;
> +                               divs[i]->width = 4;
> +                       }
> +
> +                       disp_cc_mdss_ahb_clk.halt_reg -= 4;
> +                       disp_cc_mdss_ahb_clk.clkr.enable_reg -= 4;
> +
> +                       offset_applied = true;
> +               }
> +
> +               disp_cc_mdss_ahb_clk_src.cmd_rcgr = 0x22a0;
> +
> +               disp_cc_pll0_config.config_ctl_hi1_val = 0x2A9A699C;
> +               disp_cc_pll0_config.test_ctl_hi1_val = 0x01800000;
> +               disp_cc_pll0_init.ops = &clk_alpha_pll_lucid_5lpe_ops;
> +               disp_cc_pll0.vco_table = lucid_5lpe_vco;
> +               disp_cc_pll1_config.config_ctl_hi1_val = 0x2A9A699C;
> +               disp_cc_pll1_config.test_ctl_hi1_val = 0x01800000;
> +               disp_cc_pll1_init.ops = &clk_alpha_pll_lucid_5lpe_ops;
> +               disp_cc_pll1.vco_table = lucid_5lpe_vco;
> +       } else {
> +               /* note: trion == lucid, except for the prepare() op */
> +               BUILD_BUG_ON(CLK_ALPHA_PLL_TYPE_TRION != CLK_ALPHA_PLL_TYPE_LUCID);
> +               if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8150-dispcc")) {
> +                       disp_cc_pll0_config.config_ctl_hi_val = 0x00002267;
> +                       disp_cc_pll0_config.config_ctl_hi1_val = 0x00000024;
> +                       disp_cc_pll0_config.user_ctl_hi1_val = 0x000000D0;
> +                       disp_cc_pll0_init.ops = &clk_alpha_pll_trion_ops;
> +                       disp_cc_pll1_config.config_ctl_hi_val = 0x00002267;
> +                       disp_cc_pll1_config.config_ctl_hi1_val = 0x00000024;
> +                       disp_cc_pll1_config.user_ctl_hi1_val = 0x000000D0;
> +                       disp_cc_pll1_init.ops = &clk_alpha_pll_trion_ops;
> +               }
>         }
>
> +       /* note for SM8350: downstream lucid_5lpe configure differs slightly */
>         clk_lucid_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
>         clk_lucid_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);
>
> --
> 2.26.1
>
