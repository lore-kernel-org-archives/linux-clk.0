Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1A9C11F65
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 17:26:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CAEB61474
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 17:26:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhF3R3T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jun 2021 13:29:19 -0400
Received: from mail-vs1-f47.google.com ([209.85.217.47]:35360 "EHLO
        mail-vs1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbhF3R3T (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Jun 2021 13:29:19 -0400
Received: by mail-vs1-f47.google.com with SMTP id x141so2162469vsx.2;
        Wed, 30 Jun 2021 10:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M1cCBRypI1mmkFDcRxzMzhSsB1YMOSDyt5G6Iq5VbjQ=;
        b=tOakKMJ+Pka3MJkIPk3i1rNgNouGtd7e+NVnMJlYGqw/6iJnGdOUWM5CuAr7FHdozC
         65khFjgWmX9HXC2441Vn98QJ7zVHxBWH156RJxsPKwtxQk6pzFyQdjCBuLZtrdTlFFYH
         BNU0clMLN5yKUd3UkqQ+mhC806jjECpvfwMgkbH7s2aZpuxdI0CRGuEO9WEUHaCgmUZo
         ma/Q77fZPvr3et88dZbxDRJ6ei0puJD1yMTbyAd5DiAF0ohZHaIqB8KaNLBXAsG7ouF1
         bi75vH8Vctt4gpelArIThXo6SkkZqGOdVR4ozcTYY8m/z08Mk7F5KB+q/HVUEAjYvboA
         +9yg==
X-Gm-Message-State: AOAM533s1vR1g+fkGOEWwxhlZlzXWMmaF/uLMtytPZNMavY0swEgG1bH
        2hlLM3VY92hx4sI5cRoJKpqPsu6pZAHLrYEzUG4=
X-Google-Smtp-Source: ABdhPJyO/7Hv/uqbkT5lDAiumosw2G4sYTWyajEZ5JvFt9CW0sAOHu6sC9GxNjZOhlHdt9K7O16m1WSlzW3SPgOZtRw=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr31358417vsd.42.1625074009720;
 Wed, 30 Jun 2021 10:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210528134308.649769-1-daire.mcnamara@microchip.com> <20210528134308.649769-2-daire.mcnamara@microchip.com>
In-Reply-To: <20210528134308.649769-2-daire.mcnamara@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 30 Jun 2021 19:26:38 +0200
Message-ID: <CAMuHMdV=p_HD4VYa3jz8-zfvih-ZR=Kg_8Ye9YDc6o=Z+uyG8A@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: clk: microchip: Add Microchip
 PolarFire host binding
To:     daire.mcnamara@microchip.com
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        cyril.jean@microchip.com, padmarao.begari@microchip.com,
        lewis.hanly@microchip.com, conor.dooley@microchip.com,
        david.abdurachmanov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Daire,

On Fri, May 28, 2021 at 4:19 PM <daire.mcnamara@microchip.com> wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
>
> Add device tree bindings for the Microchip PolarFire system
> clock controller
>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>

Thanks for your patch!


> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/microchip,mpfs.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip PolarFire Clock Control Module Binding
> +
> +maintainers:
> +  - Daire McNamara <daire.mcnamara@microchip.com>
> +
> +description: |
> +  Microchip PolarFire clock control (CLKCFG) is an integrated clock controller,
> +  which gates and enables all peripheral clocks.
> +
> +  This device tree binding describes 33 gate clocks.  Clocks are referenced by
> +  user nodes by the CLKCFG node phandle and the clock index in the group, from
> +  0 to 32.
> +
> +properties:
> +  compatible:
> +    const: microchip,mpfs-clkcfg
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +    description: |
> +      The clock consumer should specify the desired clock by having the clock
> +      ID in its "clocks" phandle cell. See include/dt-bindings/clock/microchip,mpfs-clock.h
> +      for the full list of PolarFire clock IDs.
> +
> +  clock-output-names:
> +    maxItems: 33

Do you need clock-output-names?
From a quick glance, the driver doesn't seem to need it.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'
> +  - clock-output-names
> +
> +additionalProperties: false
> +
> +examples:
> +  # Clock Config node:
> +  - |
> +    #include <dt-bindings/clock/microchip,mpfs-clock.h>
> +    soc {
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +            clkcfg: clock-controller@20002000 {
> +                compatible = "microchip,mpfs-clkcfg";
> +                reg = <0x0 0x20002000 0x0 0x1000>;
> +                clocks = <&ref>;
> +                #clock-cells = <1>;
> +                clock-output-names = "cpu", "axi", "ahb", "envm", "mac0", "mac1", "mmc", "timer",
> +                                     "mmuart0", "mmuart1", "mmuart2", "mmuart3", "mmuart4",
> +                                     "spi0", "spi1", "i2c0", "i2c1", "can0", "can1", "usb", "rsvd",
> +                                     "rtc", "qspi", "gpio0", "gpio1", "gpio2", "ddrc",
> +                                     "fic0", "fic1", "fic2", "fic3", "athena", "cfm";
> +        };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
