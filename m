Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C130EB64DA
	for <linux-clk@archiver.kernel.org>; Wed, 19 Jul 2023 15:45:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbjGSPpr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Jul 2023 11:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231502AbjGSPpq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Jul 2023 11:45:46 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DDC32111
        for <linux-clk@vger.kernel.org>; Wed, 19 Jul 2023 08:45:34 -0700 (PDT)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E64A43F230
        for <linux-clk@vger.kernel.org>; Wed, 19 Jul 2023 15:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1689781532;
        bh=bJD7aE/rIe6c3FFU/UVaWfG6cXGm2QJmqrPvjRg5gaY=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=Z2JJId5Ku9Bc5CRpk8AGAjyCA68XgukimWXd8dS9ZLaXui/jn0NBQC+JNIxvmlDqB
         rLa8W6GT+JvG03K/oj1I3DdXUK8ioPIMOY7YUSQbqLnnaTJXLtSAeUhSKWp/UqDVMO
         i+cjHeiwhovbXZ5c6lEapJHUBPriMmsnYRhJhuCWachAsISf3/woYFbCbNdBN0PjKg
         RTTN+YzUDHL9kzVn3fdmivpJY+gaD4myWRkQ4UvXSAWFCYGJFVoIjtkmyjtzQT1mfg
         eJqGY48oza+9exRjmcvjI3KcdbPu4zqikhcZY4u/JNfqRlOXK49mXes6cEnSm9v48N
         spmMpuk1Bzxhg==
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-765a44ce88aso78889285a.1
        for <linux-clk@vger.kernel.org>; Wed, 19 Jul 2023 08:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689781531; x=1690386331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bJD7aE/rIe6c3FFU/UVaWfG6cXGm2QJmqrPvjRg5gaY=;
        b=OhkCOeJrVuLD03SjeioHnVXEII5o1V0d2YWq4UvHbnI4WMZbxzAc4WTktq3wzteLes
         zqzGswmTwA1QG70lcvSms2G8sA3Mn5Ls5zjP3V166+MzalZTYzEgcckd/0cp4cQIt1WE
         rwxcfWYhU/dL2KmacuOqyXplJ7JFUDgkrnnpbCqlaXIMx/3nCMBfJUVNWibXmxA9KnUB
         r3rZLXLthw4umVxlEGM+29E4rIbPtzmA+QZ4CRv1ERR9DlgmAwlrOYm7t/xi9bXBdJLT
         SpTauWG0BwL49EZ/bQn1udgWj1Y5V0kw56uarlYdANLDVRN7eQf3FFrppY++ZsWu5nT1
         EOmQ==
X-Gm-Message-State: ABy/qLbvXr8d403p9cRT64Rcy/WUTF+Y4o+8qkQ3zfk2vV5ymNaiZdf5
        lxLeNE1N8Mz89Xl/tfbAn5VPSZqDy053Axqp96ESi6HeZpPl/eAHPUkab+CcSUE/a6hDAdjk2dA
        ouwTEB+kOyNUEKaZ7io2yH+Ui7XZ/Tnx/hPUnj/BuO4OnyVBa7L04LQ==
X-Received: by 2002:a05:620a:4155:b0:766:f972:73e1 with SMTP id k21-20020a05620a415500b00766f97273e1mr2968765qko.26.1689781531338;
        Wed, 19 Jul 2023 08:45:31 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEgOZHqVyytZCi4Dmyj+T4kdUCY46MCEOc5/aq2hMRc989Ipy34EdmzvPv2BTt9oGjxyPIrXj6QLDKGJmpUDGw=
X-Received: by 2002:a05:620a:4155:b0:766:f972:73e1 with SMTP id
 k21-20020a05620a415500b00766f97273e1mr2968746qko.26.1689781531078; Wed, 19
 Jul 2023 08:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230717023040.78860-1-xingyu.wu@starfivetech.com> <20230717023040.78860-2-xingyu.wu@starfivetech.com>
In-Reply-To: <20230717023040.78860-2-xingyu.wu@starfivetech.com>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Wed, 19 Jul 2023 17:45:14 +0200
Message-ID: <CAJM55Z_daAVJim+aS3DsWTv3RoG40p24qh-MZ92NgJHCVKN+3A@mail.gmail.com>
Subject: Re: [PATCH v7 1/7] dt-bindings: clock: Add StarFive JH7110 PLL clock generator
To:     Xingyu Wu <xingyu.wu@starfivetech.com>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Conor Dooley <conor@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        William Qiu <william.qiu@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 17 Jul 2023 at 04:30, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>
> Add bindings for the PLL clock generator on the JH7110 RISC-V SoC.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../bindings/clock/starfive,jh7110-pll.yaml   | 46 +++++++++++++++++++
>  .../dt-bindings/clock/starfive,jh7110-crg.h   |  6 +++
>  2 files changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml
>
> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml
> new file mode 100644
> index 000000000000..be8300ce86d0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/starfive,jh7110-pll.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 PLL Clock Generator
> +
> +description:
> +  These PLLs are high speed, low jitter frequency synthesizers in the JH7110.
> +  Each PLL works in integer mode or fraction mode, with configuration
> +  registers in the sys syscon. So the PLLs node should be a child of
> +  SYS-SYSCON node.
> +  The formula for calculating frequency is
> +  Fvco = Fref * (NI + NF) / M / Q1
> +
> +maintainers:
> +  - Xingyu Wu <xingyu.wu@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-pll
> +
> +  clocks:
> +    maxItems: 1
> +    description: Main Oscillator (24 MHz)
> +
> +  '#clock-cells':
> +    const: 1
> +    description:
> +      See <dt-bindings/clock/starfive,jh7110-crg.h> for valid indices.
> +
> +required:
> +  - compatible
> +  - clocks
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller {
> +      compatible = "starfive,jh7110-pll";
> +      clocks = <&osc>;
> +      #clock-cells = <1>;
> +    };
> diff --git a/include/dt-bindings/clock/starfive,jh7110-crg.h b/include/dt-bindings/clock/starfive,jh7110-crg.h
> index 06257bfd9ac1..3fb5e31c3be4 100644
> --- a/include/dt-bindings/clock/starfive,jh7110-crg.h
> +++ b/include/dt-bindings/clock/starfive,jh7110-crg.h
> @@ -6,6 +6,12 @@
>  #ifndef __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
>  #define __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
>
> +/* PLL clocks */
> +#define JH7110_PLLCLK_PLL0_OUT                 0
> +#define JH7110_PLLCLK_PLL1_OUT                 1
> +#define JH7110_PLLCLK_PLL2_OUT                 2
> +#define JH7110_PLLCLK_END                      3
> +
>  /* SYSCRG clocks */
>  #define JH7110_SYSCLK_CPU_ROOT                 0
>  #define JH7110_SYSCLK_CPU_CORE                 1
> --
> 2.25.1
>
