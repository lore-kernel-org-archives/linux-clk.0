Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456C5C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 23 Nov 2022 10:23:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237080AbiKWKXp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Nov 2022 05:23:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237468AbiKWKWG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Nov 2022 05:22:06 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91F9F208
        for <linux-clk@vger.kernel.org>; Wed, 23 Nov 2022 02:08:32 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id f13so5921874lfa.6
        for <linux-clk@vger.kernel.org>; Wed, 23 Nov 2022 02:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/6KnfI+9/uy7ITylHecTvTbunNR+ZrgdbZvYW8L95tE=;
        b=Z3GYxeYtlrpUJfiFGwuiU+qI838C6YNMSXBcHWKBD3OeHCuCpAlyNpJ8dlXJnsreT2
         ZHoxcAjO1+dtsBH+otG8+/Eio4ekhaqXw5Pf86DXPzHPYVI9FqurhcQ1tFCeKdeVHMeq
         HXZY1PF/BRopuElmeMKJ9v4BgMDgc7YOw3H/ofTFPFA9uadwEIdommTGe3+jGWihL9H6
         TSRxyjHtgKYP1s8pNCrOLghvCh9R8k+MlrpX/HlNjPaspZBPXSG3oYzAGvkJ/tbUdjdK
         DviI9Rv/n0Mik+Af52qds+pdsGXkSOY4Hp2Abdhx7PiTfKrygUxb6coVInzQhVxBrBKz
         J6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/6KnfI+9/uy7ITylHecTvTbunNR+ZrgdbZvYW8L95tE=;
        b=l6v1YB8LLTH3kHQ5pDc0SBBDSNBDojMGgZr8ZjgOc47UuFutTG7ryiavEXJrTlNoXq
         9+E0cmee0Aq2GgCvJoqOvyQtGnchqecJIYzfZPycWuB/PgfH/kcYN2UQjnOZ8BKCQN+k
         PkxOqGC/XUUAR1g2Kn6muS2w0IOSQq/HrPFzlK/hhowkwmf+tQHlxQ30iwPOvKMPLcZn
         sS0UR1uI7Tj5O8Z0XAJiNWrVD2oWd4b2IfZcqEP/4tLOAbWuKFjFoAGq28hwyC+LxpUD
         i09TFC8dYa17Q0pZw6Kxg987W0Ug0sewjpPC9UxlMTnculDj9gB0wNPvTnIzYcMXse/X
         t+OA==
X-Gm-Message-State: ANoB5pmmJly30SwsdxW3SMsYNvOZflAuEN1jbR9qLcGFcxDIRrwo3EHJ
        tcaDP4cMmQsT3FNXNa29bgFY3g==
X-Google-Smtp-Source: AA0mqf7ledULYqnBZnfQi9FuTJ2ZzfaNniMGFoQ0mm+yVXMomPygKM0YjBxAcGyJgZZx2qeB1bwHQw==
X-Received: by 2002:ac2:58d9:0:b0:4b3:ccea:9b2e with SMTP id u25-20020ac258d9000000b004b3ccea9b2emr10307267lfo.379.1669198110899;
        Wed, 23 Nov 2022 02:08:30 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id d18-20020a2e8912000000b002770eafaafbsm2199487lji.99.2022.11.23.02.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 02:08:30 -0800 (PST)
Message-ID: <f03f331a-5666-298e-a1a2-bdb9bab11a48@linaro.org>
Date:   Wed, 23 Nov 2022 11:08:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH V5 1/4] clk: meson: S4: add support for Amlogic S4 SoC PLL
 clock driver and bindings
Content-Language: en-US
To:     Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     kelvin.zhang@amlogic.com
References: <20221123021346.18136-1-yu.tu@amlogic.com>
 <20221123021346.18136-2-yu.tu@amlogic.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221123021346.18136-2-yu.tu@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/11/2022 03:13, Yu Tu wrote:
> Add the S4 PLL clock controller found and bindings in the s4 SoC family.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,s4-pll-clkc.yaml   |  51 +

This is v5 and still bindings are here? Bindings are always separate
patches. Use subject prefixes matching the subsystem (git log --oneline
-- ...).

And this was split, wasn't it? What happened here?!?


>  MAINTAINERS                                   |   1 +
>  drivers/clk/meson/Kconfig                     |  13 +
>  drivers/clk/meson/Makefile                    |   1 +
>  drivers/clk/meson/s4-pll.c                    | 875 ++++++++++++++++++
>  drivers/clk/meson/s4-pll.h                    |  88 ++
>  .../dt-bindings/clock/amlogic,s4-pll-clkc.h   |  30 +
>  7 files changed, 1059 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
>  create mode 100644 drivers/clk/meson/s4-pll.c
>  create mode 100644 drivers/clk/meson/s4-pll.h
>  create mode 100644 include/dt-bindings/clock/amlogic,s4-pll-clkc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
> new file mode 100644
> index 000000000000..fd517e8ef14f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/amlogic,s4-pll-clkc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson S serials PLL Clock Controller
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +  - Yu Tu <yu.hu@amlogic.com>
> +
One blank line.

> +
> +properties:
> +  compatible:
> +    const: amlogic,s4-pll-clkc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: xtal
> +
> +  "#clock-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - "#clock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clkc_pll: clock-controller@fe008000 {
> +      compatible = "amlogic,s4-pll-clkc";
> +      reg = <0xfe008000 0x1e8>;
> +      clocks = <&xtal>;
> +      clock-names = "xtal";
> +      #clock-cells = <1>;
> +    };


> +#endif /* __MESON_S4_PLL_H__ */
> diff --git a/include/dt-bindings/clock/amlogic,s4-pll-clkc.h b/include/dt-bindings/clock/amlogic,s4-pll-clkc.h
> new file mode 100644
> index 000000000000..345f87023886
> --- /dev/null
> +++ b/include/dt-bindings/clock/amlogic,s4-pll-clkc.h

This belongs to bindings patch, not driver.

> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> +/*
> + * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
> + * Author: Yu Tu <yu.tu@amlogic.com>
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_AMLOGIC_S4_PLL_CLKC_H
> +#define _DT_BINDINGS_CLOCK_AMLOGIC_S4_PLL_CLKC_H
> +
> +/*
> + * CLKID index values
> + */
> +
> +#define CLKID_FIXED_PLL			1
> +#define CLKID_FCLK_DIV2			3

Indexes start from 0 and are incremented by 1. Not by 2.

NAK.

Best regards,
Krzysztof

