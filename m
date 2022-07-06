Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68892C43334
	for <linux-clk@archiver.kernel.org>; Wed,  6 Jul 2022 11:59:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233411AbiGFL7D (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Jul 2022 07:59:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233475AbiGFL6w (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Jul 2022 07:58:52 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AB8B2408D
        for <linux-clk@vger.kernel.org>; Wed,  6 Jul 2022 04:58:49 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id h19so17814632qtp.6
        for <linux-clk@vger.kernel.org>; Wed, 06 Jul 2022 04:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ybb7VuM+EyU7gq2LFgKPhLmRG/OyaMHbxC7umWksKZ8=;
        b=rZHzmnQi3KfezNYiiRREFmx9m2Me6jF7bZpGa4gZqjCVViRAUtiS/mSJ1oIufaW90C
         6x7xa0f/TQHDaiaOrcecdpfhsytEd6kL9jWggpW+VDtopIhdCaPCbvuEGFqcUDk3wMFy
         jZTZ4gpubNGaq6voWJp1Lwjs/drK2JCgpB8QzA96psxbz3+ccMp25fLdBMW5/lIneZPD
         PXM5XbW0nTBMl/93G1kCj40H7zoQ2b9FuyvTQCeMV3z34IFxcWgksS4RgK68IGfz5RAk
         nHCHkUi3A6+b1wdySuOW1Y72jUE2sJ72vS1zgTafXBPk20yKltHrvtNsihsI76rrEhD5
         VW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ybb7VuM+EyU7gq2LFgKPhLmRG/OyaMHbxC7umWksKZ8=;
        b=LvwzxLzkV/5CQSqJRBw11FQuDFn7t0xqEDHC1XwjdBPk6WvJaz8Qw1fWwLOeQ1lsLm
         Tap3DD6J1VJqpOlfe1DEXfMwutzE1AIyKWThymPvGpX8I/b7VpldjDjspUqulnREixSB
         02n4UfLoZL79ckUYo/OfiGAb5ctW21N9fZXPVbG5eVXR/fDG5jY/OdclkEZv+i80M5S2
         RqVKPOsYMoVqnTuEzoxLFAOi5S10DXE7HvGYRGz5WRHZs3PEMIZCxzRWsrv3K9CN/LYL
         zmSdO1nLnGCJWVdXOuJjoNNtFknqaY9CHPX38uzADJopIyuOQa0CZN79hLwJeT4q/N3J
         aweA==
X-Gm-Message-State: AJIora/FbEkMkz/WEAR6v1cTwVYZfoh40KdBs7dbd/Z181P5wdHSOQUK
        vv/0vTMDyDEPeYNQbPCmBShm6+Wakna3k9acEJQqyQ==
X-Google-Smtp-Source: AGRyM1tpqygoo95h06VZ6Q5wy3BGd11IKQKZZYSwcPEJHq3OsTNNYHtH3uXbhLxIK0RsDjRlLemPMxsVoifFDbJWXsg=
X-Received: by 2002:a05:622a:1981:b0:31a:816f:9d48 with SMTP id
 u1-20020a05622a198100b0031a816f9d48mr33430632qtc.629.1657108728501; Wed, 06
 Jul 2022 04:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220705202837.667-1-ansuelsmth@gmail.com> <20220705202837.667-2-ansuelsmth@gmail.com>
 <CAA8EJpoXOwooUYic-_G6jG7MBiHo2mfoKfR0jBDmRy0DsmMNEw@mail.gmail.com> <62c5658d.1c69fb81.1dc23.6884@mx.google.com>
In-Reply-To: <62c5658d.1c69fb81.1dc23.6884@mx.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 6 Jul 2022 14:58:37 +0300
Message-ID: <CAA8EJpqAyZp8fNO1DOz4XRFvrhBMw0fJMO4cmmTr500CpPtBYA@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: clock: fix wrong clock documentation for qcom,rpmcc
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 6 Jul 2022 at 13:35, Christian Marangi <ansuelsmth@gmail.com> wrote:
>
> On Wed, Jul 06, 2022 at 11:23:46AM +0300, Dmitry Baryshkov wrote:
> > On Tue, 5 Jul 2022 at 23:56, Christian Marangi <ansuelsmth@gmail.com> wrote:
> > >
> > > qcom,rpmcc describe 2 different kind of device.
> > > Currently we have definition for rpm-smd based device but we lack
> > > Documentation for simple rpm based device.
> > >
> > > Add the missing clk for ipq806x, apq8060, msm8660 and apq8064 and
> > > provide and additional example.
> > >
> > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > ---
> > >  .../devicetree/bindings/clock/qcom,rpmcc.yaml | 77 ++++++++++++++++++-
> > >  1 file changed, 73 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
> > > index 9d296b89a8d0..028eb0277495 100644
> > > --- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
> > [,,,,]
> >
> > > +
> > > +then:
> > > +  properties:
> > > +    clocks:
> > > +      description: pxo clock
> > > +
> > > +    clock-names:
> > > +      const: pxo
> > > +
> > > +  required:
> > > +    - clocks
> > > +    - clock-names
> >
> > I don't think you can not mark these properties as required, older
> > schemas do not have them.
> >
>
> Well considering we changed rpmcc to parent_data and rpm clock require
> pxo clock as parents it seems to be they should be required.

parent_data specifies both the normal flow (.fw_name) and the fallback
(.name), so they are not required.
I actually miss 'recommended: true' in YAML for such cases.

> Actually no idea why this wasn't required before. Probably because this
> schema described only rpm-smd and not old rpm?
>
> > > +
> > > +else:
> > > +  if:
> > > +    properties:
> > > +      compatible:
> > > +        contains:
> > > +          const: qcom,rpmcc-apq8064
> > > +  then:
> > > +    properties:
> > > +      clocks:
> > > +        items:
> > > +          - description: pxo clock
> > > +          - description: cxo clock
> > [...]


-- 
With best wishes
Dmitry
