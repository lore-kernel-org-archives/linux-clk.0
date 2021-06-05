Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 284FFC47082
	for <linux-clk@archiver.kernel.org>; Sat,  5 Jun 2021 08:34:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 04999613EA
	for <linux-clk@archiver.kernel.org>; Sat,  5 Jun 2021 08:34:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbhFEIg3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 5 Jun 2021 04:36:29 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:42800 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbhFEIg3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 5 Jun 2021 04:36:29 -0400
Received: by mail-ot1-f53.google.com with SMTP id w23-20020a9d5a970000b02903d0ef989477so7051283oth.9
        for <linux-clk@vger.kernel.org>; Sat, 05 Jun 2021 01:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xBV9HQE6LSgYnjZVgsIOmo2PRbMwZA/ckSgBtoYgAJM=;
        b=STGjXij3JqwF7wloVQRWY4phBR14Uf0yDtHOxJ/sYXc1OwcDp5c+IXfOtARdk1Frx4
         kXI0QW0NyKG/IaOry5E96m9X8EwovQ0CJgUP2D4z6VNpnb17GNGnPd1UormSjUCpc+sQ
         7cgJlSdp7ETsEe0TwYVsCRYs1nWwdDyQ/ptKDLpmJ74ZQVYcy2RAniy+IFMyxbbJQby+
         lX7BDN1VnEIUN3l58Dro+7xcHF5lw2YF7qxg7w+5oK4MPRQ+IOixFP2D1y2JPoqjqFST
         Q4A+/v1+tTi/cf/wMWXmBJTBMnPWhlaBuTZIF8Lk4aViocWjSPQvs2/Eb052iTYEHVX4
         mizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xBV9HQE6LSgYnjZVgsIOmo2PRbMwZA/ckSgBtoYgAJM=;
        b=Ldzpn1YlfehVSH7jO0HNptLbLgvcZYvSFwnIkXDxz39naUNCEi6Tk6M7+ZtxvYsq19
         EqYVqguS6fKrM6QDNCvSF1/MIEWZH4OVmUJzCOlGCQU+3qThFPzxjHdQ1TbWUrhnytzN
         jyDa1gzmgmszPrtN+g9NQ13E4cvQJqncBbr88xdrYShrrOXy/MNVeA5GVvfBIrMwY8Ox
         yDmAUz/TXSKZGeNpkoKsSroGJ48wNAF+Jn5t9q52KG1f48kI9wFFnLCTQxopLFlPvJVG
         wHNEABBSnQkb5TT97uPb6jBOXSGMKA6VH1XqDFwaQA7fRFn5YHGaRCsHYeQAu6qn57Nq
         zR+g==
X-Gm-Message-State: AOAM5309nv8UDyNO2VyueErNaFmYzWNkPkXsR827Vz1SqpSMVWt8D7pa
        UVO/nO5fo3yFJFBmQjYP4+CrTqldrIPjzfIyN2MBRQ==
X-Google-Smtp-Source: ABdhPJxRmPVU6f456kI2Kv4UtWeYtFvXR43WBVmOga1zilDIm/FcYb+VcXfmzAcsqPPxx3iIignQ0+Ff8kG68Gq8t0k=
X-Received: by 2002:a9d:6117:: with SMTP id i23mr6623646otj.28.1622882021804;
 Sat, 05 Jun 2021 01:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143700.27392-1-bhupesh.sharma@linaro.org>
 <20210519143700.27392-9-bhupesh.sharma@linaro.org> <20210521014646.GA2472971@robh.at.kernel.org>
In-Reply-To: <20210521014646.GA2472971@robh.at.kernel.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Sat, 5 Jun 2021 14:03:31 +0530
Message-ID: <CAH=2Ntw=d9bf44mHp=tHDNuo-3bK+mcBZ3WgLESF5UNCRXj2Lg@mail.gmail.com>
Subject: Re: [PATCH v3 08/17] dt-bindings: crypto : Add new compatible strings
 for qcom-qce
To:     Rob Herring <robh@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Rob,

On Fri, 21 May 2021 at 07:16, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, May 19, 2021 at 08:06:51PM +0530, Bhupesh Sharma wrote:
> > Newer qcom chips support newer versions of the qce crypto IP, so add
> > soc specific compatible strings for qcom-qce instead of using crypto
> > IP version specific ones.
> >
> > Cc: Thara Gopinath <thara.gopinath@linaro.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: Herbert Xu <herbert@gondor.apana.org.au>
> > Cc: David S. Miller <davem@davemloft.net>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: dmaengine@vger.kernel.org
> > Cc: linux-clk@vger.kernel.org
> > Cc: linux-crypto@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: bhupesh.linux@gmail.com
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> > index 4be9ce697123..7722ac9529bf 100644
> > --- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> > +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> > @@ -15,7 +15,12 @@ description: |
> >
> >  properties:
> >    compatible:
> > -    const: qcom,crypto-v5.1
>
> You can't get rid of the old one.

Ok, I will fix it in v4.

Thanks,
Bhupesh

> > +    enum:
> > +      - qcom,ipq6018-qce
> > +      - qcom,sdm845-qce
> > +      - qcom,sm8150-qce
> > +      - qcom,sm8250-qce
> > +      - qcom,sm8350-qce
> >
> >    reg:
> >      maxItems: 1
> > @@ -71,7 +76,7 @@ examples:
> >    - |
> >      #include <dt-bindings/clock/qcom,gcc-apq8084.h>
> >      crypto-engine@fd45a000 {
> > -        compatible = "qcom,crypto-v5.1";
> > +        compatible = "qcom,ipq6018-qce";
> >          reg = <0xfd45a000 0x6000>;
> >          clocks = <&gcc GCC_CE2_AHB_CLK>,
> >                   <&gcc GCC_CE2_AXI_CLK>,
> > --
> > 2.31.1
> >
