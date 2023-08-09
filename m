Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC285C04A94
	for <linux-clk@archiver.kernel.org>; Wed,  9 Aug 2023 06:38:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230493AbjHIGin (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Aug 2023 02:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230489AbjHIGim (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Aug 2023 02:38:42 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 534771BFB
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 23:38:41 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99cce6f7de2so487995266b.3
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 23:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691563120; x=1692167920;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nl6Na6E5PIpt6WGlBq3IrisrQ6j0D+p9H3R/z5/fPGo=;
        b=TKwI5O9Z6OfsF2vu2E4zc8LJJNTzNU7oBp9N3IUhuz2sbm2IrwjIJjZu28J51G+e5t
         60aErxb7Y43UBWOcLGWWsKJu0NtsrWGGtEyG94r7CrOWZHQw1htmnth6teBkkYuhKoFf
         koscqW91TNX6XyUOU1dTkq4E+rZVNrWAAf/oQqSns70xOILyuZDwK3JlcIH8CxGyUgtx
         FXeFzQ5IQC1aJm7lEIi34Y67xzZBZygNbX8vp9h6nfkPh6pvr0N5NEgDosb1tbQYrgFF
         7asZtsB8Bpw/ZzApujF0wF6ri1fm4OihjjtB6g3tfu+Qye1r/rMpqdTEAcU+uQTeUSkK
         xbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691563120; x=1692167920;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nl6Na6E5PIpt6WGlBq3IrisrQ6j0D+p9H3R/z5/fPGo=;
        b=C0uyDWhfIuBD90+x3dzhMO0Y1IVm5CIje6tllZdeBF6Paq5fsh9rwzCwQ7MF8PsyKE
         HXbWbd4SwWLUEYqQoiqYeGhpjmMqMr1ySHs4O9XG59VVSoCdqqKGLnr67tfV9jFM877y
         ozrZyiLLoK5QNPnHTOqMMLDqOahv32focgSSZhWkoMLiXaiCo7cYJXFjV5aANNf09kjN
         NuXvQclY3fqTeJk1pcTO7hb/jeXHZ1FeHP97+5/FXOdf9+qZI66swiRa8vEFXLGSNlD1
         4jN3np0k2OGXurkewURFBDg5B+i+tY+sA0V9uoiXgTLAp6MiL1W8ZZ3sd7V7s9B7f2KE
         ZHag==
X-Gm-Message-State: AOJu0Ywj8dxNr23Safqdsjo11Z9xjRfzoLwhyP5Ja0sN8Ev3SBJzq44M
        qX6Rs4BOx6pQCLQkQaLLJg5Axg==
X-Google-Smtp-Source: AGHT+IGLwvh/s1qs7w2zNAQJk1p81uAzjlPSK3hoA7tJn/N7t80zoqjnZrSl9TbTA1aH+pWM8VM8pw==
X-Received: by 2002:a17:906:8a6e:b0:994:4095:3abf with SMTP id hy14-20020a1709068a6e00b0099440953abfmr1308823ejc.14.1691563119814;
        Tue, 08 Aug 2023 23:38:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id a1-20020a1709063a4100b0099275c59bc9sm7588487ejf.33.2023.08.08.23.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 23:38:39 -0700 (PDT)
Message-ID: <f4c57e4b-674b-f870-b215-8b2f80a7c9eb@linaro.org>
Date:   Wed, 9 Aug 2023 08:38:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/1] dt-bindings: clock: meson: Convert axg-audio-clkc to
 YAML format
Content-Language: en-US
To:     Alexander Stein <alexander.stein@mailbox.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230808194811.113087-1-alexander.stein@mailbox.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230808194811.113087-1-alexander.stein@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/08/2023 21:48, Alexander Stein wrote:
> Convert Amlogic AXG Audio Clock Controller binding to yaml.
> 
> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> ---
> As it is the same directory I picked the same maintainers as 
> Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc.yaml.
> 
> I'm not 100% sure about the optional clocks constraints. As mentioned in
> the .txt version only pclk is mandatory, others are optional.
> 
>  .../bindings/clock/amlogic,axg-audio-clkc.txt |  59 --------
>  .../clock/amlogic,axg-audio-clkc.yaml         | 136 ++++++++++++++++++
>  2 files changed, 136 insertions(+), 59 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
> deleted file mode 100644
> index 3a8948c04bc9..000000000000
> --- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -* Amlogic AXG Audio Clock Controllers
> -
> -The Amlogic AXG audio clock controller generates and supplies clock to the
> -other elements of the audio subsystem, such as fifos, i2s, spdif and pdm
> -devices.
> -
> -Required Properties:
> -
> -- compatible	: should be "amlogic,axg-audio-clkc" for the A113X and A113D,
> -		  "amlogic,g12a-audio-clkc" for G12A,
> -		  "amlogic,sm1-audio-clkc" for S905X3.
> -- reg		: physical base address of the clock controller and length of
> -		  memory mapped region.
> -- clocks	: a list of phandle + clock-specifier pairs for the clocks listed
> -		  in clock-names.
> -- clock-names	: must contain the following:
> -		  * "pclk" - Main peripheral bus clock
> -		  may contain the following:
> -		  * "mst_in[0-7]" - 8 input plls to generate clock signals
> -		  * "slv_sclk[0-9]" - 10 slave bit clocks provided by external
> -				      components.
> -		  * "slv_lrclk[0-9]" - 10 slave sample clocks provided by external
> -				       components.
> -- resets	: phandle of the internal reset line
> -- #clock-cells	: should be 1.
> -- #reset-cells  : should be 1 on the g12a (and following) soc family
> -
> -Each clock is assigned an identifier and client nodes can use this identifier
> -to specify the clock which they consume. All available clocks are defined as
> -preprocessor macros in the dt-bindings/clock/axg-audio-clkc.h header and can be
> -used in device tree sources.
> -
> -Example:
> -
> -clkc_audio: clock-controller@0 {
> -	compatible = "amlogic,axg-audio-clkc";
> -	reg = <0x0 0x0 0x0 0xb4>;
> -	#clock-cells = <1>;
> -
> -	clocks = <&clkc CLKID_AUDIO>,
> -		 <&clkc CLKID_MPLL0>,
> -		 <&clkc CLKID_MPLL1>,
> -		 <&clkc CLKID_MPLL2>,
> -		 <&clkc CLKID_MPLL3>,
> -		 <&clkc CLKID_HIFI_PLL>,
> -		 <&clkc CLKID_FCLK_DIV3>,
> -		 <&clkc CLKID_FCLK_DIV4>,
> -		 <&clkc CLKID_GP0_PLL>;
> -	clock-names = "pclk",
> -		      "mst_in0",
> -		      "mst_in1",
> -		      "mst_in2",
> -		      "mst_in3",
> -		      "mst_in4",
> -		      "mst_in5",
> -		      "mst_in6",
> -		      "mst_in7";
> -	resets = <&reset RESET_AUDIO>;
> -};
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> new file mode 100644
> index 000000000000..629fa3a81cf7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> @@ -0,0 +1,136 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic AXG Audio Clock Controller
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +  - Jian Hu <jian.hu@jian.hu.com>
> +  - Dmitry Rokosov <ddrokosov@sberdevices.ru>
> +
> +description:
> +  The Amlogic AXG audio clock controller generates and supplies clock to the
> +  other elements of the audio subsystem, such as fifos, i2s, spdif and pdm
> +  devices.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,axg-audio-clkc
> +      - amlogic,g12a-audio-clkc
> +      - amlogic,sm1-audio-clkc
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1

reg is usually the second property.

> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 11
> +
> +  clock-names:
> +    oneOf:
> +      - const: pclk
> +      - items:
> +          - const: pclk
> +          - const: mst_in0
> +          - const: mst_in1
> +          - const: mst_in2
> +          - const: mst_in3
> +          - const: mst_in4
> +          - const: mst_in5
> +          - const: mst_in6
> +          - const: mst_in7
> +      - items:
> +          - const: pclk
> +          - const: slv_sclk0
> +          - const: slv_sclk1
> +          - const: slv_sclk2
> +          - const: slv_sclk3
> +          - const: slv_sclk4
> +          - const: slv_sclk5
> +          - const: slv_sclk6
> +          - const: slv_sclk7
> +          - const: slv_sclk8
> +          - const: slv_sclk9
> +      - items:
> +          - const: pclk
> +          - const: slv_lrclk0
> +          - const: slv_lrclk1
> +          - const: slv_lrclk2
> +          - const: slv_lrclk3
> +          - const: slv_lrclk4
> +          - const: slv_lrclk5
> +          - const: slv_lrclk6
> +          - const: slv_lrclk7
> +          - const: slv_lrclk8
> +          - const: slv_lrclk9
> +
> +  resets:
> +    description: internal reset line
> +
> +required:
> +  - compatible
> +  - '#clock-cells'
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,g12a-audio-clkc
> +              - amlogic,sm1-audio-clkc
> +    then:
> +      required:
> +        - '#reset-cells'

else:
  properties:
    '#reset-cells': false
???


You need to constrain the clocks per variant. Probably names are also
specific to each one, so the list of names can be moved here and you
keep just min/maxItems in the top level property.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/axg-clkc.h>
> +    #include <dt-bindings/reset/amlogic,meson-axg-reset.h>
> +    apb {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        clkc_audio: clock-controller@0 {
> +        compatible = "amlogic,axg-audio-clkc";

Broken indentation.

> +        reg = <0x0 0x0 0x0 0xb4>;
> +        #clock-cells = <1>;
> +
> +        clocks = <&clkc CLKID_AUDIO>,
> +            <&clkc CLKID_MPLL0>,
> +            <&clkc CLKID_MPLL1>,
> +            <&clkc CLKID_MPLL2>,
> +            <&clkc CLKID_MPLL3>,
> +            <&clkc CLKID_HIFI_PLL>,
> +            <&clkc CLKID_FCLK_DIV3>,
> +            <&clkc CLKID_FCLK_DIV4>,
> +            <&clkc CLKID_GP0_PLL>;
> +        clock-names = "pclk",
> +            "mst_in0",
> +            "mst_in1",
> +            "mst_in2",
> +            "mst_in3",
> +            "mst_in4",
> +            "mst_in5",
> +            "mst_in6",
> +            "mst_in7";
> +        resets = <&reset RESET_AUDIO>;
> +      };

And indentation here is even less matching.
> +    };

Best regards,
Krzysztof

