Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 222AAC46467
	for <linux-clk@archiver.kernel.org>; Wed, 18 Jan 2023 12:20:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbjARMUw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Jan 2023 07:20:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbjARMTA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Jan 2023 07:19:00 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8F985897E
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 03:41:55 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id r30so9213160wrr.10
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 03:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LGHFHZvnL2Z0zGaW92z6BFzy5L5MiRfkHohrKv00800=;
        b=TThCXk5vM2PSilElu36exteHNDtCSzm9wLDnot5yTmIgVGoTiYKHshvoe05PJrQcUs
         OSGm9FfT4nUfUQrRMa50p2hiqZNlUbklilbXl7pOOVUw22P5MHoHK/cHHax3hHiD5te6
         xsE5YiYMfsLUN60O99FkjZCLdy5FqsKx5dxz0ciaGdCzk7E/90W902zaoz8CYQSXU1ig
         uy7LiG2En7pwqW4vWfdKeiT3sgDqCUuIgzkiDHa4rNHEjkM2hSh2sAZzSSe/BPBjKrJz
         P8Mc2dR2SohZtEUUIIJO8Cxa8tEWx38tt48FlyvWl4mN2AYww/nEMVagHmDBz4NJAGuo
         Avdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LGHFHZvnL2Z0zGaW92z6BFzy5L5MiRfkHohrKv00800=;
        b=3/zjp0fOB3xYNpmSzrcYWKqaIrWcAVFfRviS5pr1X+UL6VUfubV74EbyPJ6GcrLS+N
         O8RiSFWPbRKFTfCkTCwgijcWs38pWF9RRD1yOyFCtL8CtYebby8JJMJQ+UQaU1HoI5tE
         j+5wMx3nijv9AtgKlruoyY8c4/cUETjYwWWX1VdlMHGSQ3EyWj8l6gTQbn3us+dDZKZX
         +OlIdviJ1WoKygT6ak6O6AfH1dJ/enGYofl8uKMZ0/fUPX/u1R1znE5zFwbl1dM7hNXU
         63ECdmVVzCHM5O1FwajPMF16pN/YHw5/jGSXTTj1H8FaENtIQG1uo0X50wYUsekZzlx5
         +wyQ==
X-Gm-Message-State: AFqh2kpz2BfvyGszYxxDItS3ULXrUrkUd08EmOyRPwaYEt6n7I7H7Ub5
        sim/txpWL/rEhAtJfevkV9F+Xg==
X-Google-Smtp-Source: AMrXdXtRbtW9Mi7dMJWowIoYpX5sXYSUY88LmlIid4AVqtsTlKlEEkRjWJhxWrC4dczicm0j5Ner1g==
X-Received: by 2002:a5d:4a0b:0:b0:2be:1645:69b1 with SMTP id m11-20020a5d4a0b000000b002be164569b1mr6141130wrq.63.1674042114345;
        Wed, 18 Jan 2023 03:41:54 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id k18-20020adfb352000000b00241fab5a296sm31782691wrd.40.2023.01.18.03.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 03:41:53 -0800 (PST)
Message-ID: <efd7df12-d94b-4850-728d-416bdbbc295a@linaro.org>
Date:   Wed, 18 Jan 2023 12:41:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 3/6] dt-bindings: mailbox: qcom: correct the list of
 platforms using clocks
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230117223013.1545026-1-dmitry.baryshkov@linaro.org>
 <20230117223013.1545026-4-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230117223013.1545026-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/01/2023 23:30, Dmitry Baryshkov wrote:
> Only three platforms require `pll' and `aux' clocks: msm8916, msm8939
> and qcs404. Correct the list of platforms in the corresponding clause.
> 
> Fixes: 0d17014e9189 ("dt-bindings: mailbox: Add binding for SDX55 APCS")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../mailbox/qcom,apcs-kpss-global.yaml        | 33 ++++++++++++++-----
>  1 file changed, 25 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> index ecc286ab49ef..7d8de7a16984 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> @@ -72,15 +72,8 @@ allOf:
>          compatible:
>            enum:
>              - qcom,msm8916-apcs-kpss-global
> -            - qcom,msm8994-apcs-kpss-global
> -            - qcom,msm8996-apcs-hmss-global
> -            - qcom,msm8998-apcs-hmss-global
> +            - qcom,msm8939-apcs-kpss-global
>              - qcom,qcs404-apcs-apps-global
> -            - qcom,sc7180-apss-shared
> -            - qcom,sdm660-apcs-hmss-global
> -            - qcom,sdm845-apss-shared
> -            - qcom,sm6125-apcs-hmss-global
> -            - qcom,sm8150-apss-shared
>      then:
>        properties:
>          clocks:
> @@ -124,6 +117,30 @@ allOf:
>            items:
>              - const: pll
>              - const: xo
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,msm8953-apcs-kpss-global
> +            - qcom,msm8976-apcs-kpss-global
> +            - qcom,msm8994-apcs-kpss-global
> +            - qcom,msm8996-apcs-hmss-global
> +            - qcom,msm8998-apcs-hmss-global
> +            - qcom,qcm2290-apcs-hmss-global
> +            - qcom,sc7180-apss-shared
> +            - qcom,sc8180x-apss-shared
> +            - qcom,sdm660-apcs-hmss-global
> +            - qcom,sdm845-apss-shared
> +            - qcom,sm4250-apcs-hmss-global
> +            - qcom,sm6115-apcs-hmss-global
> +            - qcom,sm6125-apcs-hmss-global
> +            - qcom,sm8150-apss-shared

Isn't this in multiple places now? This doesn't match what you remove
either.

Best regards,
Krzysztof

