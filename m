Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC49C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 11:29:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbiI3L3u (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 07:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230358AbiI3L2g (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 07:28:36 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0895A20BE8
        for <linux-clk@vger.kernel.org>; Fri, 30 Sep 2022 04:19:53 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id l12so4446566ljg.9
        for <linux-clk@vger.kernel.org>; Fri, 30 Sep 2022 04:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=98VxkYtHYss6Fdvz6v89xHzqYeKh8t8Kg7Pm4jF/ymA=;
        b=jjH5Nrqm6I6cs88/zD2jA6k9ogcvrJme5pmFAlXbFzIBAeS7c+h6bAXqv/ZH4qPV6n
         SadyHQ47lZr39dIjTPCfWWk8yD/n0OuF5pQWprk+z2XFiEBPGNvKyXsTisxm4X/Iqb8J
         D3c/Rl42pBYtAgsRCMjze6pSr2PlO/uxYiT9MqDQAHWkHmdcLMQ8Ql8KT8gGk1q+e2Qi
         ZRn/dvelf8flC+B0VCLjw2DGl5RYynRwP4Pf8e+kEsky+q3Ddj0KjxNm7nhB2H37YFKF
         fTB+8NxE0/31uByMiXRHDXppm/HKsnMxsVivVDOhBHrftgS+arZoSasDmP7o4nGTgVtr
         5OHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=98VxkYtHYss6Fdvz6v89xHzqYeKh8t8Kg7Pm4jF/ymA=;
        b=B5zxqc3loV2u8ooFdHoFBtUqoZ5lHNlfDH2ze/cwDATtS3U75qil3R58ATi0jyAKWb
         bIWJ9+utzgGUKHl4fymd2Tr1NttrqcMId1y+oDDZxXdSwDKQo5f1p1rgEe+0oy6CiKEh
         kOg0si3O6W6Jxu6yd7Zc0hUt3f5dTeDLcLT2ZKyOM0HmZkFMcLPuKhszADGFmuQFlQeD
         IBkj0/H1YNTGe4otCwPD9KTxJ2t9CxF1oiQtuftIav1Xsr/xeNShw9fnRiW/HZKYW+bN
         ereUOeGceee+8bONy/YUQITIemNhTjalHEZeU6q65oiM8sm/Ni+jEV7Xqo/4256dQ1+1
         0P0g==
X-Gm-Message-State: ACrzQf3g/qYv4SAxOaGE87q6PgiOhGWJpTCiblCYomWk8my/1Of5BOrK
        QFDDBUWzokeoHgGIDcFWuD8lnA==
X-Google-Smtp-Source: AMsMyM60G1skfhndb58kLzZ6p+5lhSdzFr5E+sk9r6L9+t4iV1giJlEs3tho4HKtcVuxsoe9V2c4nQ==
X-Received: by 2002:a2e:8511:0:b0:26c:968:a068 with SMTP id j17-20020a2e8511000000b0026c0968a068mr2870172lji.206.1664536791940;
        Fri, 30 Sep 2022 04:19:51 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h4-20020a05651c124400b0026be1de1500sm135360ljh.79.2022.09.30.04.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 04:19:51 -0700 (PDT)
Message-ID: <8fb538bc-534b-0e7e-280d-754afa8e3cd9@linaro.org>
Date:   Fri, 30 Sep 2022 13:19:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/2] dt-bindings: clk: Add binding for versal clocking
 wizard
Content-Language: en-US
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        linux-clk@vger.kernel.org
Cc:     git@amd.com, devicetree@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com
References: <20220930080400.15619-1-shubhrajyoti.datta@amd.com>
 <20220930080400.15619-2-shubhrajyoti.datta@amd.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220930080400.15619-2-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/09/2022 10:03, Shubhrajyoti Datta wrote:
> The Clocking Wizard for Versal adaptive compute acceleration platforms
> generates multiple configurable number of clock outputs.
> Add device tree binding for Versal clocking wizard support.

Drop second "binding" from subject. Redundant.

> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> 
>  .../bindings/clock/xlnx,clk-wizard.yaml       | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clk-wizard.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/xlnx,clk-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clk-wizard.yaml
> new file mode 100644
> index 000000000000..41a6f4bcaccd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/xlnx,clk-wizard.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/xlnx,clk-wizard.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xilinx Versal clocking wizard
> +
> +maintainers:
> +  - Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> +
> +description:
> +  The clocking wizard is a soft ip clocking block of Xilinx versal. The IP

Isn't versal a proper noun? Some product? If so, it starts with a
capital letter.

> +  uses the input clock frequencies and generates the requested
> +  clock output.
> +
> +properties:
> +  compatible:
> +    const: xlnx,clk-wizard-1.0
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  clocks:
> +    description: List of clock specifiers which are external input
> +      clocks to the given clock controller.

Drop "List of clock specifiers which are "

> +    items:
> +      - description: functional clock input
> +      - description: axi clock or the interface clock
> +
> +  clock-names:
> +    items:
> +      - const: clk_in1

Just "in1"

> +      - const: s_axi_aclk

Just "s_axi"

> +
> +  xlnx,nr-outputs:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 8
> +    description:
> +      Number of outputs.

Nope, you just copied the name of property. That's like documenting a
function with the name of that function.

Not useful at all.

> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +  - clocks
> +  - clock-names
> +  - xlnx,nr-outputs
> +
> +...

Best regards,
Krzysztof

