Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C845EB64DC
	for <linux-clk@archiver.kernel.org>; Fri, 21 Jul 2023 08:28:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbjGUI2Z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Jul 2023 04:28:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbjGUI2Y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Jul 2023 04:28:24 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE83270F
        for <linux-clk@vger.kernel.org>; Fri, 21 Jul 2023 01:28:23 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-992b66e5affso260350666b.3
        for <linux-clk@vger.kernel.org>; Fri, 21 Jul 2023 01:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689928101; x=1690532901;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dsq6lq46bmqojlD1viyuK+4fMsUmUDsNHjUOX0R90yo=;
        b=UQJvkxYK5Bxuy5cxfNgH7GymctjAjpOdfNZzmiGhVU3mR8wufYDTT5hcugzHMocqHQ
         hE9g2B66HdXjXY+TsmRAOdgPTY9Yuz3O7epIy2hoTD9uzcacjxoiMQkp2jyi0btALKYq
         OpscFAK7122dRJOnYN/kgy2NYxPr0hcALiieEm9y0Pv3PIC3nJSy5dSYya8T2mT46Y2j
         zYd0DxteaYHfkiw3K5+B/+G06Hr9LxcOZzUsIG/E+7RdI3eCrjj1yNm970qtvWmOPmYP
         W5W+UvTkzNnrdGjaaaqyD+6yWzyk2y2rQhnSzkgPbgz8Z3ZmHHz43kBXxe9BRc2iAkkx
         aUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689928101; x=1690532901;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dsq6lq46bmqojlD1viyuK+4fMsUmUDsNHjUOX0R90yo=;
        b=fKogR/YxnheE7dWOkDDq7VaBhomKVwsriBkvYuDRp7y3xGGOL77oXb9pnbcAmIluAT
         CyfXmEGv4uRDOrV0szEtNtvr5Dz1kdqbPlgUKJfzdcANtBsY2MGi8vaRT63LNRv80BHr
         62mz+WfkJfL7rac8zDk6/22jZ9gwybeQbvAKMGe0yhgYOAM0oFv8j1wV4ROgezakNEKN
         toN6OFZvZEddJZc6Bs3Fx50lcYrEBQamcqnTZCL2KbjP6OB37kaxf5py9GlJeZjTroz1
         K7An8/O9J6Tw6M5RINUrdEvM4Oa43VR2LJlpkWdpqkOCDOB8kl4mbeS27BQ/nqdM+86n
         CFTw==
X-Gm-Message-State: ABy/qLYIrFyGZH/YBXuPKPqXalYiblZ3FkxmVRXYBAJGgeZGvusoXu12
        yY6FXUu65m80TUwdyO7jvBd4RuWXqIWMiFNR5sLg1w==
X-Google-Smtp-Source: APBJJlFbeZX45zp0XdOXmUFlZXuNJ6sCLFRjiKekTNif3yCbc7LaSJc7oV4YzxyygJvwOayb93+JkA==
X-Received: by 2002:a17:906:7394:b0:994:4095:3abf with SMTP id f20-20020a170906739400b0099440953abfmr1190916ejl.14.1689928101569;
        Fri, 21 Jul 2023 01:28:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id qx4-20020a170906fcc400b00987e2f84768sm1821201ejb.0.2023.07.21.01.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 01:28:21 -0700 (PDT)
Message-ID: <745fccb0-e49d-7da7-9556-eb28aee4a32b@linaro.org>
Date:   Fri, 21 Jul 2023 10:28:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] dt-bindings: clock: versal: Convert the
 xlnx,zynqmp-clk.txt to yaml
Content-Language: en-US
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        devicetree@vger.kernel.org
Cc:     git@amd.com, linux-clk@vger.kernel.org, michal.simek@amd.com,
        conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com
References: <20230720113110.25047-1-shubhrajyoti.datta@amd.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230720113110.25047-1-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/07/2023 13:31, Shubhrajyoti Datta wrote:
> Convert the xlnx,zynqmp-clk.txt to yaml.
> versal-clk.yaml already exists that's why ZynqMP is converted and
> merged.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> 
> ---
> 
> Changes in v2:
> add enum in compatible
> fix the description
> add constraints for clocks

No, you didn't.

> name the clock-controller1 to clock-controller
> 
>  .../bindings/clock/xlnx,versal-clk.yaml       | 80 ++++++++++++++++---
>  .../bindings/clock/xlnx,zynqmp-clk.txt        | 63 ---------------
>  2 files changed, 70 insertions(+), 73 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> index e9cf747bf89b..cfe3aa676504 100644
> --- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> @@ -19,7 +19,9 @@ select: false
>  properties:
>    compatible:
>      oneOf:
> -      - const: xlnx,versal-clk
> +      - enum:
> +          - xlnx,versal-clk
> +          - xlnx,zynqmp-clk
>        - items:
>            - enum:
>                - xlnx,versal-net-clk
> @@ -31,16 +33,8 @@ properties:
>    clocks:
>      description: List of clock specifiers which are external input
>        clocks to the given clock controller.
> -    items:
> -      - description: reference clock
> -      - description: alternate reference clock
> -      - description: alternate reference clock for programmable logic
>  
> -  clock-names:
> -    items:
> -      - const: ref
> -      - const: alt_ref
> -      - const: pl_alt_ref
> +  clock-names: true

Nothing improved. Still constraints missing. You need min and maxItems
for clocks and clock-names. HERE.
>  
>  required:
>    - compatible
> @@ -50,6 +44,63 @@ required:
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
> +          minItems: 3

What happened here? Why? Drop.

> +          items:
> +            - description: reference clock
> +            - description: alternate reference clock
> +            - description: alternate reference clock for programmable logic
> +
> +        clock-names:
> +          minItems: 3

Drop

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
> +            - description: GEM emio clock  (Optional clock)
> +            - description: Watchdog external clock (Optional clock)
> +
> +        clock-names:
> +          minItems: 5
> +          items:
> +            - const: pss_ref_clk
> +            - const: video_clk
> +            - const: pss_alt_ref_clk
> +            - const: aux_ref_clk
> +            - const: gt_crx_ref_clk
> +            - pattern: "^mio_clk[00-77]+.*$"
> +            - pattern: "gem[0-3]+_emio_clk.*$"
> +            - pattern: "swdt[0-1]+_ext_clk.*$"
> +
>  examples:
>    - |
>      firmware {
> @@ -64,4 +115,13 @@ examples:
>          };
>        };
>      };
> +
> +    clock-controller {
> +        #clock-cells = <1>;
> +        compatible = "xlnx,zynqmp-clk";

compatible is always the first property.


Best regards,
Krzysztof

