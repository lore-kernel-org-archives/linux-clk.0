Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDEEC04A95
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 17:11:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234066AbiI1RLE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 13:11:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234350AbiI1RLC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 13:11:02 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA689E9CE1
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 10:11:00 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id d42so21441339lfv.0
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 10:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=iZLMwu3BF/t4R2IMVX7ZdZKBFfNgmWUXpfgEF5atWY4=;
        b=hFFDqFfms2s94TPUFzYYZ+siLNodOd+2HLWMfNn1e/KwtLanwfuOy3M+PpVm5gFg03
         OnUj2b8CWyfgnhvoUry83lugF4J2puaOA/q6CvV/RAmfc3bQ/tA4WAeClyBJj6pcLSmJ
         /NuecAgAGiro4GFDzpYwZhGgKzBN2QrQ4H6WcMIWj4OlLpINikQbRhMaf4QGXrmJHWgQ
         bedxo5zWPiT2fCqMMe91vOojYgOh+lU7D1IuUZLPd1Jl+Yv4jmZJMOg8FeB9EAJ8KyLa
         5nMiugsLZGiNWzJBxdlzCHddSer9UREJegFMvp24rk5o1v9sriJk/6jlIGYYsnRH90KB
         CkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=iZLMwu3BF/t4R2IMVX7ZdZKBFfNgmWUXpfgEF5atWY4=;
        b=TPWOHKVnuQ2AtTzvgd+LDSDZyf0ip6al5tVUE46TqEIkByptOiHU/tkyBFde8Qrx8r
         EoOaGaXqKKEadiI0xXQV8+mKMSyBhFpnsz9NcDXsfaQiG9HO4ys4dr1YujgNrpOoKyr0
         HlNJwwXz08tcq9XGeLomZuRFeJ4hq3F6vI63/2Lioj3AeAlPy8Nmp9MUvSx6BqadDCb7
         FvBsWSRh5EX7DAkp6fr9yuMfKqjkvPlSkEuuvA+m630Bz4tcGWiJMR7iVWVvCnQlAlyh
         pTw5loO+QoWtM5ki6U16TKDkSrTP8ZaIvEW3oKUpUdP9Syeppiru9Vs4NQFvm7OG+QH5
         KFag==
X-Gm-Message-State: ACrzQf2FewAW8HQs9q+Z4pL2jlc1BmBwdRGhIRlhtY1fXV63p3tjqgz+
        RcFmOIm4B7NonUs/qXWXQINI1Q==
X-Google-Smtp-Source: AMsMyM7JNbNJ5v50tEMFjQ/PFrPlZsFEiRNawid2ZCvshRNElBT/qtWheK5uNWmOS4pBQc9PWu7cCA==
X-Received: by 2002:ac2:4d2b:0:b0:498:fbf0:4f89 with SMTP id h11-20020ac24d2b000000b00498fbf04f89mr13322798lfk.500.1664385058974;
        Wed, 28 Sep 2022 10:10:58 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v13-20020a05651203ad00b00492eb7205b0sm521870lfp.210.2022.09.28.10.10.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 10:10:58 -0700 (PDT)
Message-ID: <c5b6880c-de8a-026b-9a5a-7731428498d2@linaro.org>
Date:   Wed, 28 Sep 2022 19:10:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 01/11] dt-bindings: clock: split qcom,gcc-msm8974,-msm8226
 to the separate file
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
 <20220928145958.376288-2-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928145958.376288-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/09/2022 16:59, Dmitry Baryshkov wrote:
> Move schema for the GCC on MSM8974 and MSM8226 platforms to a separate
> file to be able to define device-specific clock properties.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,gcc-msm8974.yaml      | 65 +++++++++++++++++++
>  .../bindings/clock/qcom,gcc-other.yaml        |  9 +--
>  2 files changed, 66 insertions(+), 8 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml

Thank you for your patch. There is something to discuss/improve.

> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml
> new file mode 100644
> index 000000000000..72e8f54d0e0e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: GPL-2.0-only

Dual license

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,gcc-msm8974.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller Binding for MSM8226 and
> +  MSM8974, including Pro variants
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@kernel.org>
> +  - Taniya Das <tdas@codeaurora.org>

That's not valid email anymore, I think.

> +
> +description: |
> +  Qualcomm global clock control module which supports the clocks, resets and
> +  power domains on SDM630, SDM636 and SDM660

The model numbers need updates.

> +
> +  See also:
> +  - dt-bindings/clock/qcom,gcc-msm8974.h (qcom,gcc-msm8226 and qcom,gcc-msm8974)
> +  - dt-bindings/reset/qcom,gcc-msm8974.h (qcom,gcc-msm8226 and qcom,gcc-msm8974)
> +
> +$ref: qcom,gcc.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,gcc-msm8226
> +      - qcom,gcc-msm8974
> +      - qcom,gcc-msm8974pro
> +      - qcom,gcc-msm8974pro-ac
> +
> +  clocks:
> +    items:
> +      - description: XO source
> +      - description: Sleep clock source
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +      - const: sleep_clk
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  # Example for GCC for SDM660:

Maybe skip the comment?

> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    clock-controller@fc400000 {
> +        compatible = "qcom,gcc-msm8974";
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +        #power-domain-cells = <1>;
> +        reg = <0x00100000 0x94000>;

reg goes usually after compatible.

> +
> +        clock-names = "xo", "sleep_clk";
> +        clocks = <&xo_board>,
> +                 <&sleep_clk>;
> +    };
> +...

Best regards,
Krzysztof

