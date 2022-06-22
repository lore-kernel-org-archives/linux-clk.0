Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DDD2C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 22 Jun 2022 23:24:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353921AbiFVXYx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Jun 2022 19:24:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236540AbiFVXYx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Jun 2022 19:24:53 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AFA442480
        for <linux-clk@vger.kernel.org>; Wed, 22 Jun 2022 16:24:52 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id b12-20020a17090a6acc00b001ec2b181c98so828965pjm.4
        for <linux-clk@vger.kernel.org>; Wed, 22 Jun 2022 16:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ffIU4qD5x85d6iCQtZLq6rD/cyWC5Mkjs1IUQLDVtmU=;
        b=SZiUakEUp/fRPbuLjnYU5tXFDGpBGsc7+ny5WQn9Dp9G2PJCoM5kFvXUzrMlLlDF4g
         7teOPb905PvRwc/KPgtD+I73FGzZWvYETlPe4rDk5JWVkpGtdBMpI+TBUstC6yyTGvuB
         BjT8+o4LtU86uDsWnaAAcI7NsVLUt3M0mIIcucXdLLfFNMEVhNmv42ontJ/1GzqiiKJF
         zTIxkH1mALm3Zy/ScTw+M6+CJNbTaz38LNw3fY1y8oGohl/Pd39TIoSpNnZnB4FOxdbd
         I5WyQwyN4Q0UshroRddJJocrgQANQeeem6oURxyfwEiVny8ETNlc6ELt/01TvRXEvQvg
         A+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ffIU4qD5x85d6iCQtZLq6rD/cyWC5Mkjs1IUQLDVtmU=;
        b=H2OvCkCNNMM6DLCLAGfD43uZWCLsl0y3oKS5Dzkaa4G3inyt13cBH15znWNGv0ncdK
         6gdm0rVLScZ/5QGAEWouLIEfJqaDVBG9j9af9s8nS+f89MJKpZ/+ca2/kfk0vuX8V9uK
         ftzyCVhzrkWRyVaVGgxYUYS/ppHVXBs/03lC9oJ8no3XbbUXVSdejJM114xzUMwOlhnb
         c8CQz0XOrFCBtgqArwu8ZJ+gZzM7Xf7uTB/NTH9c2Ev/QdQtJKA9M4rWImqcvR/Lohn4
         IKvCYN6KoM4tgSU+/00AMYqEx88VW2obScr5r5m2ZQyOSaJgfRE0mraOId2UX6ZiKSbm
         G3tA==
X-Gm-Message-State: AJIora9FhgpvfmVKjJ9BlBBDaA5q1uijXyiQKrf/c4TWuXISajUo7DNp
        d3x24ytt1V/t+VT+sV+EwhvtZQboolCjB62vxpDllA==
X-Google-Smtp-Source: AGRyM1vsB3XLvGTtSV+Qux0xWs8h5I+urr5qnu42v7p9Q5nB2HjwBLTOZs7N+aSdaVrJTMMCj8gnStu06k/O2W5vPpw=
X-Received: by 2002:a17:90a:cc7:b0:1ea:3993:78f9 with SMTP id
 7-20020a17090a0cc700b001ea399378f9mr812825pjt.179.1655940291540; Wed, 22 Jun
 2022 16:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220621233412.506768-1-robert.foss@linaro.org>
 <20220621233412.506768-5-robert.foss@linaro.org> <adf27e62-246a-9c5f-e517-f225d17fe1cd@somainline.org>
In-Reply-To: <adf27e62-246a-9c5f-e517-f225d17fe1cd@somainline.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 23 Jun 2022 01:24:40 +0200
Message-ID: <CAG3jFytsDpoeuQ9GPYp+YJmORdi89SC5Ps6JQFPJOD8Sx6XYdA@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] clk: qcom: add support for SM8350 DISPCC
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, jonathan@marek.ca,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 22 Jun 2022 at 12:22, Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:
>
>
>
> On 22.06.2022 01:34, Robert Foss wrote:
> > From: Jonathan Marek <jonathan@marek.ca>
> >
> > Add support to the SM8350 display clock controller by extending the SM8250
> > display clock controller, which is almost identical but has some minor
> > differences.
> >
> > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >
> > Changes since v1
> >  - Remove comment - Dmitry
> >
> > Changes since v2
> >  - Add my SoB - Bjorn
> >  - Remove CLK_ASSUME_ENABLED_WHEN_UNUSED flag
> >
> > Changes since v3
> >  - Add kconfig dependency on SM_GCC_8350 - Konrad
> >  - Change hex to lowercase - Konrad
> >  - Split from dispcc-sm8250.c implementation
> >  - Switch from .fw_name to .index
> >
> > Changes since v4
> >  - Hex to lowercase - Konrad
> >  - Remove bad match table entries - Konrad
> >
> > Changes since v5
> >  - Reverted split from dispcc-sm8250
> >  - Re-added tags from v3
> >
> >
> >  drivers/clk/qcom/Kconfig         |  4 +--
> >  drivers/clk/qcom/dispcc-sm8250.c | 60 +++++++++++++++++++++++++++++++-
> >  2 files changed, 61 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> > index b11235c21952..4c3d1a548b7a 100644
> > --- a/drivers/clk/qcom/Kconfig
> > +++ b/drivers/clk/qcom/Kconfig
> > @@ -618,11 +618,11 @@ config SM_DISPCC_6125
> >         splash screen
> >
> >  config SM_DISPCC_8250
> > -     tristate "SM8150 and SM8250 Display Clock Controller"
> > +     tristate "SM8150/SM8250/SM8350 Display Clock Controller"
> >       depends on SM_GCC_8150 || SM_GCC_8250
> || SM_GCC_8350

Ack

>
> >       help
> >         Support for the display clock controller on Qualcomm Technologies, Inc
> > -       SM8150 and SM8250 devices.
> > +       SM8150/SM8250/SM8350 devices.
> >         Say Y if you want to support display devices and functionality such as
> >         splash screen.
> >
> > diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
> > index db9379634fb2..4e101d584115 100644
> > --- a/drivers/clk/qcom/dispcc-sm8250.c
> > +++ b/drivers/clk/qcom/dispcc-sm8250.c
> > @@ -43,6 +43,10 @@ static struct pll_vco vco_table[] = {
> >       { 249600000, 2000000000, 0 },
> >  };
> >
> > +static struct pll_vco lucid_5lpe_vco[] = {
> > +     { 249600000, 1750000000, 0 },
> > +};
> > +
> >  static struct alpha_pll_config disp_cc_pll0_config = {
> >       .l = 0x47,
> >       .alpha = 0xE000,
> > @@ -1228,6 +1232,7 @@ static const struct of_device_id disp_cc_sm8250_match_table[] = {
> >       { .compatible = "qcom,sc8180x-dispcc" },
> >       { .compatible = "qcom,sm8150-dispcc" },
> >       { .compatible = "qcom,sm8250-dispcc" },
> > +     { .compatible = "qcom,sm8350-dispcc" },
> >       { }
> >  };
> >  MODULE_DEVICE_TABLE(of, disp_cc_sm8250_match_table);
> > @@ -1258,7 +1263,7 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
> >               return PTR_ERR(regmap);
> >       }
> >
> > -     /* note: trion == lucid, except for the prepare() op */
> > +     /* Apply differences for SM8150 and SM8350 */
> I think both comments should stay, as the one you're adding doesn't explain the BUILD_BUG_ON()

Ack

>
>
> Konrad
> >       BUILD_BUG_ON(CLK_ALPHA_PLL_TYPE_TRION != CLK_ALPHA_PLL_TYPE_LUCID);
> >       if (of_device_is_compatible(pdev->dev.of_node, "qcom,sc8180x-dispcc") ||
> >           of_device_is_compatible(pdev->dev.of_node, "qcom,sm8150-dispcc")) {
> > @@ -1270,6 +1275,59 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
> >               disp_cc_pll1_config.config_ctl_hi1_val = 0x00000024;
> >               disp_cc_pll1_config.user_ctl_hi1_val = 0x000000D0;
> >               disp_cc_pll1_init.ops = &clk_alpha_pll_trion_ops;
> > +     } else if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8350-dispcc")) {
> > +             static struct clk_rcg2 * const rcgs[] = {
> > +                     &disp_cc_mdss_byte0_clk_src,
> > +                     &disp_cc_mdss_byte1_clk_src,
> > +                     &disp_cc_mdss_dp_aux1_clk_src,
> > +                     &disp_cc_mdss_dp_aux_clk_src,
> > +                     &disp_cc_mdss_dp_link1_clk_src,
> > +                     &disp_cc_mdss_dp_link_clk_src,
> > +                     &disp_cc_mdss_dp_pixel1_clk_src,
> > +                     &disp_cc_mdss_dp_pixel2_clk_src,
> > +                     &disp_cc_mdss_dp_pixel_clk_src,
> > +                     &disp_cc_mdss_esc0_clk_src,
> > +                     &disp_cc_mdss_mdp_clk_src,
> > +                     &disp_cc_mdss_pclk0_clk_src,
> > +                     &disp_cc_mdss_pclk1_clk_src,
> > +                     &disp_cc_mdss_rot_clk_src,
> > +                     &disp_cc_mdss_vsync_clk_src,
> > +             };
> > +             static struct clk_regmap_div * const divs[] = {
> > +                     &disp_cc_mdss_byte0_div_clk_src,
> > +                     &disp_cc_mdss_byte1_div_clk_src,
> > +                     &disp_cc_mdss_dp_link1_div_clk_src,
> > +                     &disp_cc_mdss_dp_link_div_clk_src,
> > +             };
> > +             unsigned int i;
> > +             static bool offset_applied;
> > +
> > +             /* only apply the offsets once (in case of deferred probe) */
> > +             if (!offset_applied) {
> > +                     for (i = 0; i < ARRAY_SIZE(rcgs); i++)
> > +                             rcgs[i]->cmd_rcgr -= 4;
> > +
> > +                     for (i = 0; i < ARRAY_SIZE(divs); i++) {
> > +                             divs[i]->reg -= 4;
> > +                             divs[i]->width = 4;
> > +                     }
> > +
> > +                     disp_cc_mdss_ahb_clk.halt_reg -= 4;
> > +                     disp_cc_mdss_ahb_clk.clkr.enable_reg -= 4;
> > +
> > +                     offset_applied = true;
> > +             }
> > +
> > +             disp_cc_mdss_ahb_clk_src.cmd_rcgr = 0x22a0;
> > +
> > +             disp_cc_pll0_config.config_ctl_hi1_val = 0x2a9a699c;
> > +             disp_cc_pll0_config.test_ctl_hi1_val = 0x01800000;
> > +             disp_cc_pll0_init.ops = &clk_alpha_pll_lucid_5lpe_ops;
> > +             disp_cc_pll0.vco_table = lucid_5lpe_vco;
> > +             disp_cc_pll1_config.config_ctl_hi1_val = 0x2a9a699c;
> > +             disp_cc_pll1_config.test_ctl_hi1_val = 0x01800000;
> > +             disp_cc_pll1_init.ops = &clk_alpha_pll_lucid_5lpe_ops;
> > +             disp_cc_pll1.vco_table = lucid_5lpe_vco;
> >       }
> >
> >       clk_lucid_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
