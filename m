Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09DEEC4320A
	for <linux-clk@archiver.kernel.org>; Wed, 18 Aug 2021 07:05:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E01FA61058
	for <linux-clk@archiver.kernel.org>; Wed, 18 Aug 2021 07:05:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238440AbhHRHFm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Aug 2021 03:05:42 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:53650
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238093AbhHRHFl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Aug 2021 03:05:41 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 9410F41281
        for <linux-clk@vger.kernel.org>; Wed, 18 Aug 2021 07:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629270306;
        bh=GiPZif3WhhgQryFLR/tnhUOZmOp5r3GZm5WHeqgH8yU=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=kRwmqLhotfeRfePM41j276//w9S1BP5IcNBo0nwk+RjYWHyXARcfxE9nh7kk3qUFJ
         pupOMOdbMXjljmwcnPE1AEnI7yB0XupaCY6f2XZe3AjelvmhTllflJ5vI5lrJipFOu
         iurpIEPTlg1yXQi0ourGTndy7ksLqE1ijMD9rU2iE9mbh1pRA8Y9GCCCCgfjaxggws
         3DM3XCHzLhjrclZnsYHywNzAduDi541BDWkUmOI4vIsmq/X8Lty0yI74dQMbnnwVyt
         qR8sQfyqahkCp4CNkZZVk9upVRJzT3gM8vKE8SkLHX8n/ICplA5tuZ9MIAYorX9xHx
         ppZJqfp5bLqsQ==
Received: by mail-ed1-f71.google.com with SMTP id b25-20020a05640202d9b02903be7281a80cso560338edx.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Aug 2021 00:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GiPZif3WhhgQryFLR/tnhUOZmOp5r3GZm5WHeqgH8yU=;
        b=KMtedpTSjVInT4oTfQ3PtpKlaPU96jnphN4oMDR+5JEWiLlcixq9aHJGS5389YmeTL
         AjB77AoEdeQf+5+06UvIXQILyrSpfcf8gemwHZJ6WjRWegmh8KeGxfb73jnIcg7n4x99
         3dBU7ftFwKpefFS1kSBphgzzYLlBP4FVcikT5099CbUMjrziCFsMSdXDjGFaVM/w7FLC
         nJNbRicREkbPDmVqWRtYX5DmaCMFh1wHrYAtH7vfKXo7RdM00U9SjtB+Ramko7eTn0zi
         jFFCjo2tOAkIjus/HU2zDMroY7N7Y0RMZvcbF8z65KTXWVFbvODZIeQzJAcfF4pPaCGX
         uzQw==
X-Gm-Message-State: AOAM533G6MQK8uZ9TuChsWWDV2MNC3HCxO+3n8+LDd4hwv4ZdXvHskcI
        0KB2JTzhQE6CBHF3IYIX/g0wDi6hNS59l/ly2SRl3ThCZXW5Be2ul5Q1C7yWZPiSLexAaUwoY2k
        f2k+QUt9z8gRidCKybbzuB1ayqvBsaHy9o+c3sA==
X-Received: by 2002:a17:907:c12:: with SMTP id ga18mr822310ejc.107.1629270306255;
        Wed, 18 Aug 2021 00:05:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweDS1MgiuJQRLVhEgssP66aU+yuOSH7KK2IB2OUDoqYStiSrV9zT27jxD2JB8PYwKO6d2FYA==
X-Received: by 2002:a17:907:c12:: with SMTP id ga18mr822284ejc.107.1629270306066;
        Wed, 18 Aug 2021 00:05:06 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id lw15sm1578792ejb.50.2021.08.18.00.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 00:05:05 -0700 (PDT)
To:     Rob Herring <robh@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sam Protsenko <semen.protsenko@linaro.org>
References: <20210810093145.26153-1-krzysztof.kozlowski@canonical.com>
 <20210810093145.26153-6-krzysztof.kozlowski@canonical.com>
 <YRwa4ehkBUNwJi+I@robh.at.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v2 5/8] dt-bindings: clock: samsung: convert Exynos4 to
 dtschema
Message-ID: <dcbe2391-b0a4-6e81-77b7-003ac0611ccc@canonical.com>
Date:   Wed, 18 Aug 2021 09:05:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRwa4ehkBUNwJi+I@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/08/2021 22:24, Rob Herring wrote:
> On Tue, Aug 10, 2021 at 11:31:42AM +0200, Krzysztof Kozlowski wrote:
>> Merge Exynos4210 and Exynos4412 clock controller bindings to existing DT
>> schema.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  .../bindings/clock/exynos4-clock.txt          | 86 -------------------
>>  .../bindings/clock/samsung,exynos-clock.yaml  | 29 ++++++-
>>  2 files changed, 28 insertions(+), 87 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/clock/exynos4-clock.txt
>>
>> diff --git a/Documentation/devicetree/bindings/clock/exynos4-clock.txt b/Documentation/devicetree/bindings/clock/exynos4-clock.txt
>> deleted file mode 100644
>> index 17bb11365354..000000000000
>> --- a/Documentation/devicetree/bindings/clock/exynos4-clock.txt
>> +++ /dev/null
>> @@ -1,86 +0,0 @@
>> -* Samsung Exynos4 Clock Controller
>> -
>> -The Exynos4 clock controller generates and supplies clock to various controllers
>> -within the Exynos4 SoC. The clock binding described here is applicable to all
>> -SoC's in the Exynos4 family.
>> -
>> -Required Properties:
>> -
>> -- compatible: should be one of the following.
>> -  - "samsung,exynos4210-clock" - controller compatible with Exynos4210 SoC.
>> -  - "samsung,exynos4412-clock" - controller compatible with Exynos4412 SoC.
>> -
>> -- reg: physical base address of the controller and length of memory mapped
>> -  region.
>> -
>> -- #clock-cells: should be 1.
>> -
>> -Each clock is assigned an identifier and client nodes can use this identifier
>> -to specify the clock which they consume.
>> -
>> -All available clocks are defined as preprocessor macros in
>> -dt-bindings/clock/exynos4.h header and can be used in device
>> -tree sources.
>> -
>> -Example 1: An example of a clock controller node is listed below.
>> -
>> -	clock: clock-controller@10030000 {
>> -		compatible = "samsung,exynos4210-clock";
>> -		reg = <0x10030000 0x20000>;
>> -		#clock-cells = <1>;
>> -	};
>> -
>> -Example 2: UART controller node that consumes the clock generated by the clock
>> -	   controller. Refer to the standard clock bindings for information
>> -	   about 'clocks' and 'clock-names' property.
>> -
>> -	serial@13820000 {
>> -		compatible = "samsung,exynos4210-uart";
>> -		reg = <0x13820000 0x100>;
>> -		interrupts = <0 54 0>;
>> -		clocks = <&clock CLK_UART2>, <&clock CLK_SCLK_UART2>;
>> -		clock-names = "uart", "clk_uart_baud0";
>> -	};
>> -
>> -Exynos4412 SoC contains some additional clocks for FIMC-ISP (Camera ISP)
>> -subsystem. Registers for those clocks are located in the ISP power domain.
>> -Because those registers are also located in a different memory region than
>> -the main clock controller, a separate clock controller has to be defined for
>> -handling them.
>> -
>> -Required Properties:
>> -
>> -- compatible: should be "samsung,exynos4412-isp-clock".
>> -
>> -- reg: physical base address of the ISP clock controller and length of memory
>> -  mapped region.
>> -
>> -- #clock-cells: should be 1.
>> -
>> -- clocks: list of the clock controller input clock identifiers,
>> -  from common clock bindings, should point to CLK_ACLK200 and
>> -  CLK_ACLK400_MCUISP clocks from the main clock controller.
>> -
>> -- clock-names: list of the clock controller input clock names,
>> -  as described in clock-bindings.txt, should be "aclk200" and
>> -  "aclk400_mcuisp".
>> -
>> -- power-domains: a phandle to ISP power domain node as described by
>> -  generic PM domain bindings.
>> -
>> -Example 3: The clock controllers bindings for Exynos4412 SoCs.
>> -
>> -	clock: clock-controller@10030000 {
>> -		compatible = "samsung,exynos4412-clock";
>> -		reg = <0x10030000 0x18000>;
>> -		#clock-cells = <1>;
>> -	};
>> -
>> -	isp_clock: clock-controller@10048000 {
>> -		compatible = "samsung,exynos4412-isp-clock";
>> -		reg = <0x10048000 0x1000>;
>> -		#clock-cells = <1>;
>> -		power-domains = <&pd_isp>;
>> -		clocks = <&clock CLK_ACLK200>, <&clock CLK_ACLK400_MCUISP>;
>> -		clock-names = "aclk200", "aclk400_mcuisp";
>> -	};
>> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
>> index c7b07fcd3fa1..ea73201f259b 100644
>> --- a/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
>> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
>> @@ -23,6 +23,9 @@ properties:
>>            - samsung,exynos3250-cmu
>>            - samsung,exynos3250-cmu-dmc
>>            - samsung,exynos3250-cmu-isp
>> +          - samsung,exynos4210-clock
>> +          - samsung,exynos4412-clock
>> +          - samsung,exynos4412-isp-clock
>>            - samsung,exynos5250-clock
>>            - samsung,exynos5420-clock
>>            - samsung,exynos5800-clock
>> @@ -35,11 +38,18 @@ properties:
>>    assigned-clocks: true
>>    assigned-clock-parents: true
>>    assigned-clock-rates: true
>> -  clocks: true
>> +  clocks:
>> +    description: |
>> +      For samsung,exynos4412-isp-clock, the input clocks should be CLK_ACLK200
>> +      and CLK_ACLK400_MCUISP from the main clock controller.
>> +
>> +  clock-names: true
>>  
>>    "#clock-cells":
>>      const: 1
>>  
>> +  power-domains: true
>> +
> 
> How many?

I'll add it.

> 
> Now all the flavors can have a power domain? Maybe this should be a 
> separate binding given this and the if/then below.

If you ask about the hardware specifically - almost all flavors could
have a power domain.

There are actually several clock controllers in every SoC responsible
for different parts (e.g. display, GPU, audio, video encoder) and most
of them could have a power domain.

However the clock controller bindings and drivers for all ARMv7 Exynos
SoCs were designed as one device with one device node. Inside the driver
spawns sub-controllers but still there is one device node.

Therefore the answer, if you ask about bindings and hardware-driver
model, is that only some of the flavors will have a power domain.

If you think that having to separate bindings, without that "allOf: if:"
below, is simpler then I can split it.

> 
>>    reg:
>>      maxItems: 1
>>  
>> @@ -50,6 +60,23 @@ required:
>>  
>>  additionalProperties: false
>>  
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: samsung,exynos4412-isp-clock
>> +    then:
>> +      properties:
>> +        clock-names:
>> +          items:
>> +            - const: aclk200
>> +            - const: aclk400_mcuisp
>> +      required:
>> +        - clocks
>> +        - clock-names
>> +        - power-domains
>> +
>>  examples:
>>    - |
>>      #include <dt-bindings/clock/exynos5250.h>
>> -- 
>> 2.30.2
>>
>>


Best regards,
Krzysztof
