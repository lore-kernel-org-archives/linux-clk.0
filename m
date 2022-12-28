Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CC7C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 10:31:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232661AbiL1Kb5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Dec 2022 05:31:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbiL1Kb4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 05:31:56 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7026A101E2
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 02:31:55 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id z26so23067010lfu.8
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 02:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZCu/tSyamKVNOSDECszVgKFvHHKZM88MzZTuIVLyAUk=;
        b=fwfK4nSTW5uMgLhih/O2DffCzYD3eCO2UYrH8TU2bG7Lk4ogX77V/QfgD7Rq5t2XxJ
         dimpxFgRm9s2l0M8/YCE7uHWGzHOtQULJbeLlNry/MX3+afeOAqTCS3xKmN0WiTd/Vnd
         hzXeddsNNGYdFu9JBoiAPchXq6Bk3qLUUTpTgoGCwAnQVzeLNQ3Lu/d5VDMpHtR+bGJI
         ClD/AD+NgGhyY2xwHde2y18j/F2tRQorqMaekBTh9Q+4oUgIlxaZaF/bNEfFbuyewt1Z
         qxgxV5WO8+qVBkVDryppxl8xtYk+HbaE3BeJduZkkuHcz59l1+rs5X6aP2p9PAiCQW0J
         e9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCu/tSyamKVNOSDECszVgKFvHHKZM88MzZTuIVLyAUk=;
        b=PiFT3GKF4Z5KCFqLpakrQ4EELH6tltyeKpX8ZwACy7P2fgXB2q8givAKKGjjUo8stM
         1MjHVHcSg3966ET1ZQBixIvxM3azVIplFsIfI6n47RnxCGrfr1aXHF2jQL8+sbTauvUa
         ot3QNMpuKg21aDlZ+fjKxt05qblOBSmBUaQOzCDstQUXMsO/yBTTC+gQAKkdOLLgX1+D
         RugCwFHHfaJwrsK4JJstr9MuI7R0t6NDpHQsxt3AhTBnHEu4psVUZG8PWmRzkRGTVZoC
         KPlkH3sPUDSUTaxeXxnOM2HQNtiG79OvurNL/YpuqcN797zFurigfFzGqUIsEutzHbqK
         rWSw==
X-Gm-Message-State: AFqh2krMZTe2KaN2tTqPQ6Q2q+cIA+HWnH92XFfdhRMFrHfo7UGE3mxC
        Ns8QcGMc0l1xmL99AEihSi8wjg==
X-Google-Smtp-Source: AMrXdXsvfqC64Kn58O6u+HTm0ZkN18e0IICEBhFOXTJHvN53U9z3hS1pPoN7t57UFAe1unOR/6ecgQ==
X-Received: by 2002:a05:6512:3e21:b0:4a4:68b7:deb7 with SMTP id i33-20020a0565123e2100b004a468b7deb7mr9585580lfv.19.1672223513835;
        Wed, 28 Dec 2022 02:31:53 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b11-20020a056512024b00b004b57277474esm2607971lfo.106.2022.12.28.02.31.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 02:31:53 -0800 (PST)
Message-ID: <dfc193df-a3ca-e03e-9fcf-b9d3f9fe76f6@linaro.org>
Date:   Wed, 28 Dec 2022 11:31:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 03/12] dt-bindings: clock: qcom,mmcc: define
 clocks/clock-names for APQ8084
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
References: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
 <20221227013225.2847382-4-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221227013225.2847382-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/12/2022 02:32, Dmitry Baryshkov wrote:
> Define clock/clock-names properties of the MMCC device node to be used
> on APQ8084 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,mmcc.yaml  | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
> index e6d17426e903..fd926df80c64 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
> @@ -137,6 +137,46 @@ allOf:
>              - const: edp_link_clk
>              - const: edp_vco_div
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,mmcc-apq8084
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Board XO source
> +            - description: Board sleep source
> +            - description: MMSS GPLL0 voted clock
> +            - description: GPLL0 clock
> +            - description: GPLL0 voted clock
> +            - description: GPLL1 clock
> +            - description: DSI phy instance 0 dsi clock
> +            - description: DSI phy instance 0 byte clock
> +            - description: DSI phy instance 1 dsi clock
> +            - description: DSI phy instance 1 byte clock
> +            - description: HDMI phy PLL clock
> +            - description: eDP phy PLL link clock
> +            - description: eDP phy PLL vco clock

This looks like exceeding constraints set in top-level (max 10).

Best regards,
Krzysztof

