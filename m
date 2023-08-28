Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E79C83F12
	for <linux-clk@archiver.kernel.org>; Mon, 28 Aug 2023 11:39:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231644AbjH1Lij (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Aug 2023 07:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbjH1LiT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Aug 2023 07:38:19 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2850CEB
        for <linux-clk@vger.kernel.org>; Mon, 28 Aug 2023 04:38:17 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d743a5fe05aso2950749276.2
        for <linux-clk@vger.kernel.org>; Mon, 28 Aug 2023 04:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693222696; x=1693827496;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X/GcQDos7beFK8Cr8pyybDQsIb90MvDBQ7F0gE7uSTg=;
        b=t+y7VOvrfhe78N28JaKtOAKkHPLsu0IfQyka5RAfFYATUbKwuudLVhdSwKPEb3H8Lw
         PW8kVppM5FFqRHtKhOiEaPBaH81Vz0YHQZ7tfWJCl578+tSqAiA6tA+ntEkNPtxFdCDN
         Vy8VMnmY5S8ClorwFa57g7r6ravlzmJvsm7Q1czfcEiwkoFfXMpgb2Gr1Ul6qjIKJxD4
         hSKu1kxrsgglwBmpPc/EMr4hak2/pqSJK2V1noRujL18QZoxfYpRk2h3hSCvnUpyi/Sv
         Em7/khjjteAnGfPwcSpknD9Z1GOF/Jn0nni7I2BagYqACyrXQNbosuIBMkYKLvxgGZx7
         +Mzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693222696; x=1693827496;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/GcQDos7beFK8Cr8pyybDQsIb90MvDBQ7F0gE7uSTg=;
        b=P6mre91MAUz6yqRfNfo5FUNljBeNlBgmjci9vSUFzx7l/wQqCWiN4mOyHQi+2HviGd
         NqssmDxY0kQhjK6ZS3XiSvUYVM1FSa69kAglSiS9gbtBGQZPF5HaxgCnLPau8G1ZjcML
         RubydQ0zbqDxH+80eKPnRaH4i1a7Tni2iTm4ZG7oTok3ngUn4dpeiNMIJfzd0j4p6dN5
         1OgeZBnwYDOvWt4FyQpZZtj0zY4O079aPRQg8+8Yki79LEVGIQcTQ7n/cBICOQ/gg5l3
         xXMnlZYog3GVFGq9Rfj4+pM9/btfcMAFzRpFOb01U4AgMYBhMPMOwj+WRdSTAkUaaqFl
         2Sbw==
X-Gm-Message-State: AOJu0YwbCBipQIX4ByLj8KwqBcXQaeBcUDUVlHlu9p2+9cVhQ4uW0MiM
        mwFd/tBVOzzjozlM9SkAwTCA6rdD6dXhFZAfNUw0kQ==
X-Google-Smtp-Source: AGHT+IGSI0QI0tI/WkUznWjFS0uzLKIYm0i0wZ8BZiHVTdJITFObmZ7zhr+id79WX+wWOU1SIhbptghNiVOrUezedCE=
X-Received: by 2002:a25:874c:0:b0:d5d:4df9:b6e2 with SMTP id
 e12-20020a25874c000000b00d5d4df9b6e2mr21819788ybn.46.1693222696379; Mon, 28
 Aug 2023 04:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
 <20230827115033.935089-16-dmitry.baryshkov@linaro.org> <3b88827f-9cda-46b3-96ad-d10245afce1e@linaro.org>
In-Reply-To: <3b88827f-9cda-46b3-96ad-d10245afce1e@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 28 Aug 2023 14:38:04 +0300
Message-ID: <CAA8EJpp7GQ1DFcYwdS3-UG7CzRZT5KXXL78wgbYs46o72ZxLuw@mail.gmail.com>
Subject: Re: [PATCH v4 15/23] ARM: dts: qcom: apq8064: add Krait clock controller
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 28 Aug 2023 at 13:54, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 27.08.2023 13:50, Dmitry Baryshkov wrote:
> > Add device node for the clock controller for the CPU cores and L2
> > clocks. It will be further used by the L2 and by the CPUfreq nodes.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 26 ++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > index ba7d5ef8de17..a05e64bff07f 100644
> > --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > @@ -213,6 +213,32 @@ sleep_clk: sleep_clk {
> >               };
> >       };
> >
> > +     kraitcc: clock-controller {
> > +             compatible = "qcom,krait-cc-v1";
> > +             clocks = <&gcc PLL9>,
> > +                      <&gcc PLL10>,
> > +                      <&gcc PLL16>,
> > +                      <&gcc PLL17>,
> > +                      <&gcc PLL12>,
> > +                      <&acc0>,
> > +                      <&acc1>,
> > +                      <&acc2>,
> > +                      <&acc3>,
> > +                      <&l2cc>;
> > +             clock-names = "hfpll0",
> > +                           "hfpll1",
> > +                           "hfpll2",
> > +                           "hfpll3",
> > +                           "hfpll_l2",
> > +                           "acpu0_aux",
> > +                           "acpu1_aux",
> > +                           "acpu2_aux",
> > +                           "acpu3_aux",
> > +                           "acpu_l2_aux";
> > +             #clock-cells = <1>;
> > +             #interconnect-cells = <1>;
> Doesn't only the L2 device register with icc?

True. I'll drop this



--
With best wishes
Dmitry
