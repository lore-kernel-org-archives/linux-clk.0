Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B37E9C433ED
	for <linux-clk@archiver.kernel.org>; Fri, 30 Apr 2021 21:10:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 82E0F6145A
	for <linux-clk@archiver.kernel.org>; Fri, 30 Apr 2021 21:10:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232008AbhD3VK7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Apr 2021 17:10:59 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:41932 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231328AbhD3VK7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Apr 2021 17:10:59 -0400
Received: by mail-ot1-f41.google.com with SMTP id z20-20020a0568301294b02902a52ecbaf18so13276321otp.8;
        Fri, 30 Apr 2021 14:10:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sswChY2P0nqjxXFrW42RNty2PYxS8JkopFLHAkVrfB0=;
        b=R2OaDe+1CLgEZdocsTfcSczovHE8su5hguewrnFgLB64Dz1fnscUxLCT3QyrOXDtKw
         h4Nv+zxmxIfwHnU/GNppsttUu22NjaIVHdVxLkPBRWUoVmfw7juEHObjAYNOZzVzMlMD
         79on+B9qpCTv4eMIO5O6CT61pXAh/IbiQKPLAY6/BUWP4L3JRKD9R0onPsxDe2JBvlmO
         +CZeJ58a9mI0L3ku1W+0QFMY0VBx5Xm3D4plSo4ed5+lQLG691NQ1IPXMkZMkAKVnWhE
         nLt58dp1KRdrOkcXglw2kRxzvEFJrBj+IcF/wYriFBRs744Oh51lC73zXxRXaX1oITiB
         LFPA==
X-Gm-Message-State: AOAM530MpXjtdvER8R6+tkZmlokICiftxuSNEoF1uZ85O1N2bhI9LzzM
        r3WdlibCEGx92OyDM/Gm6A==
X-Google-Smtp-Source: ABdhPJxX6Rb9ZzLj2PQQ9tOwDld+yMQzmYvHHxuqicc8mlUmSISqX0kULKcMPfdiI30ctxndufi4pQ==
X-Received: by 2002:a9d:5c11:: with SMTP id o17mr5164707otk.178.1619817009304;
        Fri, 30 Apr 2021 14:10:09 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v3sm1049855oov.47.2021.04.30.14.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 14:10:08 -0700 (PDT)
Received: (nullmailer pid 3898621 invoked by uid 1000);
        Fri, 30 Apr 2021 21:10:07 -0000
Date:   Fri, 30 Apr 2021 16:10:07 -0500
From:   Rob Herring <robh@kernel.org>
To:     daire.mcnamara@microchip.com
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        palmer@dabbelt.com, cyril.jean@microchip.com,
        padmarao.begari@microchip.com, lewis.hanly@microchip.com,
        conor.dooley@microchip.com, david.abdurachmanov@gmail.com
Subject: Re: [PATCH v4 1/2] dt-bindings: clk: microchip: Add Microchip
 PolarFire host binding
Message-ID: <20210430211007.GA3819778@robh.at.kernel.org>
References: <20210428122711.2136467-1-daire.mcnamara@microchip.com>
 <20210428122711.2136467-2-daire.mcnamara@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210428122711.2136467-2-daire.mcnamara@microchip.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Apr 28, 2021 at 01:27:10PM +0100, daire.mcnamara@microchip.com wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
> 
> Add device tree bindings for the Microchip PolarFire system
> clock controller
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  .../bindings/clock/microchip,mpfs.yaml        | 73 +++++++++++++++++++
>  .../dt-bindings/clock/microchip,mpfs-clock.h  | 45 ++++++++++++
>  2 files changed, 118 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
>  create mode 100644 include/dt-bindings/clock/microchip,mpfs-clock.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
> new file mode 100644
> index 000000000000..a4756480a8ec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
> @@ -0,0 +1,73 @@
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
> +  This device tree binding describes 32 gate clocks.  Clocks are referenced by
> +  user nodes by the CLKCFG node phandle and the clock index in the group, from
> +  0 to 31.
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
> +    maxItems: 32
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
> +            ref: refclk {
> +                compatible = "fixed-clock";
> +                #clock-cells = <0>;
> +                clock-frequency = <600000000>;
> +                clock-output-names = "msspllclk";
> +            };

This belongs at the top level. Or just omit it.

> +            clkcfg: clock-controller@20002000 {
> +                compatible = "microchip,mpfs-clkcfg";
> +                reg = <0x0 0x20002000 0x0 0x1000>;
> +                clocks = <&ref>;
> +                #clock-cells = <1>;
> +                clock-output-names = "cpu", "axi", "ahb", "envm", "mac0", "mac1", "mmc", "timer",
> +                                     "mmuart0", "mmuart1", "mmuart2", "mmuart3", "mmuart4",
> +                                     "spi0", "spi1", "i2c0", "i2c1", "can0", "can1", "usb", "rtc",
> +                                     "qspi", "gpio0", "gpio1", "gpio2", "ddrc",
> +                                     "fic0", "fic1", "fic2", "fic3", "athena", "cfm";
> +        };
> +    };
> diff --git a/include/dt-bindings/clock/microchip,mpfs-clock.h b/include/dt-bindings/clock/microchip,mpfs-clock.h
> new file mode 100644
> index 000000000000..d217b039a873
> --- /dev/null
> +++ b/include/dt-bindings/clock/microchip,mpfs-clock.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

Dual license please.

> +/*
> + * Daire McNamara,<daire.mcnamara@microchip.com>
> + * Copyright (C) 2020 Microchip Technology Inc.  All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_
> +#define _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_
> +
> +#define CLK_CPU	0
> +#define CLK_AXI	1
> +#define CLK_AHB	2
> +
> +#define CLK_ENVM	3
> +#define CLK_MAC0	4
> +#define CLK_MAC1	5
> +#define CLK_MMC	6
> +#define CLK_TIMER	7
> +#define CLK_MMUART0	8
> +#define CLK_MMUART1	9
> +#define CLK_MMUART2	10
> +#define CLK_MMUART3	11
> +#define CLK_MMUART4	12
> +#define CLK_SPI0	13
> +#define CLK_SPI1	14
> +#define CLK_I2C0	15
> +#define CLK_I2C1	16
> +#define CLK_CAN0	17
> +#define CLK_CAN1	18
> +#define CLK_USB	19
> +#define CLK_RESERVED	20
> +#define CLK_RTC	21
> +#define CLK_QSPI	22
> +#define CLK_GPIO0	23
> +#define CLK_GPIO1	24
> +#define CLK_GPIO2	25
> +#define CLK_DDRC	26
> +#define CLK_FIC0	27
> +#define CLK_FIC1	28
> +#define CLK_FIC2	29
> +#define CLK_FIC3	30
> +#define CLK_ATHENA	31
> +#define CLK_CFM	32

I thought it was 0-31 clocks?

> +
> +#endif	/* _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_ */
> -- 
> 2.25.1
> 
