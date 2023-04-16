Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 938CCC77B61
	for <linux-clk@archiver.kernel.org>; Sun, 16 Apr 2023 17:41:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbjDPRlw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 16 Apr 2023 13:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjDPRlv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 16 Apr 2023 13:41:51 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC23392
        for <linux-clk@vger.kernel.org>; Sun, 16 Apr 2023 10:41:49 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id dx24so14393759ejb.11
        for <linux-clk@vger.kernel.org>; Sun, 16 Apr 2023 10:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681666908; x=1684258908;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0TFYSfH8+ws46fuXUrsraGF/WbVUM81FcswEVKLOzE0=;
        b=zGUt77Nt3Ke58fpugP8tk7eyMiZAJYs9crvE5OyMqwQvCPggP92vew9caOdPVXK5CE
         8bQOWTpRiVvrzEyvsBL5+I8nAyyBiz4SVI4RfLqzqeXZ6ta7j2USay0q+28Wn9OInd4O
         jRHTT+LNldL7uMlanrSUX8p+C92tOaj2HKZoFpNZq/Z7hbRyU80IO5Roi+B1BJu4UBuz
         R8D2+VyW75ujfw9YJHvoJdB3EFKfIqXDSnZcKenmuWXA0UP3TEXBKTF20ON3ChzeTYbh
         QpWcRC6D4tzaomVM92EYx3vsv/GH2iW8xO+z3yuN1PbSa4k6qO6gfj+dFmPaCfk03XF6
         dBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681666908; x=1684258908;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0TFYSfH8+ws46fuXUrsraGF/WbVUM81FcswEVKLOzE0=;
        b=RPjiHzRXF3nBY2Ag/Oq8pfkHcuOpUAaAgqIy5IX9lRduUDIOSWE4V58oGdqfazinX4
         wYerdULJHakgH3up+rxPb7FXScoh0SXMGV6s7L7mW6prvp4x2GTMkBYOhctu6nQx9m9I
         c/u9nqRJYZvNTgz6MEloBd0NV4yYQ4mD/1U3KyLG7bO6RcXfqi3FXiWYyT6S/X1p5V53
         rkQ2zYphNK3TKGZvb05lu3O0XXn4Z6NK6x8jdFVD+q/j38KywJusVUivVAeLS7jN/wm4
         IBaItKurh90LYDbKLpYWtK0gLuZizcLKhEwlgooJVh9FT2btF2mBfxNSAex+y1M0O6Sk
         KCNA==
X-Gm-Message-State: AAQBX9dRdYX6IZoWcOhlOKFb+EIxX/2KzVwJhmL0gXHkgVD01udMIP+X
        Pp3f5kqrSHLrxGiQI+UGbaYDTA==
X-Google-Smtp-Source: AKy350a/8PY8a2YVI8GdLCQ7ix4ebkvi5A/K90DMd7YGCjwVznwyTgAO0GZk8kwre3YirgUfUSW8Lg==
X-Received: by 2002:a17:906:c407:b0:94e:732f:a594 with SMTP id u7-20020a170906c40700b0094e732fa594mr6906012ejz.23.1681666908202;
        Sun, 16 Apr 2023 10:41:48 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f9e3:1d38:66a7:ae92? ([2a02:810d:15c0:828:f9e3:1d38:66a7:ae92])
        by smtp.gmail.com with ESMTPSA id kt2-20020a170906aac200b0094f6458157csm819160ejb.223.2023.04.16.10.41.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 10:41:47 -0700 (PDT)
Message-ID: <8b3ea617-8d4e-cf0b-1cb2-d02405c39487@linaro.org>
Date:   Sun, 16 Apr 2023 19:41:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 3/4] dt-bindings: clock: Add gate-clock
Content-Language: en-US
To:     David Yang <mmyangfl@gmail.com>, linux-clk@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        gate-clock@cc.3
References: <20230416173302.1185683-1-mmyangfl@gmail.com>
 <20230416173302.1185683-4-mmyangfl@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230416173302.1185683-4-mmyangfl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/04/2023 19:33, David Yang wrote:
> Add DT bindings documentation for gate-clock, which can gate its output.
> 
> Signed-off-by: David Yang <mmyangfl@gmail.com>
> ---
>  .../devicetree/bindings/clock/gate-clock.yaml | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/gate-clock.yaml

Where is the changelog? What happened here?

> 
> diff --git a/Documentation/devicetree/bindings/clock/gate-clock.yaml b/Documentation/devicetree/bindings/clock/gate-clock.yaml
> new file mode 100644
> index 000000000000..3c993cb7e9bb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/gate-clock.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/gate-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Clock which can gate its output
> +
> +maintainers:
> +  - David Yang <mmyangfl@gmail.com>
> +
> +description: |
> +  Clock which can gate its output.
> +
> +  The registers map is retrieved from the parental dt-node. So the clock node
> +  should be represented as a sub-node of a "clock-controller" node.

If this is supposed to be used in parent schema, then reference it there.

> +
> +  See also: linux/clk-provider.h

How is this related to hardware? Also, referencing linux headers is
usually not good idea for bindings.
> +
> +properties:
> +  compatible:
> +    const: gate-clock
> +
> +  '#clock-cells':
> +    const: 0
> +
> +  clocks:
> +    maxItems: 1
> +    description: Parent clock.
> +
> +  offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Offset in the register map for the control register (in bytes).
> +
> +  bits:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Bit index which controls the output.
> +
> +  clock-output-names:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - '#clock-cells'
> +  - offset
> +  - bits
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gate-clock@cc.3 {

So you keep ignoring the comments... I don't know what happened here but
this code for sure looks wrong.

Did you test the changes?

Best regards,
Krzysztof

