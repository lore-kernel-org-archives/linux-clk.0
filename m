Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 309D0C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 20 May 2022 16:54:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351887AbiETQyW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 May 2022 12:54:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351866AbiETQyV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 May 2022 12:54:21 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34DD115F6CC
        for <linux-clk@vger.kernel.org>; Fri, 20 May 2022 09:54:20 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id y20so7023621qvx.3
        for <linux-clk@vger.kernel.org>; Fri, 20 May 2022 09:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xksdR7cckrIApy1rhqgVh1+1eEs54VHio6TCg8UH6PI=;
        b=aYoMLy9GLz0HarktuqWF6PX6W3Ycwqx8WXBUixBc1IFf8bBNtLoBRHQu+msTTX0cc4
         keY0VhifZq4pT3AYt8s8Xnjsgs7YZyStnpnulZxy5J7xyb1f1BzZEzKLOjkzttY3n3fn
         kGgrv9amIN3QVH+2r/MZmkRmvapkrGJkF8dE5d8QWYz7F3Yk92eboDuglcOJOSQ9WsZI
         7My661vjBB1XG5YS24zXt64YVU+m1108aRnvfM6lnoVx46Hvt2Dy2S8+JuwXKm9e9wRO
         qfXYb3mbIhkSWSx171/I2tB44kS0eXqYPwVVFQy8nQySxih8ZCH+FQ30P1t6Z5pt7CYE
         QTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xksdR7cckrIApy1rhqgVh1+1eEs54VHio6TCg8UH6PI=;
        b=roP6hTVeTSdAxrzfX+A4lhz6M6IaNhQOGxA0F5ahCRJyIL3Q9r/SAPTv4tWXKcwwyq
         lv884oKFiY66+RyKDSK8eml0HKbvqPYOWQhXKR8hbER++6GTcAELDxA/ib0k3+ppRTVr
         m8ghES3nhVndsVT+pM1LC/ylKRyMVtilnEdYvVLmakLYj81Ip7KtLFcyDCzvPrO6ttXZ
         4NfZSy0L5ZGGOpTnZGX12ZRy2WVNhO9Rv0RjccDsgGPpq6nKbMjXOq3zlRC5dnongD/4
         2v6OEjt6TO/4yQIVJpjCrgAzaIutW+aB1vzg0/yc+/0mwAKzZ5dLuxWDFxcyfpu+ehNQ
         v5SA==
X-Gm-Message-State: AOAM533vp+rFnHGSjRby48xBHOa5dZtxvZDwbShuHYcB8m1HBxz2VkJa
        qhNdyl2YK70AZ8zcU1/TeksUAC4rXPWyb02P+ExcHA==
X-Google-Smtp-Source: ABdhPJz+G62lEb+fIC9mzCBS2zE3C2aMX0PQzCPkfSBWGYPNQ0OFqMEjT4w8Us9F3dPm/peRuv+0uL9/kJX1+YvWyV4=
X-Received: by 2002:ad4:5dc6:0:b0:461:e12e:932f with SMTP id
 m6-20020ad45dc6000000b00461e12e932fmr8787412qvh.115.1653065659190; Fri, 20
 May 2022 09:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220520015844.1190511-1-dmitry.baryshkov@linaro.org>
 <20220520015844.1190511-4-dmitry.baryshkov@linaro.org> <Yoe9VSxzOs733LTz@hovoldconsulting.com>
In-Reply-To: <Yoe9VSxzOs733LTz@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 20 May 2022 19:54:08 +0300
Message-ID: <CAA8EJpoFe=37G7dxecDqP922bMuktXyPmpY3rWp2Yr6J2hT4zA@mail.gmail.com>
Subject: Re: [PATCH v7 3/6] clk: qcom: gcc-sm8450: use new clk_regmap_phy_mux_ops
 for PCIe pipe clocks
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 20 May 2022 at 19:09, Johan Hovold <johan@kernel.org> wrote:
>
> On Fri, May 20, 2022 at 04:58:41AM +0300, Dmitry Baryshkov wrote:
> > Use newly defined clk_regmap_phy_mux_ops for PCIe pipe clocks to let
> > the clock framework automatically park the clock when the clock is
> > switched off and restore the parent when the clock is switched on.
> >
> > Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> For the benefit of others using the new phy_mux implementation, it would
> have been better to just do a revert of the safe-mux change. Would make
> reviewing easier too.

Fine with me, I hesitated between these two variants and settled on
having a smaller amount of noise. I'll change this in next iteration.

>
> > ---
> >  drivers/clk/qcom/gcc-sm8450.c | 72 +++++++++++------------------------
> >  1 file changed, 22 insertions(+), 50 deletions(-)
>
> > -static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src = {
> > -     .reg = 0x7b060,
> > -     .shift = 0,
> > -     .width = 2,
> > -     .safe_src_parent = P_BI_TCXO,
> > -     .parent_map = gcc_parent_map_4,
> > -     .clkr = {
> > -             .hw.init = &(struct clk_init_data){
> > -                     .name = "gcc_pcie_0_pipe_clk_src",
> > -                     .parent_data = gcc_parent_data_4,
> > -                     .num_parents = ARRAY_SIZE(gcc_parent_data_4),
> > -                     .ops = &clk_regmap_mux_safe_ops,
> > +static struct clk_regmap gcc_pcie_0_pipe_clk_src = {
> > +     .enable_reg = 0x7b060,
> > +     .hw.init = &(struct clk_init_data){
> > +             .name = "gcc_pcie_0_pipe_clk_src",
> > +             .parent_data = &(const struct clk_parent_data){
> > +                     .fw_name = "pcie_0_pipe_clk",
> >               },
> > +             .num_parents = 1,
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_regmap_phy_mux_ops,
> >       },
> >  };
>
> And again, this would be easier to understand with a dedicated struct
> clk_regmap_phy_mux (whose definition you can look up and find a
> description of how it is intended to be use).

Or one can lookup the definition of clk_regmap_phy_mux_ops and read
the corresponding text. But I see your point, let's bring it back.



-- 
With best wishes
Dmitry
