Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4CA5C433FE
	for <linux-clk@archiver.kernel.org>; Mon, 21 Nov 2022 08:47:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbiKUIrN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Nov 2022 03:47:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbiKUIrM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Nov 2022 03:47:12 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53D966DFE1
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 00:47:11 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id j16so17742343lfe.12
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 00:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kndWz83Xral0dUFOAKp2Vmc6vOTcnvs9YYJQaOTyYnk=;
        b=GkKeSc7TMYPu00JKJp1CrxzXew8hnss4sAxmBEZL77QYVr4TQJH3CCXlOHWB5jYFOF
         HzIkSXnikeqEkdZyu1D7qCsup3SRNe6xlUC1+2kRq/nX5NtysB8HHy9EhYAdS12XIGou
         Nnwg/xioCRfzd+sQtO0+Rmioz0ATbT1CqVn5bweUjOjxtQx/7N17UAAKTwTuK9gOfd9F
         qUrlYnFdVJ91dUvpwZViz+sI6kdOXXqyvbmW9KvVZeaXAoDiTBdJVI4ntStblyflwU8P
         +KAHYcDkP/CuCew59BihYdSHxSeWwPP9VH+LEQnl2aLMmHWfuZcba8oJp5tNYaoJn1pz
         BV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kndWz83Xral0dUFOAKp2Vmc6vOTcnvs9YYJQaOTyYnk=;
        b=LetbzDFjTKjHAt4Wtfvpq2Gk1F61Jxji9IuV2tQIJOrhJBsATfNa9AMY0n6J8EvqUY
         H+Kowl8MLslP7KUKeGVX2JwQi1Hz/CFoXWOzZ9GrbG4+7jgPGTEhYngpEdrdAdwYBNE9
         GLbkMm005D9hmsgHovHRcBMaq8tDw1H/MEXDjrFH/Zb66ZwweyovbcGSor/+pjNkAXmq
         dKXzbcBqZ9JSpMdoHPOvMSHbRLLtdRsPiWjY8+T8v4jedHFwBDIbALmzHr9bIq5NJ6rn
         WdxtDKRL5fQf6TONCQ4EBlpDrTiGI9Zr2WOFM82ymJ8Q963ZuR9SxUMmEGMlXQPVYBaW
         sudg==
X-Gm-Message-State: ANoB5pltXzTVClh095dsRQ/1s07u8PGknPNcqcx93q13vVf3LeYvUfvg
        C5Onctb1vRsGSUay4Uyc6mb6dA==
X-Google-Smtp-Source: AA0mqf7ezaup3NdGbhw0Yyfz7OPrbPKKL4Om6RxHB8XBzBJN4qpHopH6igjgvEXoxu+a4RwhtFpnuA==
X-Received: by 2002:ac2:508d:0:b0:4a4:72b0:9a2b with SMTP id f13-20020ac2508d000000b004a472b09a2bmr5324334lfm.469.1669020429698;
        Mon, 21 Nov 2022 00:47:09 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id t17-20020a056512209100b0049ebc44994fsm1944613lfr.128.2022.11.21.00.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 00:47:09 -0800 (PST)
Message-ID: <1d62f95f-0edc-afd4-abb4-37fadc0b6a47@linaro.org>
Date:   Mon, 21 Nov 2022 09:47:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 09/14] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Content-Language: en-US
To:     Hal Feng <hal.feng@starfivetech.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        linux-kernel@vger.kernel.org
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-10-hal.feng@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118010627.70576-10-hal.feng@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/11/2022 02:06, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Add bindings for the system clock and reset generator (SYSCRG) on the
> JH7110 RISC-V SoC by StarFive Ltd.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>

Binding headers are coming with the file bringing bindings for the
device, so you need to squash patches.

> ---
>  .../clock/starfive,jh7110-syscrg.yaml         | 80 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  2 files changed, 81 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> new file mode 100644
> index 000000000000..a8cafbc0afe2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/starfive,jh7110-syscrg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 System Clock and Reset Generator
> +
> +maintainers:
> +  - Emil Renner Berthing <kernel@esmil.dk>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-syscrg
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Main Oscillator (24 MHz)
> +      - description: RMII reference clock
> +      - description: RGMII RX clock
> +      - description: I2S TX bit clock
> +      - description: I2S TX left/right clock
> +      - description: I2S RX bit clock
> +      - description: I2S RX left/right clock
> +      - description: TDM
> +      - description: mclk
> +
> +  clock-names:
> +    items:
> +      - const: osc
> +      - const: gmac1_rmii_refin
> +      - const: gmac1_rgmii_rxin
> +      - const: i2stx_bclk_ext
> +      - const: i2stx_lrck_ext
> +      - const: i2srx_bclk_ext
> +      - const: i2srx_lrck_ext
> +      - const: tdm_ext
> +      - const: mclk_ext
> +
> +  '#clock-cells':
> +    const: 1
> +    description:
> +      See <dt-bindings/clock/starfive-jh7110.h> for valid indices.

Fix filename.

> +
> +  '#reset-cells':
> +    const: 1
> +    description:
> +      See <dt-bindings/reset/starfive-jh7110.h> for valid indices.

Fix filename.


> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +  - '#reset-cells'
> +

Best regards,
Krzysztof

