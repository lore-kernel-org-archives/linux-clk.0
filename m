Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A579C49361
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jun 2021 07:21:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DA05613B9
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jun 2021 07:21:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbhFQHXz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jun 2021 03:23:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbhFQHXy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Jun 2021 03:23:54 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CADC4C06175F
        for <linux-clk@vger.kernel.org>; Thu, 17 Jun 2021 00:21:46 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id o21so2445846pll.6
        for <linux-clk@vger.kernel.org>; Thu, 17 Jun 2021 00:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IjF1z4yp7kxuUs/wDgstv+aPVQR97fq6wk0riu8YOLk=;
        b=Jm9OcHyaoQjmHVeqxnR/WCXvjB6XBrqBCHJihMMBJaz8GKdeYQPVWmaPf8yLPnxbD6
         eMvuheLXDyhjhNlkU8xV+w9ThanNiXEX4E44EclziWfPSTTDRHDhOI2rqQkyAMVU53gg
         q633b/dVFnZwY+/h0kQpMmzEcB6RInMVqsAdgQLCKrkWxjW0IAU5IwPsD/nGR/lBiL2n
         Ejej6dWkYltzBUj8Cjvr3DXFBSQ532QpoZOLMRG0rq1PDsOK1n+wp+QqBnO6Gfy7IEPK
         boe2BnLXI2SUUArncpYvaPxNLWYQe9/yvQK/9K9i7LDvlt/Jvbd4gGUy9DARzVQzOORC
         ItIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IjF1z4yp7kxuUs/wDgstv+aPVQR97fq6wk0riu8YOLk=;
        b=hGyfufaeyvEN+92OwJ6bY3QpjXjp6P6d+7ln1+CVIEHZ8l7FbmLOQwUANnzOVlDcx3
         PFJnScpnllW5GJq1+6dt4XOtiaB9LxdoFl2ivfNWSpXz1y+1XaOM+EXHvTpN6sSEHjK6
         WMvRP22OrKV8zE4voQXzaJEBHmJC7CgQrDxM7c1msJo6Q56Jtm6x84QzQnl4uz6IrNSC
         J97Ne/fzO+RuqeTj8GxAMlFInu8wQgr32ZhBAnm5kDZ8WaJEBQWOtK+z7/dnfcN8nQyr
         RkdBdAFjUt4guKZmVEc9WQfpxsYrIoEl0SLMKEcJhH+G3zb9Z+l7s7VHfzUws7ejWmKc
         izew==
X-Gm-Message-State: AOAM530/0sEQJrTqDMXiI+4Fan8DKsJLh86sSZLu8N2kBBikKgl8/Ojp
        h+zNz7ar8PQqC9ASJbq6UAjGgo/XXNncn5J/CsSVSQ==
X-Google-Smtp-Source: ABdhPJxWx9LhplsvVRORmkEDRrkOB+irOVB/sblQujfstYIQAJCxC/uhuTBnQPok6By+k/RJKnWlp8r7qjf5Lgbp9vQ=
X-Received: by 2002:a17:902:b717:b029:11a:fae3:ba7c with SMTP id
 d23-20020a170902b717b029011afae3ba7cmr3229197pls.28.1623914506170; Thu, 17
 Jun 2021 00:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210608142707.19637-1-jonathan@marek.ca>
In-Reply-To: <20210608142707.19637-1-jonathan@marek.ca>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 17 Jun 2021 09:21:33 +0200
Message-ID: <CAG3jFysYEG-wNvwExRXASzWqDeLW2sayCcLRW=6OU95WsokMQw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] clk: qcom: add support for SM8350 DISPCC
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

On Tue, 8 Jun 2021 at 16:29, Jonathan Marek <jonathan@marek.ca> wrote:
>
> Add support to the SM8350 display clock controller by extending the SM8250
> display clock controller, which is almost identical but has some minor
> differences.
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
> v3:
>  - added const to vco tables
>  - moved clk rcgs/div list to global scope
>  - patching clks on module init instead of probe
>  - lowercase hex
>  - update configure comment
>  - rebased on added edp clocks
>
>  drivers/clk/qcom/Kconfig         |   4 +-
>  drivers/clk/qcom/dispcc-sm8250.c | 103 ++++++++++++++++++++++++++-----
>  2 files changed, 90 insertions(+), 17 deletions(-)
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
> index 601c7c0ba483..86c474a51cd2 100644
> --- a/drivers/clk/qcom/dispcc-sm8250.c
> +++ b/drivers/clk/qcom/dispcc-sm8250.c
> @@ -34,10 +34,14 @@ enum {
>         P_DSI1_PHY_PLL_OUT_DSICLK,
>  };
>
> -static struct pll_vco vco_table[] = {
> +static const struct pll_vco vco_table[] = {
>         { 249600000, 2000000000, 0 },
>  };
>
> +static const struct pll_vco lucid_5lpe_vco[] = {
> +       { 249600000, 1750000000, 0 },
> +};
> +
>  static struct alpha_pll_config disp_cc_pll0_config = {
>         .l = 0x47,
>         .alpha = 0xE000,
> @@ -1222,6 +1226,7 @@ static const struct of_device_id disp_cc_sm8250_match_table[] = {
>         { .compatible = "qcom,sc8180x-dispcc" },
>         { .compatible = "qcom,sm8150-dispcc" },
>         { .compatible = "qcom,sm8250-dispcc" },
> +       { .compatible = "qcom,sm8350-dispcc" },
>         { }
>  };
>  MODULE_DEVICE_TABLE(of, disp_cc_sm8250_match_table);
> @@ -1234,20 +1239,10 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
>         if (IS_ERR(regmap))
>                 return PTR_ERR(regmap);
>
> -       /* note: trion == lucid, except for the prepare() op */
> -       BUILD_BUG_ON(CLK_ALPHA_PLL_TYPE_TRION != CLK_ALPHA_PLL_TYPE_LUCID);
> -       if (of_device_is_compatible(pdev->dev.of_node, "qcom,sc8180x-dispcc") ||
> -           of_device_is_compatible(pdev->dev.of_node, "qcom,sm8150-dispcc")) {
> -               disp_cc_pll0_config.config_ctl_hi_val = 0x00002267;
> -               disp_cc_pll0_config.config_ctl_hi1_val = 0x00000024;
> -               disp_cc_pll0_config.user_ctl_hi1_val = 0x000000D0;
> -               disp_cc_pll0_init.ops = &clk_alpha_pll_trion_ops;
> -               disp_cc_pll1_config.config_ctl_hi_val = 0x00002267;
> -               disp_cc_pll1_config.config_ctl_hi1_val = 0x00000024;
> -               disp_cc_pll1_config.user_ctl_hi1_val = 0x000000D0;
> -               disp_cc_pll1_init.ops = &clk_alpha_pll_trion_ops;
> -       }
> -
> +       /* sm8350 note: downstream has a clk_lucid_5lpe_pll_configure, which
> +        * does not write the PLL_UPDATE_BYPASS bit in PLL_MODE.
> +        * It should not hurt sm8350 to have this extra write.
> +        */
>         clk_lucid_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
>         clk_lucid_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);
>
> @@ -1268,8 +1263,86 @@ static struct platform_driver disp_cc_sm8250_driver = {
>         },
>  };
>
> +static struct clk_rcg2 * const __initconst disp_cc_sm8250_rcgs[] = {
> +       &disp_cc_mdss_byte0_clk_src,
> +       &disp_cc_mdss_byte1_clk_src,
> +       &disp_cc_mdss_dp_aux1_clk_src,
> +       &disp_cc_mdss_dp_aux_clk_src,
> +       &disp_cc_mdss_dp_link1_clk_src,
> +       &disp_cc_mdss_dp_link_clk_src,
> +       &disp_cc_mdss_dp_pixel1_clk_src,
> +       &disp_cc_mdss_dp_pixel2_clk_src,
> +       &disp_cc_mdss_dp_pixel_clk_src,
> +       &disp_cc_mdss_edp_aux_clk_src,
> +       &disp_cc_mdss_edp_gtc_clk_src,
> +       &disp_cc_mdss_edp_link_clk_src,
> +       &disp_cc_mdss_edp_pixel_clk_src,
> +       &disp_cc_mdss_esc0_clk_src,
> +       &disp_cc_mdss_mdp_clk_src,
> +       &disp_cc_mdss_pclk0_clk_src,
> +       &disp_cc_mdss_pclk1_clk_src,
> +       &disp_cc_mdss_rot_clk_src,
> +       &disp_cc_mdss_vsync_clk_src,
> +       &disp_cc_mdss_ahb_clk_src,
> +};
> +
> +static struct clk_regmap_div * const __initconst disp_cc_sm8250_divs[] = {
> +       &disp_cc_mdss_byte0_div_clk_src,
> +       &disp_cc_mdss_byte1_div_clk_src,
> +       &disp_cc_mdss_dp_link1_div_clk_src,
> +       &disp_cc_mdss_dp_link_div_clk_src,
> +};
> +
> +static bool __init disp_cc_is_compatible(const char *compatible)
> +{
> +       struct device_node *node = of_find_compatible_node(NULL, NULL, compatible);
> +
> +       of_node_put(node);
> +       return node != NULL;
> +}

checkpatch --struct is unhappy with the above comparison. I think it
can be removed.

> +
>  static int __init disp_cc_sm8250_init(void)
>  {
> +       if (disp_cc_is_compatible("qcom,sm8150-dispcc") ||
> +           disp_cc_is_compatible("qcom,sc8180x-dispcc")) {
> +               BUILD_BUG_ON(CLK_ALPHA_PLL_TYPE_TRION != CLK_ALPHA_PLL_TYPE_LUCID);
> +               disp_cc_pll0_config.config_ctl_hi_val = 0x00002267;
> +               disp_cc_pll0_config.config_ctl_hi1_val = 0x00000024;
> +               disp_cc_pll0_config.user_ctl_hi1_val = 0x000000d0;
> +               disp_cc_pll0_init.ops = &clk_alpha_pll_trion_ops;
> +               disp_cc_pll1_config.config_ctl_hi_val = 0x00002267;
> +               disp_cc_pll1_config.config_ctl_hi1_val = 0x00000024;
> +               disp_cc_pll1_config.user_ctl_hi1_val = 0x000000d0;
> +               disp_cc_pll1_init.ops = &clk_alpha_pll_trion_ops;
> +       } else if (disp_cc_is_compatible("qcom,sm8350-dispcc")) {
> +               unsigned int i;
> +
> +               for (i = 0; i < ARRAY_SIZE(disp_cc_sm8250_rcgs); i++)
> +                       disp_cc_sm8250_rcgs[i]->cmd_rcgr -= 4;
> +
> +               for (i = 0; i < ARRAY_SIZE(disp_cc_sm8250_divs); i++) {
> +                       disp_cc_sm8250_divs[i]->reg -= 4;
> +                       disp_cc_sm8250_divs[i]->width = 4;
> +               }
> +
> +               disp_cc_mdss_ahb_clk.halt_reg -= 4;
> +               disp_cc_mdss_ahb_clk.clkr.enable_reg -= 4;
> +
> +               disp_cc_mdss_ahb_clk_src.cmd_rcgr = 0x22a0;
> +
> +               disp_cc_pll0_config.config_ctl_hi1_val = 0x2a9a699c;
> +               disp_cc_pll0_config.test_ctl_hi1_val = 0x01800000;
> +               disp_cc_pll0_init.ops = &clk_alpha_pll_lucid_5lpe_ops;
> +               disp_cc_pll0.vco_table = lucid_5lpe_vco;
> +               disp_cc_pll1_config.config_ctl_hi1_val = 0x2a9a699c;
> +               disp_cc_pll1_config.test_ctl_hi1_val = 0x01800000;
> +               disp_cc_pll1_init.ops = &clk_alpha_pll_lucid_5lpe_ops;
> +               disp_cc_pll1.vco_table = lucid_5lpe_vco;
> +
> +               disp_cc_sm8250_clocks[DISP_CC_MDSS_EDP_GTC_CLK] = NULL;
> +               disp_cc_sm8250_clocks[DISP_CC_MDSS_EDP_GTC_CLK_SRC] = NULL;
> +       }
> +
>         return platform_driver_register(&disp_cc_sm8250_driver);
>  }
>  subsys_initcall(disp_cc_sm8250_init);

With the above issue addressed, lgtm.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
