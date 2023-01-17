Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5DB6C63797
	for <linux-clk@archiver.kernel.org>; Tue, 17 Jan 2023 11:35:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236282AbjAQLfr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Jan 2023 06:35:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236814AbjAQLer (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Jan 2023 06:34:47 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAA973609F
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 03:34:43 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id e3so21033526wru.13
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 03:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0fREWHN2UQ1kl2XZ6OMZzGJJemz/P4M0H3yz7UyzV+A=;
        b=QSscyCpFZNbbM6kyMW199uVthsV7aRgY+daSbfaJH7SmHUieDbJ3JqHGYU+FXCi55W
         f1U84Y+nlWQhZvyaWVEDrbezdyNVKuByZpMdnvVDLCxc8hk6kvUnkAOekj8wFP94eZ6V
         Fzzo3XG/40/WB0u4Rpu52uH0sb9kzmIJ7YWstAO9Q4/3YSeDi9jalDiGoLDOsB2OL9TF
         s/Ar12W1+M2VcLYvQJrQT5CjtCtCMB7i9asQ4BKnWhBEWJA02RntWvh7DCbi2DnRxzsV
         9U8YcPyUduEmxx3IRfq/xnrsfXhC/ppPJ7CNfcU8ZJk9CU8jBE1L08xZjjf4GKiGfj0u
         ppnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0fREWHN2UQ1kl2XZ6OMZzGJJemz/P4M0H3yz7UyzV+A=;
        b=X+KsJvrU5gPP8XibGXumqLd8hsPzV/vnAqV7NH45k6FGdxJpetjsuqVGnhv7rfeH6v
         q+b1E+dMEaO2iEuyu1R7/C5PP8Y8tN3vucNvVW3cJm/nEF49oDy1uf7rwrVjRnzK/sp/
         +OrCJfYkoQ71D79+Op4bECie6n8za2gGF7UeYEYkf7ikzG76MkN4dFo2HRKLfqOZAMOd
         rhtGW3YJwXh0hUhTl2lzqh9fNdAIq12SDfN3HLs/YqaCeI4mvcbFsgyK8v1vcgWBRgNs
         JUXMpdHKxhR7qO+o19bR6Q7dMG+J5dZ4U3VIN3u4E5hvA8F+5tsaAPYBlEzJcexmdL8A
         HRZw==
X-Gm-Message-State: AFqh2koXEh6EgYKnj5DiKufBz+piMjji2UxA0J0OSM5Q53V7kKf6nn6I
        mqQPy7avgqji7Fqc0TWXX2sHXg==
X-Google-Smtp-Source: AMrXdXtVLG+lFxj/ILADCcRFl8jlKdWjcXBh4tuBystBmpfSjE2Lu+/jzWctDw6Y3TXUc20op7SLNw==
X-Received: by 2002:a05:6000:248:b0:2bd:d4bd:581d with SMTP id m8-20020a056000024800b002bdd4bd581dmr10476975wrz.53.1673955282527;
        Tue, 17 Jan 2023 03:34:42 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n6-20020adfe786000000b002bdbde1d3absm18444072wrm.78.2023.01.17.03.34.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 03:34:42 -0800 (PST)
Message-ID: <aa5598ee-0dd1-caa7-c60d-5a409f039713@linaro.org>
Date:   Tue, 17 Jan 2023 12:34:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/4] dt-bindings: mailbox: qcom: correct the list of
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
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230113090739.45805-1-dmitry.baryshkov@linaro.org>
 <20230113090739.45805-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113090739.45805-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/01/2023 10:07, Dmitry Baryshkov wrote:
> Only three platforms require `pll' and `aux' clocks: msm8916, msm8939
> and qcs404. Correct the list of platforms in the corresponding clause.
> 
> Fixes: 0d17014e9189 ("dt-bindings: mailbox: Add binding for SDX55 APCS")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/mailbox/qcom,apcs-kpss-global.yaml          | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> index 943f9472ae10..b8a44ef0540f 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> @@ -71,15 +71,8 @@ allOf:
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

And what in other case? Any clocks? They should be moved to their own if
forbidding the clocks and clock-names.

Best regards,
Krzysztof

