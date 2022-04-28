Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BF0C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 08:00:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343716AbiD1IDu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 04:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343731AbiD1IDr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 04:03:47 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D7289A9B1
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 01:00:29 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id r13so7918915ejd.5
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 01:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hoO0z6ox/0MpErRBciBUS6KXmSs/8Ul8Shji/6D5s6Y=;
        b=jZR3MnpAJ0mog/qurS4zjfNeTVjwu1R7dSeZynWmrRUlEZfEoirRMAK3v6lTFs5aVR
         K/IrQ+bSRwQLSvEehuSzvgPTugl+v8t7cVjMD6NekHDNTbNmUGJIjGwK30LFkBdg48I/
         mFEfqXI64C1SFJMPO3C7VNKI/9Xu8sN7YCfO/8g6Z6qTDHL/JaAXK9BKv+kdpnb5M7CQ
         4MGS0X/j5eZ17YI1xOUk4alTxSK4qStpr7lX8GXDmhLB+qzov5iAeomdKLn5cFhbu5Pf
         LIqJV62giHlfnTfPfbUC/Z2SeHwsjm1udPgr43A8zInqYCW2xVtBRqLK23maRIk07asU
         s4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hoO0z6ox/0MpErRBciBUS6KXmSs/8Ul8Shji/6D5s6Y=;
        b=rHbK9H4LCohkUugUTWo0OepFg9BaFl6ZzsnWqfOQdeUXK8e4inwkjLYNV4QEOyll9W
         GYlrIgakPg5VNq8u46z4fTcITBEyEAiraldmxuQTOEY0LYv7l+dUjA9gglYEZ0tzgmf4
         y4crWpbJq0GdbZrp4EGMEGIoitnQL9rXibSUDryiRagDpfUnQd3EE32VJHszdLd+xx7n
         nSxoVlGvH6u/7Fz6sxTfA+3uIRZ9wSUZD2ggaF6YLFC3zfOPvvT5KChEdAlW03qxPwIt
         7Kv4jxrLY+vRGjbt2UUazQIef08lso4bf9FZWcw+sgqGjYMzWZT9EENtA+oCzPhGLrbF
         24cw==
X-Gm-Message-State: AOAM530A9Fa16rTh+/KtVln1plCOclQ+pZBGTmEnwzXJr6Sacm8+oK69
        UvJ6cLpMuasptvU3HTyvDPRR0g==
X-Google-Smtp-Source: ABdhPJxY0l6cGk55GfOnpY/HEIBGRKGps3VQWZY7889JQ0r8sNS6Iig2RknQXv0yzdCXTzT7tNj+Nw==
X-Received: by 2002:a17:906:2294:b0:6f3:bd02:95a3 with SMTP id p20-20020a170906229400b006f3bd0295a3mr9758882eja.201.1651132827289;
        Thu, 28 Apr 2022 01:00:27 -0700 (PDT)
Received: from [192.168.0.161] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id h7-20020a1709060f4700b006e8d0746969sm7855860ejj.222.2022.04.28.01.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 01:00:26 -0700 (PDT)
Message-ID: <e41bad2a-3453-e5ce-2f92-b4655a5453f6@linaro.org>
Date:   Thu, 28 Apr 2022 10:00:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 3/3] dt-bindings: clock: qcom,gcc-apq8064: split tsens
 to the child node
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        quic_tdas@quicinc.com
References: <20220427125423.3166138-1-dmitry.baryshkov@linaro.org>
 <20220427125423.3166138-4-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220427125423.3166138-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/04/2022 14:54, Dmitry Baryshkov wrote:
> Split tsens properties to the child node of the gcc. This follows the
> lead of ipq8064 (which also uses a separate node for tsens) and makes
> device tree closer to other platforms, where tsens is a completely
> separate device.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,gcc-apq8064.yaml      | 49 +++++++++----------
>  1 file changed, 22 insertions(+), 27 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
> index bd7b04c75e50..3a8bb5a5b37f 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
> @@ -23,47 +23,42 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,gcc-apq8064
> -      - qcom,gcc-msm8960
> -
> -  nvmem-cells:
> -    minItems: 1
> -    maxItems: 2
> -    description:
> -      Qualcomm TSENS (thermal sensor device) on some devices can
> -      be part of GCC and hence the TSENS properties can also be part
> -      of the GCC/clock-controller node.
> -      For more details on the TSENS properties please refer
> -      Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> -
> -  nvmem-cell-names:

All these properties (and old compatible list) should be rather instead
made deprecated:true. These bindings exists since some time, so it's not
like refactoring during development.

> -    minItems: 1
>      items:
> -      - const: calib
> -      - const: calib_backup
> +      - enum:
> +          - qcom,gcc-apq8064
> +          - qcom,gcc-msm8960
> +      - const: syscon
> +
> +  thermal-sensor:
> +    type: object
>  
> -  '#thermal-sensor-cells':
> -    const: 1
> +    allOf:
> +      - $ref: /schemas/thermal/qcom-tsens.yaml#

No need for allOf and type, just $ref and description.

>  
>  required:
>    - compatible
> -  - nvmem-cells
> -  - nvmem-cell-names
> -  - '#thermal-sensor-cells'
>  
>  unevaluatedProperties: false


Best regards,
Krzysztof
