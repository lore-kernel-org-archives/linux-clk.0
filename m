Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C630C67871
	for <linux-clk@archiver.kernel.org>; Mon, 16 Jan 2023 08:29:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232241AbjAPI3W (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Jan 2023 03:29:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232083AbjAPI3U (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Jan 2023 03:29:20 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6996410AA6
        for <linux-clk@vger.kernel.org>; Mon, 16 Jan 2023 00:29:19 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id kt14so7368014ejc.3
        for <linux-clk@vger.kernel.org>; Mon, 16 Jan 2023 00:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=suk68sDbaZb4bVcYI2D243OtUKgl7bbyrnOid/OtO7g=;
        b=d6ePkrGCuxnqgjYDB398PrD2rGklUquvWHdbILHgA69czoke7FbnaFz4phx1aPJxGG
         QBahJKpVUp8zbdLsNognWBlI4+4hGS4JnRXU6S5ybZroIJzyLTCtDTbCO4ixFw9jtIIa
         LyXfbOBJtURhcqKpCoplVm6XvtGgFLgg1jvh6D3e+2W4nf5/wMZIq9Z4kNqo9ydZG/xa
         wc/2vivaP9XQJxhQQmSMAyDFO0wBRtj4xSLbDLtvMqTxcUzI0Vvh3EMuNezc/3q6gjoV
         kIsLove8weacu4GU3R3o6kbi74dGKLskgu3M84rJG23k+KjMVwDe2BGRgXSjcJp16vQl
         N2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=suk68sDbaZb4bVcYI2D243OtUKgl7bbyrnOid/OtO7g=;
        b=rI/0ZRYF0oB/tNfiIofKQuKWPLwSR8rcLampuVSSrHJ+x/Gw3adSLO9WzvZ3lxy23L
         Apj0IUAWS9tDhCbUh/su96jM0Lnw1nefylI1b7P+t4FmwtAwzI2Eq9R9VLFW4ZXvrbk1
         lRonpvb6UCsdCjUYvQNBo/hMRthm1XAyxHV7znv5NSJgnt2F9Xyi5xfqmVrfjHIH9Swo
         0MPLYj//nprz98fP7Q6UXeh/J58O9tJqCoeji6xzljQa4hqQ865A/zxQwUyAxV70juYZ
         7oh3S74IfAUGoKPcr+Wjgy3zmryYsC1aUMJJawgUpbwIn+S2zFvo0u79S+HZk3SpfmSM
         7EKQ==
X-Gm-Message-State: AFqh2koGmxm84k+kZ/pb4Y/Znmb+qySE51CaA5Hzwfb03YwDeF8yLtl8
        6+n0hLxnJ38NA/kOpwgx6VKUXw==
X-Google-Smtp-Source: AMrXdXsEIfj5nNcJS/YRvzjJ3iiJdejLhMQs6tZNdN+3EU6P0ICwVTjDW1JU1oTSqHI3wscQ62o/HQ==
X-Received: by 2002:a17:906:dfe9:b0:84d:378b:8820 with SMTP id lc9-20020a170906dfe900b0084d378b8820mr12649387ejc.18.1673857757948;
        Mon, 16 Jan 2023 00:29:17 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id sh39-20020a1709076ea700b0084c62b9eb57sm11684541ejc.144.2023.01.16.00.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 00:29:17 -0800 (PST)
Message-ID: <02b6b3a6-e2ad-8cbc-fa15-fbd2db6ada64@linaro.org>
Date:   Mon, 16 Jan 2023 09:29:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V6 1/3] dt-bindings: clock: document Amlogic S4 SoC PLL &
 peripheral clock controller
Content-Language: en-US
To:     Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     "kelvin . zhang" <Kelvin.Zhang@amlogic.com>,
        "qi . duan" <qi.duan@amlogic.com>
References: <20230116074214.2326-1-yu.tu@amlogic.com>
 <20230116074214.2326-2-yu.tu@amlogic.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230116074214.2326-2-yu.tu@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/01/2023 08:42, Yu Tu wrote:
> Add the S4 PLL & peripheral clock controller dt-bindings in the s4 SoC
> family.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>  .../clock/amlogic,s4-peripherals-clkc.yaml    | 104 ++++++++++++++
>  .../bindings/clock/amlogic,s4-pll-clkc.yaml   |  50 +++++++
>  MAINTAINERS                                   |   1 +
>  .../clock/amlogic,s4-peripherals-clkc.h       | 131 ++++++++++++++++++
>  .../dt-bindings/clock/amlogic,s4-pll-clkc.h   |  30 ++++
>  5 files changed, 316 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
>  create mode 100644 include/dt-bindings/clock/amlogic,s4-pll-clkc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
> new file mode 100644
> index 000000000000..2deeff497754
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/amlogic,s4-peripherals-clkc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson S serials Peripherals Clock Controller
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +  - Yu Tu <yu.tu@amlogic.com>
> +
> +properties:
> +  compatible:
> +    const: amlogic,s4-peripherals-clkc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: input fixed pll div2
> +      - description: input fixed pll div2p5
> +      - description: input fixed pll div3
> +      - description: input fixed pll div4
> +      - description: input fixed pll div5
> +      - description: input fixed pll div7
> +      - description: input hifi pll
> +      - description: input gp0 pll
> +      - description: input mpll0
> +      - description: input mpll1
> +      - description: input mpll2
> +      - description: input mpll3
> +      - description: input hdmi pll
> +      - description: input oscillator (usually at 24MHz)
> +      - description: input external 32kHz reference (optional)
> +
> +  clock-names:
> +    items:
> +      - const: fclk_div2
> +      - const: fclk_div2p5
> +      - const: fclk_div3
> +      - const: fclk_div4
> +      - const: fclk_div5
> +      - const: fclk_div7
> +      - const: hifi_pll
> +      - const: gp0_pll
> +      - const: mpll0
> +      - const: mpll1
> +      - const: mpll2
> +      - const: mpll3
> +      - const: hdmi_pll
> +      - const: xtal
> +      - const: ext_32k
> +
> +  "#clock-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - "#clock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
> +
> +    /* 32KHz reference crystal */
> +    ext_32k: ref32k {
> +        compatible = "fixed-clock";
> +        #clock-cells = <0>;
> +        clock-frequency = <32000>;
> +    };

This wasn't here before. Drop it. It is trivial and it is not needed to
illustrate your device bindings. All clock bindings use it...

> +
> +    clkc_periphs: clock-controller@fe000000 {
> +      compatible = "amlogic,s4-peripherals-clkc";
> +      reg = <0xfe000000 0x49c>;
> +      clocks = <&clkc_pll 3>,
> +              <&clkc_pll 13>,
> +              <&clkc_pll 5>,
> +              <&clkc_pll 7>,
> +              <&clkc_pll 9>,
> +              <&clkc_pll 11>,
> +              <&clkc_pll 17>,
> +              <&clkc_pll 15>,
> +              <&clkc_pll 25>,
> +              <&clkc_pll 27>,
> +              <&clkc_pll 29>,
> +              <&clkc_pll 31>,
> +              <&clkc_pll 20>,
> +              <&xtal>,
> +              <&ext_32k>;
> +      clock-names = "fclk_div2", "fclk_div2p5", "fclk_div3", "fclk_div4",
> +                    "fclk_div5", "fclk_div7", "hifi_pll", "gp0_pll",
> +                    "mpll0", "mpll1", "mpll2", "mpll3", "hdmi_pll", "xtal",
> +                    "ext_32k";
> +      #clock-cells = <1>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
> new file mode 100644
> index 000000000000..aeda4861cebe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/amlogic,s4-pll-clkc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson S serials PLL Clock Controller
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +  - Yu Tu <yu.tu@amlogic.com>
> +
> +properties:
> +  compatible:
> +    const: amlogic,s4-pll-clkc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: xtal
> +
> +  "#clock-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - "#clock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clkc_pll: clock-controller@fe008000 {
> +      compatible = "amlogic,s4-pll-clkc";
> +      reg = <0xfe008000 0x1e8>;
> +      clocks = <&xtal>;
> +      clock-names = "xtal";
> +      #clock-cells = <1>;
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f61eb221415b..26c82beeffda 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1897,6 +1897,7 @@ L:	linux-amlogic@lists.infradead.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/clock/amlogic*
>  F:	drivers/clk/meson/
> +F:	include/dt-bindings/clock/amlogic*
>  F:	include/dt-bindings/clock/gxbb*
>  F:	include/dt-bindings/clock/meson*
>  
> diff --git a/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
> new file mode 100644
> index 000000000000..bbec5094d5c3
> --- /dev/null
> +++ b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
> @@ -0,0 +1,131 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */

Unusual license... are you sure to license the bindings under GPLv4 or
GPLv5? Fine by me.

Best regards,
Krzysztof

