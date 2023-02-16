Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77B7C636CC
	for <linux-clk@archiver.kernel.org>; Thu, 16 Feb 2023 10:16:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbjBPKQm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Feb 2023 05:16:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbjBPKQl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Feb 2023 05:16:41 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D303E4DE38
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 02:16:33 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id dr8so3856545ejc.12
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 02:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1PGfu87n+hgkCIk36FgbHQSfTL8/6kgTjaQ8jrg0Ats=;
        b=bdq663wbjD24ghnHeXgGD6EGbUp7AIvfKEgI9DQRcRH9gTESHtdCEP7mLV0Ity05FG
         w4FGwXA2AAgNlrGpqx3XsQ1Iuu6NLZ9JARLR0TeN7DeieQkn+O7X8um2FVzK7ef1/gD3
         15VJYoAEyMSeiyIXTT19pDbBA+N7uD3S6qtoEFuwCyBaUzcqdUdEc63fR4znfYZ3GE/L
         2UU2hdnfjLZ8nL+Qc95XLLi5pBpPPWst/bs1yqMGdxuhHVKKJnBwcmaxqpBKdBKZVINj
         Ry9w0T2HiIqLe66BDEdLRgnJUea1IlHr72mauDYUMNbH6yoVa7js5VulW79HDZyzkfne
         ydEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1PGfu87n+hgkCIk36FgbHQSfTL8/6kgTjaQ8jrg0Ats=;
        b=x9nMbNAKu8Vx/WYs1lSvL9mVrw2h0IeAhHxYj1bG/PDdfRSJ/smENIYY7BqA2YoqE1
         guqzppnQMDpYrmCAsN5FlRdvjRFfiBlEvfXvZEkvXfRwGoqetJdZ6U6wU4r8+5Ww5MNz
         YQupxpVQN4Vf90XUiooWQZIAUZKZqYwbFaVCMM6qO9AflPHqr8+Z/iDwSRBHzBKEsFcH
         4sJo1BtArxnKXLx9s/ZVrGSFVbAR/bCOI4QfhN1KSF0gHyhg/Gfgd3Qx0bjxUbFS09G6
         Zt3wb1w6KkbA65Z0y/M+iq5ieWrIuKBHHVe9tizmKB9VdiofJjWQsLdT/TnOa1N98yuG
         fRVA==
X-Gm-Message-State: AO0yUKVqa//ZUKfQvzRHpkxh4W+Bbz5G95+ws9BwIsn0xvMoyyfQ7RVK
        mZXqJAiHaLn+MaRnpFEqnh91iA==
X-Google-Smtp-Source: AK7set+Oth8dBTqhGPae0wFBpF8ml/E+UZSUs8kHq7UOo5kVGdEYYpxh2OC2JupksHXkw09jWLt+Vw==
X-Received: by 2002:a17:906:3659:b0:888:94d3:37f5 with SMTP id r25-20020a170906365900b0088894d337f5mr4915515ejb.63.1676542592391;
        Thu, 16 Feb 2023 02:16:32 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id k2-20020a50ce42000000b004acbecf091esm624327edj.17.2023.02.16.02.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 02:16:32 -0800 (PST)
Message-ID: <dcdd0a62-8d1f-d9b1-6137-34d9e68313a1@linaro.org>
Date:   Thu, 16 Feb 2023 11:16:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/7] dt-bindings: clock: split qcom,gcc-ipq4019 to
 separate file
Content-Language: en-US
To:     Robert Marko <robert.marko@sartura.hr>, andersson@kernel.org,
        agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     luka.perkov@sartura.hr
References: <20230214162325.312057-1-robert.marko@sartura.hr>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230214162325.312057-1-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/02/2023 17:23, Robert Marko wrote:
> Move schema for the GCC on IPQ4019 platform to a separate file to be able
> to allow passing XO and sleep clks directly to GCC.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  .../bindings/clock/qcom,gcc-ipq4019.yaml      | 53 +++++++++++++++++++
>  .../bindings/clock/qcom,gcc-other.yaml        |  2 -
>  2 files changed, 53 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-ipq4019.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq4019.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq4019.yaml
> new file mode 100644
> index 0000000000000..6ebaef2288fa3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq4019.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,gcc-ipq4019.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller on IPQ4019
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@kernel.org>
> +  - Taniya Das <tdas@codeaurora.org>
> +  - Robert Marko <robert.markoo@sartura.hr>
> +
> +description: |
> +  Qualcomm global clock control module provides the clocks, resets and power
> +  domains on IPQ4019.
> +
> +  See also:: include/dt-bindings/clock/qcom,gcc-ipq4019.h
> +
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,gcc-ipq4019
> +
> +  clocks:
> +    items:
> +      - description: board XO clock
> +      - description: sleep clock
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +      - const: sleep_clk
> +
> +required:
> +  - compatible

Aren't the clocks now required? Will it keep working without them?

Best regards,
Krzysztof

