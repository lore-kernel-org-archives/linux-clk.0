Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 441D5C38142
	for <linux-clk@archiver.kernel.org>; Mon, 23 Jan 2023 09:11:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231475AbjAWJLf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Jan 2023 04:11:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbjAWJLf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Jan 2023 04:11:35 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D733A1E2AE
        for <linux-clk@vger.kernel.org>; Mon, 23 Jan 2023 01:11:33 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so7990954wmc.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Jan 2023 01:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CG19qBP1qisED+IAqQMmGMoYnI5R7guTZv3vQ7JrYgg=;
        b=KY62Yq/Jod9kD7PdpFPEQoBKCnOIQ8HCN0No5mdMa/Nx8XDcOjWbz+OldgofOdZTO9
         thcgGwrrjOisNNizvprqix7unM1N9yeLBaJ1k0IZsteOHUR+KvqwYWzbfgnWnJB3uCLB
         mlHOH2jKMSOnyq/AZKQ7g23bWUVI5sIKVVad4cecou+6X/B3tSyVyOllKWRo9BeWa2lH
         Ck7ucBhsWm4YT5p+K0bO5LhH0IbpbZOAeyOAijykOc1sWVCuKmNuMRXkJDvcKNj+atX1
         tqjIYypPUXn+rzRqoFA9oUbSDuegvVt7yXIVnw9FDDhcqw2GkglMks7uVT29n+OYGRN/
         U1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CG19qBP1qisED+IAqQMmGMoYnI5R7guTZv3vQ7JrYgg=;
        b=bbIP4wtz0MvjbU0icFh9+jWbDlLRrsgN6ZJjdOmvX9DprqZ34fvZcJNnvo3EyxqODV
         f9cEAU5D81DxhjlIAfP50tpdL7jS7nR2Jhe1gPwlNA5wB4Vvgk42a6/EI9ktdnkkKVys
         llTs+8v/owdpWAAYbhe6vifrSIPjoLCbQkJjN7UhsJCwSS+/lweNe56ukdUVAn3zGmtX
         UIn3DN6ZjLga7Pff5URei2tpRGlUKfHrMNw0MtUthEaeES6EWlG9ahd1Y0yOW9hcbKAk
         qv3+CJ/GA5knvYBurIm7C8bv/FDvqz8/oitStQOXC75gS/Eixy0/RLzdGBPrJ+DDA2so
         Pw5g==
X-Gm-Message-State: AFqh2ko8aOzRz4U1DU3KR/js3mkCrIcEXDWRRkN3DLVnvZpGK1NLcGnf
        LIOWWFkfNejAX1OnAHKcnvCjtw==
X-Google-Smtp-Source: AMrXdXvhrbLBq5qfOpbnhzrPoA1QWjj+VqwIqC8hv2Peu4Tu/YazU8Ya88WE1sTPHwqxrjxy2z4+zA==
X-Received: by 2002:a05:600c:3083:b0:3da:e4d:e6ba with SMTP id g3-20020a05600c308300b003da0e4de6bamr22647113wmn.14.1674465092407;
        Mon, 23 Jan 2023 01:11:32 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v17-20020a05600c445100b003d9e74dd9b2sm10463657wmn.9.2023.01.23.01.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 01:11:32 -0800 (PST)
Message-ID: <5f778c47-a1a3-70f2-78b8-107a11e31eeb@linaro.org>
Date:   Mon, 23 Jan 2023 10:11:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: Add SM7150 GCC clocks
Content-Language: en-US
To:     Danila Tikhonov <danila@jiaxyga.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Wronek <davidwronek@gmail.com>
References: <20230122192924.119636-1-danila@jiaxyga.com>
 <20230122192924.119636-2-danila@jiaxyga.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230122192924.119636-2-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/01/2023 20:29, Danila Tikhonov wrote:
> Add device tree bindings for global clock subsystem clock
> controller for Qualcomm Technology Inc's SM7150 SoCs.
> 
> Co-developed-by: David Wronek <davidwronek@gmail.com>
> Signed-off-by: David Wronek <davidwronek@gmail.com>
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  .../bindings/clock/qcom,sm7150-gcc.yaml       |  69 +++++++
>  include/dt-bindings/clock/qcom,sm7150-gcc.h   | 193 ++++++++++++++++++
>  2 files changed, 262 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,sm7150-gcc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml
> new file mode 100644
> index 000000000000..a0105e11fdb8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sm7150-gcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller on SM7150
> +
> +maintainers:
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Danila Tikhonov <danila@jiaxyga.com>
> +  - David Wronek <davidwronek@gmail.com>
> +
> +description: |
> +  Qualcomm global clock control module provides the clocks, resets and power
> +  domains on SM7150
> +
> +  See also:: include/dt-bindings/clock/qcom,sm7150-gcc.h
> +
> +properties:
> +  compatible:
> +    const: qcom,sm7150-gcc
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: Board XO Active-Only source
> +      - description: Sleep clock source
> +

If you started your work from the most recent bindings (e.g. sm8550) you
would have saved one iteration and one set of review...

> +  '#clock-cells':
> +    const: 1

Drop entire property, it's coming from gcc.yaml.


> +  '#reset-cells':
> +    const: 1

Ditto

> +
> +  '#power-domain-cells':
> +    const: 1

Ditto

> +
> +  reg:
> +    maxItems: 1

Ditto

> +
> +required:
> +  - compatible
> +  - reg

Drop reg

> +  - clocks
> +  - '#clock-cells'
> +  - '#reset-cells'
> +  - '#power-domain-cells'

Drop these three.

> +
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    clock-controller@100000 {
> +      compatible = "qcom,sm7150-gcc";
> +      reg = <0x00100000 0x001f0000>;
> +      clocks = <&rpmhcc RPMH_CXO_CLK>,
> +               <&rpmhcc RPMH_CXO_CLK_A>,
> +               <&sleep_clk>;
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +    };
> +...
> +
> diff --git a/include/dt-bindings/clock/qcom,sm7150-gcc.h b/include/dt-bindings/clock/qcom,sm7150-gcc.h
> new file mode 100644
> index 000000000000..3e5f8d32796d
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,sm7150-gcc.h
> @@ -0,0 +1,193 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2023, Danila Tikhonov <danila@jiaxyga.com>
> + * Copyright (c) 2023, David Wronek <davidwronek@gmail.com>

You did not base your work on any existing bindings upstream or
downstream? This should include original work copyrights...

Best regards,
Krzysztof

