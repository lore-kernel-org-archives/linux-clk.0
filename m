Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA93C77B7D
	for <linux-clk@archiver.kernel.org>; Mon, 15 May 2023 06:27:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239788AbjEOG1F (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 May 2023 02:27:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239748AbjEOG0y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 May 2023 02:26:54 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2F7C1FD8
        for <linux-clk@vger.kernel.org>; Sun, 14 May 2023 23:26:51 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-50bc4b88998so21755824a12.3
        for <linux-clk@vger.kernel.org>; Sun, 14 May 2023 23:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684132010; x=1686724010;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qKPNUzjoxIt2qle5yyUBx+bzfhRe4atuWwPXnoKqr+I=;
        b=i0rOmp8mgMrmR30bV4O+LQ+jOpWIkqsnD3dfhCBrHxL6VrwBvi1R92pPpXXejeRZlR
         4ut9hMkEDnvlR7YDto5UTrk4sgeKmrTuFKlBH0WyxUzhmIx3E+c5TiPtONH5zBydqGrA
         qCMBZbIkIoOwq3QumgXHx9eV7DpX8hZ2lBHgh5wyHznKoglu9wZTF57C5Sol3LW0TBDi
         syjRgknmwz54wGvXMBq3qJ8GvG0jj9Gt4VhJWSYfy4qRQpzyQ3ZON2+cfHAAhzbJ66Op
         u2oviZ3B4KKL2EHWCNPphpefFZzbOSTBQN5ymDWTROIyGXPzijTCiEyDkXgGu50mxzrb
         fygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684132010; x=1686724010;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qKPNUzjoxIt2qle5yyUBx+bzfhRe4atuWwPXnoKqr+I=;
        b=TK71EeVHS0tQVJOIUGe0rqogKFUYrGeYwcJNJr/a4J1ZWf+KZVCqrXKxhu37f24sjG
         w5i46VR8M+EmxsSSXt67cG1H85WQ3v7a+8hj8gPP1irXtX4hqPtwY8us1jtIqm+WzDfu
         b0B4t/MTYCPX8HJmzYKK0JESGHXvIBK2lkDMgw33sJCusiYdslHnKMG8LOzYi6HErr80
         Jzfvq2f9cMqYNFVFcLwqlpmgQNVxGuJ+IAobi09iZ0y8gdjN7Kot+Q4YVYqFixglH3ft
         qPIPXYT4Y8tgg0MMvvgOqemzPR722B8XE9GPkSGaZOiL/vmv4R6B3eD0ceeAY5MC7KVe
         LfYg==
X-Gm-Message-State: AC+VfDzFnwJRRbYrMQ4/8iW4vGr7WYk+kiROTWs2KxMkFpDAPFM40FOF
        G/N2cwjBDP2OlZW1hncc/55fz7zru4MFIrE6zm7C0g==
X-Google-Smtp-Source: ACHHUZ519n6PfF1iQeih2w1H7eBKQCRVwE2ObXahgbrsyPv9Fez0px0W+jcEExMsuLAEmazbgXYEPw==
X-Received: by 2002:aa7:d982:0:b0:509:f221:cee2 with SMTP id u2-20020aa7d982000000b00509f221cee2mr26674380eds.32.1684132010534;
        Sun, 14 May 2023 23:26:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6470:25b8:7c2d:1992? ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
        by smtp.gmail.com with ESMTPSA id n25-20020a056402061900b0050a276e7ba8sm7069699edv.36.2023.05.14.23.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 May 2023 23:26:50 -0700 (PDT)
Message-ID: <a4ec338a-1b17-4b88-3df1-239acfa6745e@linaro.org>
Date:   Mon, 15 May 2023 08:26:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add thead th1520 clock
Content-Language: en-US
To:     Yangtao Li <frank.li@vivo.com>, mturquette@baylibre.com,
        sboyd@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jisheng Zhang <jszhang@kernel.org>, Wei Fu <wefu@redhat.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Icenowy Zheng <uwu@icenowy.me>
References: <20230515054402.27633-1-frank.li@vivo.com>
 <20230515054402.27633-2-frank.li@vivo.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230515054402.27633-2-frank.li@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/05/2023 07:43, Yangtao Li wrote:
> Add devicetree binding document and related header file
> for the T-HEAD TH1520 clock.
> 
> Cc: Icenowy Zheng <uwu@icenowy.me>
> Cc: Wei Fu <wefu@redhat.com>
> Cc: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  .../bindings/clock/thead,th1520-ccu.yaml      | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml b/Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml
> new file mode 100644
> index 000000000000..c3e2d8c7efa6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/thead,th1520-ccu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: T-HEAD Clock Control Unit
> +
> +maintainers:
> +  - Jisheng Zhang <jszhang@kernel.org>
> +  - Wei Fu <wefu@redhat.com>
> +  - Yangtao Li <frank.li@vivo.com>
> +
> +

Stray blank line.

> +properties:
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +  compatible:

Compatible is always first property.

> +    enum:
> +      - thead,th1520-ccu
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    const: 2
> +    items:
> +      - description: High Frequency Oscillator (usually at 24MHz)
> +      - description: Low Frequency Oscillator (usually at 32kHz)

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

I'll stop review.

Best regards,
Krzysztof

