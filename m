Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0330C0015E
	for <linux-clk@archiver.kernel.org>; Wed,  5 Jul 2023 06:25:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231179AbjGEGZM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Jul 2023 02:25:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231428AbjGEGZL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Jul 2023 02:25:11 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB4E610F2
        for <linux-clk@vger.kernel.org>; Tue,  4 Jul 2023 23:25:09 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-51d9128494cso6007546a12.0
        for <linux-clk@vger.kernel.org>; Tue, 04 Jul 2023 23:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688538308; x=1691130308;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jbQGMdTbw1VFlYXzanej6yIJ3DkaHASr0zbCi4VfePk=;
        b=RtRwkjoh3Oi/VjkysiTdKtQf1CPqQVzAsfW1WngfNj9JnIjopxiExTvvGQJZU1TlRz
         zMv1YhNtcf504bANLr048uaOYpbi3CyKBxnyUnQWya1empjt6bmB/8CSuJXLT6zQ6a8N
         kVfzJZkHMwtykRdKj2T0XjtwqxU+ASlthp6tciOCr1EizXeeyAYWHyMYCIvibaWJh8T8
         kvH8YIJIQ3asLIm+2TughU33Tw+3lsLYGedtLuClvGWX6XlvN57pZ/MeZsSy8u1uZlMj
         TkLrLl8U6JfO0/urPWAAogXvoLlasLqu07BR74Hxz040SUq6RVwsbqvSX5fKHSvrUFa/
         GhdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688538308; x=1691130308;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jbQGMdTbw1VFlYXzanej6yIJ3DkaHASr0zbCi4VfePk=;
        b=KJSpImJca1lfRRLFHYvMe1AZjn1AnZHuBwy0hfz/Ym7A7w+p7hytzlItaBjsNhvICj
         kCM6GD302/RphSe70BBzFdWXjIhKP9HC6GKIN8Q8K3u4muiQidAxGvXx2+ubbeW42Tt2
         qLQh3tjz7esnIOi7Ds/tDnS8kA6B8CkHgtxcS6D4am86spL0ms4v3uXxn71Dn1g400cF
         Qpp9Ml7w9ylljv9nKpIlLN2gAEO+p7P5waPehbOP5qteAxH7u6x13Xe/VuGK+1vy3ODz
         g2qEq+xmpDsBCFEqQE1EPGYRPdXkSod458Ovqw0rI5TuyPQ+PWNRY1k1wYLLrCzqWiYk
         XFKw==
X-Gm-Message-State: ABy/qLadnpOI3X6Px4uBaW/hHrIF/1JLS0mVeYH9LYO9oBdIFjI8E9HL
        TU5UROABnT5K2DEF8NLMlKFWFg==
X-Google-Smtp-Source: APBJJlGDxvPTXXGTs9bR/9zAtcZojo1qjKRRrWQq2zyrzSFX8MC31jDSmw09BaJoLYajnWN/R9spmg==
X-Received: by 2002:aa7:c650:0:b0:51e:f1b:ae1a with SMTP id z16-20020aa7c650000000b0051e0f1bae1amr6226660edr.32.1688538308373;
        Tue, 04 Jul 2023 23:25:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id r26-20020aa7d15a000000b0051df54c6a27sm6246687edo.56.2023.07.04.23.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 23:25:07 -0700 (PDT)
Message-ID: <41ee8c5c-7a6f-04b2-9853-67fb6bdb67b3@linaro.org>
Date:   Wed, 5 Jul 2023 08:25:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: fsl,imx8-acm: Add audio clock
 mux support
Content-Language: en-US
To:     Shengjiu Wang <shengjiu.wang@nxp.com>, abelvesa@kernel.org,
        peng.fan@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        shengjiu.wang@gmail.com
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1688521839-3036-1-git-send-email-shengjiu.wang@nxp.com>
 <1688521839-3036-2-git-send-email-shengjiu.wang@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1688521839-3036-2-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/07/2023 03:50, Shengjiu Wang wrote:
> Add the clock dt-binding file for audio clock mux. which
> is the IP for i.MX8QM, i.MX8QXP, i.MX8DXL.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../bindings/clock/fsl,imx8-acm.yaml          | 159 ++++++++++++++++++
>  1 file changed, 159 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/fsl,imx8-acm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/fsl,imx8-acm.yaml b/Documentation/devicetree/bindings/clock/fsl,imx8-acm.yaml
> new file mode 100644
> index 000000000000..b79dd080c008
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/fsl,imx8-acm.yaml

nxp, because that's what you used in compatibles.

I don't see detailed changelog. What changed here?

> @@ -0,0 +1,159 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/fsl,imx8-acm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX8 Audio Clock Mux
> +
> +maintainers:
> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> +
> +description: |
> +  NXP i.MX8 Audio Clock Mux is dedicated clock muxing IP
> +  used to control Audio related clock on the SoC.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,imx8qm-acm
> +      - nxp,imx8qxp-acm
> +      - nxp,imx8dxl-acm
> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    description:
> +      List of phandle and PM domain specifier as documented in
> +      Documentation/devicetree/bindings/power/power_domain.txt

Drop description, it's redundant. I did not ask to add it.

Anyway, my comment is unanswered. Don't ignore the emails you receive.

Can someone provide rationale for this?

Best regards,
Krzysztof

