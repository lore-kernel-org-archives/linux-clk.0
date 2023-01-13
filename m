Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BDFFC678D8
	for <linux-clk@archiver.kernel.org>; Fri, 13 Jan 2023 15:06:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbjAMPGo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Jan 2023 10:06:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbjAMPF5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Jan 2023 10:05:57 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63606FAC9
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 06:57:33 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id ss4so45658926ejb.11
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 06:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o0NOI61sZZytS7l+v8TO1KZZRUZqCOc1nmFiVvqeW/U=;
        b=mt5OZcj0ibpkJjQfmMfVLnZB2nNEpqrPpBlFS6IZqEyDlA0O6uP1jKssBmNCZjF5cp
         PChbYpEfIIygKZND3MWe2Y4x+v0FfKZr7MgiIN7C31GpR5yD2aN3RrLobFKdf3Eh0Jkb
         nVh/88DxGBN9MkwS99Hf+tx/CRI+YPPFG+k2Xk/9mTQ61VpmMcf+3932gfgauaX6GFgG
         kIqIxGKS3wJY2Zors6D9cfgQXOIq4r0dQwYI+Uhum6zvb+cWQvi7q4wovpaft9DRopRZ
         3JqjMjQvdBED/juxFziXfrLmpNtuJ1VxNsCiey6gwgZd17ogeCbZAaBsNXzT9R0FOVRH
         A1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o0NOI61sZZytS7l+v8TO1KZZRUZqCOc1nmFiVvqeW/U=;
        b=kdppK9t5rn5mlcl2r68S9z1TUarl8S/KAbix9akvP3+hbNCIujvjcxco1GF9XpLzDM
         w2AfgOPSlXEnAVg/8D9zOHk3Tfqr8GvQnZ+iCJmrxytqXwM30fooxWyIC46JD2LnZP9h
         lL1G3WdVIqoKjzvFw7xpZBuCVBKJerK1vpbIEmVmW6N4EQyY80LKmEYjiJcZDxsKT04b
         U7CRRLoSS0gA1pAEjM7461wiuNXOvIaiMwLuGWf7Zlx6GcgWJC6o2D1E6DdvWLXDSWcg
         v9eKHlUz+UTBp/fK8IwzLUaQ+6mr9htuSmW0j5n7zJGO+hbeI+Kk7KDzoxo11HWoMvYc
         M3mA==
X-Gm-Message-State: AFqh2krnKvekrefbCH+3r4CgnyfXiUQ+mALvejnQfOmxFydX7Njgvmt4
        uQV3ZQ0gEkjnLlSpzYWd7zIVCg==
X-Google-Smtp-Source: AMrXdXvZDD1kPQ0qZ8nzhzFjR7dYZBRGdYQLKP1aRAWON25sL5kQ7wkZxmEihgbIy2ov6AwuUGW1Zg==
X-Received: by 2002:a17:907:a0d6:b0:7d3:c516:6ef4 with SMTP id hw22-20020a170907a0d600b007d3c5166ef4mr89399506ejc.20.1673621851782;
        Fri, 13 Jan 2023 06:57:31 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id 18-20020a170906201200b00846734faa9asm8506473ejo.164.2023.01.13.06.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 06:57:31 -0800 (PST)
Message-ID: <0337e1ad-b8b4-8728-f5f1-be153b950fe6@linaro.org>
Date:   Fri, 13 Jan 2023 15:57:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/6] dt-bindings: clock: Add YAML schemas for QCOM A73 PLL
Content-Language: en-US
To:     devi priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, jassisinghbrar@gmail.com,
        catalin.marinas@arm.com, will@kernel.org, shawnguo@kernel.org,
        arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <20230113143647.14961-1-quic_devipriy@quicinc.com>
 <20230113143647.14961-2-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113143647.14961-2-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/01/2023 15:36, devi priya wrote:
> Add schema for primary CPU PLL found on few Qualcomm platforms.

Subject: drop redundant "YAML schemas for"


> 
> Co-developed-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: devi priya <quic_devipriy@quicinc.com>
> ---
>  .../bindings/clock/qcom,a73pll.yaml           | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,a73pll.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,a73pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a73pll.yaml
> new file mode 100644
> index 000000000000..a0e81094db8d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,a73pll.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,a73pll.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm A73 PLL clock
> +
> +maintainers:
> +  - Bjorn Andersson <andersson@kernel.org>
> +
> +description:
> +  The A73 PLL on few Qualcomm platforms is the main CPU PLL used for
> +  frequencies above 1GHz.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,ipq9574-a73pll
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 0
> +
> +  clocks:
> +    items:
> +      - description: board XO clock
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +
> +  operating-points-v2: true

Drop. I'll fix the other bindings.

> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    a73pll: clock@b116000 {
> +            compatible = "qcom,ipq9574-a73pll";

Use 4 spaces for example indentation.

> +            reg = <0x0b116000 0x40>;
> +            #clock-cells = <0>;
> +            clocks = <&xo_board_clk>;
> +            clock-names = "xo";
> +    };

Best regards,
Krzysztof

