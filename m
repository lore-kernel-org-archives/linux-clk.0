Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A6E5C43217
	for <linux-clk@archiver.kernel.org>; Tue, 18 Oct 2022 13:51:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbiJRNvl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Oct 2022 09:51:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbiJRNvk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Oct 2022 09:51:40 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3F8E8169A
        for <linux-clk@vger.kernel.org>; Tue, 18 Oct 2022 06:51:38 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id j21so8609508qkk.9
        for <linux-clk@vger.kernel.org>; Tue, 18 Oct 2022 06:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Bp+MtIf4+R6pNtZTvWCO+IGmeYq2hNpJQPV17Az0I4=;
        b=ASBeeOrm3YZSpMLkcK0F5eHdf8DZeuVCUsOADJLijx/8HJo1tFiK+O1NWTeedngzos
         KvbWN0H7a1tkPkYDh93JvfVUJ8h7CkKAEDwM1bLvtWSbM3mQUN9365BICoTQNDbkwyHd
         OPnR1IqfTRtJ7yhkmvUMhCAeqYW9IurnyF1OEfBt6gba3HClWRRwpxYguyyV+NUDcD56
         iXP2rAVW5heQIxcBsB1OBITz5ht2I+xkGsnbaDKQwhPJylEoE8ITN3iI1MRV0Y3C7vwn
         q6eIGbYD84qvoPxBTMr8NrJI7UT/EniQYNcUvacTeh+w+QVzY30v+Mwyjx6WPxQtf60m
         haiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Bp+MtIf4+R6pNtZTvWCO+IGmeYq2hNpJQPV17Az0I4=;
        b=dfiAodEGdmxxNCXYkvOAArS+cuH0IxZ1/t2+bK7AYOf1BbNseL1f9HRvCvzyigwIHX
         x7pKhvCRHcpLuHLP4Nms3FtIjeWV9Xaqf8KglOxn9ZSQyvzoozhQeYedkPR9kqDiYnEE
         40amnFUTNMbbVB2uo2cmXrKiQJP+xoHmTXgNn02tGtzkNqyjklsNH9CJvHVqar6l+R+B
         xIKGZFc7siRE53ugHDaR/UxSDWHT3ZxVPYrd2KGLdF6oSViSaxFKYXGR8rlULbx+Vh6b
         j6J8q6lSXMbUs1FQmP4wvwIWFhdHGhMwhduEZBEszVEtMssgfMWqy8k9/wf1GiBzHzmb
         XDGQ==
X-Gm-Message-State: ACrzQf3otWj6JEy4GHC9K6WgyycRtMAjIS3VoVlGDBDi0Gjwu7uMQSo1
        xFfObDAtJaToc9axpEE/mM/UaQ==
X-Google-Smtp-Source: AMsMyM4dC3ZAV4mCKJjX8mzg/4nbCvt+gntlN3+/orwCsGNYUF/sB+TKvJdsQ9diUqgPtThzOYqMfw==
X-Received: by 2002:a05:620a:1729:b0:6ee:cf01:6810 with SMTP id az41-20020a05620a172900b006eecf016810mr1798512qkb.555.1666101097893;
        Tue, 18 Oct 2022 06:51:37 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id ci19-20020a05622a261300b0035badb499c7sm2009135qtb.21.2022.10.18.06.51.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 06:51:37 -0700 (PDT)
Message-ID: <3339aa03-5e43-7579-837f-d70eb0f4dae6@linaro.org>
Date:   Tue, 18 Oct 2022 09:51:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/1] dt-bindings: clock: ti,cdce925: Convert to DT schema
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20221018072106.2391771-1-alexander.stein@ew.tq-group.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221018072106.2391771-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/10/2022 03:21, Alexander Stein wrote:
> Convert the TI CDCE925 clock binding to DT schema format.
> Including a small fix: Add the missing 'ti' prefix in the example
> compatible.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Thank you for your patch. There is something to discuss/improve.

> diff --git a/Documentation/devicetree/bindings/clock/ti,cdce925.yaml b/Documentation/devicetree/bindings/clock/ti,cdce925.yaml
> new file mode 100644
> index 000000000000..1e68ee68e458
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti,cdce925.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/ti,cdce925.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI CDCE913/925/937/949 programmable I2C clock synthesizers node bindings

Drop "node bindings"

> +
> +maintainers:
> +  - Mike Looijmans <mike.looijmans@topic.nl>
> +
> +description: |
> +  Flexible Low Power LVCMOS Clock Generator with SSC Support for EMI Reduction
> +
> +  - CDCE(L)913: 1-PLL, 3 Outputs https://www.ti.com/product/cdce913
> +  - CDCE(L)925: 2-PLL, 5 Outputs https://www.ti.com/product/cdce925
> +  - CDCE(L)937: 3-PLL, 7 Outputs https://www.ti.com/product/cdce937
> +  - CDCE(L)949: 4-PLL, 9 Outputs https://www.ti.com/product/cdce949
> +
> +properties:
> +  $nodename:
> +    pattern: "^clock-controller$"

Drop this requirement. It is in general expected, but there is no need
for each binding to specify it.

Other problem is that you did not actually test these bindings before
sending...

> +
> +  compatible:
> +    enum:
> +      - ti,cdce913
> +      - ti,cdce925
> +      - ti,cdce937
> +      - ti,cdce949
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: fixed parent clock
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  vdd-supply:
> +    description: Regulator that provides 1.8V Vdd power supply
> +
> +  vddout-supply:
> +    description: |
> +      Regulator that provides Vddout power supply.
> +      non-L variant: 2.5V or 3.3V for
> +      L variant: 1.8V for
> +
> +  xtal-load-pf:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Crystal load-capacitor value to fine-tune performance on a
> +      board, or to compensate for external influences.
> +
> +patternProperties:
> +  "^PLL[1-4]$":
> +    type: object
> +    description: |
> +      optional child node can be used to specify spread
> +      spectrum clocking parameters for a board
> +

    additionalProperties: false

> +    properties:
> +      spread-spectrum:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: SSC mode as defined in the data sheet
> +
> +      spread-spectrum-center:
> +        type: boolean
> +        description: |
> +          Use "centered" mode instead of "max" mode. When
> +          present, the clock runs at the requested frequency on average.
> +          Otherwise the requested frequency is the maximum value of the
> +          SCC range.
> +

Best regards,
Krzysztof

