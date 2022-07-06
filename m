Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E57B0CCA480
	for <linux-clk@archiver.kernel.org>; Wed,  6 Jul 2022 08:24:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231997AbiGFIYS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Jul 2022 04:24:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231757AbiGFIX7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Jul 2022 04:23:59 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19C23140E7
        for <linux-clk@vger.kernel.org>; Wed,  6 Jul 2022 01:23:58 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id v6so10530743qkh.2
        for <linux-clk@vger.kernel.org>; Wed, 06 Jul 2022 01:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1rup06Vco8ni++NHk+fV9QZlwRsoZbZgKQALP9OU2oQ=;
        b=cv+j4JQb1ISWoJ8z34+l/PMmk8xfXG9cKN8LSWsB85ldibuPnuenR53ZannLlgpZIG
         QFC89WnyC8qgjzl6vLBd3WoviKmm6AiC1QZfdPWTqazZ2XUQ++kO75BdibuOSJOyJv02
         3UQahRMUaQFqFbvmNTgRQNm8g7eEQe+SBya47/yv3vDZjupFvcADpI85/Iieky0bYFqX
         I/rHPcAJnhKtfJs0mzuQCP+Gnx9uc9h+fJ35Ts1CG1KXAeamqbypySdJJqSZ+Ged0WN1
         pJJOb4qZN5j7oEJDiC7PFkZEY7R/gIXsdS7IIFxmOxg6QL9gNlSz/70nYW2wWUoKqOCV
         EYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1rup06Vco8ni++NHk+fV9QZlwRsoZbZgKQALP9OU2oQ=;
        b=H17YBTncClGG4c6yGOBnhzBjw+hBSV9lytnd2NqNYpieQHR954yyIaKJe1dwqiXzRJ
         UjmZxKjwU+eFzPP6JsNiLbvBq/DIZhzhGHKhz8Kihjagv48ij41nQs9LVEj8cblAhXZD
         u6A/VfATaxZsAEmFwc0RJyxiAJi1DW59Z+6voMHdM2tgmJ8/AEpa7nz0PE6CzFlipBow
         Tmt/9a3aC4bmsaT+e8+9CLzKu28tVvInrsMxnJJ/Sm/w49gpSGPcGBTaOMQt7COhNlUC
         tZAGNmNO82I3bwpvcZe4cIhzWpwa17RQq2MGiNqAd44NIbdI3icNDP4wjakmDiEEyrK4
         yiXg==
X-Gm-Message-State: AJIora9MMFR9QO3NHP74uHnRxGNJkVTOkWul72xekprGdWgbrVLWE1fm
        asqhwo/F6XMd+SZelXwTuEy7f5NAdaJj0mXCfK/GEpyIfVc=
X-Google-Smtp-Source: AGRyM1tdB1TNGeTDhjl2mWrO7dYY5lgeSpPZwNnggzjHH2xfv/Copq/oDtv5UzbGKDrdkmU3Mixw5wsgQlFU7i8ZuvU=
X-Received: by 2002:a05:620a:2409:b0:6b1:4464:e401 with SMTP id
 d9-20020a05620a240900b006b14464e401mr26117406qkn.30.1657095837223; Wed, 06
 Jul 2022 01:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220705202837.667-1-ansuelsmth@gmail.com> <20220705202837.667-2-ansuelsmth@gmail.com>
In-Reply-To: <20220705202837.667-2-ansuelsmth@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 6 Jul 2022 11:23:46 +0300
Message-ID: <CAA8EJpoXOwooUYic-_G6jG7MBiHo2mfoKfR0jBDmRy0DsmMNEw@mail.gmail.com>
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

On Tue, 5 Jul 2022 at 23:56, Christian Marangi <ansuelsmth@gmail.com> wrote:
>
> qcom,rpmcc describe 2 different kind of device.
> Currently we have definition for rpm-smd based device but we lack
> Documentation for simple rpm based device.
>
> Add the missing clk for ipq806x, apq8060, msm8660 and apq8064 and
> provide and additional example.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../devicetree/bindings/clock/qcom,rpmcc.yaml | 77 ++++++++++++++++++-
>  1 file changed, 73 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
> index 9d296b89a8d0..028eb0277495 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
[,,,,]

> +
> +then:
> +  properties:
> +    clocks:
> +      description: pxo clock
> +
> +    clock-names:
> +      const: pxo
> +
> +  required:
> +    - clocks
> +    - clock-names

I don't think you can not mark these properties as required, older
schemas do not have them.

> +
> +else:
> +  if:
> +    properties:
> +      compatible:
> +        contains:
> +          const: qcom,rpmcc-apq8064
> +  then:
> +    properties:
> +      clocks:
> +        items:
> +          - description: pxo clock
> +          - description: cxo clock
[...]

-- 
With best wishes
Dmitry
