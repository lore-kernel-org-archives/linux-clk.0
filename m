Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76943C7618A
	for <linux-clk@archiver.kernel.org>; Sun, 19 Mar 2023 12:29:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbjCSM3E (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 19 Mar 2023 08:29:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbjCSM3D (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 19 Mar 2023 08:29:03 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF8F414E8E
        for <linux-clk@vger.kernel.org>; Sun, 19 Mar 2023 05:29:01 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id b20so3950590edd.1
        for <linux-clk@vger.kernel.org>; Sun, 19 Mar 2023 05:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679228940;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j+O52D/DV4YgwqI2JOZWwPGBcydQvd8bbC9f6R3xUAY=;
        b=d6mMatByqBvvw9nV/5nVC3nV+LZkLVWCQ02kayCz3j4h/dxzFQzDkCLxYQy0KC/WfT
         0QobqY056ZHkhLgWHaG1xLa7ef5yTFtYXmtwmDQr8CkJp64w1rcQa3fE7vUH3omf+5Gi
         SBt/5xq6XIa8vDgFiyq4TUNOV/M1S+Nzn7h34itm18QnZAO01WgwnNKZQ8w9XkHufo2q
         ssFZyAHWqRsUIj5fO9jVy7zgcZZmf7ZDmNDBM5+jYIPN5DatiKgfNOEdwenvrG8GKMNT
         HCacgmlBDvNqSAB2vQfZ3QYLQ8a34MW246jkM/NDQHkFQYwnbq8c+EXVEAK4+VwGtram
         Gw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679228940;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j+O52D/DV4YgwqI2JOZWwPGBcydQvd8bbC9f6R3xUAY=;
        b=qtQ7PP698VVRuyMjGrGDcw5HBf5q+YpshxDnIP3/GLnkkA3gsGHR2T6V65DaXEWttt
         wgVUv43nEYGZdAx3YBy8rpwohLf3tV4XgWVNnVqCFRiJ3qD/FnFwn+NTFrmi8UPaYkEj
         WcX8f6cKTf7T91mE0gZVG9QyTNxC0lvGdC+WPjdrcrwCiNzN/WiTHvk387+xE3DVUvL2
         nYEPOajxY9ybsK11G73Nk8CLhns/W4wD0eocdm4iPDkx4oZ7wqmtTj6wcyF8s9Bknly4
         5Xk7jCaUzW/Ttkvg3mTMbmJg7wmxmAAHMDuNNhfTgDmvt/IZ3+aVkNxvEvepEhpob0lg
         RtTA==
X-Gm-Message-State: AO0yUKV/0hO9p8D5mStixYhWRuszZ4v5p+SgfFFlQn41S45HhmyGZ091
        RcYdlIhTJkiWiyzjlsE3HmwhgA==
X-Google-Smtp-Source: AK7set94owjWJlViRmiDbyyh8a8jp6CCdztcsXHhVWObolmpVvjrHsBmCzRtr9vz4WkLaB2DLCdndw==
X-Received: by 2002:a17:906:6953:b0:931:c6ba:8619 with SMTP id c19-20020a170906695300b00931c6ba8619mr6028801ejs.72.1679228940261;
        Sun, 19 Mar 2023 05:29:00 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id qx20-20020a170906fcd400b008eaf99be56esm3262695ejb.170.2023.03.19.05.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:28:59 -0700 (PDT)
Message-ID: <1f352445-4677-e33b-be14-c76bd7ffa188@linaro.org>
Date:   Sun, 19 Mar 2023 13:28:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/6] dt-bindings: soc: starfive: syscon: Add optional
 patternProperties
Content-Language: en-US
To:     Xingyu Wu <xingyu.wu@starfivetech.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Conor Dooley <conor@kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        William Qiu <william.qiu@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230316030514.137427-1-xingyu.wu@starfivetech.com>
 <20230316030514.137427-4-xingyu.wu@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230316030514.137427-4-xingyu.wu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/03/2023 04:05, Xingyu Wu wrote:
> Add optional compatible and patternProperties.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 39 ++++++++++++++++---
>  1 file changed, 33 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> index ae7f1d6916af..b61d8921ef42 100644
> --- a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> @@ -15,16 +15,31 @@ description: |
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - starfive,jh7110-aon-syscon
> -          - starfive,jh7110-stg-syscon
> -          - starfive,jh7110-sys-syscon
> -      - const: syscon
> +    oneOf:
> +      - items:
> +          - enum:
> +              - starfive,jh7110-aon-syscon
> +              - starfive,jh7110-stg-syscon
> +              - starfive,jh7110-sys-syscon
> +          - const: syscon
> +      - items:
> +          - enum:
> +              - starfive,jh7110-aon-syscon
> +              - starfive,jh7110-stg-syscon
> +              - starfive,jh7110-sys-syscon
> +          - const: syscon
> +          - const: simple-mfd
>  
>    reg:
>      maxItems: 1
>  
> +patternProperties:
> +  # Optional children
> +  "pll-clock-controller":

It's not a pattern.

Anyway should be clock-controller

> +    type: object
> +    $ref: /schemas/clock/starfive,jh7110-pll.yaml#
> +    description: Clock provider for PLL.
> +

You just added these bindings! So the initial submission was incomplete
on purpose?

No, add complete bindings.

>  required:
>    - compatible
>    - reg
> @@ -38,4 +53,16 @@ examples:
>          reg = <0x10240000 0x1000>;
>      };
>  
> +  - |
> +    syscon@13030000 {

No need for new example... Just put it in existing one.


Best regards,
Krzysztof

