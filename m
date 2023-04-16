Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D68C77B61
	for <linux-clk@archiver.kernel.org>; Sun, 16 Apr 2023 17:38:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbjDPRiz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 16 Apr 2023 13:38:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjDPRiy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 16 Apr 2023 13:38:54 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5EED2D7B
        for <linux-clk@vger.kernel.org>; Sun, 16 Apr 2023 10:38:40 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-50670cc3abfso2437793a12.1
        for <linux-clk@vger.kernel.org>; Sun, 16 Apr 2023 10:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681666719; x=1684258719;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f2vKe4V7oTjo32GQLqOKK9KO2UHfJzvL/v/DQOh4vME=;
        b=abHRUrt5wUQO7o3okURaM/Bwxq5e70RyKNZ3o1yVlo0qp4wUO959TGhV+UTMEmvs1P
         39hfxQ0v0h34iow78PmVmB4uyy211WwlXKoXN5wW0U0B8GdVmpNPQ4pbuSEiiIYNHgR0
         ycG6Vpl6X2UosaD1Obyt9cxSipQLFX8gJg/qD5A7xgYlgChKbiulgPk7a76eYDsJdf5m
         0rJen6DZO4LtdbWS3mnXesWe8bySM4acFPCtaTgE3++2uBuIXgASYpD8AXrzl13ELWYk
         qE81Dmx8d6NkGEtlqdVMz9JDufDmB1dGF8m/sFaEa9FIj0J8WvrwcOnHSf+tgaekA7P4
         63hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681666719; x=1684258719;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f2vKe4V7oTjo32GQLqOKK9KO2UHfJzvL/v/DQOh4vME=;
        b=JNcYla1nWYb/suLPTREa+R94HHEr6vrTaicw1mx3MJ+NL/Oq9LFUjBhtQO+Qxrbgpq
         h1WjNggmAKZJnrfWG1Ys6234H7/F/iH+OlTg1FqDl88KCKEshXeybyTP5Tu4Y1rjP/eh
         OkVJOl27VyLsTtjgkW4PmBrcNbezTnTtSQCSs8O6LOSNOiTTL+lr0Tn5K41GAbdbx9vn
         o6n3K86ipS+sL3cYEq0LsCR7jyxwHlk7Ytu65fjAk78T1tLGyF8VFvuD3MqE8e3dQbfC
         hFXB/6kp5sPqhoij4BSkUpAaYINHvkAmVSShsh7pk2Z6L8SJaeyiZca92I6Uvep7ztYh
         O3Lw==
X-Gm-Message-State: AAQBX9eTfnFAJ8+IuOh/UH+bBW0Fpd01rPDJzU2rFzOpY+1mz52OFa62
        MfCZOu+jGmlfcjK2W+mjgoSEiw==
X-Google-Smtp-Source: AKy350aTQXNKVQFEuceo2SpdnYVpR14+yujDsTeJUZHdSUOVrzsfrVXo5hTVvkca/HY/La78DmELLw==
X-Received: by 2002:aa7:d74f:0:b0:505:34c:eb38 with SMTP id a15-20020aa7d74f000000b00505034ceb38mr11698645eds.11.1681666719387;
        Sun, 16 Apr 2023 10:38:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f9e3:1d38:66a7:ae92? ([2a02:810d:15c0:828:f9e3:1d38:66a7:ae92])
        by smtp.gmail.com with ESMTPSA id j21-20020aa7ca55000000b004fa380a14e7sm4740615edt.77.2023.04.16.10.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 10:38:39 -0700 (PDT)
Message-ID: <c6571a6d-bf55-14b3-102d-814af6763be7@linaro.org>
Date:   Sun, 16 Apr 2023 19:38:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: Add simple-clock-controller
Content-Language: en-US
To:     David Yang <mmyangfl@gmail.com>, linux-clk@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230416173302.1185683-1-mmyangfl@gmail.com>
 <20230416173302.1185683-2-mmyangfl@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230416173302.1185683-2-mmyangfl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/04/2023 19:32, David Yang wrote:
> Add DT bindings documentation for simple-clock-controller, mutex
> controller for clocks.
> 
> Signed-off-by: David Yang <mmyangfl@gmail.com>
> ---
>  .../clock/simple-clock-controller.yaml        | 50 +++++++++++++++++++

Where is the changelog?

>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/simple-clock-controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/simple-clock-controller.yaml b/Documentation/devicetree/bindings/clock/simple-clock-controller.yaml
> new file mode 100644
> index 000000000000..17835aeddb1d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/simple-clock-controller.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/simple-clock-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Simple clock controller
> +
> +maintainers:
> +  - David Yang <mmyangfl@gmail.com>
> +
> +description: |
> +  Driver (lock provider) for real clocks.

Drop driver references. Typo: clock, not lock.

What is a real clock? What is an unreal clock?

> +
> +  Usually one register controls more than one clocks. This controller avoids
> +  write conflicts by imposing a write lock, so that two operations on the same
> +  register will not happen at the same time.

Interesting. How the clock controller imposes write locks? Aren't you
now mixing drivers and hardware?


> +
> +properties:
> +  compatible:
> +    items:
> +      - oneOf:
> +          - const: simple-clock-controller
> +          - const: simple-clock-reset-controller

Why two?

> +      - const: syscon
> +      - const: simple-mfd

Why do you need syscon and simple-mfd?

> +
> +  reg:
> +    maxItems: 1
> +
> +  '#reset-cells':
> +    const: 2
> +
> +patternProperties:
> +  "clock@.*":

Use consistent quotes.

Anyway, I don't understand what is happening here and why such changes.
Nothing is explained...


Best regards,
Krzysztof

