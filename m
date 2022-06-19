Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A25C433EF
	for <linux-clk@archiver.kernel.org>; Sun, 19 Jun 2022 05:06:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232689AbiFSFGP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 19 Jun 2022 01:06:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbiFSFGN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 19 Jun 2022 01:06:13 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 711C911A3A
        for <linux-clk@vger.kernel.org>; Sat, 18 Jun 2022 22:06:12 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id 89so11935572qvc.0
        for <linux-clk@vger.kernel.org>; Sat, 18 Jun 2022 22:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g4eUI0BzbqwGfzltxtB1irXUPNhqdMTDmFUtF3/NrEk=;
        b=zHsc3IUT4Fbw+cGtTC7if0IXCCImCmFqk/hM3dLQbUPKhRHUKnFLZF9SUf3B81v5NP
         D83b2xZDg5fFpyaO5Qr8Zp7Jl0CKjh8wh4gVpHQctiDEuiNcX8yLhN98C3z9X9Pc08i9
         qmxBpWvDGthGUYuJczAFRk4ran3B6P3uNofIX2dyxfbt4E+iso3NQ48Ep98mdv8MsExC
         RX6Cdeu8qSg7vGg+Sz3qGs06XR2L3llI2Smls+0om2jzXGkCRKjc9Z7HmW+diWxpEwXz
         JT5RRdx9LJAxOFZUcIKNeBrs/AEKEaQrE/x9AvmDK4nIfW+DPHnatP4GWX0AhpbrXH2L
         O9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g4eUI0BzbqwGfzltxtB1irXUPNhqdMTDmFUtF3/NrEk=;
        b=k9vtoeb/7gpFhrKCHZ7H3UYu3pGtJx1NRw1InKwKiP8YST+VyquK00saZma8QiqKF7
         W1GEZuUXuKUqiN3k1ZgGyoG0juvSfVDQOwqIFwM1fN/1RGhRhn6DVW1eWHgSAx0YW6Dq
         F/ncs1UZPz6Zq3Z/jc/Nb5Gugf14NjusE2TgKK94RXjormXt/bQKrPJsO9gOZQrAH174
         Wm4NkqN54wlv84RL/w/sMlTot9Ri70BOLzyX04Cdyb5AIa3iR3mD0fT93ItNdKurbCx9
         /Lbu9qJjQu8UwWio1oE1XOGv0XH5NehjmPAACWrOyyfieMCqGmAiSZYfx1A0OBsO2joL
         rRjA==
X-Gm-Message-State: AJIora/C80gjJM/bbJleJ3rzDKRIN+c1undmC2y8jB8DSUoBHITztQZl
        S/5K25GBeUvPVUdN27qXnCaaxbAnNJmHBJfCGli0YA==
X-Google-Smtp-Source: AGRyM1sud0zhM7jkdrKtZrSMEefvPSTwagyhaVTx2h3tVe+6G4KWz3aHPaaZLXUwxhbZWLhmy2iETlAl/4Tvp/nMLlo=
X-Received: by 2002:ac8:7e87:0:b0:306:6575:6035 with SMTP id
 w7-20020ac87e87000000b0030665756035mr14886059qtj.629.1655615171582; Sat, 18
 Jun 2022 22:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220617122922.769562-1-dmitry.baryshkov@linaro.org>
 <20220617122922.769562-7-dmitry.baryshkov@linaro.org> <155e3867-c37e-4cc4-782c-3903b134c427@somainline.org>
In-Reply-To: <155e3867-c37e-4cc4-782c-3903b134c427@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 19 Jun 2022 08:06:00 +0300
Message-ID: <CAA8EJpoDEXHkf1sbvrEc0-Pc8jSd3ZMjTGHj4bwSzo_q4UP9HA@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: msm8996: add clocks to the MMCC
 device node
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 19 Jun 2022 at 02:53, Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:
>
>
>
> On 17.06.2022 14:29, Dmitry Baryshkov wrote:
> > As we are converting this platform to use DT clock bindings, add clocks
> > and clock-names properties to the MMCC device tree node.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>
>
> Sidenote: would RPM XO work here, or is it broken on 8996?

I was not sure, which of XOs should be used here, thus I just left the xo_board.

We already have several other devices on 8996 which use xo_board, so
ideally we should fix all of them later.

>
> Konrad
> >  arch/arm64/boot/dts/qcom/msm8996.dtsi | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > index dffb87a5ee74..0c7b7cd9f23e 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > @@ -751,6 +751,22 @@ mmcc: clock-controller@8c0000 {
> >                       #reset-cells = <1>;
> >                       #power-domain-cells = <1>;
> >                       reg = <0x008c0000 0x40000>;
> > +                     clocks = <&xo_board>,
> > +                              <&gcc GCC_MMSS_NOC_CFG_AHB_CLK>,
> > +                              <&gcc GPLL0>,
> > +                              <&dsi0_phy 1>,
> > +                              <&dsi0_phy 0>,
> > +                              <0>,
> > +                              <0>,
> > +                              <0>;
> > +                     clock-names = "xo",
> > +                                   "gcc_mmss_noc_cfg_ahb_clk",
> > +                                   "gpll0",
> > +                                   "dsi0pll",
> > +                                   "dsi0pllbyte",
> > +                                   "dsi1pll",
> > +                                   "dsi1pllbyte",
> > +                                   "hdmipll";
> >                       assigned-clocks = <&mmcc MMPLL9_PLL>,
> >                                         <&mmcc MMPLL1_PLL>,
> >                                         <&mmcc MMPLL3_PLL>,
> >



-- 
With best wishes
Dmitry
