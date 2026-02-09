Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B76623373D;
	Mon,  9 Feb 2026 13:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770642874; cv=none; b=NDhNuS6uMdFb6qTQF/XJG8iuGKHcaZ3k7RZH9lF+ijDUDqqQJ+m6fABATa3Ho8lxGx2A6QTQACEb3RhvqAg/ovbIj7xz0xQA/21BEvJcRnLLHdwTbd0UjtKhBw1/SStCNMAmTHsNAs6vO2Li/2TWYhtDKKqbRVQc0Tt7AXz/49A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770642874; c=relaxed/simple;
	bh=564k2LnoApszpIPBy6pIXAzs/P2R7AhJFsF2c/0eiNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d26h3/PysX6VSlslCeHi8b8CrR6oUNNUParFJfGTt+0mKIeLUK/kOYfwYH79ojBwRB+PP1bzY6IRC4gcQfzVuluv3NvNdQCT232IoRrAJpuCY6i1OkuFchhm15TaxaB4Rp4mcGBAl7FT6TmCYr7ombMgAiUwpeyitssvCFPP9xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1Mxnd7F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1Mxnd7F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0AFFC116C6;
	Mon,  9 Feb 2026 13:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770642873;
	bh=564k2LnoApszpIPBy6pIXAzs/P2R7AhJFsF2c/0eiNs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e1Mxnd7FrLR/nBfDYZ8/Xt5QjPS+7uAz0eK2b3vZgJS3H8O+t/OhnLqspmhipgXli
	 EnokWJyQhYhnEIFDhvUqFhkfaJLW8mcbA9RtOVbSMbpdq/vijsWzZN4mKUZ3qalGSX
	 sllVmEPyVTa83HsCBT6jEL9aLHXqnW7wbYFd1ia22bui4/2V1TYuSGny0Ircph4HvF
	 lHR+pJpOlSHtKY3Zg5swfEgQhxifuC4gEkEngFxJsA60PoPQ08+Nv0STvRbZtrE0+G
	 nFBCgx4scCA/6HN4kodTwdvWfi+UWACc2xYUdw8yxsmkG9hqu/HRJuEMDAioIGjiI9
	 vIXPgmAd9lf+g==
Message-ID: <10caac08-1a1d-4fe9-8df8-e0b75c532e8f@kernel.org>
Date: Mon, 9 Feb 2026 14:14:29 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] dt-bindings: clock: Add Amlogic A9 standardized
 model clock control units
To: chuan.liu@amlogic.com, Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260209-a9_clock_driver-v1-0-a9198dc03d2a@amlogic.com>
 <20260209-a9_clock_driver-v1-1-a9198dc03d2a@amlogic.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260209-a9_clock_driver-v1-1-a9198dc03d2a@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/02/2026 06:48, Chuan Liu via B4 Relay wrote:
> From: Chuan Liu <chuan.liu@amlogic.com>
> 
> Add dt-binding documentation for standardized model clock control units
> in A9 SoC family.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,a9-model-ccu.yaml       | 435 +++++++++++++++++++++
>  1 file changed, 435 insertions(+)

Brief review, you still have to read basic guidelines to not repeat the
basic mistakes.

> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a9-model-ccu.yaml b/Documentation/devicetree/bindings/clock/amlogic,a9-model-ccu.yaml
> new file mode 100644
> index 000000000000..56c5cbe1b246
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,a9-model-ccu.yaml
> @@ -0,0 +1,435 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2026 Amlogic, Inc. All rights reserved
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/amlogic,a9-model-ccu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic A9 Family Standardized Model Clock Control Unit
> +
> +maintainers:
> +  - Chuan Liu <chuan.liu@amlogic.com>
> +
> +description:
> +  The clock tree within the A9 is composed of numerous instances of these
> +  standardized model CCU (Clock Control Units).
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:

Drop

> +          - const: amlogic,a9-composite-ccu
> +        description: Supports clock source selection, frequency division, and
> +                     clock gating.

This is just one big enum. You can add comments if you insist...


> +      - items:
> +          - const: amlogic,a9-composite-ccu-mult
> +        description: Some modules have multiple input clocks and contain
> +                     multiple composite-ccus internally.
> +      - items:
> +          - const: amlogic,a9-noglitch-ccu
> +        description: Provides the same functionality as composite-ccu but
> +                     includes glitch suppression during frequency transitions.
> +      - items:
> +          - const: amlogic,a9-noglitch-ccu-mult
> +        description: Some modules have multiple input clocks and contain
> +                     multiple noglitch-ccus internally.
> +      - items:
> +          - const: amlogic,a9-sysbus-ccu
> +        description: Consists of multiple gating arrays, commonly used for
> +                     Amlogic's sys_clk and axi_clk.
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 16
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 16
> +
> +  clock-output-names:
> +    minItems: 1
> +    # The sysbus-ccu of A9 supports up to 128 gates
> +    maxItems: 128
> +
> +  '#clock-cells':
> +    description:
> +      The clock controller of a module may contain one or more CCU(s). When a
> +      clock controller has multiple CCUs, an index is required to specify a
> +      particular CCU within the clock controller.

Drop

> +    oneOf:
> +      - const: 0
> +        description: Single clock output, no specifier needed
> +      - const: 1
> +        description: Multiple clocks, index selects specific output

Drop all descriptions. That's enum. Do not explain usu how DT works.

> +
> +  amlogic,clock-max-frequency:

Drop property. So many wrong things here... First, start from basic
guidelines like talks or docs in kernel and understand the suffixes.

Second not a DT property.

> +    description: |
> +      Each clock's maximum output frequency is constrained during hardware
> +      design to ensure proper timing requirements for the clock network. If the
> +      clock frequency configured exceeds this design limit, it can lead to
> +      abnormal behavior in modules relying on that clock and may even cause
> +      cross-talk that affects other modules.
> +
> +      In the driver, this property is parsed, and interface functions from the

Why would we care about driver?

This is binding, we talk about hardware.


> +      CCF are called to enforce the clock's maximum frequency, preventing
> +      potential issues caused by excessive clock frequency configurations.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +  amlogic,reg-layout:

No, drop. Compatible defines it.

> +    description:
> +      These standardized model CCUs require register configuration for their
> +      clock functions. This property node describes the register layout
> +      parameters for each model's CCU.
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          anyOf:
> +            - contains:
> +                const: amlogic,a9-composite-ccu
> +            - contains:
> +                const: amlogic,a9-noglitch-ccu
> +    then:
> +      properties:
> +        '#clock-cells':
> +          const: 0
> +        clock-output-names:
> +          minItems: 1
> +          maxItems: 1
> +    else:
> +      properties:
> +        '#clock-cells':
> +          const: 1
> +        clock-output-names:
> +          minItems: 2
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: amlogic,a9-composite-ccu
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 1
> +          items:
> +            - description: input clock source 0
> +            - description: input clock source 1 (optional)
> +            - description: input clock source 2 (optional)
> +            - description: input clock source 3 (optional)
> +            - description: input clock source 4 (optional)
> +            - description: input clock source 5 (optional)
> +            - description: input clock source 6 (optional)
> +            - description: input clock source 7 (optional)
> +        clock-names:
> +          minItems: 1
> +          items:
> +            - const: clkin0
> +            - const: clkin1
> +            - const: clkin2
> +            - const: clkin3
> +            - const: clkin4
> +            - const: clkin5
> +            - const: clkin6
> +            - const: clkin7
> +        amlogic,reg-layout:
> +          description: |
> +            composite-ccu contains three register layout parameters:
> +              * register offset
> +              * bit offset
> +              * divider effective bit width
> +      required:
> +        - amlogic,reg-layout
> +        - clock-names
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: amlogic,a9-composite-ccu-mult
> +    then:
> +      properties:
> +        clocks:
> +          description:
> +            Some clock controllers contain two composite-ccus (labeled
> +            composite_a and composite_b). In certain controllers, composite_a
> +            and composite_b share a common clock source, while in others they
> +            have independent clock sources.
> +          minItems: 1
> +          items:
> +            - description: composite_a/b's input clock source 0
> +            - description: composite_a/b's input clock source 1 (optional)
> +            - description: composite_a/b's input clock source 2 (optional)
> +            - description: composite_a/b's input clock source 3 (optional)
> +            - description: composite_a/b's input clock source 4 (optional)
> +            - description: composite_a/b's input clock source 5 (optional)
> +            - description: composite_a/b's input clock source 6 (optional)
> +            - description: composite_a/b's input clock source 7 (optional)
> +            - description: composite_b's input clock source 0 (optional)
> +            - description: composite_b's input clock source 1 (optional)
> +            - description: composite_b's input clock source 2 (optional)
> +            - description: composite_b's input clock source 3 (optional)
> +            - description: composite_b's input clock source 4 (optional)
> +            - description: composite_b's input clock source 5 (optional)
> +            - description: composite_b's input clock source 6 (optional)
> +            - description: composite_b's input clock source 7 (optional)
> +        clock-names:
> +          minItems: 1
> +          items:
> +            - const: clkin0
> +            - const: clkin1
> +            - const: clkin2
> +            - const: clkin3
> +            - const: clkin4
> +            - const: clkin5
> +            - const: clkin6
> +            - const: clkin7
> +            - const: bclkin0
> +            - const: bclkin1
> +            - const: bclkin2
> +            - const: bclkin3
> +            - const: bclkin4
> +            - const: bclkin5
> +            - const: bclkin6
> +            - const: bclkin7
> +        amlogic,reg-layout:
> +          description: |
> +            composite-ccu contains three register layout parameters:
> +              * register offset
> +              * bit offset
> +              * divider effective bit width
> +      required:
> +        - amlogic,reg-layout
> +        - clock-names
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: amlogic,a9-noglitch-ccu
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 1
> +          items:
> +            - description: input clock source 0
> +            - description: input clock source 1 (optional)
> +            - description: input clock source 2 (optional)
> +            - description: input clock source 3 (optional)
> +            - description: input clock source 4 (optional)
> +            - description: input clock source 5 (optional)
> +            - description: input clock source 6 (optional)
> +            - description: input clock source 7 (optional)
> +        clock-names:
> +          minItems: 1
> +          items:
> +            - const: clkin0
> +            - const: clkin1
> +            - const: clkin2
> +            - const: clkin3
> +            - const: clkin4
> +            - const: clkin5
> +            - const: clkin6
> +            - const: clkin7
> +      required:
> +        - clock-names
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: amlogic,a9-noglitch-ccu-mult
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 1

Why?

> +          items:
> +            - description: input clock source 0
> +            - description: input clock source 1 (optional)

Drop optional. Don't repeat constraints in free form text.

> +            - description: input clock source 2 (optional)
> +            - description: input clock source 3 (optional)
> +            - description: input clock source 4 (optional)
> +            - description: input clock source 5 (optional)
> +            - description: input clock source 6 (optional)
> +            - description: input clock source 7 (optional)
> +        clock-names:
> +          minItems: 1
> +          items:
> +            - const: clkin0
> +            - const: clkin1
> +            - const: clkin2
> +            - const: clkin3
> +            - const: clkin4
> +            - const: clkin5
> +            - const: clkin6
> +            - const: clkin7
> +        amlogic,reg-layout:
> +          description: |
> +            composite-ccu contains one register layout parameters:
> +              * register offset
> +      required:
> +        - amlogic,reg-layout
> +        - clock-names
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: amlogic,a9-sysbus-ccu
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +          description: input clock of sysbus-ccu

list the items with description instead.

> +        amlogic,reg-layout:
> +          description: |
> +            composite-ccu contains two register layout parameters:
> +              * register offset
> +              * bit offset
> +      required:
> +        - amlogic,reg-layout

This is huge and amount of ifs is clearly suggesting you combined way
too much into one file.


> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-output-names
> +  - "#clock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clk_dummy: clock-dummy {
> +        compatible = "fixed-clock";
> +        #clock-cells = <0>;
> +        clock-frequency = <0>;
> +        clock-output-names = "dummy";
> +        status = "disabled";
> +    };

Not relevant, drop entire node.

> +
> +    apb {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        clock-controller@350 {
> +            compatible = "amlogic,a9-composite-ccu";
> +            reg = <0x0 0x350 0x0 0x4>;
> +            #clock-cells = <0>;
> +            amlogic,clock-max-frequency = <50000000>;
> +            amlogic,reg-layout = <0x0 0  7>;
> +            clock-output-names = "sar_adc";
> +            clocks = <&xtal_24m>,
> +                     <&scmi_clk 17>;
> +            clock-names = "clkin0", "clkin1";
> +        };
> +
> +        clock-controller@290 {
> +            compatible = "amlogic,a9-composite-ccu-mult";
> +            reg = <0x0 0x290 0x0 0x8>;
> +            #clock-cells = <1>;
> +            amlogic,clock-max-frequency = <250000000>,
> +                                          <250000000>,
> +                                          <1200000000>;
> +            amlogic,reg-layout = <0x0 0  7>,
> +                                 <0x0 16 7>,
> +                                 <0x4 0  7>;
> +            clock-output-names = "sd_emmc_a",
> +                                 "sd_emmc_b",
> +                                 "sd_emmc_c";
> +            clocks = <&xtal_24m>,
> +                     <&scmi_clk 6>,
> +                     <&scmi_clk 10>;
> +            clock-names = "clkin0",
> +                          "clkin1",
> +                          "clkin2";
> +        };

One or two are enough. Drop the rest.

> 


Best regards,
Krzysztof
