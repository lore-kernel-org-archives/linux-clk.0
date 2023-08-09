Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17DD3EB64DD
	for <linux-clk@archiver.kernel.org>; Wed,  9 Aug 2023 06:43:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231218AbjHIGnH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Aug 2023 02:43:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231205AbjHIGnG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Aug 2023 02:43:06 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFCF01986
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 23:43:04 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3178dd81ac4so5304082f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 23:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691563383; x=1692168183;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=kntP8Y9ceRocWIC/OOeyMK71VIkTrXJ3h5YSVFPUDgI=;
        b=UUuxm641QpLIqcCMKTz1Hhe8xa1cPg319FAwcAqmk9L7jnx6+yB3rE3MUeeUxYeum4
         4J5jKWAiubpyvNvm0MCZwzhZFZl8Ntf4AipleasPre+WF5jfzcAuFhood316C4kqCu0P
         tlrIfiOi4mbZUSporDpm+bRLFXNVKbgYl9h+7w961BTT5RgNOs7ddWdvIpj2/FVr4DgM
         iN/62YbkRBZNhkQ9c7TDvlwvhEZvGi5PtTFaazrdcGeMPMJW1/iKUo3QeDEo8cvO7QMJ
         KNWGsBGDMAUcEHgpMvShBiTWNzkDLIxvaPrVPUHI0eihl/Kc9l83Z3EBUvAgSpDx6sLs
         Hafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691563383; x=1692168183;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kntP8Y9ceRocWIC/OOeyMK71VIkTrXJ3h5YSVFPUDgI=;
        b=jkWsvMdLyLCmkyUhH0Y6x/UXekSifBeoZxOwCg7osKbH+oPb3WqTdNQ6fiDQGNAxGb
         yzD1GA5Ne/RwJzX6l3P2g/FJSZdul6sCO14e+mpRXTqz6ff9oyb5FYr9kIXlgOpiXLEB
         1F6YSQiJ+atm8xEYhRKx2LBPzjeMkhjBKiHpEoWm4uEGtVx/U9BOpsREAUDt9kTY3m7n
         BtS6rENNSK7yIZt55BMI1vqQ1cztfYmJKwdHPyM+JdbhCGAtVP12eejFfHQhxsEYNhPo
         k75zEby12UME+cUJp2TDfoJLrbElH9mJN/m0XTYLGaopJkS7CxYVzrkx85zaeEUrexBo
         nk1A==
X-Gm-Message-State: AOJu0YySOyNG47N7nIvQutq3ORf9QFcdJ4SXx6n+A3/tVqDqpWduFR0H
        0SDfgZHJmItOxztKQ1gZt3sltA==
X-Google-Smtp-Source: AGHT+IGT/vP5y+MBd+voB+7NqaVgqtJcETYF5AEG6aT8d/1P4nGajbm9pvnGqEei6sC8DXDyRAQw5Q==
X-Received: by 2002:a05:6000:10f:b0:317:57f0:fae with SMTP id o15-20020a056000010f00b0031757f00faemr1167141wrx.63.1691563383152;
        Tue, 08 Aug 2023 23:43:03 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c245:8b53:af5b:96f3])
        by smtp.gmail.com with ESMTPSA id b11-20020a05600010cb00b003180822cf8fsm385532wrx.1.2023.08.08.23.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 23:43:02 -0700 (PDT)
References: <20230808194811.113087-1-alexander.stein@mailbox.org>
User-agent: mu4e 1.8.13; emacs 28.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Alexander Stein <alexander.stein@mailbox.org>,
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
Date:   Wed, 09 Aug 2023 08:15:31 +0200
In-reply-to: <20230808194811.113087-1-alexander.stein@mailbox.org>
Message-ID: <1ja5v0bts9.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Tue 08 Aug 2023 at 21:48, Alexander Stein <alexander.stein@mailbox.org> wrote:

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

Jian and Dmitry do not maintain this.

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

IIUC the above, it means
 - pclk
 - OR pclk with all the master clocks
 - OR pclk with all the slave bit clocks
 - OR pclk with all the slave sample clocks.

Correct ?

If that is what it means, it is wrong.

* pclk is required
* the master and slave clocks are all optional and independent.

Any combination of master and slave clocks is valid from the controller
perspective. For ex: it is perfectly OK to have master 2 and 4, slave 5
and 8, and not the others.

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
> +    };

