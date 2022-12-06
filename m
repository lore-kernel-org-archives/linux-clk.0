Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB41C352A1
	for <linux-clk@archiver.kernel.org>; Tue,  6 Dec 2022 15:35:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234261AbiLFPfZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Dec 2022 10:35:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234085AbiLFPfY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Dec 2022 10:35:24 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D2602AD4
        for <linux-clk@vger.kernel.org>; Tue,  6 Dec 2022 07:35:20 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id d6so24242782lfs.10
        for <linux-clk@vger.kernel.org>; Tue, 06 Dec 2022 07:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F1KPdrNmIxp/vLqj14ywZDhQ1hvfTFyJrb/kxKX7fV4=;
        b=lBCtYGkPkNXHFvTdm1DCtq7RzVuMzyyDGMYRTAYKnx7r0KkE9pqSJz9RwHkzTfaU/n
         Y2s0W3b3Q9TKaSwHDG7nJrJBgDXS29ms9JSVA6+83rmsyNbMj9gxkBEL4ROyA8dDIWgn
         xeLk8Iz1ZE4YJq4mSOP5Y1T7SQF2wEOwVI4An16JY+NKeermak7fmVqhRRn3cR3IeDDT
         4YLXzF+Nw9bqXE8wRODMU/hNtpRgocb3NiOSIkZFYg6ysR7D0WcoodHt0kyfP4bWmV/j
         M8Xrq0rhd36WoZDwDiJfaM46jbBmR4eURWj2CP+hZOjq+RHyamsoarrT42EEGoD33+Er
         ItHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F1KPdrNmIxp/vLqj14ywZDhQ1hvfTFyJrb/kxKX7fV4=;
        b=PYISh4OH5zud/SjLKmu0NI9R6CEpL5u0s7D/FbKSd1vJSbMoZ5spCiYAc3iZPoE16t
         mBGIFHu8X4yWyT4Xrl1ieb28Xb+yDUFh2wwfDiLZXxvZ7nSounASUAgOC35LOLfG4FVI
         BSAUTCz9eEKSEPjzCFOaE3oGM8TG5/Y81YIUCb1u7JnOBi1myrj92pgzxASLchV5c+8r
         jynB+dyV2Y2PwSzySPUdILeOLZmft0iOl2r69SJET5j9MMQ1wyZrqcUx3KeLVH/8BuEV
         aWlqKzPwmPvzZKIfUK9vMNEDuhJECWPGOCEwPD2wbeEHT+upreVErQ3L1neHORWPXBil
         ysbQ==
X-Gm-Message-State: ANoB5pmVVsJYBe8EYSqKU3llHfChIZomagShtu4uAY2OOzpZ7hzLFlxM
        yvS/KeoT73RqYkebaoq9DnwsPg==
X-Google-Smtp-Source: AA0mqf5Egysi9Meisg5THM/DUVSiqhI4AENo68/EpnGy0c4t/MajZcQiQC8PBhxf+3S0Ahjn4MVrWw==
X-Received: by 2002:a05:6512:3413:b0:4aa:b3d1:9c83 with SMTP id i19-20020a056512341300b004aab3d19c83mr22037421lfr.260.1670340918475;
        Tue, 06 Dec 2022 07:35:18 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id g4-20020a2ea4a4000000b00279d73cdf83sm1417014ljm.128.2022.12.06.07.35.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 07:35:18 -0800 (PST)
Message-ID: <33d261f6-ab3d-7470-8e3d-6943c3fa9297@linaro.org>
Date:   Tue, 6 Dec 2022 16:35:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v5 1/5] dt-bindings: clock: Add SM8550 TCSR CC clocks
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20221206125635.952114-1-abel.vesa@linaro.org>
 <20221206125635.952114-2-abel.vesa@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221206125635.952114-2-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/12/2022 13:56, Abel Vesa wrote:
> Add bindings documentation for clock TCSR driver on SM8550.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/clock/qcom,sm8550-tcsr.yaml      | 53 +++++++++++++++++++
>  include/dt-bindings/clock/qcom,sm8550-tcsr.h  | 18 +++++++
>  2 files changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,sm8550-tcsr.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> new file mode 100644
> index 000000000000..15176b0457d1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm TCSR Clock Controller on SM8550
> +
> +maintainers:
> +  - Bjorn Andersson <andersson@kernel.org>
> +
> +description: |
> +  Qualcomm TCSR clock control module provides the clocks, resets and
> +  power domains on SM8550
> +
> +  See also:: include/dt-bindings/clock/qcom,sm8550-tcsr.h
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8550-tcsr

This still misses syscon. Did you send it before we talk on IRC?

Best regards,
Krzysztof

