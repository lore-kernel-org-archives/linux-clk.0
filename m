Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A4D1C38142
	for <linux-clk@archiver.kernel.org>; Mon, 23 Jan 2023 08:11:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231636AbjAWILO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Jan 2023 03:11:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbjAWILO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Jan 2023 03:11:14 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDC3113D7F
        for <linux-clk@vger.kernel.org>; Mon, 23 Jan 2023 00:11:12 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id q8so8294597wmo.5
        for <linux-clk@vger.kernel.org>; Mon, 23 Jan 2023 00:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e7s9saYfKQc1Lv+pPmApBZHnSW8je2cMqPGzEWMmsU8=;
        b=U36nOcrJP5Lav7NaP7ggUfWX03/gtcJ4qyVtPgbUHc7ogn/HdK9JGEZqNKSN1R2S0B
         LHPIGKa+ZpahcQj0V8tqixMwn2w7byk5pMvpFvVu8qFw2IJX3Ttnl4YKEVc3ErWmLJ8o
         TJxNhTl7BMXqz8ugDh+FCqKItYZuU2B0o1yaa1uk2vxZ3JQRT7E/EP/KbMU2GKrAQMFm
         HRw/IGL9HeYf/aNOeKYV9maeVq+BO9UkqDIC6oPoFJr+5dPk8gg48LgQWlNzN2iVwzF7
         asjU1SR+IFhVawGBPm1/kzh+DICQba71vpE5y12HDDmklyZr5HChWhtEmWB5nTxP8idp
         iuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e7s9saYfKQc1Lv+pPmApBZHnSW8je2cMqPGzEWMmsU8=;
        b=cT9rr/00uS1F95yjFs3yQNF85u0n//we9Tt6Z7510IFkqnKpCU1+GbuL8nc8UrLQA5
         IIWXe4GdZUjaYSvaVozTvDv6tcXqT4wM1kcj9cJxnt5MSfeFMC3q78WKzVXbn4UW9wGD
         z7u47kpNWgIBS7MHiXEzwOiJauADVhO/FAOhQDiGmI/vaym6BCTO+MTtYwb3rkE8kMEy
         1WWUgAXxBPtX2PKVCNp+Tm78a2zl3ihtYQ4fv4Rq3yJZ+lIze+6wjJdDGYWAbzlDAWRS
         1Mo/o47lesXl8/a3fpa3O3Q9ax7DZh1mU8+hlHWeNxd/BzE+cWQ30P8BGMeaAZL/oYYA
         x3aw==
X-Gm-Message-State: AFqh2kpU1B39h7ApunNI2/0X4l8+i9XgptMAjLLzEBLAoZDQ1cQBPUPH
        6CGJyJiPCQgoJef3jBlGhjgQDg==
X-Google-Smtp-Source: AMrXdXsrI6xUDZcUDl7hloTWyhkrOc4Xd9fNlHdIaE1cAD7LpvXhPrVzG5UikQ15bShCvE55WGPofQ==
X-Received: by 2002:a05:600c:1da6:b0:3da:107e:a1e6 with SMTP id p38-20020a05600c1da600b003da107ea1e6mr23059216wms.17.1674461471409;
        Mon, 23 Jan 2023 00:11:11 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t15-20020a05600c198f00b003db32ccf4bfsm9969922wmq.41.2023.01.23.00.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 00:11:10 -0800 (PST)
Message-ID: <0c19efb4-3bca-f500-ca24-14b9d24369ef@linaro.org>
Date:   Mon, 23 Jan 2023 09:11:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 07/15] dt-bindings: clock: Add Ambarella clock bindings
Content-Language: en-US
To:     Li Chen <lchen@ambarella.com>, Li Chen <me@linux.beauty>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     "moderated list:ARM/Ambarella SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20230123073305.149940-1-lchen@ambarella.com>
 <20230123073305.149940-8-lchen@ambarella.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230123073305.149940-8-lchen@ambarella.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/01/2023 08:32, Li Chen wrote:
> This patch introduce clock bindings for Ambarella.
> 
> Signed-off-by: Li Chen <lchen@ambarella.com>
> Change-Id: I29018a23ed3a5b79a1103e859a5c7ed7bb83a261

All the same problems plus new:

Subject: drop second/last, redundant "bindings". The "dt-bindings"
prefix is already stating that these are bindings.

> ---
>  .../clock/ambarella,composite-clock.yaml      | 52 ++++++++++++++++
>  .../bindings/clock/ambarella,pll-clock.yaml   | 59 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +
>  3 files changed, 113 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/ambarella,composite-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/ambarella,pll-clock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/ambarella,composite-clock.yaml b/Documentation/devicetree/bindings/clock/ambarella,composite-clock.yaml
> new file mode 100644
> index 000000000000..fac1cb9379c4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ambarella,composite-clock.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/ambarella,composite-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ambarella Composite Clock
> +
> +maintainers:
> +  - Li Chen <lchen@ambarella.com>
> +

Missing description.

> +properties:
> +  compatible:
> +    items:

Drop items.

> +      - const: ambarella,composite-clock

Missing SoC specific compatible. This is anyway not really correct
compatible...

> +
> +  clocks: true

No, needs constraints.

> +  assigned-clocks: true
> +  assigned-clock-parents: true
> +  assigned-clock-rates: true

Drop these three.

> +  clock-output-names: true

Missing constraints.

> +  amb,mux-regmap: true

NAK.

It's enough. The patches have very, very poor quality.

Missing description, missing type/$ref, wrong prefix.

> +  amb,div-regmap: true
> +  amb,div-width: true
> +  amb,div-shift: true

These two are arguments to phandle.

> +
> +  '#clock-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'
> +
> +additionalProperties: false

So why you decided to add it here and not in other places?
> +
> +examples:
> +  - |
> +      gclk_uart0: gclk-uart0 {

Wrong indentation.

> +        #clock-cells = <0>;
> +        compatible = "ambarella,composite-clock";
> +        clocks = <&osc>, <&gclk_core>, <&pll_out_enet>, <&pll_out_sd>;
> +        clock-output-names = "gclk_uart0";
> +        assigned-clocks = <&gclk_uart0>;
> +        assigned-clock-parents = <&osc>;
> +        assigned-clock-rates = <24000000>;
> +        amb,mux-regmap = <&rct_syscon 0x1c8>;
> +        amb,div-regmap = <&rct_syscon 0x038>;
> +        amb,div-width = <24>;
> +        amb,div-shift = <0>;
> +      };
> diff --git a/Documentation/devicetree/bindings/clock/ambarella,pll-clock.yaml b/Documentation/devicetree/bindings/clock/ambarella,pll-clock.yaml
> new file mode 100644
> index 000000000000..65c1feb60041
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ambarella,pll-clock.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/ambarella,pll-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ambarella PLL Clock
> +
> +maintainers:
> +  - Li Chen <lchen@ambarella.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ambarella,pll-clock
> +      - ambarella,clkpll-v0
> +
> +if:

No, this does not work like that. It sits under "allOf", located after
"required:".

> +  properties:
> +    compatible:
> +      const: ambarella,pll-clock
> +
> +then:
> +  properties:
> +    clocks:
> +      maxItems: 1
> +
> +    clock-output-names: true
> +    amb,clk-regmap: true
> +    amb,frac-mode: true
> +    assigned-clocks: true
> +    assigned-clock-rates: true

Same problems.

> +    gclk_axi: gclk-axi {
> +        #clock-cells = <0>;
> +        compatible = "fixed-factor-clock";

What is this example about? Not related at all. Provide real example.



Best regards,
Krzysztof

