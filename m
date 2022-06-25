Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA790C43334
	for <linux-clk@archiver.kernel.org>; Sat, 25 Jun 2022 00:00:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbiFYAA2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Jun 2022 20:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiFYAA1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jun 2022 20:00:27 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C12D8BEF6
        for <linux-clk@vger.kernel.org>; Fri, 24 Jun 2022 17:00:26 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id k20so3074496qkj.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Jun 2022 17:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IJAvhDroqXmrsqH4iFc0E0GuqNL82U57VX6UdPTB9n4=;
        b=UjArEFJwORom6BY7pUnOBCcQ0EVVDgVYIpnJWPp0BMyABVVRD1xExo45roAleP5uys
         R5ue84Q/xYTkg7Pk/QwD/ZTYk6pmkULGBg2rJ7g2+5NS7XmUTsc1KYWB4KfJN8p3NXTT
         JsFzxwEboUM+nV0Ve4r6i8fbRenjKlWnX4glXb00XQtdtsZ0e592YIGwQ1/ZB1V4s7hO
         qSx1QU3tiwgnZu5QfxwijJbNrQTx5TvlYracdQUpOb5ljOy/s68U4W1pPS++J9fEdJ+6
         lyGxPm3Yv2FpyrxYiI/K9538LR/Z8KpAEwdXIq/AW2poyhpws3a75rNPyZw2JJRIjPWw
         mPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IJAvhDroqXmrsqH4iFc0E0GuqNL82U57VX6UdPTB9n4=;
        b=EWwNC4REm8m1c1sT/b3AzjIj5mzHaNGhzPN29j1nmsRS9m5JQDyuYmC53R+arjIwpz
         69FqhHOB+P1VoREWkNKJK9s2Ea7r9dllQRBFJF2yXMglw35hznL7GgAYhNCY/+haO5vx
         g3xm/rgy4+06w8jkBWTo3wwp+96pU9IKQpqCWz7TxciUck4iXCH13A5d7kO8Bvg0V6Rr
         gwUWEDN2daYKfjEbVTUzGeyhDenOnG3AIz5SVnMk9NKxAZX9kBbzUF2rKlqSCwr5wy3S
         6Y7ruAfSCMdgmuq1VULS0OXfHEDx2X9qnYce2ILxeEs88zOO8d3QZinH64tvZFLYEVgc
         vGQQ==
X-Gm-Message-State: AJIora/jEBOp2Ir8dInFp8/BIDW3ANb0Gp+6hWsQ+420IIucttnNg7sV
        dCyNz5lPX/pjNmgicZ/aOcIK1u8m2u2Hq0auWf9I+A==
X-Google-Smtp-Source: AGRyM1tKMU1zp+sgdctuv70FNenlX/Oh6sbMw452AJpPiUL9wpU9PVXvgjjHaSl5eBf1lE3MMCyE6Eg6264uUtkypd4=
X-Received: by 2002:a05:620a:4156:b0:6a6:f8d2:6d9e with SMTP id
 k22-20020a05620a415600b006a6f8d26d9emr1424978qko.30.1656115225461; Fri, 24
 Jun 2022 17:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
 <20220623120418.250589-3-dmitry.baryshkov@linaro.org> <21efbf73-74af-8f80-3577-b82f39e161e6@linaro.org>
In-Reply-To: <21efbf73-74af-8f80-3577-b82f39e161e6@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 25 Jun 2022 03:00:14 +0300
Message-ID: <CAA8EJpp+pTPjFnGXaWvjUBFc=B9b=OwnHYUP33MNQOsaxwqk4w@mail.gmail.com>
Subject: Re: [PATCH 02/15] dt-bindings: clocks: qcom,mmcc: define
 clocks/clock-names for MSM8960
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 24 Jun 2022 at 18:57, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 23/06/2022 14:04, Dmitry Baryshkov wrote:
> > Define clock/clock-names properties of the MMCC device node to be used
> > on MSM8960/APQ8064 platform.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../devicetree/bindings/clock/qcom,mmcc.yaml  | 31 +++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
> > index d02fe6dc79b5..c13243682365 100644
> > --- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
> > +++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
> > @@ -82,6 +82,37 @@ then:
> >      - clock-names
> >
> >  allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - qcom,mmcc-apq8064
> > +              - qcom,mmcc-msm8960
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: Board PXO source
> > +            - description: PLL 3 clock
> > +            - description: PLL 3 Vote clock
> > +            - description: DSI phy instance 1 dsi clock
> > +            - description: DSI phy instance 1 byte clock
> > +            - description: DSI phy instance 2 dsi clock
> > +            - description: DSI phy instance 2 byte clock
> > +            - description: HDMI phy PLL clock
> > +
> > +        clock-names:
> > +          items:
> > +            - const: pxo
> > +            - const: pll3
> > +            - const: pll8_vote
> > +            - const: dsi1pll
> > +            - const: dsi1pllbyte
> > +            - const: dsi2pll
> > +            - const: dsi2pllbyte
> > +            - const: hdmipll
>
> The clocks are listed in properties, so they have min/max constraints
> set implicitly. Are you sure this now works fine?

I mentioned this while listing dependencies in the patchset description (00/15):

Dependencies: [1] (whole series), [2], [3]
[...]
[2] https://lore.kernel.org/linux-arm-msm/20220617122922.769562-2-dmitry.baryshkov@linaro.org/

This patch moves clocks/clock-names to the conditional clause.

-- 
With best wishes
Dmitry
