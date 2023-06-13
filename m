Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D31EB64D7
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 18:34:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235184AbjFMSee (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jun 2023 14:34:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239334AbjFMSeb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 14:34:31 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1E6D1BC9
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 11:34:29 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-97458c97333so957998066b.2
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 11:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686681268; x=1689273268;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NtcqOw9tGOLwmlWw5dD/FwSbu+eMTAPAiQdNyorGdKs=;
        b=TF06f9ZKq7pMgbq7ormbfzR+qN7ngTNxN1iQAXw5U5DuvJrUq1xjjW5xw9Ize6wSp7
         EYxB2YzFz/QtVppI3GMbtwa4xgZ9sRQc3f4t8YBK/meyV6UR1DiBbMgwpXwOIgNKFs33
         U87sFC0COYk9vce4kBnTGAGE2hazjZOGeQSpl2b7BLjyXbNQiuFuyb5xpd60z2nQkxnA
         4ykIXEPRyNRfLYITKW1o/rh6DBnkOaeN2/hn1ZF0+4KTDPZWhyejI8hH3+tu0EYeYbJB
         EJffQ0cUT8Gpm0QKBn3ydp3Uf+0X+hUyQ9Savf8KEz8OyniD+XdZ/s6VAtYcnNCFkcFq
         8qsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686681268; x=1689273268;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NtcqOw9tGOLwmlWw5dD/FwSbu+eMTAPAiQdNyorGdKs=;
        b=KRaAtWo8+IdMhDEB2v/yyCyemiYSdh0sbTjNQADzuT9dfjfL4WcmnSVjDTS2/thxo7
         ZN8ASfpvRXvJLPKYAAzD5asdADlyZxoCum8Gm2SbCy7tZRQ3257wqliqxHUip6iEt6Zr
         LFu+WYcP9sp7SzrOCjgjJRwqNyN3TdBM614pIjWY4Fax8eexEYCl+p1h8cVwUi8ghY/V
         RjkIINCkyx3B9ZcHffaHbdyCrTokmZ4udQuSdopBsjbFFJmeHdHRFupCaPkkqekcg5yb
         uHZ5OVMLLN4LfjBP9gxR85cptwgQs6n5wLAPCy8Q5jRB0sTfb67mapE+B0keBPBmzLcE
         b8Hw==
X-Gm-Message-State: AC+VfDwNIADIWNOApFQiHtzv1ieEr/bYoevVOkooeqYqcEyE3bNpHkKE
        7nKT3sw1WHNlHIVWyXznnGOVtQ==
X-Google-Smtp-Source: ACHHUZ5h4YyZdlSWo9Eiykl6LWg95TEWZGgJxSeDzTRZm8HcaKkAKbdZzhGVqPwl1h+uQO5nbWUlYg==
X-Received: by 2002:a17:907:eac:b0:978:8925:7a08 with SMTP id ho44-20020a1709070eac00b0097889257a08mr15533059ejc.72.1686681268157;
        Tue, 13 Jun 2023 11:34:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id pv12-20020a170907208c00b0096b4ec45e10sm6946337ejb.139.2023.06.13.11.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 11:34:27 -0700 (PDT)
Message-ID: <75508c4d-d86e-f88f-191f-dd870ebe7bd7@linaro.org>
Date:   Tue, 13 Jun 2023 20:34:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 3/7] dt-bindings: clock: jh7110-syscrg: Add PLL clock
 inputs
Content-Language: en-US
To:     Xingyu Wu <xingyu.wu@starfivetech.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Conor Dooley <conor+dt@kernel.org>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        William Qiu <william.qiu@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230613125852.211636-1-xingyu.wu@starfivetech.com>
 <20230613125852.211636-4-xingyu.wu@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230613125852.211636-4-xingyu.wu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/06/2023 14:58, Xingyu Wu wrote:
> Add optional PLL clock inputs from PLL clock generator.

Are you sure that PLLs are optional? Usually they are not...

> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../clock/starfive,jh7110-syscrg.yaml         | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> index 84373ae31644..5536e5f9e20b 100644
> --- a/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> @@ -39,6 +39,33 @@ properties:
>            - description: External TDM clock
>            - description: External audio master clock
>  
> +      - items:
> +          - description: Main Oscillator (24 MHz)
> +          - description: GMAC1 RMII reference or GMAC1 RGMII RX
> +          - description: External I2S TX bit clock
> +          - description: External I2S TX left/right channel clock
> +          - description: External I2S RX bit clock
> +          - description: External I2S RX left/right channel clock
> +          - description: External TDM clock
> +          - description: External audio master clock
> +          - description: PLL0
> +          - description: PLL1
> +          - description: PLL2

Add these three to the existing entry with minItems.

> +
> +      - items:
> +          - description: Main Oscillator (24 MHz)
> +          - description: GMAC1 RMII reference
> +          - description: GMAC1 RGMII RX
> +          - description: External I2S TX bit clock
> +          - description: External I2S TX left/right channel clock
> +          - description: External I2S RX bit clock
> +          - description: External I2S RX left/right channel clock
> +          - description: External TDM clock
> +          - description: External audio master clock
> +          - description: PLL0
> +          - description: PLL1
> +          - description: PLL2

Add these three to the existing entry with minItems.



> +
>    clock-names:
>      oneOf:
>        - items:
> @@ -64,6 +91,35 @@ properties:
>            - const: tdm_ext
>            - const: mclk_ext
>  
> +      - items:
> +          - const: osc
> +          - enum:
> +              - gmac1_rmii_refin
> +              - gmac1_rgmii_rxin
> +          - const: i2stx_bclk_ext
> +          - const: i2stx_lrck_ext
> +          - const: i2srx_bclk_ext
> +          - const: i2srx_lrck_ext
> +          - const: tdm_ext
> +          - const: mclk_ext
> +          - const: pll0_out
> +          - const: pll1_out
> +          - const: pll2_out

Add these three to the existing entry with minItems.


> +
> +      - items:
> +          - const: osc
> +          - const: gmac1_rmii_refin
> +          - const: gmac1_rgmii_rxin
> +          - const: i2stx_bclk_ext
> +          - const: i2stx_lrck_ext
> +          - const: i2srx_bclk_ext
> +          - const: i2srx_lrck_ext
> +          - const: tdm_ext
> +          - const: mclk_ext
> +          - const: pll0_out
> +          - const: pll1_out
> +          - const: pll2_out

Add these three to the existing entry with minItems.



Best regards,
Krzysztof

