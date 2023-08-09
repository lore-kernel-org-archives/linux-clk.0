Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB08FEB64DD
	for <linux-clk@archiver.kernel.org>; Wed,  9 Aug 2023 06:59:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbjHIG7k (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Aug 2023 02:59:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231305AbjHIG7d (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Aug 2023 02:59:33 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DF931BCF
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 23:59:32 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fe5eb84d43so22319635e9.3
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 23:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691564371; x=1692169171;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=pclgRUr50wRfATBploauErLn3ue8ixjFigg7gvZ224U=;
        b=PN6guLnyozz5cEFAsw9hY4rNE0NCNNWMkqQmHPfYpwzl47AZldLyKZ+we8YHvjd8Gw
         aUP6CSZiod+JKRjUlanRvZigp2dyRVLlFnhjr9flZ1277ptCZFPx9SwOnuFx0DEbfJzB
         DUN7A9aR+tnQ5gZzpomjBpFcTah3xpaTA/UiuFUmZBh3RToLWYkbDgutgUIyGLCE2OBc
         Kfmo6tBuEYrufO6rkvv3mZrdiV2GEaJrWIykkDVAYR5Ry4PtxdP40wvNfSUyKZQg2Xm8
         QnAqD1xASpGrhKxd+X9ULQ0JgsUNf9IW+sU3llqAD5SUS+GfyKGkjCNkVDkJwAMM/mCX
         /SeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691564371; x=1692169171;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pclgRUr50wRfATBploauErLn3ue8ixjFigg7gvZ224U=;
        b=X/FrpcIJaq/U35wiRshkRfqGYpMGWvnJe88VrniTnxoyAHusRt9uEKxY8Fk/jHbPC5
         sq8Lcmawugk6hs8I8h8ynfxpecXCFqmQewLg9o2bV5uf/pQ7pd/d1vR+gXUbYhz+Oluw
         InS9LjCOkVyvmjZXaDV5i7U2/Hi/i4sfgEcL0tU8SvlJsG/rLJxVqTwkanXe3kaWsQyG
         52CRSjbKZ+P/jANspCrTFQ7i6Q0JWpSMQv4j9+34QyUa+lxG3sNvYNCl0phL2Er8RJj3
         z2gzk2YpGa62E22oIgwNMZYCeEkFmnY/j1cBeDtFOXHrpMw5SuyHLZa+6Z2MQm/+9vxJ
         yD9A==
X-Gm-Message-State: AOJu0Yw+WLya4/J+ymegxYwWKbKI/Aiv0/dpDuVUACTZWNCmYHzrqdLt
        +xrot/Tb1DaIy2zWNqRpvZivZQ==
X-Google-Smtp-Source: AGHT+IEejW5zaT9030AiSgkdaUeZ6uylLMMkycmFoe1jR8VqChQw1A1b8nHcYE2IauP9F+4gmNd6cg==
X-Received: by 2002:a05:600c:2311:b0:3fe:f99:1ba with SMTP id 17-20020a05600c231100b003fe0f9901bamr1519354wmo.2.1691564370877;
        Tue, 08 Aug 2023 23:59:30 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c245:8b53:af5b:96f3])
        by smtp.gmail.com with ESMTPSA id h6-20020adffd46000000b00317878d83c6sm15708212wrs.72.2023.08.08.23.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 23:59:30 -0700 (PDT)
References: <20230808194811.113087-1-alexander.stein@mailbox.org>
 <f4c57e4b-674b-f870-b215-8b2f80a7c9eb@linaro.org>
User-agent: mu4e 1.8.13; emacs 28.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alexander Stein <alexander.stein@mailbox.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: clock: meson: Convert axg-audio-clkc
 to YAML format
Date:   Wed, 09 Aug 2023 08:58:23 +0200
In-reply-to: <f4c57e4b-674b-f870-b215-8b2f80a7c9eb@linaro.org>
Message-ID: <1j5y5obt0u.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Wed 09 Aug 2023 at 08:38, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 08/08/2023 21:48, Alexander Stein wrote:
>> Convert Amlogic AXG Audio Clock Controller binding to yaml.
>> 
>> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
>> ---
>> As it is the same directory I picked the same maintainers as 
>> Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc.yaml.
>> 
>> I'm not 100% sure about the optional clocks constraints. As mentioned in
>> the .txt version only pclk is mandatory, others are optional.
>> 
>>  .../bindings/clock/amlogic,axg-audio-clkc.txt |  59 --------
>>  .../clock/amlogic,axg-audio-clkc.yaml         | 136 ++++++++++++++++++
>>  2 files changed, 136 insertions(+), 59 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
>>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
>> deleted file mode 100644
>> index 3a8948c04bc9..000000000000
>> --- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
>> +++ /dev/null
>> @@ -1,59 +0,0 @@
>> -* Amlogic AXG Audio Clock Controllers
>> -
>> -The Amlogic AXG audio clock controller generates and supplies clock to the
>> -other elements of the audio subsystem, such as fifos, i2s, spdif and pdm
>> -devices.
>> -
>> -Required Properties:
>> -
>> -- compatible	: should be "amlogic,axg-audio-clkc" for the A113X and A113D,
>> -		  "amlogic,g12a-audio-clkc" for G12A,
>> -		  "amlogic,sm1-audio-clkc" for S905X3.
>> -- reg		: physical base address of the clock controller and length of
>> -		  memory mapped region.
>> -- clocks	: a list of phandle + clock-specifier pairs for the clocks listed
>> -		  in clock-names.
>> -- clock-names	: must contain the following:
>> -		  * "pclk" - Main peripheral bus clock
>> -		  may contain the following:
>> -		  * "mst_in[0-7]" - 8 input plls to generate clock signals
>> -		  * "slv_sclk[0-9]" - 10 slave bit clocks provided by external
>> -				      components.
>> -		  * "slv_lrclk[0-9]" - 10 slave sample clocks provided by external
>> -				       components.
>> -- resets	: phandle of the internal reset line
>> -- #clock-cells	: should be 1.
>> -- #reset-cells  : should be 1 on the g12a (and following) soc family
>> -
>> -Each clock is assigned an identifier and client nodes can use this identifier
>> -to specify the clock which they consume. All available clocks are defined as
>> -preprocessor macros in the dt-bindings/clock/axg-audio-clkc.h header and can be
>> -used in device tree sources.
>> -
>> -Example:
>> -
>> -clkc_audio: clock-controller@0 {
>> -	compatible = "amlogic,axg-audio-clkc";
>> -	reg = <0x0 0x0 0x0 0xb4>;
>> -	#clock-cells = <1>;
>> -
>> -	clocks = <&clkc CLKID_AUDIO>,
>> -		 <&clkc CLKID_MPLL0>,
>> -		 <&clkc CLKID_MPLL1>,
>> -		 <&clkc CLKID_MPLL2>,
>> -		 <&clkc CLKID_MPLL3>,
>> -		 <&clkc CLKID_HIFI_PLL>,
>> -		 <&clkc CLKID_FCLK_DIV3>,
>> -		 <&clkc CLKID_FCLK_DIV4>,
>> -		 <&clkc CLKID_GP0_PLL>;
>> -	clock-names = "pclk",
>> -		      "mst_in0",
>> -		      "mst_in1",
>> -		      "mst_in2",
>> -		      "mst_in3",
>> -		      "mst_in4",
>> -		      "mst_in5",
>> -		      "mst_in6",
>> -		      "mst_in7";
>> -	resets = <&reset RESET_AUDIO>;
>> -};
>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
>> new file mode 100644
>> index 000000000000..629fa3a81cf7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
>> @@ -0,0 +1,136 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic AXG Audio Clock Controller
>> +
>> +maintainers:
>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>> +  - Jerome Brunet <jbrunet@baylibre.com>
>> +  - Jian Hu <jian.hu@jian.hu.com>
>> +  - Dmitry Rokosov <ddrokosov@sberdevices.ru>
>> +
>> +description:
>> +  The Amlogic AXG audio clock controller generates and supplies clock to the
>> +  other elements of the audio subsystem, such as fifos, i2s, spdif and pdm
>> +  devices.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - amlogic,axg-audio-clkc
>> +      - amlogic,g12a-audio-clkc
>> +      - amlogic,sm1-audio-clkc
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  '#reset-cells':
>> +    const: 1
>> +
>> +  reg:
>> +    maxItems: 1
>
> reg is usually the second property.
>
>> +
>> +  clocks:
>> +    minItems: 1
>> +    maxItems: 11
>> +
>> +  clock-names:
>> +    oneOf:
>> +      - const: pclk
>> +      - items:
>> +          - const: pclk
>> +          - const: mst_in0
>> +          - const: mst_in1
>> +          - const: mst_in2
>> +          - const: mst_in3
>> +          - const: mst_in4
>> +          - const: mst_in5
>> +          - const: mst_in6
>> +          - const: mst_in7
>> +      - items:
>> +          - const: pclk
>> +          - const: slv_sclk0
>> +          - const: slv_sclk1
>> +          - const: slv_sclk2
>> +          - const: slv_sclk3
>> +          - const: slv_sclk4
>> +          - const: slv_sclk5
>> +          - const: slv_sclk6
>> +          - const: slv_sclk7
>> +          - const: slv_sclk8
>> +          - const: slv_sclk9
>> +      - items:
>> +          - const: pclk
>> +          - const: slv_lrclk0
>> +          - const: slv_lrclk1
>> +          - const: slv_lrclk2
>> +          - const: slv_lrclk3
>> +          - const: slv_lrclk4
>> +          - const: slv_lrclk5
>> +          - const: slv_lrclk6
>> +          - const: slv_lrclk7
>> +          - const: slv_lrclk8
>> +          - const: slv_lrclk9
>> +
>> +  resets:
>> +    description: internal reset line
>> +
>> +required:
>> +  - compatible
>> +  - '#clock-cells'
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - amlogic,g12a-audio-clkc
>> +              - amlogic,sm1-audio-clkc
>> +    then:
>> +      required:
>> +        - '#reset-cells'
>
> else:
>   properties:
>     '#reset-cells': false
> ???
>
>
> You need to constrain the clocks per variant. Probably names are also
> specific to each one, so the list of names can be moved here and you
> keep just min/maxItems in the top level property.
>

input clock names and constraints are the same for all 3 variants.

>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/axg-clkc.h>
>> +    #include <dt-bindings/reset/amlogic,meson-axg-reset.h>
>> +    apb {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        clkc_audio: clock-controller@0 {
>> +        compatible = "amlogic,axg-audio-clkc";
>
> Broken indentation.
>
>> +        reg = <0x0 0x0 0x0 0xb4>;
>> +        #clock-cells = <1>;
>> +
>> +        clocks = <&clkc CLKID_AUDIO>,
>> +            <&clkc CLKID_MPLL0>,
>> +            <&clkc CLKID_MPLL1>,
>> +            <&clkc CLKID_MPLL2>,
>> +            <&clkc CLKID_MPLL3>,
>> +            <&clkc CLKID_HIFI_PLL>,
>> +            <&clkc CLKID_FCLK_DIV3>,
>> +            <&clkc CLKID_FCLK_DIV4>,
>> +            <&clkc CLKID_GP0_PLL>;
>> +        clock-names = "pclk",
>> +            "mst_in0",
>> +            "mst_in1",
>> +            "mst_in2",
>> +            "mst_in3",
>> +            "mst_in4",
>> +            "mst_in5",
>> +            "mst_in6",
>> +            "mst_in7";
>> +        resets = <&reset RESET_AUDIO>;
>> +      };
>
> And indentation here is even less matching.
>> +    };
>
> Best regards,
> Krzysztof

