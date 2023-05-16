Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A37C7EE25
	for <linux-clk@archiver.kernel.org>; Tue, 16 May 2023 13:42:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233704AbjEPNma (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 May 2023 09:42:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233725AbjEPNm0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 May 2023 09:42:26 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3D67527A
        for <linux-clk@vger.kernel.org>; Tue, 16 May 2023 06:42:21 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-306f2b42a86so9359920f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 16 May 2023 06:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684244540; x=1686836540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RIvTcNlwAmPNpObBbfvPw1SrNayKQmgyhgtXRTbsW0o=;
        b=x9+y61j4a/rAqAPb1vGX/7FNSeS8qKNMAkz5A+EfN2PlplrNAb/IRWBIMaEIZ3cPJI
         QV75FLyklyjKqWPSxT8eq7Jh00z3BEhRFKWlLjnoXgH43+L/NhvEgUdROmkwTPN/isql
         TBIALmXNNjepZplPEpN9J4QaiP88m12Yb81TkDLmdSLCHI7Le8roh5vofYHC8Z1lAJVn
         3e/b0VHr/3BhisQZXuYE2xHzasHy8RHY0UOtKa9lVNvj3xD77VDo/qtEjGdUsd1qThGj
         e4a9cQOpdrOn7epnbZpSY4/nD3KOzTH2hcRKr0pi04OvJ3UAaYVRx4yrZdA+8BxMxv1Y
         kyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684244540; x=1686836540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RIvTcNlwAmPNpObBbfvPw1SrNayKQmgyhgtXRTbsW0o=;
        b=kmGUdxdAj36gW4yMnLusaTlpNI07Or/ydxK/58yvQ6b+Un8sEL/xRHlqcMKSjRb9oV
         mLcDzOLwcAznYf09sfj1d2PwgSbd8nWsbi+2WX4s9ewSV5V4d+j3kdwF9jnln0CmSPef
         sC3V6O4JYFLqPS1Kmggg9gyGj1Lwan81kzeQCTy8VbIPv6ShcH0+RFcGTgrFLvl6hz03
         quVtoWNrwobKrEWaw1PFQWvu41Lr+CaM/YfUMdRv0GzElmQuJrWHoYhYCQpNVKlS1aeO
         JA+40m9nqBeYBCALzTW5tc4/6kc4dURnd4urFLwK++uw+j8nHZl+qEyu5E7izBVN7ISI
         MasA==
X-Gm-Message-State: AC+VfDwbJVp6ATE1xOjl/gP3jo+4+4qUcsDEybVn6jjPoeu6I6WwiP7n
        w7EQqOlNUXUPWFv52hpN0GSWZA==
X-Google-Smtp-Source: ACHHUZ6Qej44yGCIdrpInYjzHIJscOEjjkfM4eL+VuKHu1Ub2WB/gSILNqOM8VjDJvJ/EH6SR69hPg==
X-Received: by 2002:a5d:43c4:0:b0:2f0:2dfe:e903 with SMTP id v4-20020a5d43c4000000b002f02dfee903mr29013651wrr.69.1684244540172;
        Tue, 16 May 2023 06:42:20 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v17-20020adff691000000b00307c0afc030sm2761242wrp.4.2023.05.16.06.42.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 06:42:19 -0700 (PDT)
Message-ID: <d244f5f3-a4a0-c9ac-2f78-49baeb8ef3d3@linaro.org>
Date:   Tue, 16 May 2023 14:42:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: qcom,gcc-sm8250: add missing
 bi_tcxo_ao clock
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>
References: <20230516105241.30091-1-krzysztof.kozlowski@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230516105241.30091-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/05/2023 11:52, Krzysztof Kozlowski wrote:
> The initial SM8250 GCC driver added in commit 3e5770921a88 ("clk: qcom:
> gcc: Add global clock controller driver for SM8250") already consumed it
> on the clock.  This fixes warnings like:
> 
>    sm8250-xiaomi-elish-csot.dtb: clock-controller@100000: clock-names: ['bi_tcxo', 'bi_tcxo_ao', 'sleep_clk'] is too long
> 
> Fixes: 98394efb48f5 ("dt-bindings: clock: Add SM8250 GCC clock bindings")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Re-word commit msg and fixes tag (Konrad)
> 2. Add tags
> ---
>   Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
> index b752542ee20c..ead6665b9a45 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
> @@ -23,11 +23,13 @@ properties:
>     clocks:
>       items:
>         - description: Board XO source
> +      - description: Board active XO source
>         - description: Sleep clock source
>   
>     clock-names:
>       items:
>         - const: bi_tcxo
> +      - const: bi_tcxo_ao
>         - const: sleep_clk
>   
>   required:
> @@ -47,8 +49,9 @@ examples:
>         compatible = "qcom,gcc-sm8250";
>         reg = <0x00100000 0x1f0000>;
>         clocks = <&rpmhcc RPMH_CXO_CLK>,
> +               <&rpmhcc RPMH_CXO_CLK_A>,
>                  <&sleep_clk>;
> -      clock-names = "bi_tcxo", "sleep_clk";
> +      clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
>         #clock-cells = <1>;
>         #reset-cells = <1>;
>         #power-domain-cells = <1>;

LGTM

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
