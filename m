Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA12C4332F
	for <linux-clk@archiver.kernel.org>; Wed,  2 Nov 2022 08:40:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230425AbiKBIkK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Nov 2022 04:40:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbiKBIkG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Nov 2022 04:40:06 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D9C7275E4
        for <linux-clk@vger.kernel.org>; Wed,  2 Nov 2022 01:40:05 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id n12so43251480eja.11
        for <linux-clk@vger.kernel.org>; Wed, 02 Nov 2022 01:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e/jtuwgULBOycwGalh+zkT6mjLdV0jwG/bWZgUJxcW8=;
        b=nRkmXPJgWNcU1eAeVmyDwZ7wmOLf3UxyJf1p03PwhRq4lDa78pIsXQ7Ty2cPuTcml1
         kQLUesRT+qIw/TivDkTLF036tENc5gqUbdjzprZpng7t7mdSibHC9FYXQJyQf7G+XH3j
         4DQF23XKCH9RBhhtDPxB25r0gVixcFJMGqC5nZpWLtNaYpj4R4R9lTIjW8pXNHFkkLWD
         O8CtSRyKfIMvXoEmfTcRhTPeJ9J4trnoA+SrfkhmV6pS87l8tJ7odb8vIdXkYdXeF6GD
         QAOwhs3h7FktPZwb1UOohta1jWsQAx4IO9lVoD5sJgpOq8OLGz9t4btkQV/n4Beu75he
         48vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/jtuwgULBOycwGalh+zkT6mjLdV0jwG/bWZgUJxcW8=;
        b=KlRCCC9wcis6OgoTw6uo+phO4iKHKAhYBMzyY/544d39Rd5DMavx9fOQKI4P0aTHG+
         hOBKtYdDCL8g+iubVDiCmQfAzfa+hCOXNcAHGRZ8UBJvX2NrhhsYzzSo+hG8tbsnRhCc
         +fVWfY62fp7GMcGH2Oj0KSzjPHLgzF1dEK4THs1MkK58ZHLIQxq9abGmAk3KWj4+BXZM
         qo22MFndaq8eSzKZIakuM176LAiYyWftudX8PSpMDIwmiqWXn0E/tuGcRRgBSjYoIQo3
         UFaUrmwc/5bsJ0vhbMCmpMjUDSIWQ37oD//a6vCl8R6zTyGi2euphIpMGZYYQkAoCB+k
         0y3A==
X-Gm-Message-State: ACrzQf1haphFxbiJiwQG/MyIGQJKz789zalYu60mY3VXgvaMroABTsHy
        B3SgTBx3tKizLIxhsaS3GvL8Hjx4VgyxoR3KpNzk7w==
X-Google-Smtp-Source: AMsMyM5nzVcTT98Fh7PeXoFIpuR2xOrxd1QJPqjmAIoiBUnWh103tbbpfY8bXpvrDyFZz1aE+VvCY/S3/al36AN61Ik=
X-Received: by 2002:a17:907:72cb:b0:7ad:7e95:63f5 with SMTP id
 du11-20020a17090772cb00b007ad7e9563f5mr22321018ejc.383.1667378403649; Wed, 02
 Nov 2022 01:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20221027123432.1818530-1-robert.foss@linaro.org>
 <20221027123432.1818530-4-robert.foss@linaro.org> <e32be4c0-56ea-6999-92e6-3b51792a5255@linaro.org>
In-Reply-To: <e32be4c0-56ea-6999-92e6-3b51792a5255@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 2 Nov 2022 09:39:52 +0100
Message-ID: <CAG3jFyuvdTOisdP6qexaY3M+JQOHbRomqk4cCKRwS=L=ev6CWA@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] clk: qcom: dispcc-sm8250: Add missing EDP clocks
 for sm8350
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 27 Oct 2022 at 14:42, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 27/10/2022 15:34, Robert Foss wrote:
> > SM8350 supports embedded displayport, but the clocks for this
> > were previously not enabled.
>
> I'd say 'not accounted for' instead. Bjorn has added eDP clocks, but
> they were following the 8150 (no div_clk_src) and the offsets were not
> updated.

Ack.

>
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >   drivers/clk/qcom/dispcc-sm8250.c | 22 +++++++++++++++++++++-
> >   1 file changed, 21 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
> > index a7606580cf22..d2aaa44ed3d4 100644
> > --- a/drivers/clk/qcom/dispcc-sm8250.c
> > +++ b/drivers/clk/qcom/dispcc-sm8250.c
> > @@ -462,6 +462,20 @@ static struct clk_branch disp_cc_mdss_edp_link_clk = {
> >       },
> >   };
> >
> > +static struct clk_regmap_div disp_cc_mdss_edp_link_div_clk_src = {
> > +     .reg = 0x2288,
> > +     .shift = 0,
> > +     .width = 2,
> > +     .clkr.hw.init = &(struct clk_init_data) {
> > +             .name = "disp_cc_mdss_edp_link_div_clk_src",
> > +             .parent_hws = (const struct clk_hw*[]){
> > +                     &disp_cc_mdss_edp_link_clk_src.clkr.hw,
> > +             },
> > +             .num_parents = 1,
> > +             .ops = &clk_regmap_div_ro_ops,
> > +     },
> > +};
> > +
> >   static struct clk_branch disp_cc_mdss_edp_link_intf_clk = {
> >       .halt_reg = 0x2074,
> >       .halt_check = BRANCH_HALT,
> > @@ -471,7 +485,7 @@ static struct clk_branch disp_cc_mdss_edp_link_intf_clk = {
> >               .hw.init = &(struct clk_init_data){
> >                       .name = "disp_cc_mdss_edp_link_intf_clk",
> >                       .parent_hws = (const struct clk_hw*[]){
> > -                             &disp_cc_mdss_edp_link_clk_src.clkr.hw,
> > +                             &disp_cc_mdss_edp_link_div_clk_src.clkr.hw,
> >                       },
> >                       .num_parents = 1,
> >                       .flags = CLK_GET_RATE_NOCACHE,
> > @@ -1175,6 +1189,7 @@ static struct clk_regmap *disp_cc_sm8250_clocks[] = {
> >       [DISP_CC_MDSS_EDP_GTC_CLK_SRC] = &disp_cc_mdss_edp_gtc_clk_src.clkr,
> >       [DISP_CC_MDSS_EDP_LINK_CLK] = &disp_cc_mdss_edp_link_clk.clkr,
> >       [DISP_CC_MDSS_EDP_LINK_CLK_SRC] = &disp_cc_mdss_edp_link_clk_src.clkr,
> > +     [DISP_CC_MDSS_EDP_LINK_DIV_CLK_SRC] = &disp_cc_mdss_edp_link_div_clk_src.clkr,
> >       [DISP_CC_MDSS_EDP_LINK_INTF_CLK] = &disp_cc_mdss_edp_link_intf_clk.clkr,
> >       [DISP_CC_MDSS_EDP_PIXEL_CLK] = &disp_cc_mdss_edp_pixel_clk.clkr,
> >       [DISP_CC_MDSS_EDP_PIXEL_CLK_SRC] = &disp_cc_mdss_edp_pixel_clk_src.clkr,
> > @@ -1285,7 +1300,11 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
> >                       &disp_cc_mdss_dp_pixel1_clk_src,
> >                       &disp_cc_mdss_dp_pixel2_clk_src,
> >                       &disp_cc_mdss_dp_pixel_clk_src,
> > +                     &disp_cc_mdss_edp_aux_clk_src,
> > +                     &disp_cc_mdss_edp_link_clk_src,
> > +                     &disp_cc_mdss_edp_pixel_clk_src,
> >                       &disp_cc_mdss_esc0_clk_src,
> > +                     &disp_cc_mdss_esc1_clk_src,
> >                       &disp_cc_mdss_mdp_clk_src,
> >                       &disp_cc_mdss_pclk0_clk_src,
> >                       &disp_cc_mdss_pclk1_clk_src,
> > @@ -1297,6 +1316,7 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
> >                       &disp_cc_mdss_byte1_div_clk_src,
> >                       &disp_cc_mdss_dp_link1_div_clk_src,
> >                       &disp_cc_mdss_dp_link_div_clk_src,
> > +                     &disp_cc_mdss_edp_link_div_clk_src,
> >               };
> >               unsigned int i;
> >               static bool offset_applied;
>
> --
> With best wishes
> Dmitry
>
