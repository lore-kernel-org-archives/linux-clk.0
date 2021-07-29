Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01423C4320E
	for <linux-clk@archiver.kernel.org>; Thu, 29 Jul 2021 18:55:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0E5760F6F
	for <linux-clk@archiver.kernel.org>; Thu, 29 Jul 2021 18:55:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231594AbhG2Sza (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Jul 2021 14:55:30 -0400
Received: from mail-io1-f48.google.com ([209.85.166.48]:45947 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231475AbhG2Sz3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Jul 2021 14:55:29 -0400
Received: by mail-io1-f48.google.com with SMTP id l126so8430878ioa.12;
        Thu, 29 Jul 2021 11:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=N5HQJNffQhFc+K7rZRG2l6Sl7paEKGLe+E3AH1r857E=;
        b=UawhYtTze828VUok10r0/7DICPRZdGk1/LMb/OzCI+i9rjlPHmqB5ytcrJUyFFuId6
         z8BaGrJClk4UYnZFEnD2okWvOkis5jyHAFkRjnjeFILEy71P27YJOWzVcXGv9UN14HRy
         rdZJnRjRJ0JofZwqmXgpz7A4rVYup9JkS0G/oxcho2LnHeNQm2kHHOvBcF/svq5YWnJu
         IZd0na50AyjcfxxUPqah6MoOTUJq4Uo+rv8pl7Oz6J/axiZyV+Nzw2bxtvJMIK4JX048
         g1r1MpuDNLBbqrYkl9RPAW3Io7UcHWgihIkcCMz49HsNy4/YcWrKLHKJIivfjzjpN6qV
         61dQ==
X-Gm-Message-State: AOAM532ankn5FglHydOJ98LhKMd7EM87llaCp5O6qnhfqM9wd/ZP4HID
        JM56dUAYYZGUUY+shmq66w==
X-Google-Smtp-Source: ABdhPJxUw2c4O+y9uR5m/u13d7fpFerjUtdc2sxKB90UeO9WWhGT2afU+Lm2nBPKLdTMW0anzD9pwg==
X-Received: by 2002:a05:6638:3452:: with SMTP id q18mr5619349jav.111.1627584924892;
        Thu, 29 Jul 2021 11:55:24 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q11sm1309957ile.71.2021.07.29.11.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 11:55:22 -0700 (PDT)
Received: (nullmailer pid 683968 invoked by uid 1000);
        Thu, 29 Jul 2021 18:55:21 -0000
Date:   Thu, 29 Jul 2021 12:55:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     shawnguo@kernel.org, sboyd@kernel.org, abel.vesa@nxp.com,
        s.hauer@pengutronix.de, p.zabel@pengutronix.de,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: clock: Add imx8ulp clock support
Message-ID: <YQL5mVakoyAovx3M@robh.at.kernel.org>
References: <20210719053430.1442505-1-ping.bai@nxp.com>
 <20210719053430.1442505-2-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210719053430.1442505-2-ping.bai@nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jul 19, 2021 at 01:34:22PM +0800, Jacky Bai wrote:
> Add the clock dt-binding file for i.MX8ULP.
> 
> For pcc node, it will also be used as a reset controller,
> so add the '#reset-cells' property description and add the
> pcc reset IDs.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  changes:
>   - Move this patch from dts patchset into this patchset
>   - Resolve Rob's comments

That's not all that helpful of a changelog. Assume I don't remember my 
comments, so give me a hint as to what part needs to be looked at again.

> ---
>  .../bindings/clock/imx8ulp-clock.yaml         | 128 +++++++++
>  include/dt-bindings/clock/imx8ulp-clock.h     | 262 ++++++++++++++++++
>  include/dt-bindings/reset/imx8ulp-pcc-reset.h |  59 ++++
>  3 files changed, 449 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imx8ulp-clock.yaml
>  create mode 100644 include/dt-bindings/clock/imx8ulp-clock.h
>  create mode 100644 include/dt-bindings/reset/imx8ulp-pcc-reset.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/imx8ulp-clock.yaml b/Documentation/devicetree/bindings/clock/imx8ulp-clock.yaml
> new file mode 100644
> index 000000000000..9eb0c3c2a49d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/imx8ulp-clock.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/imx8ulp-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX8ULP Clock Control Module Binding
> +
> +maintainers:
> +  - Jacky Bai <ping.bai@nxp.com>
> +
> +description: |
> +  On i.MX8ULP, The clock sources generation, distribution and management is
> +  under the control of several CGCs & PCCs modules. The CGC modules generate
> +  and distribute clocks on the device. PCC modules control clock selection,
> +  optional division and clock gating mode for peripherals
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8ulp-cgc1
> +      - fsl,imx8ulp-cgc2
> +      - fsl,imx8ulp-pcc3
> +      - fsl,imx8ulp-pcc4
> +      - fsl,imx8ulp-pcc5
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks: true
> +
> +  clock-names: true
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8ulp-cgc1
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: rosc
> +            - description: sosc
> +            - description: frosc
> +            - description: lposc
> +
> +        clock-names:
> +          items:
> +            - const: rosc
> +            - const: sosc
> +            - const: frosc
> +            - const: lposc
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8ulp-cgc2
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: sosc
> +            - description: frosc
> +
> +        clock-names:
> +          items:
> +            - const: sosc
> +            - const: frosc
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8ulp-cgc1
> +              - fsl,imx8ulp-cgc2
> +    then:
> +      required:
> +        - clocks
> +        - clock-names
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8ulp-pcc3
> +              - fsl,imx8ulp-pcc4
> +              - fsl,imx8ulp-pcc5
> +    then:
> +      required:
> +        - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  # Clock Control Module node:
> +  - |
> +    clock-controller@292c0000 {
> +        compatible = "fsl,imx8ulp-cgc1";
> +        reg = <0x292c0000 0x10000>;
> +        clocks = <&rosc>, <&sosc>, <&frosc>, <&lposc>;
> +        clock-names = "rosc", "sosc", "frosc", "lposc";
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    clock-controller@292d0000 {
> +        compatible = "fsl,imx8ulp-pcc3";
> +        reg = <0x292d0000 0x10000>;
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +    };
> diff --git a/include/dt-bindings/clock/imx8ulp-clock.h b/include/dt-bindings/clock/imx8ulp-clock.h
> new file mode 100644
> index 000000000000..cb449c991643
> --- /dev/null
> +++ b/include/dt-bindings/clock/imx8ulp-clock.h
> @@ -0,0 +1,262 @@
> +/* SPDX-License-Identifier: GPL-2.0+ OR MIT */
> +/*
> + * Copyright 2021 NXP
> + */
> +
> +#ifndef __DT_BINDINGS_CLOCK_IMX8ULP_H
> +#define __DT_BINDINGS_CLOCK_IMX8ULP_H
> +
> +#define IMX8ULP_CLK_DUMMY			0
> +#define IMX8ULP_CLK_ROSC			1
> +#define IMX8ULP_CLK_FROSC			2
> +#define IMX8ULP_CLK_LPOSC			3
> +#define IMX8ULP_CLK_SOSC			4
> +
> +/* CGC1 */
> +#define IMX8ULP_CLK_SPLL2			5
> +#define IMX8ULP_CLK_SPLL3			6
> +#define IMX8ULP_CLK_A35_SEL			7
> +#define IMX8ULP_CLK_A35_DIV			8
> +#define IMX8ULP_CLK_SPLL2_PRE_SEL		9
> +#define IMX8ULP_CLK_SPLL3_PRE_SEL		10
> +#define IMX8ULP_CLK_SPLL3_PFD0			11
> +#define IMX8ULP_CLK_SPLL3_PFD1			12
> +#define IMX8ULP_CLK_SPLL3_PFD2			13
> +#define IMX8ULP_CLK_SPLL3_PFD3			14
> +#define IMX8ULP_CLK_SPLL3_PFD0_DIV1		15
> +#define IMX8ULP_CLK_SPLL3_PFD0_DIV2		16
> +#define IMX8ULP_CLK_SPLL3_PFD1_DIV1		17
> +#define IMX8ULP_CLK_SPLL3_PFD1_DIV2		18
> +#define IMX8ULP_CLK_SPLL3_PFD2_DIV1		19
> +#define IMX8ULP_CLK_SPLL3_PFD2_DIV2		20
> +#define IMX8ULP_CLK_SPLL3_PFD3_DIV1		21
> +#define IMX8ULP_CLK_SPLL3_PFD3_DIV2		22
> +#define IMX8ULP_CLK_NIC_SEL			23
> +#define IMX8ULP_CLK_NIC_AD_DIVPLAT		24
> +#define IMX8ULP_CLK_NIC_PER_DIVPLAT		25
> +#define IMX8ULP_CLK_XBAR_SEL			26
> +#define IMX8ULP_CLK_XBAR_AD_DIVPLAT		27
> +#define IMX8ULP_CLK_XBAR_DIVBUS			28
> +#define IMX8ULP_CLK_XBAR_AD_SLOW		29
> +#define IMX8ULP_CLK_SOSC_DIV1			30
> +#define IMX8ULP_CLK_SOSC_DIV2			31
> +#define IMX8ULP_CLK_SOSC_DIV3			32
> +#define IMX8ULP_CLK_FROSC_DIV1			33
> +#define IMX8ULP_CLK_FROSC_DIV2			34
> +#define IMX8ULP_CLK_FROSC_DIV3			35
> +#define IMX8ULP_CLK_SPLL3_VCODIV		36
> +#define IMX8ULP_CLK_SPLL3_PFD0_DIV1_GATE	37
> +#define IMX8ULP_CLK_SPLL3_PFD0_DIV2_GATE	38
> +#define IMX8ULP_CLK_SPLL3_PFD1_DIV1_GATE	39
> +#define IMX8ULP_CLK_SPLL3_PFD1_DIV2_GATE	40
> +#define IMX8ULP_CLK_SPLL3_PFD2_DIV1_GATE	41
> +#define IMX8ULP_CLK_SPLL3_PFD2_DIV2_GATE	42
> +#define IMX8ULP_CLK_SPLL3_PFD3_DIV1_GATE	43
> +#define IMX8ULP_CLK_SPLL3_PFD3_DIV2_GATE	44
> +#define IMX8ULP_CLK_SOSC_DIV1_GATE		45
> +#define IMX8ULP_CLK_SOSC_DIV2_GATE		46
> +#define IMX8ULP_CLK_SOSC_DIV3_GATE		47
> +#define IMX8ULP_CLK_FROSC_DIV1_GATE		48
> +#define IMX8ULP_CLK_FROSC_DIV2_GATE		49
> +#define IMX8ULP_CLK_FROSC_DIV3_GATE		50
> +#define IMX8ULP_CLK_SAI4_SEL			51
> +#define IMX8ULP_CLK_SAI5_SEL			52
> +#define IMX8ULP_CLK_AUD_CLK1			53
> +#define IMX8ULP_CLK_ARM				54
> +#define IMX8ULP_CLK_ENET_TS_SEL			55
> +
> +#define IMX8ULP_CLK_CGC1_END			56
> +
> +/* CGC2 */
> +#define IMX8ULP_CLK_PLL4_PRE_SEL	0
> +#define IMX8ULP_CLK_PLL4		1
> +#define IMX8ULP_CLK_PLL4_VCODIV		2
> +#define IMX8ULP_CLK_DDR_SEL		3
> +#define IMX8ULP_CLK_DDR_DIV		4
> +#define IMX8ULP_CLK_LPAV_AXI_SEL	5
> +#define IMX8ULP_CLK_LPAV_AXI_DIV	6
> +#define IMX8ULP_CLK_LPAV_AHB_DIV	7
> +#define IMX8ULP_CLK_LPAV_BUS_DIV	8
> +#define IMX8ULP_CLK_PLL4_PFD0		9
> +#define IMX8ULP_CLK_PLL4_PFD1		10
> +#define IMX8ULP_CLK_PLL4_PFD2		11
> +#define IMX8ULP_CLK_PLL4_PFD3		12
> +#define IMX8ULP_CLK_PLL4_PFD0_DIV1_GATE	13
> +#define IMX8ULP_CLK_PLL4_PFD0_DIV2_GATE	14
> +#define IMX8ULP_CLK_PLL4_PFD1_DIV1_GATE	15
> +#define IMX8ULP_CLK_PLL4_PFD1_DIV2_GATE	16
> +#define IMX8ULP_CLK_PLL4_PFD2_DIV1_GATE	17
> +#define IMX8ULP_CLK_PLL4_PFD2_DIV2_GATE	18
> +#define IMX8ULP_CLK_PLL4_PFD3_DIV1_GATE	19
> +#define IMX8ULP_CLK_PLL4_PFD3_DIV2_GATE	20
> +#define IMX8ULP_CLK_PLL4_PFD0_DIV1	21
> +#define IMX8ULP_CLK_PLL4_PFD0_DIV2	22
> +#define IMX8ULP_CLK_PLL4_PFD1_DIV1	23
> +#define IMX8ULP_CLK_PLL4_PFD1_DIV2	24
> +#define IMX8ULP_CLK_PLL4_PFD2_DIV1	25
> +#define IMX8ULP_CLK_PLL4_PFD2_DIV2	26
> +#define IMX8ULP_CLK_PLL4_PFD3_DIV1	27
> +#define IMX8ULP_CLK_PLL4_PFD3_DIV2	28
> +#define IMX8ULP_CLK_CGC2_SOSC_DIV1_GATE	29
> +#define IMX8ULP_CLK_CGC2_SOSC_DIV2_GATE	30
> +#define IMX8ULP_CLK_CGC2_SOSC_DIV3_GATE	31
> +#define IMX8ULP_CLK_CGC2_SOSC_DIV1	32
> +#define IMX8ULP_CLK_CGC2_SOSC_DIV2	33
> +#define IMX8ULP_CLK_CGC2_SOSC_DIV3	34
> +#define IMX8ULP_CLK_CGC2_FROSC_DIV1_GATE	35
> +#define IMX8ULP_CLK_CGC2_FROSC_DIV2_GATE	36
> +#define IMX8ULP_CLK_CGC2_FROSC_DIV3_GATE	37
> +#define IMX8ULP_CLK_CGC2_FROSC_DIV1	38
> +#define IMX8ULP_CLK_CGC2_FROSC_DIV2	39
> +#define IMX8ULP_CLK_CGC2_FROSC_DIV3	40
> +#define IMX8ULP_CLK_AUD_CLK2		41
> +#define IMX8ULP_CLK_SAI6_SEL		42
> +#define IMX8ULP_CLK_SAI7_SEL		43
> +#define IMX8ULP_CLK_SPDIF_SEL		44
> +#define IMX8ULP_CLK_HIFI_SEL		45
> +#define IMX8ULP_CLK_HIFI_DIVCORE	46
> +#define IMX8ULP_CLK_HIFI_DIVPLAT	47
> +#define IMX8ULP_CLK_DSI_PHY_REF		48
> +
> +#define IMX8ULP_CLK_CGC2_END		49
> +
> +/* PCC3 */
> +#define IMX8ULP_CLK_WDOG3		0
> +#define IMX8ULP_CLK_WDOG4		1
> +#define IMX8ULP_CLK_LPIT1		2
> +#define IMX8ULP_CLK_TPM4		3
> +#define IMX8ULP_CLK_TPM5		4
> +#define IMX8ULP_CLK_FLEXIO1		5
> +#define IMX8ULP_CLK_I3C2		6
> +#define IMX8ULP_CLK_LPI2C4		7
> +#define IMX8ULP_CLK_LPI2C5		8
> +#define IMX8ULP_CLK_LPUART4		9
> +#define IMX8ULP_CLK_LPUART5		10
> +#define IMX8ULP_CLK_LPSPI4		11
> +#define IMX8ULP_CLK_LPSPI5		12
> +#define IMX8ULP_CLK_DMA1_MP		13
> +#define IMX8ULP_CLK_DMA1_CH0		14
> +#define IMX8ULP_CLK_DMA1_CH1		15
> +#define IMX8ULP_CLK_DMA1_CH2		16
> +#define IMX8ULP_CLK_DMA1_CH3		17
> +#define IMX8ULP_CLK_DMA1_CH4		18
> +#define IMX8ULP_CLK_DMA1_CH5		19
> +#define IMX8ULP_CLK_DMA1_CH6		20
> +#define IMX8ULP_CLK_DMA1_CH7		21
> +#define IMX8ULP_CLK_DMA1_CH8		22
> +#define IMX8ULP_CLK_DMA1_CH9		23
> +#define IMX8ULP_CLK_DMA1_CH10		24
> +#define IMX8ULP_CLK_DMA1_CH11		25
> +#define IMX8ULP_CLK_DMA1_CH12		26
> +#define IMX8ULP_CLK_DMA1_CH13		27
> +#define IMX8ULP_CLK_DMA1_CH14		28
> +#define IMX8ULP_CLK_DMA1_CH15		29
> +#define IMX8ULP_CLK_DMA1_CH16		30
> +#define IMX8ULP_CLK_DMA1_CH17		31
> +#define IMX8ULP_CLK_DMA1_CH18		32
> +#define IMX8ULP_CLK_DMA1_CH19		33
> +#define IMX8ULP_CLK_DMA1_CH20		34
> +#define IMX8ULP_CLK_DMA1_CH21		35
> +#define IMX8ULP_CLK_DMA1_CH22		36
> +#define IMX8ULP_CLK_DMA1_CH23		37
> +#define IMX8ULP_CLK_DMA1_CH24		38
> +#define IMX8ULP_CLK_DMA1_CH25		39
> +#define IMX8ULP_CLK_DMA1_CH26		40
> +#define IMX8ULP_CLK_DMA1_CH27		41
> +#define IMX8ULP_CLK_DMA1_CH28		42
> +#define IMX8ULP_CLK_DMA1_CH29		43
> +#define IMX8ULP_CLK_DMA1_CH30		44
> +#define IMX8ULP_CLK_DMA1_CH31		45
> +#define IMX8ULP_CLK_MU3_A		46
> +#define IMX8ULP_CLK_MU0_B		47
> +
> +#define IMX8ULP_CLK_PCC3_END		48
> +
> +/* PCC4 */
> +#define IMX8ULP_CLK_FLEXSPI2		0
> +#define IMX8ULP_CLK_TPM6		1
> +#define IMX8ULP_CLK_TPM7		2
> +#define IMX8ULP_CLK_LPI2C6		3
> +#define IMX8ULP_CLK_LPI2C7		4
> +#define IMX8ULP_CLK_LPUART6		5
> +#define IMX8ULP_CLK_LPUART7		6
> +#define IMX8ULP_CLK_SAI4		7
> +#define IMX8ULP_CLK_SAI5		8
> +#define IMX8ULP_CLK_PCTLE		9
> +#define IMX8ULP_CLK_PCTLF		10
> +#define IMX8ULP_CLK_USDHC0		11
> +#define IMX8ULP_CLK_USDHC1		12
> +#define IMX8ULP_CLK_USDHC2		13
> +#define IMX8ULP_CLK_USB0		14
> +#define IMX8ULP_CLK_USB0_PHY		15
> +#define IMX8ULP_CLK_USB1		16
> +#define IMX8ULP_CLK_USB1_PHY		17
> +#define IMX8ULP_CLK_USB_XBAR		18
> +#define IMX8ULP_CLK_ENET		19
> +#define IMX8ULP_CLK_SFA1		20
> +#define IMX8ULP_CLK_RGPIOE		21
> +#define IMX8ULP_CLK_RGPIOF		22
> +
> +#define IMX8ULP_CLK_PCC4_END		23
> +
> +/* PCC5 */
> +#define IMX8ULP_CLK_TPM8		0
> +#define IMX8ULP_CLK_SAI6		1
> +#define IMX8ULP_CLK_SAI7		2
> +#define IMX8ULP_CLK_SPDIF		3
> +#define IMX8ULP_CLK_ISI			4
> +#define IMX8ULP_CLK_CSI_REGS 		5
> +#define IMX8ULP_CLK_PCTLD		6
> +#define IMX8ULP_CLK_CSI			7
> +#define IMX8ULP_CLK_DSI			8
> +#define IMX8ULP_CLK_WDOG5		9
> +#define IMX8ULP_CLK_EPDC		10
> +#define IMX8ULP_CLK_PXP			11
> +#define IMX8ULP_CLK_SFA2		12
> +#define IMX8ULP_CLK_GPU2D		13
> +#define IMX8ULP_CLK_GPU3D		14
> +#define IMX8ULP_CLK_DC_NANO		15
> +#define IMX8ULP_CLK_CSI_CLK_UI 		16
> +#define IMX8ULP_CLK_CSI_CLK_ESC		17
> +#define IMX8ULP_CLK_RGPIOD		18
> +#define IMX8ULP_CLK_DMA2_MP		19
> +#define IMX8ULP_CLK_DMA2_CH0		20
> +#define IMX8ULP_CLK_DMA2_CH1		21
> +#define IMX8ULP_CLK_DMA2_CH2		22
> +#define IMX8ULP_CLK_DMA2_CH3		23
> +#define IMX8ULP_CLK_DMA2_CH4		24
> +#define IMX8ULP_CLK_DMA2_CH5		25
> +#define IMX8ULP_CLK_DMA2_CH6		26
> +#define IMX8ULP_CLK_DMA2_CH7		27
> +#define IMX8ULP_CLK_DMA2_CH8		28
> +#define IMX8ULP_CLK_DMA2_CH9		29
> +#define IMX8ULP_CLK_DMA2_CH10		30
> +#define IMX8ULP_CLK_DMA2_CH11		31
> +#define IMX8ULP_CLK_DMA2_CH12		32
> +#define IMX8ULP_CLK_DMA2_CH13		33
> +#define IMX8ULP_CLK_DMA2_CH14		34
> +#define IMX8ULP_CLK_DMA2_CH15		35
> +#define IMX8ULP_CLK_DMA2_CH16		36
> +#define IMX8ULP_CLK_DMA2_CH17		37
> +#define IMX8ULP_CLK_DMA2_CH18		38
> +#define IMX8ULP_CLK_DMA2_CH19		39
> +#define IMX8ULP_CLK_DMA2_CH20		40
> +#define IMX8ULP_CLK_DMA2_CH21		41
> +#define IMX8ULP_CLK_DMA2_CH22		42
> +#define IMX8ULP_CLK_DMA2_CH23		43
> +#define IMX8ULP_CLK_DMA2_CH24		44
> +#define IMX8ULP_CLK_DMA2_CH25		45
> +#define IMX8ULP_CLK_DMA2_CH26		46
> +#define IMX8ULP_CLK_DMA2_CH27		47
> +#define IMX8ULP_CLK_DMA2_CH28		48
> +#define IMX8ULP_CLK_DMA2_CH29		49
> +#define IMX8ULP_CLK_DMA2_CH30		50
> +#define IMX8ULP_CLK_DMA2_CH31		51
> +#define IMX8ULP_CLK_MU2_B		52
> +#define IMX8ULP_CLK_MU3_B		53
> +#define IMX8ULP_CLK_AVD_SIM		54
> +#define IMX8ULP_CLK_DSI_TX_ESC		55
> +
> +#define IMX8ULP_CLK_PCC5_END		56
> +
> +#endif
> diff --git a/include/dt-bindings/reset/imx8ulp-pcc-reset.h b/include/dt-bindings/reset/imx8ulp-pcc-reset.h
> new file mode 100644
> index 000000000000..e99a4735c3c4
> --- /dev/null
> +++ b/include/dt-bindings/reset/imx8ulp-pcc-reset.h
> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

Dual license needed here too.
