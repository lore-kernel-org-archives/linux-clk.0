Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F84C11F69
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jul 2021 16:17:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BF5E61416
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jul 2021 16:17:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231998AbhGAQUD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Jul 2021 12:20:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbhGAQUC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Jul 2021 12:20:02 -0400
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30673C0613DB
        for <linux-clk@vger.kernel.org>; Thu,  1 Jul 2021 09:17:31 -0700 (PDT)
Received: by mail-ua1-x92d.google.com with SMTP id x37so2633495uac.13
        for <linux-clk@vger.kernel.org>; Thu, 01 Jul 2021 09:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kSutTWtKn3LC21+SCDRY5AQt3qGlpQzYvBUsBO0I13s=;
        b=Cz/Z4KysJpHmOr6ibCjk08qQ/efufrjBBkmz4eh0ueWMETfIZA/IBv7vVXKq68RJve
         IOygIBObuwk7hTTlRQrkJpz/1y/2VO47FbT+g9p26kcpMLZ7RFQMn+HSG8XIM2EUlQuq
         +2U3N1PTxEkq5dfYkUgvjBFi8AV6vHNuU6XtH5D1hIP2tTqdQNfiNSkMCDqQ7ruLglIw
         Yv9P9pn5uI3+7isevo3uyqQxHorzARSjIDcbhjFeoYkPycaIXa92T8PM0/YFQItvYiMF
         0Pl2KZQP5fgvGFxFL9ecM3129Kb2zNq1TvXJik7G03SepUiy5fZ91m+6NQ6daJFewKzz
         fBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kSutTWtKn3LC21+SCDRY5AQt3qGlpQzYvBUsBO0I13s=;
        b=WLPFibhqeDonwaLPQSQuqgcxuUUEiS12L+iLTMjgKHufJakLXfWG82fSEHcCi2kWaz
         WEGfCywYTzkGbqv6P3W3gGNWxV9baKKtU9JDSvHVqH4TMtFDZ2oPfVr+1Ph2fF2JGdAF
         7lhbkip/XOdcsQFYsMFIeFv+8fcim1NCRTBqFLnvB/tsCa1xBR6cwlNcbY12Ph0r4Ud3
         2hgLuoy+bkg7ZEpGgJUZ/yeJC2/UvH8uG4rHrc3QzEz3r1JBuyj0/gV5F+qe+9XrUZh4
         UL+Ph17RiMsWUfPcZZdXuPldJqkiz+zRBG4R/Yd8SYy5qxeGclLOOdC8QawpdWzby0Tv
         ulOw==
X-Gm-Message-State: AOAM533a1utkWXbQYALyiIV7qrBZiO09kTmB4opJ+YhL4bmHEETD8+Bm
        FPEq5n52idLP9cSMU/cX3xLGyEBCI+DiboNnhCRVxQ==
X-Google-Smtp-Source: ABdhPJyTRNUhFUu4nIiksCC4rq4CAg/HgWOpjZqRE3xtf2lCc4YLyyWXsz+vp/A0H8R9TwWUqwxE/SaVoY6h/wvKXWk=
X-Received: by 2002:ab0:484b:: with SMTP id c11mr1059123uad.100.1625156250168;
 Thu, 01 Jul 2021 09:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210630133149.3204290-1-dmitry.baryshkov@linaro.org> <20210630133149.3204290-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210630133149.3204290-2-dmitry.baryshkov@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 1 Jul 2021 18:16:53 +0200
Message-ID: <CAPDyKFpXD3rCmp53LFFYky_xQv9ucofvTezG5qWyDZt427chNQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: clock: qcom,dispcc-sm8x50: add mmcx
 power domain
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 30 Jun 2021 at 15:31, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On sm8250 dispcc requires MMCX power domain to be powered up before
> clock controller's registers become available. For now sm8250 was using
> external regulator driven by the power domain to describe this
> relationship. Switch into specifying power-domain and required opp-state
> directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,dispcc-sm8x50.yaml    | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
> index 0cdf53f41f84..48d86fb34fa7 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
> @@ -55,6 +55,16 @@ properties:
>    reg:
>      maxItems: 1
>
> +  power-domains:
> +    description:
> +      A phandle and PM domain specifier for the MMCX power domain.
> +    maxItems: 1
> +

Should you perhaps state that this is a parent domain? Or it isn't?

Related to this and because this is a power domain provider, you
should probably reference the common power-domain bindings somewhere
here. Along the lines of this:

- $ref: power-domain.yaml#

As an example, you could have a look at
Documentation/devicetree/bindings/power/pd-samsung.yaml.

> +  required-opps:
> +    description:
> +      Performance state to use for MMCX to enable register access.
> +    maxItems: 1

According to the previous discussions, I was under the assumption that
this property belongs to a consumer node rather than in the provider
node, no?

> +
>  required:
>    - compatible
>    - reg
> @@ -64,6 +74,15 @@ required:
>    - '#reset-cells'
>    - '#power-domain-cells'
>
> +# Either both properties are present or both are absent
> +dependencies:
> +  power-domains:
> +    required:
> +      - required-opps
> +  required-opps:
> +    required:
> +      - power-domains
> +
>  additionalProperties: false
>
>  examples:
> --
> 2.30.2
>

Kind regards
Uffe
