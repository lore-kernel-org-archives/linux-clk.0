Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00958C74A5B
	for <linux-clk@archiver.kernel.org>; Fri, 17 Mar 2023 08:38:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231450AbjCQIiK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Mar 2023 04:38:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230479AbjCQIhv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Mar 2023 04:37:51 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3808F1B2C3
        for <linux-clk@vger.kernel.org>; Fri, 17 Mar 2023 01:37:27 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id o12so17362245edb.9
        for <linux-clk@vger.kernel.org>; Fri, 17 Mar 2023 01:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679042244;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OlPqv768qCCRhbWsFux44Qe0dzJaFQxdWXwQRr3vCTQ=;
        b=fuxTMqbLrj9y998apb+qKYS5CguVvnJHGZJMgh22O1TpRECsrFcf5PEEAIWsU6XDw2
         vqU/2vIft/NjHk9vOiOHM2iKT2s+MSn5sJcE+8Vg1TtZFGBBR1Lh7F+xy7vQSEkOBwK/
         AmISI2iKzjU5bmW5XvnX1bvmuUlItSxUXnW7FQbdXHB28FoM7RY5eCDkDmmI0znDttco
         QIBjn2LHYEkyXFDwjH6+dVwYBA9r3/cw8t+jJo46exUcmwDJTLtHducjt2UTdSBTw5dg
         XL+MNdAtBGpCEivudUJYPqAqVTzu4UEn+8K1c9xQ4syM/20jK2+vmtA0905ogWsVLndh
         Rczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679042244;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OlPqv768qCCRhbWsFux44Qe0dzJaFQxdWXwQRr3vCTQ=;
        b=Su9KsQ0qIrqnzY0FSTlU3jFq+XxlUNEBFWypvLlQMlncN1hsECxOZVl/mzxv1xfpGy
         2YeQd9BEqVER3t8sLsMyy29PoRcNR00GIBdb4Jyv4cEoZ6ku6e68V1Mai4GxOggf5oqD
         ZCDa3yDG9qTUHKKnZwgrWglo23LUrTknICS8SWWix1EspdKANrf6mY6352wV1Ay43Wyw
         2ymaymYSmZ7TYEnGglq7K/pMHryqlaRDnnqSagPgNRtpal3kghz79jXpyL4cAnfdR60s
         np90VwVNEXGhlEGF41uP6yMZZVeVQm7saof7GpI+tAs/jIeLk0uLXJ6y+cOGeziK9x7+
         Bs0g==
X-Gm-Message-State: AO0yUKUr6qORdGU9g1BMbD9XUpAwLnIDPSOsFjABaOu+XDnby6vpTN5x
        o+7YeUuXT5+8w4e2cV4K/lpJ0A==
X-Google-Smtp-Source: AK7set/BJnJbJSWip7dqiPfnqEErqX/AIulc+OWIg24f0Z9pR/HAjsUiDAHUxfBLBwe0h8xR3/6ZiA==
X-Received: by 2002:a05:6402:1810:b0:4fb:5795:b7e0 with SMTP id g16-20020a056402181000b004fb5795b7e0mr2375824edy.31.1679042243955;
        Fri, 17 Mar 2023 01:37:23 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:848a:1971:93e0:b465? ([2a02:810d:15c0:828:848a:1971:93e0:b465])
        by smtp.gmail.com with ESMTPSA id c14-20020a509f8e000000b005003fd12eafsm654272edf.63.2023.03.17.01.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 01:37:22 -0700 (PDT)
Message-ID: <1d0c894b-ccd4-348f-0c48-c6a5c89df27d@linaro.org>
Date:   Fri, 17 Mar 2023 09:37:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/5] dt-bindings: clock: qcom,gpucc: Fix SM6350 clock
 names
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230315-topic-lagoon_gpu-v1-0-a74cbec4ecfc@linaro.org>
 <20230315-topic-lagoon_gpu-v1-1-a74cbec4ecfc@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230315-topic-lagoon_gpu-v1-1-a74cbec4ecfc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/03/2023 12:16, Konrad Dybcio wrote:
> SM6350 GPUCC uses the same clock names as the rest of the gang, except
> without a _src suffix. Account for that.

Why not fixing the names instead (to use the same)? If the clocks are
the same, why using different names for the inputs? To remind - these
are not names of clocks in GCC, but names of clock inputs to the device.

> 
> Fixes: 7b91b9d8cc6c ("dt-bindings: clock: add SM6350 QCOM Graphics clock bindings")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,gpucc.yaml      | 29 +++++++++++++++++++---
>  1 file changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
> index db53eb288995..d209060a619d 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
> @@ -43,10 +43,8 @@ properties:
>        - description: GPLL0 div branch source
>  
>    clock-names:
> -    items:
> -      - const: bi_tcxo
> -      - const: gcc_gpu_gpll0_clk_src
> -      - const: gcc_gpu_gpll0_div_clk_src
> +    minItems: 3

Drop minItems, not needed as it is implied by maxItems.

> +    maxItems: 3
>  
>    '#clock-cells':
>      const: 1
> @@ -71,6 +69,29 @@ required:
>  
>  additionalProperties: false
>
> 

Best regards,
Krzysztof

