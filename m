Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0588C41513
	for <linux-clk@archiver.kernel.org>; Sat, 22 Jul 2023 09:23:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbjGVJXO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 22 Jul 2023 05:23:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjGVJXN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 22 Jul 2023 05:23:13 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 999BA2704
        for <linux-clk@vger.kernel.org>; Sat, 22 Jul 2023 02:23:11 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso2095125f8f.0
        for <linux-clk@vger.kernel.org>; Sat, 22 Jul 2023 02:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690017790; x=1690622590;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XT0YJwA5wpgSh6StJpWCXO4kO37kVk1+EeRpL2QWvQg=;
        b=Pfehy92aCJXBtpRKzQtpThMxokjeL6Ic1k6Ueq7iZYeTyvAtMWgFloMV+YjwCKqF8i
         j5sqoOIYq/BfxqdTdoq1J6lR/+EODlVlM9D7F632Xbahl43rTHNbVoYI17rT894cTwyo
         2nVNNJhX8NRJ119IGZvtIF6ZKum9mg/7MY8ig00FJu/W59avstexgBM7KiX/H6GY29UJ
         WCegQaw3u+J0rWCut9Y4/KmpSd5tbP7VNSNsWDjMK+sdwdDmA2MnsLQhQi5QYo2+Oy9m
         L0IP1t/M/Zy19wzDbkEMVoqDHq6IUeXMP4r9mH0hgkI0sX7IP22v3zmQhm3DLsQ7yy1x
         ARnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690017790; x=1690622590;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XT0YJwA5wpgSh6StJpWCXO4kO37kVk1+EeRpL2QWvQg=;
        b=MPSADrqI8RpvJ5Jy2jv5Gy0vBhKIcg4Vsi2QqpPi4oj1FUqesTNIv9RYnhlB5nvhth
         g4CyM9N3CZ2G/Ob3J+oyzwG64/Mh26OzCfxDk2tRWmHlXqT/LjU7DvzX1D/Tjz1zPWr+
         5sfRXzkHNz1qocKBWUzq3mU0InAC3qTI//dXaXaGPVMDlVJRgJ7pt9e4TUU9olOWNoaG
         jiGO3E+MPFZFcISU+qv+oL32+lvHnIiO96zlMsYCwL+AJN9CTkRnfXopnr5WYkv1r5YV
         srbwiN4rsEwwSW+rtGQTYzVRSkmy7plqalIeDUgsRR6rI9BPqTMa4nLUJY4UPJ35GcfP
         la/A==
X-Gm-Message-State: ABy/qLaOyfMrudLp+4OfJozcu2FUeDBioqok2lpxGT4Hs9Yj6HmeysT5
        fhiWC6Sq58p7Jc95tD8iushmUA==
X-Google-Smtp-Source: APBJJlEnLE1qzuS1Tfe9PmJ2bcAEPtnmhDzQJf77UYJ0uwmIPXcyl539LotgSBUbG/F5DzqS4zABJw==
X-Received: by 2002:a05:6000:545:b0:313:f862:6e3e with SMTP id b5-20020a056000054500b00313f8626e3emr2787726wrf.40.1690017790136;
        Sat, 22 Jul 2023 02:23:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id n8-20020adfe348000000b00315af025098sm6432802wrj.46.2023.07.22.02.23.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jul 2023 02:23:09 -0700 (PDT)
Message-ID: <2067e0ec-0c5c-4f0f-6b1e-c084a3e433f4@linaro.org>
Date:   Sat, 22 Jul 2023 11:23:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 06/10] dt-bindings: clock: Add documentation for Marvell
 PXA1908
Content-Language: en-US
To:     =?UTF-8?Q?Duje_Mihanovi=c4=87?= <duje.mihanovic@skole.hr>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        afaerber@suse.com
References: <20230721210042.21535-1-duje.mihanovic@skole.hr>
 <20230721210042.21535-7-duje.mihanovic@skole.hr>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230721210042.21535-7-duje.mihanovic@skole.hr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/07/2023 22:37, Duje Mihanović wrote:
> Add dt bindings and documentation for Marvell PXA1908's clock controller
> blocks.
> 
> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
> ---
>  .../bindings/clock/marvell,pxa1908.yaml       | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml b/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
> new file mode 100644
> index 000000000000..3fa6f00a26f7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/marvell,pxa1908.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell PXA1908 Clock Controllers
> +
> +maintainers:
> +  - Duje Mihanović <duje.mihanovic@skole.hr>
> +
> +description: |
> +  The PXA1908 clock subsystem generates and supplies clock to various
> +  controllers within the PXA1908 SoC. The PXA1908 contains numerous clock
> +  controller blocks, with the ones currently supported being APBC, APBCP, MPMU
> +  and APMU roughly corresponding to internal buses.
> +
> +  Each clock is assigned an identifier and client nodes use this identifier to
> +  specify the clock which they consume.

Drop this sentence, it's obvious.

> +
> +  All these identifiers could be found in <include/dt-bindings/marvell,pxa1908.h>.

"Clock identifiers ..."

> +
> +properties:
> +  compatible:
> +    enum:
> +      - marvell,pxa1908-apbc
> +      - marvell,pxa1908-apbcp
> +      - marvell,pxa1908-mpmu
> +      - marvell,pxa1908-apmu

Blank line

> +  reg:
> +    maxItems: 1
> +    description: |
> +      Physical address of the clock controller and length of the memory mapped
> +      region.

Drop description, it is obvious.

> +
> +  '#clock-cells':
> +    const: 1

Best regards,
Krzysztof

