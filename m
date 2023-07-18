Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B17AEB64DA
	for <linux-clk@archiver.kernel.org>; Tue, 18 Jul 2023 08:40:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231953AbjGRIko (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Jul 2023 04:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbjGRIkn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Jul 2023 04:40:43 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E84B10F9
        for <linux-clk@vger.kernel.org>; Tue, 18 Jul 2023 01:40:34 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9926623e367so769939066b.0
        for <linux-clk@vger.kernel.org>; Tue, 18 Jul 2023 01:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689669633; x=1692261633;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CWZTBAgn0sS+qEaFaptfqAKbYTBQ+DgmJZTWl6nef1U=;
        b=QqWpVaddIE2t/8XVvP/3VyDPBoo7sCh27hFVqsmka9a0CENOreiYjqjZCZNzPpfvnj
         0NNNTHQhoKUp9jKGf27C40p4Ghh8X7VIGh3E/Q08cf4x6K+eKZf+l2NtQByWx9FL3uCW
         0WsAAj2DfzrXGe+05VsD+njMxyaiVuu9cOrLjdRqdyD6k+DndbTUrqn8alMk8LKJ866Y
         1G+hqsJrukJB7GYbafnMMS7qSnYXHXPD+yGdrjLpl/xjqIeuQW1WkDUcDLFx8f2TQBti
         DObTe3wiffKTw2x/I8NG/rERN0faQEBCXoA/L4iFyAZHoWRaLepOhThwcrcF3r8nTOoG
         fnog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689669633; x=1692261633;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CWZTBAgn0sS+qEaFaptfqAKbYTBQ+DgmJZTWl6nef1U=;
        b=FR9SMe+Q/meNRuHH2ZF01wAH0rPtO9Xrr0HCBee0mzgsIncWA1HQCJ/qDeIQ90XqxO
         Fc+ZlIyG2WIJMugPqU3koTkwq/SR51EebeccMYGcQ4IxwlJTrT1TnWixJfgvNmyzo67q
         OlKBxiao6dWOqHvTMnYib8sA1IiJbMMNec3VCoIacZdDKYFR57AKe1iAsRZn0vQXJaZC
         poHqfmB16DPqtZvJPb9fF4ugfrN2zl0vl5M/gAzTgta8KRs8qGZeWKaTks4Q/X8Eq2Ma
         P8Iz7BuAPg9XsJ0EJ1XRfU6fX5skovpwsgFClAWrBnKPWCio5n0r7Le9L3KAixWn4bMJ
         X4rg==
X-Gm-Message-State: ABy/qLbRTjl+qPPe/xK+IlMcT/TuPA34qOuFEeFntRf42peg2vZ6DSOm
        1MTXZDfjjHtlLeFySxd58Ie/lg==
X-Google-Smtp-Source: APBJJlGXvZzY/4ZnkMYEMZVjqUOmFmubBz1PHzs4Mn4Z4u51BwEhq7i+2TcH00XbtVWsX2YKrYCOfg==
X-Received: by 2002:a17:906:6b97:b0:98e:26ae:9b01 with SMTP id l23-20020a1709066b9700b0098e26ae9b01mr12759543ejr.65.1689669633012;
        Tue, 18 Jul 2023 01:40:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id lc11-20020a170906dfeb00b00992ae4cf3c1sm697275ejc.186.2023.07.18.01.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 01:40:32 -0700 (PDT)
Message-ID: <28bfbafb-88c3-7284-6933-052caf734681@linaro.org>
Date:   Tue, 18 Jul 2023 10:40:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dt-bindings: clock: versal: Convert the
 xlnx,zynqmp-clk.txt to yaml
Content-Language: en-US
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        devicetree@vger.kernel.org
Cc:     git@amd.com, linux-clk@vger.kernel.org, michal.simek@amd.com,
        conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com
References: <20230718061035.9341-1-shubhrajyoti.datta@amd.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230718061035.9341-1-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/07/2023 08:10, Shubhrajyoti Datta wrote:
> Convert the xlnx,zynqmp-clk.txt to yaml.
> versal-clk.yaml already exists that's why zynqmp is converted and
> merged.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> Please let me know if the mergeing of the versal and zynqmp is fine 
> or if a seperate yaml is preferred.
> 
> Rebased on [1] to avoid merge conflict.
> 
> [1] https://lore.kernel.org/all/20230620110137.5701-1-shubhrajyoti.datta@amd.com/
> 
>  .../bindings/clock/xlnx,versal-clk.yaml       | 73 +++++++++++++++++--
>  .../bindings/clock/xlnx,zynqmp-clk.txt        | 63 ----------------
>  2 files changed, 65 insertions(+), 71 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> index e9cf747bf89b..1b69e2590478 100644
> --- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> @@ -20,6 +20,7 @@ properties:
>    compatible:
>      oneOf:
>        - const: xlnx,versal-clk
> +      - const: xlnx,zynqmp-clk

These two are enum.

>        - items:
>            - enum:
>                - xlnx,versal-net-clk
> @@ -31,16 +32,9 @@ properties:
>    clocks:
>      description: List of clock specifiers which are external input
>        clocks to the given clock controller.
> -    items:
> -      - description: reference clock
> -      - description: alternate reference clock
> -      - description: alternate reference clock for programmable logic

Missing constraints.

>  
>    clock-names:
> -    items:
> -      - const: ref
> -      - const: alt_ref
> -      - const: pl_alt_ref
> +    minItems: 3

This cannot be min. You wanted maxItems.

>  
>  required:
>    - compatible
> @@ -50,6 +44,60 @@ required:
>  
>  additionalProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - xlnx,versal-clk
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: reference clock
> +            - description: alternate reference clock
> +            - description: alternate reference clock for programmable logic
> +
> +        clock-names:
> +          items:
> +            - const: ref
> +            - const: alt_ref
> +            - const: pl_alt_ref
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - xlnx,zynqmp-clk
> +
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          items:
> +            - description: PS reference clock
> +            - description: reference clock for video system
> +            - description: alternative PS reference clock
> +            - description: auxiliary reference clock
> +            - description: transceiver reference clock
> +            - description: (E)MIO clock source  (Optional clock)

So you have 5-6 items.

> +
> +        clock-names:
> +          minItems: 5
> +          items:
> +            - const: pss_ref_clk
> +            - const: video_clk
> +            - const: pss_alt_ref_clk
> +            - const: aux_ref_clk
> +            - const: gt_crx_ref_clk
> +            - const: mio_clk_50_or_51
> +            - pattern: "^mio_clk[00-77]+.*$"
> +            - pattern: "gem[0-3]+_emio_clk.*$"
> +            - pattern: "swdt[0-1]+_ext_clk.*$"

But here more. It's a mess.

> +
>  examples:
>    - |
>      firmware {
> @@ -64,4 +112,13 @@ examples:
>          };
>        };
>      };
> +
> +    clock-controller1{

clock-controller


> +        #clock-cells = <1>;
> +        compatible = "xlnx,zynqmp-clk";
> +        clocks = <&pss_ref_clk>, <&video_clk>, <&pss_alt_ref_clk>,
> +                 <&aux_ref_clk>, <&gt_crx_ref_clk>;
> +        clock-names = "pss_ref_clk", "video_clk", "pss_alt_ref_clk",
> +                      "aux_ref_clk", "gt_crx_ref_clk";
> +    };


Best regards,
Krzysztof

