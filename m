Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7711AC77B72
	for <linux-clk@archiver.kernel.org>; Fri, 14 Apr 2023 21:08:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbjDNVIJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Apr 2023 17:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbjDNVIJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Apr 2023 17:08:09 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4274E4EF2
        for <linux-clk@vger.kernel.org>; Fri, 14 Apr 2023 14:08:07 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-94a342f3ebcso453570966b.0
        for <linux-clk@vger.kernel.org>; Fri, 14 Apr 2023 14:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681506486; x=1684098486;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hy2SHbI2lqj5Bp3ZPYgjYD8oE60t27/oFxktc6fpZbI=;
        b=dnqGaZ8B9oXTFuifP0wk6iUbtXyERtqOhliVUYa5wckjCSPJkNC9U7XX4kcmSa7bc5
         Ccr/MSJ9XbtMhceJhyIl3ieDrCrfSVMIOHZaxKP1/ya4meZ3ldxfEfasRAijK3GQgMww
         Sh+pmn/4PCxJEmzb4m2FGQBoD7YkXB3hJvTFNuhC7lpPCLbj5oRcvCTjwY1deu21I6gJ
         xV1zyH9+3s7JyH/QUyh6ibo3T7DsJaP6eBaOd47pIyTuUu6T50DutzxTZULtgC0mNH/+
         zOKWAt/ATU39PPNai3+mUflQ3/xvHWBVa+qo8SjSjkucT83P4Ng2YF3HJ2dWncoyGbNn
         4fCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681506486; x=1684098486;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hy2SHbI2lqj5Bp3ZPYgjYD8oE60t27/oFxktc6fpZbI=;
        b=lEx2DIJrX+lgHPytkh+ezOl+94XfzCyuhL4XwaKqhA6Y8d2IJcm0JBc2QNUVXgnw9w
         a/iQRDDiLBv68zSAwmMbQ9p1ygJ0O86sAfhtcN/PXQzNEYRm/UbjrhAAgqnUuIcJVRJm
         RD7QZEqmMRP2q+ynHIWVzehmgnmTnLtLswB518GLf1ipBxh6gE9vrRB5rX1aIdFcjXpf
         JzO2v4dOYu7D8NDv4RuAvn+dbObKmq35swE83aIGRzqhsAw/n/LPWrldzpz3VfIRWgAN
         i8yedmizJUt9dus3rcLCSwUp23SUUpauDTQOkgrXw0hRlsfLb5qqhselLUN0cluSnwaU
         ZEYg==
X-Gm-Message-State: AAQBX9ffUv9hLIhU44v85PgfzvdMxx0FIkvqw4VkkSddQrILnH9wZ4mp
        fBZf3vXJ1J36P6KGaeAQWnFTrQ==
X-Google-Smtp-Source: AKy350Yi3LtwsUpEg00id3W9FUSjh+9nXNEH8GoJJSgGVr18nTCmXKwr4Rn8T7Bv28uuxo6Bpyucag==
X-Received: by 2002:a05:6402:215:b0:506:905b:816d with SMTP id t21-20020a056402021500b00506905b816dmr80507edv.6.1681506485749;
        Fri, 14 Apr 2023 14:08:05 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ffae:8aab:ae5a:4688? ([2a02:810d:15c0:828:ffae:8aab:ae5a:4688])
        by smtp.gmail.com with ESMTPSA id o4-20020a509b04000000b00504d04c939fsm2605223edi.59.2023.04.14.14.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 14:08:03 -0700 (PDT)
Message-ID: <c1f32d73-a311-6d70-0be6-12bdb50a052f@linaro.org>
Date:   Fri, 14 Apr 2023 23:08:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add reg-clock-controller
Content-Language: en-US
To:     David Yang <mmyangfl@gmail.com>, linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230414181302.986271-1-mmyangfl@gmail.com>
 <20230414181302.986271-2-mmyangfl@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230414181302.986271-2-mmyangfl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/04/2023 20:12, David Yang wrote:
> Add DT bindings documentation for reg-clock-controller, collection of
> basic clocks common to many platforms.
> 
> Signed-off-by: David Yang <mmyangfl@gmail.com>
> ---
>  .../bindings/clock/reg-clock-controller.yaml  | 245 ++++++++++++++++++
>  1 file changed, 245 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/reg-clock-controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/reg-clock-controller.yaml b/Documentation/devicetree/bindings/clock/reg-clock-controller.yaml
> new file mode 100644
> index 000000000000..a6a7e0b05821
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/reg-clock-controller.yaml
> @@ -0,0 +1,245 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/reg-clock-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Simple straight-forward register-based clocks
> +
> +maintainers:
> +  - David Yang <mmyangfl@gmail.com>
> +
> +description: |
> +  Basic clocks common to many platforms.
> +
> +  If your clocks don't fit into these catagories, simply create your clock

typo: categories

> +  controller. This driver normally work well with other controllers as long as
> +  they operate on different registers.
> +
> +  See linux/clk-provider.h for details about properties for each type of clock.

Describe here what is this device, what such simple clock controller
represents.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - reg-clock-controller
> +
> +  ranges: true
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - ranges
> +  - '#address-cells'
> +  - '#size-cells'

required goes after patternProperties.

> +
> +patternProperties:
> +  ".*gate-clock@.*":

"gate-clock@" should be equivalent. However this should be just "clock".

> +    type: object
> +
> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      Clock which can gate its output.
> +
> +    properties:
> +      compatible:
> +        const: gate-clock
> +
> +      reg:
> +        maxItems: 1
> +
> +      '#clock-cells':
> +        const: 0
> +
> +      clocks:
> +        maxItems: 1
> +        description:
> +          Parent clock.
> +
> +      clock-output-name:

names

Don't create your own properties.

> +        maxItems: 1
> +
> +      bit-index:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Bit index which controls the output.

I suggest to use same property as nvme, so bits.

> +
> +    required:
> +      - compatible
> +      - reg
> +      - '#clock-cells'
> +      - bit-index
> +
> +    additionalProperties: false
> +
> +  ".*divider-clock@.*":
> +    type: object
> +
> +    description: |
> +      Clock with an adjustable divider affecting its output frequency.
> +
> +    properties:
> +      compatible:
> +        const: divider-clock
> +
> +      reg:
> +        maxItems: 1
> +
> +      '#clock-cells':
> +        const: 0
> +
> +      clocks:
> +        description:
> +          Parent clocks.
> +
> +      clock-output-name:
> +        maxItems: 1
> +
> +      shift:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Shift to the divider bit field.
> +
> +      width:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Width of the divider bit field.
> +
> +      dividers:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description:
> +          Array of value/divider pairs.

Then it looks like matrix.

> +
> +    required:
> +      - compatible
> +      - reg
> +      - '#clock-cells'
> +      - shift
> +      - width
> +
> +    additionalProperties: false
> +
> +  ".*mux-clock@.*":
> +    type: object
> +
> +    description: |
> +      Clock with multiple selectable parents.
> +
> +    properties:
> +      compatible:
> +        const: mux-clock
> +
> +      reg:
> +        maxItems: 1
> +
> +      '#clock-cells':
> +        const: 0
> +
> +      clocks:
> +        minItems: 1
> +        description:
> +          Parent clock.
> +
> +      clock-output-name:
> +        maxItems: 1
> +
> +      shift:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Shift to multiplexer bit field.
> +
> +      mask:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Mask of mutliplexer bit field.
> +
> +      table:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description:
> +          Array of register values corresponding to the parent index.
> +
> +    required:
> +      - compatible
> +      - reg
> +      - '#clock-cells'
> +      - shift
> +      - mask
> +
> +    additionalProperties: false
> +
> +  ".*fractional-divider-clock@.*":
> +    type: object
> +
> +    description: |
> +      Clock with adjustable fractional divider affecting its output frequency.
> +
> +    properties:
> +      compatible:
> +        const: fractional_divider-clock
> +
> +      reg:
> +        maxItems: 1
> +
> +      '#clock-cells':
> +        const: 0
> +
> +      clocks:
> +        maxItems: 1
> +        description:
> +          Parent clock.
> +
> +      clock-output-name:
> +        maxItems: 1
> +
> +      numerator-shift:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Shift to the numerator bit field.
> +
> +      numerator-width:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Width of the numerator bit field.
> +
> +      denominator-shift:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Shift to the denominator bit field.
> +
> +      denominator-width:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Width of the denominator bit field.
> +
> +    required:
> +      - compatible
> +      - reg
> +      - '#clock-cells'
> +      - numerator-shift
> +      - numerator-width
> +      - denominator-shift
> +      - denominator-width
> +
> +    additionalProperties: false
> +
> +additionalProperties: true

No, come on. This must be false.

> +
> +examples:
> +  - |
> +    clks: reg-clk-ctrl@ffff0000 {

Names should be generic, so clock-controller

Drop the label.

> +      compatible = "reg-clock-controller";
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges = <0 0xffff0000 0x1000>;
> +
> +      my_clk: gate-clock@cc-3 {

Drop label.

That's a new unit address to me. Did I miss a change in DT spec?

> +        compatible = "gate-clock";
> +        #clock-cells = <0>;
> +        reg = <0xcc 4>;

reg is after compatible.

> +        bit-index = <3>;
> +        clock-output-name = "my-clk";

Plus, test your patches. This fails testing...

> +      };
> +    };

Best regards,
Krzysztof

