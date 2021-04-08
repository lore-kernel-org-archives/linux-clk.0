Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D34C433ED
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:38:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A464A61186
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:38:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbhDHAib (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Apr 2021 20:38:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbhDHAia (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Apr 2021 20:38:30 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 609CFC061760
        for <linux-clk@vger.kernel.org>; Wed,  7 Apr 2021 17:38:18 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id h3so70971qvr.10
        for <linux-clk@vger.kernel.org>; Wed, 07 Apr 2021 17:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1nGUzu4qNZTPndpk9QEmw4K0zNMWrS/U4pG62W10g1I=;
        b=nkZSHP4l9vkbT6OFbkhcUSkSi3iE0RJe0wUnONM4I7k6c8hnwA/snwYo769mjjyZ6m
         qOb+d/ay4X1DMvBgEgdFElXPIzf5+BeNSLpNLdcRmR9E2uve9LNDDaO4G+kCdcNHPad5
         cV9WzJFmz5KWtl6GEjxxyhzLH/dkM8uRxDnl714+AKgYige+qrSxmwYBM0m/KGvqWoEG
         mJavs1Qhh6VNgjgkipSpY+2zuCmi/lQ/t98k/vyMK8SAyy/VZo3HrGjjGkKDGnxElvbx
         A3+LafR71R1l937Fw8sBdeTI10vQnshSWSaIdX0Fx0lPYa7ntmLOPBkssDcJTykqi4EN
         kV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1nGUzu4qNZTPndpk9QEmw4K0zNMWrS/U4pG62W10g1I=;
        b=lG3NrzBuj3ly0HXdM3c2GRPgV/ES70840xzXHfPJsdZ/L8sE9J80Fj6jARPt6dVxiY
         nkWoW/13Q8OOirRXSTM13iamxvAE6oehI8patyu9iaXeERQ+z7b0jTGAjBbxG5F/sEs0
         sfRLz4fQhgInh9YJtgzxgSRuhyGFGeQLBSkXgP0TnAmCi3ONAVDryolYVR6nwirSdKRh
         haumiq3WP6Cff3Vboh0wNI1m/zOi2p+7gl/T/0OVZdiSrcYiagdz+ULmzttO6W+oHz+T
         /BDXIMCYq+N9MU3mJPkdvPptIm4nYxClSLCePoli2egb5LrJQwkPo6j0822lL/kYgZAh
         QixQ==
X-Gm-Message-State: AOAM533KqzbySKqeMUsaiOEPDB1Mm50TFnLDoo1mCkPLbBJTIkclCGBX
        QO3my7WUfV+aiUQYSaL8uQYPLd8EA5guoIoFQrk3tQ==
X-Google-Smtp-Source: ABdhPJydECt459zvSvLS5niFVsoae50GE1E1nTcJk7wCRDz5EeTeguSHV3SqZ83xSq1VRanzQmjWYibeJWA9pxkZ/8o=
X-Received: by 2002:a05:6214:1870:: with SMTP id eh16mr6073598qvb.23.1617842297591;
 Wed, 07 Apr 2021 17:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210406231909.3035267-1-dmitry.baryshkov@linaro.org>
 <20210406231909.3035267-2-dmitry.baryshkov@linaro.org> <161784119850.3790633.17698180700358661431@swboyd.mtv.corp.google.com>
In-Reply-To: <161784119850.3790633.17698180700358661431@swboyd.mtv.corp.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 8 Apr 2021 03:38:06 +0300
Message-ID: <CAA8EJpqVJgj0eBm5m91MNqiBZg0y1v=iMAuLpW8H-i3ut8-q0A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: separate SDM845 GCC clock bindings
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

On Thu, 8 Apr 2021 at 03:20, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dmitry Baryshkov (2021-04-06 16:19:06)
> > Separate qcom,gcc-sdm845 clock bindings, adding required clocks and
> > clock-names properties.
>
> Yes, but why?

Why separate or why add required clocks? Consider the rest of
bindings, where qcom,gcc.yaml defines older bindings, which do not use
clocks/clock-names and for newer bindings we have one file per binding
(qcom,gcc-apq8064.yaml, qcom,gcc-qcs404.yaml, qcom,gcc-sdx55.yaml,
qcom,gcc-sm8150.yaml, etc).

Do you suggest merging all of them back into a single yaml file?

>
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../bindings/clock/qcom,gcc-sdm845.yaml       | 84 +++++++++++++++++++
> >  .../devicetree/bindings/clock/qcom,gcc.yaml   |  2 -
> >  2 files changed, 84 insertions(+), 2 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
> > new file mode 100644
> > index 000000000000..4808fa7a6b8c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
> > @@ -0,0 +1,84 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/qcom,gcc-sdm845.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Global Clock & Reset Controller Binding
> > +
> > +maintainers:
> > +  - Stephen Boyd <sboyd@kernel.org>
> > +  - Taniya Das <tdas@codeaurora.org>
> > +
> > +description: |
> > +  Qualcomm global clock control module which supports the clocks, resets and
> > +  power domains on SDM845
> > +
> > +  See also:
> > +  - dt-bindings/clock/qcom,gcc-sdm845.h
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,gcc-sdm845
> > +
> > +  clocks:
> > +    items:
> > +      - description: Board XO source
> > +      - description: Board active XO source
> > +      - description: Sleep clock source
> > +      - description: PCIE 0 Pipe clock source (Optional clock)
> > +      - description: PCIE 1 Pipe clock source (Optional clock)
>
> Can we make them not optional?

Sure,

>
> > +    minItems: 3
> > +    maxItems: 5
>
> And remove this? Because in reality the clks are always going there so
> we can put a <0> element in the clocks array if we don't care to
> actually specify it.

Fine with me.

>
> > +
> > +  clock-names:
> > +    items:
> > +      - const: bi_tcxo
> > +      - const: bi_tcxo_ao
> > +      - const: sleep_clk
> > +      - const: pcie_0_pipe_clk # Optional clock
> > +      - const: pcie_1_pipe_clk # Optional clock
> > +    minItems: 3
> > +    maxItems: 5
> > +



-- 
With best wishes
Dmitry
