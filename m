Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8524DC43470
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 01:17:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 642666136A
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 01:17:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbhDHBRS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Apr 2021 21:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230475AbhDHBRS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Apr 2021 21:17:18 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0BA9C061760
        for <linux-clk@vger.kernel.org>; Wed,  7 Apr 2021 18:17:06 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id g15so646000qkl.4
        for <linux-clk@vger.kernel.org>; Wed, 07 Apr 2021 18:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RponVH/n0pFWeAldVZ4sD08GNccWTnm59ZDslhoHoI8=;
        b=iBGVFBxiMIY/WHY9U2+dk0mL9hmKnaVjUbryQlNgHHXCc+cZftQLQgTW3+vtrfj4cc
         FI9ICgXJ2YllVjB/zIujnGYD5u7ODgjWg4R5yTb+IeFhu+IhdjKMRkE3+oECw8umIwLZ
         2nuGUk7MJV8+Wsszk2EwJrPqUgrZkCri0TDtRN23nFN5NMvbjqocAQWhaguBejQJZptK
         Vett4vHV07sEi1iEVMH52KkWcrjVcynhfnpDHgnr/HGaNbOXMb7ecxnUkbIEXS/LILee
         IgdKLfOtZVk4toehA4Swe1AdlfPC3nBjsl5gOlR/ivUtEjvQIb4QrMdqeh97x9/OoyOU
         HiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RponVH/n0pFWeAldVZ4sD08GNccWTnm59ZDslhoHoI8=;
        b=Q4GafOfvSTo7kvWGgEOD4WaHXHB5DLbunovKzayj09D0J8JlNQe+cz3qXdo2A0GFqO
         g9Piuz5FIBb5n6Zri3eiBWciPBPzEGRMhyKQaCH82hsVFlTSMTwrp9qPZ1+XPfaoIjWs
         dJWGz1y43gL8xyYU5ySGve51ZSUFYm7MCXwaLV8rdZKvWL9I2TnXu065ZMMV4JCnu11T
         svnqJwZyhQbp43f7P4coKy2/iUOvhNDR2jBashm4/2XRmrt3IURebDbX+5sMsdbWLHW8
         1iit2iqXlsU2vMWj57AUIa9KOtg6XfMBIz2hMdEeHpZf7vw8cMuec/96LR+3dxL5V9Qy
         dgUg==
X-Gm-Message-State: AOAM530m0SYjAtRtRhqtwAkY+QL88mXgKKOnYOQF8zXp2vBaVwBC8OYf
        B0b3gEM4dMwkUJ+wWRU8s9Km0ZXc/Pin0iOPBj063Z9WWZA=
X-Google-Smtp-Source: ABdhPJz3UZBfJjNTlP+uGEGfQYh2yVI4kGW+LUjXTJj1Heanc3aJJRzfi/+eypiUVBdXr/0LZzRlJHcikVMKUlbnY/8=
X-Received: by 2002:ae9:f312:: with SMTP id p18mr6207469qkg.162.1617844625938;
 Wed, 07 Apr 2021 18:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210406231909.3035267-1-dmitry.baryshkov@linaro.org>
 <20210406231909.3035267-2-dmitry.baryshkov@linaro.org> <161784119850.3790633.17698180700358661431@swboyd.mtv.corp.google.com>
 <CAA8EJpqVJgj0eBm5m91MNqiBZg0y1v=iMAuLpW8H-i3ut8-q0A@mail.gmail.com> <161784413353.3790633.12158005058384470922@swboyd.mtv.corp.google.com>
In-Reply-To: <161784413353.3790633.12158005058384470922@swboyd.mtv.corp.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 8 Apr 2021 04:16:54 +0300
Message-ID: <CAA8EJprRt=mx5k6cGO91nmH8e1QkKTAnPasveFY7kVhgBBb42w@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: separate SDM845 GCC clock bindings
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        DRM DRIVER FOR MSM ADRENO GPU 
        <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, open list:COMMON CLK FRAMEWORK" 
        <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 8 Apr 2021 at 04:08, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dmitry Baryshkov (2021-04-07 17:38:06)
> > Hello,
> >
> > On Thu, 8 Apr 2021 at 03:20, Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Dmitry Baryshkov (2021-04-06 16:19:06)
> > > > Separate qcom,gcc-sdm845 clock bindings, adding required clocks and
> > > > clock-names properties.
> > >
> > > Yes, but why?
> >
> > Why separate or why add required clocks? Consider the rest of
>
> Why separate the binding from the overall gcc one.
>
> > bindings, where qcom,gcc.yaml defines older bindings, which do not use
> > clocks/clock-names and for newer bindings we have one file per binding
> > (qcom,gcc-apq8064.yaml, qcom,gcc-qcs404.yaml, qcom,gcc-sdx55.yaml,
> > qcom,gcc-sm8150.yaml, etc).
> >
> > Do you suggest merging all of them back into a single yaml file?
>
> No. Please add the "why" part to the commit text. The "how" and "what"
> should be clear from the patch itself. I guess "so we can add required
> clocks and clock-names properties to the binding" should be sufficient.

Ah, got you. Sorry for the confusion. Will send v3 shortly.

-- 
With best wishes
Dmitry
