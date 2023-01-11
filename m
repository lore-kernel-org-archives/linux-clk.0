Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923D2C46467
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 09:43:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232655AbjAKJnD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 04:43:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236259AbjAKJmi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 04:42:38 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 040141A380
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 01:39:05 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id p1-20020a05600c1d8100b003d8c9b191e0so12147064wms.4
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 01:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=73HQio63W0EpBnT1hsIGdzOvUrTEv6vdD18QgBbVEx8=;
        b=ee5ZQ3Qca93OxEnpffZ5ppRQb+HbqrTgeoi7mYumKz4+GzednjSsbQDPYSiAkTuoRQ
         8IZp7gbLAf858ivd0EvWTlVi1VJS6FDn8foAhfshIUY5AxAKDg4hABVcCbTZl0pw6iPN
         kcieNluNtsNh6KmiZHgwLbmtez/esntTp7YF6x8zueN1rG9Fk57SEIvWjuvBracm6PcM
         8pzKEObTv55fb4PgtKyJTPzjUA7lQW/rWcMrN4juHCp+f7u3Srrj/Po7tAVsQeSPrBi1
         JTunCPNE2Q8/im4AvLt3ztJlCyKIIwib5SKNNup1h0bahDGJWPceqeql0FqDZhZWsGdY
         Hhlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=73HQio63W0EpBnT1hsIGdzOvUrTEv6vdD18QgBbVEx8=;
        b=59E8uy8a0a+iKxcVauI19H6fif8t9nLyvgdimPhsH8OPjzK45nNGz/ZXZmJZc6JRro
         StGMdUwtTCCDJridVDJhCAhiibnDICRVbwBKURKzn2xR0po8CAxcJMAjsPMqdzPJ34Pz
         69Aky6k1c///E4PWYORDjk809TissYq+VZdMwdlA3PC8oE1+EmW2XYXP736glPhiyhOa
         kk8X6ejUoN/XqxruugObuV7ebVBn6KrA+zuWOc9WvxPUTyscVlVKWhiZb7WEAS3fysRl
         wiqwU/0wshRt9TX+YMSQIp4SiAduFxGjSL69rx4h/I3gDdjeVp9YZCA5ZSiAsotS4uMJ
         eKtA==
X-Gm-Message-State: AFqh2kqBL4d18bBCLMu6Skxys//++nFSBqHkv9k/cWSgFepz/cdX3iuj
        Lv9x5boXSfPxB7G10w/BLei8eg==
X-Google-Smtp-Source: AMrXdXtZTHLGuTgKzjj1x/+ePKVY5RJVD/q5DwAfISn78uCxLxi5rEbX1L1xXLK21urnFX6x21kmoQ==
X-Received: by 2002:a05:600c:5006:b0:3d2:3eda:dd1 with SMTP id n6-20020a05600c500600b003d23eda0dd1mr52275256wmr.17.1673429944253;
        Wed, 11 Jan 2023 01:39:04 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h10-20020a05600c2caa00b003cfd58409desm23274210wmc.13.2023.01.11.01.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 01:39:03 -0800 (PST)
Message-ID: <b63600f9-82ef-83dc-1680-1df125b5d971@linaro.org>
Date:   Wed, 11 Jan 2023 10:39:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/7] dt-bindings: pinctrl: qcom: Add ipq9574 pinctrl
 bindings
Content-Language: en-US
To:     devi priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <20230110121316.24892-1-quic_devipriy@quicinc.com>
 <20230110121316.24892-4-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230110121316.24892-4-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/01/2023 13:13, devi priya wrote:
> Add device tree binding documentation details for ipq9574
> pinctrl driver
> 

Subject: drop second/last, redundant "bindings". The "dt-bindings"
prefix is already stating that these are bindings.

> Co-developed-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: devi priya <quic_devipriy@quicinc.com>
> ---
>  .../bindings/pinctrl/qcom,ipq9574-tlmm.yaml   | 129 ++++++++++++++++++
>  1 file changed, 129 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq9574-tlmm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq9574-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq9574-tlmm.yaml
> new file mode 100644
> index 000000000000..f9cb457bc18d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq9574-tlmm.yaml
> @@ -0,0 +1,129 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,ipq9574-tlmm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. IPQ9574 TLMM block
> +
> +maintainers:
> +  - Anusha <quic_anusha@quicinc.com>
> +
> +description: |
> +  This binding describes the Top Level Mode Multiplexer block found in the
> +  IPQ9574 platform.

No, please rebase on recent changes. You started your work on some old
bindings so your binding likely includes all issues we fixed.

> +
> +allOf:
> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,ipq9574-tlmm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts: true
> +  interrupt-controller: true
> +  "#interrupt-cells": true
> +  gpio-controller: true
> +  gpio-reserved-ranges: true
> +  "#gpio-cells": true
> +  gpio-ranges: true
> +  wakeup-parent: true

Missing gpio-line-names and constraints for ranges. Look at other bindings.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +patternProperties:
> +  "-state$":
> +    oneOf:
> +      - $ref: "#/$defs/qcom-ipq9574-tlmm-state"
> +      - patternProperties:
> +          "-pins$":
> +            $ref: "#/$defs/qcom-ipq9574-tlmm-state"
> +        additionalProperties: false
> +
> +$defs:
> +  qcom-ipq9574-tlmm-state:
> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
> +
> +    properties:
> +      pins:
> +        description:
> +          List of gpio pins affected by the properties specified in this
> +          subnode.
> +        items:
> +          oneOf:
> +            - pattern: "^gpio([0-9]|[1-5][0-9]|6[0-4])$"
> +            - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk, sdc2_cmd,
> +                      sdc2_data, qdsd_cmd, qdsd_data0, qdsd_data1, qdsd_data2,
> +                      qdsd_data3 ]

These are ordered by name.

> +        minItems: 1
> +        maxItems: 8
> +
> +      function:
> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins.
> +
> +        enum: [ atest_char, atest_char0, atest_char1, atest_char2, atest_char3,
> +                audio_pdm1, audio_pri, audio_sec, blsp0_spi, blsp0_uart,
> +                blsp1_i2c, blsp1_spi, blsp1_uart, blsp2_i2c, blsp2_spi,
> +                blsp2_uart, blsp3_i2c, blsp3_spi, blsp3_uart, blsp4_i2c,
> +                blsp4_spi, blsp4_uart, blsp5_i2c, blsp5_uart, cri_trng0,
> +                cri_trng1, cri_trng3, cxc0, cxc1, dbg_out, dwc_ddrphy,
> +                gcc_plltest, gcc_tlmm, mac00, mac01, mac10, mac11, mdc,
> +                mdio, pcie0_clk, pcie0_wake, pcie1_clk, pcie1_wake, pcie2_clk,
> +                pcie2_wake, pcie3_clk, pcie3_wake, prng_rosc0, prng_rosc1,
> +                prng_rosc2, prng_rosc3, pta1_0, pta1_1, pta1_2, pta20, pta21,
> +                pwm00, pwm01, pwm02, pwm03, pwm04, pwm10, pwm11, pwm12, pwm13,
> +                pwm14, pwm20, pwm21, pwm22, pwm23, pwm24, pwm30, pwm31, pwm32,
> +                pwm33, qdss_cti_trig_in_a0, qdss_cti_trig_in_a1, qdss_cti_trig_in_b0,
> +                qdss_cti_trig_in_b1, qdss_cti_trig_out_a0, qdss_cti_trig_out_a1,
> +                qdss_cti_trig_out_b0, qdss_cti_trig_out_b1, qdss_traceclk_a,
> +                qdss_traceclk_b, qdss_tracectl_a, qdss_tracectl_b, qdss_tracedata_a,
> +                dss_tracedata_b, qdss_tracedata_b, qspi_clk, qspi_cs, qspi_data,
> +                rx0, rx1, sdc_clk, sdc_cmd, sdc_data, sdc_rclk, tsens_max,
> +                wci20, wci21, wsa_swrm, audio_pdm0 ]

These too

> +
> +      bias-disable: true
> +      bias-pull-down: true
> +      bias-pull-up: true
> +      drive-strength: true
> +      input-enable: true
> +      output-high: true
> +      output-low: true
> +
> +    required:
> +      - pins
> +
> +    additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    tlmm: pinctrl@1000000 {
> +        compatible = "qcom,ipq9574-tlmm";
> +        reg = <0x01000000 0x300000>;
> +        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +        gpio-ranges = <&tlmm 0 0 65>;
> +
> +        uart2-state {
> +                pins = "gpio34", "gpio35";

Wrong indentation.

> +                function = "blsp2_uart";
> +                drive-strength = <8>;
> +                bias-pull-down;
> +        };
> +    };

Best regards,
Krzysztof

