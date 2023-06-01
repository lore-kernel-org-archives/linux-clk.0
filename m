Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA12CC77B7A
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jun 2023 06:40:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231268AbjFAGkN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Jun 2023 02:40:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231799AbjFAGkM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Jun 2023 02:40:12 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18F3012C
        for <linux-clk@vger.kernel.org>; Wed, 31 May 2023 23:40:10 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51492ae66a4so772917a12.1
        for <linux-clk@vger.kernel.org>; Wed, 31 May 2023 23:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685601608; x=1688193608;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Cv6JOLKqyraaAJ1veDO2EfbDEnH0qDmoSmkFEbJxzU=;
        b=rGULAy8o6ltpYLKvIWAp6dbZn/AbKY9W5TZa/ke5vYz4397NkfiwVXAd3rniVX3jnb
         P3tBKaU08bTKi8Lb7UbGlLPzPGo6NJV+Gr+cMwH7n1Z2OnA6VayOZOFZer87sN5bj7wV
         lvm28mS+XzC5qHqaoWh2WlA0d34xqq7bVhx1U1RcAu4sAhKLuICvynoxV05PYZKglk+a
         LwtfnDkJWN3OxdOZlFjAacxmYEBPjSK/HUuwnf04wKFy7AMd8LEn50DgdNMggEuevjTe
         pxxZNaALd73mZl6EUtZUnd4uSWuJyberrCZpraXR09M2r7n1oqCxAGOv/zqy4qch1B8P
         ZSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685601608; x=1688193608;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Cv6JOLKqyraaAJ1veDO2EfbDEnH0qDmoSmkFEbJxzU=;
        b=T0IHokAErPI16pg+pYGc0ru7rL9Vex5UquomREKqOF38dPpSqXYHxsd5wmtCio9tDY
         Mfn/4GzNsJ2iFahjVG7GpV3xOV4tYNkT/K6ndrVMnAkb6in5t7UmL88g/30lM7qr9SFK
         /Uvy4O3KU/ceDR46ye5IJcaQjMCW3tEyS8ktY5LqB/wddkBc7KZ7w7Ouzl9Vgs14LT9I
         dYmoa4WkiYPJ4R+55vd04VUGTSpBLK9D/gDODtJUjcEmKslqnRxKFKSQABCGCY0+RCR6
         3kDruvaayJ67Uo/rvtqBfPOdgjUoQzvF8XvqqJnyt6ByYzrRJFE9hJD1uNPTBCFf7v7j
         tCDA==
X-Gm-Message-State: AC+VfDzgQQA9kGG5Xg52FAgGKqwbvRu4RGxA6xOLT7ElKXISLKd8/yH9
        NWiYUTgsE5JuhdC6eTJ5/8Uh4A==
X-Google-Smtp-Source: ACHHUZ6irEqbHsAc+m1c3TXDwUEB0JblM1p8azIRxgoVEdZK5OgrTJxaZdnjwZJYFqEYXfpAyj4MLw==
X-Received: by 2002:a05:6402:1252:b0:514:97f4:8401 with SMTP id l18-20020a056402125200b0051497f48401mr5581425edw.21.1685601608491;
        Wed, 31 May 2023 23:40:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id b13-20020a056402138d00b0050690bc07a3sm6841935edv.18.2023.05.31.23.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 23:40:08 -0700 (PDT)
Message-ID: <cbe93a8b-bb48-d5f4-38cd-eb63792cff14@linaro.org>
Date:   Thu, 1 Jun 2023 08:40:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 04/43] dt-bindings: clock: Add Cirrus EP93xx
Content-Language: en-US
To:     Nikita Shubin <nikita.shubin@maquefel.me>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Michael Peters <mpeters@embeddedTS.com>,
        Kris Bahnsen <kris@embeddedTS.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
 <20230601053546.9574-5-nikita.shubin@maquefel.me>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230601053546.9574-5-nikita.shubin@maquefel.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 01/06/2023 07:33, Nikita Shubin wrote:
> This adds device tree bindings for the Cirrus Logic EP93xx
> clock block used in these SoCs.
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> ---
> 
> Notes:
>     v0 -> v1:
>     
>     - it's now a clock controller
> 
>  .../bindings/clock/cirrus,ep9301.yaml         | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/cirrus,ep9301.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/cirrus,ep9301.yaml b/Documentation/devicetree/bindings/clock/cirrus,ep9301.yaml
> new file mode 100644
> index 000000000000..4f9e0d483698
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/cirrus,ep9301.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/cirrus,ep9301.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cirrus Logic ep93xx SoC's clock controller
> +
> +maintainers:
> +  - Nikita Shubin <nikita.shubin@maquefel.me>
> +  - Alexander Sverdlin <alexander.sverdlin@gmail.com>
> +
> +description: |
> +  Cirrus Logic EP93XX SoC clocks driver bindings. The clock

First sentence is not suitable for bindings. Describe the hardware or
skip it.

> +  controller node must be defined as a child node of the ep93xx
> +  system controller node.
> +

parent schema should define it...

Best regards,
Krzysztof

