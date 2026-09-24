Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D64B4457C4;
	Thu, 24 Sep 2026 09:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790241022; cv=none; b=XY8ivopr5lfRPyBwE/xtAEe1bLGN03zWeNBUnLXpJV0VdzmuVKjz/cbgR3UMwjpy7uNwU5k6PqaUUJMlhlfW8amIgodwEitKFLatWHEOfYJMh2lXnSKmhYe6IbphMKVx98m6FjnA1Jf6NTh5lvoW78i5SWfHa0wbwZzqzn04RV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790241022; c=relaxed/simple;
	bh=ZTd7/55gRcUyEBH8+zHp7ksV9kCfaAQyCbscIOmUjFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZWUThYacV8jWl8xIhkr33A4s0pENWqgNcb+zFj1YlIPe/ROKxvXhP4CQ6piOxW0Y6ThBkZCM4C07EskEY9xr9zzhMvHRIWakwdvnAoEvdx7NuJvsSLgTx8cclH5mWd/5JfXZIdEzCaNqjlwkh5wzDTmINvt97g3BOxtY5UZ7oc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=f7SKZyq7; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="f7SKZyq7"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E00B1477;
	Thu, 24 Sep 2026 02:03:22 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 001373F86F;
	Thu, 24 Sep 2026 02:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790240605; bh=ZTd7/55gRcUyEBH8+zHp7ksV9kCfaAQyCbscIOmUjFY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f7SKZyq7qgwPA53Ie3/Pvf9BidRruW0yV3SKJinELV3Q/8S0Tk2KPQV2GXk7hwzUq
	 D6kW+MlBhtQNItXi1NVHVQ7s510bftzrLoq8swCfhtmvO1e3JuMfZ8LfdwGTFb9wip
	 PGVgyu1MBRxYWPm4UvCWsKC3vxyIT5f2Mk/ojNkE=
Message-ID: <8871e921-f66c-475b-a489-560028eb2200@arm.com>
Date: Thu, 24 Sep 2026 11:03:22 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/11] dt-bindings: clock: add Allwinner B288 CCU
To: Pablo Mazzini <pmazzini@gmail.com>, Brian Masney
 <bmasney+clk@redhat.com>, Chen-Yu Tsai <wens@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20260923201701.43391-1-pmazzini@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260923201701.43391-1-pmazzini@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Pablo,

many thanks for sending this series, on a first glance this looks pretty 
good.
As a general comment: please add a cover letter (git format-patch ... 
--cover-letter, then edit the generated file), and explain a bit about 
the background of this work. This would be a good place to briefly 
describe what the B288 is, how it's related to other SoCs, how you came 
to all this information, the firmware story, and the existing 
limitations of this port.

One problem in general is the lack of access to a manual, I am not even 
sure we ever upstreamed SoC support without one. Especially the clock 
driver is quite tricky, we would love to compare the clock descriptions 
against some documentation.

On 9/23/26 22:16, Pablo Mazzini wrote:
> The B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book readers.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>   .../clock/allwinner,sun8i-b288-ccu.yaml       | 55 ++++++++++++
>   include/dt-bindings/clock/sun8i-b288-ccu.h    | 90 +++++++++++++++++++
>   include/dt-bindings/reset/sun8i-b288-ccu.h    | 45 ++++++++++
>   3 files changed, 190 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/clock/allwinner,sun8i-b288-ccu.yaml
>   create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
>   create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun8i-b288-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun8i-b288-ccu.yaml
> new file mode 100644
> index 000000000000..22b59d5b652c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/allwinner,sun8i-b288-ccu.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/allwinner,sun8i-b288-ccu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner B288 Clock Control Unit
> +
> +maintainers:
> +  - Chen-Yu Tsai <wens@csie.org>
> +  - Maxime Ripard <mripard@kernel.org>

I am afraid you cannot push off the responsibility to other people, 
especially I think Maxime wouldn't be really interested any more ;-)

Actually, why do you need a separate binding? Wouldn't it be enough to 
just add the compatible string to the existing 
allwinner,sun4i-a10-ccu.yaml file? This one here looks like a subset of 
this, and would blend in there easily.

Cheers,
Andre

> +
> +properties:
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +  compatible:
> +    const: allwinner,sun8i-b288-ccu
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: High Frequency Oscillator
> +      - description: Low Frequency Oscillator
> +
> +  clock-names:
> +    items:
> +      - const: hosc
> +      - const: losc
> +
> +required:
> +  - "#clock-cells"
> +  - "#reset-cells"
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    ccu: clock-controller@1c20000 {
> +        compatible = "allwinner,sun8i-b288-ccu";
> +        reg = <0x01c20000 0x400>;
> +        clocks = <&osc24M>, <&osc32k>;
> +        clock-names = "hosc", "losc";
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +    };
> diff --git a/include/dt-bindings/clock/sun8i-b288-ccu.h b/include/dt-bindings/clock/sun8i-b288-ccu.h
> new file mode 100644
> index 000000000000..3dc1704d001e
> --- /dev/null
> +++ b/include/dt-bindings/clock/sun8i-b288-ccu.h
> @@ -0,0 +1,90 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +#ifndef _DT_BINDINGS_CLK_SUN8I_B288_H_
> +#define _DT_BINDINGS_CLK_SUN8I_B288_H_
> +
> +#define CLK_PLL_CPUX	0
> +#define CLK_PLL_AUDIO_BASE	1
> +#define CLK_PLL_VIDEO0	2
> +#define CLK_PLL_DDR0	3
> +#define CLK_PLL_PERIPH0	4
> +#define CLK_PLL_VIDEO1	5
> +#define CLK_PLL_24M	6
> +#define CLK_PLL_PERIPH1	7
> +#define CLK_PLL_DE	8
> +#define CLK_PLL_DDR1	9
> +
> +#define CLK_PLL_PERIPH0_2X	10
> +#define CLK_PLL_PERIPH1_2X	11
> +#define CLK_CPUX	12
> +#define CLK_AXI	13
> +#define CLK_CPUAPB	14
> +#define CLK_AHB1	15
> +#define CLK_APB1	16
> +#define CLK_APB2	17
> +
> +#define CLK_NAND	18
> +#define CLK_MMC0	19
> +#define CLK_MMC1	20
> +#define CLK_MMC2	21
> +#define CLK_MMC3	22
> +#define CLK_SPI0	23
> +#define CLK_SPI1	24
> +#define CLK_SPI2	25
> +#define CLK_DRAM	26
> +#define CLK_DE	27
> +#define CLK_EE	28
> +#define CLK_EDMA	29
> +#define CLK_TCON0	30
> +#define CLK_MBUS	31
> +
> +#define CLK_BUS_THS	32
> +#define CLK_BUS_NAND	33
> +#define CLK_BUS_SDMMC0_BUS	34
> +#define CLK_BUS_SDMMC1_BUS	35
> +#define CLK_BUS_SDMMC2_BUS	36
> +#define CLK_BUS_SDMMC3_BUS	37
> +#define CLK_BUS_SPI0	38
> +#define CLK_BUS_SPI1	39
> +#define CLK_BUS_SPI2	40
> +#define CLK_BUS_I2S0	41
> +#define CLK_BUS_I2S1	42
> +#define CLK_BUS_SPDIF	43
> +#define CLK_BUS_DSD	44
> +#define CLK_BUS_DMIC	45
> +#define CLK_BUS_USBOHCI0	46
> +#define CLK_BUS_USBEHCI0	47
> +#define CLK_BUS_USBOTG	48
> +#define CLK_BUS_DE	49
> +#define CLK_BUS_EE	50
> +#define CLK_BUS_TCON0	51
> +#define CLK_BUS_CSI_S	52
> +#define CLK_BUS_CSI_M	53
> +#define CLK_BUS_CSI_MISC	54
> +#define CLK_BUS_ADDA	55
> +#define CLK_BUS_SDRAM	56
> +#define CLK_BUS_PSRAM	57
> +#define CLK_BUS_DMA	58
> +#define CLK_BUS_UART0	59
> +#define CLK_BUS_UART1	60
> +#define CLK_BUS_UART2	61
> +#define CLK_BUS_UART3	62
> +#define CLK_BUS_UART4	63
> +#define CLK_BUS_UART5	64
> +#define CLK_BUS_TWI0	65
> +#define CLK_BUS_TWI1	66
> +#define CLK_BUS_TWI2	67
> +#define CLK_BUS_PIO	68
> +#define CLK_BUS_GPADC	69
> +#define CLK_BUS_KEYADC	70
> +
> +/*
> + * mmc0 and mmc1 are v4p1x controllers driven in the old timing mode, which
> + * needs the sample and output phase clocks. mmc2 and mmc3 are newer blocks
> + * that do their own delay calibration and have none.
> + */
> +#define CLK_MMC0_SAMPLE	71
> +#define CLK_MMC0_OUTPUT	72
> +#define CLK_MMC1_SAMPLE	73
> +#define CLK_MMC1_OUTPUT	74
> +
> +#endif
> diff --git a/include/dt-bindings/reset/sun8i-b288-ccu.h b/include/dt-bindings/reset/sun8i-b288-ccu.h
> new file mode 100644
> index 000000000000..675145654548
> --- /dev/null
> +++ b/include/dt-bindings/reset/sun8i-b288-ccu.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +#ifndef _DT_BINDINGS_RST_SUN8I_B288_H_
> +#define _DT_BINDINGS_RST_SUN8I_B288_H_
> +
> +#define RST_BUS_THS	0
> +#define RST_BUS_NAND	1
> +#define RST_BUS_MMC0	2
> +#define RST_BUS_MMC1	3
> +#define RST_BUS_MMC2	4
> +#define RST_BUS_MMC3	5
> +#define RST_BUS_SPI0	6
> +#define RST_BUS_SPI1	7
> +#define RST_BUS_SPI2	8
> +#define RST_BUS_I2S0	9
> +#define RST_BUS_I2S1	10
> +#define RST_BUS_SPDIF	11
> +#define RST_BUS_DSD	12
> +#define RST_BUS_DMIC	13
> +#define RST_USBPHY0	14
> +#define RST_BUS_OHCI0	15
> +#define RST_BUS_EHCI0	16
> +#define RST_BUS_OTG	17
> +#define RST_BUS_DE	18
> +#define RST_BUS_EE	19
> +#define RST_BUS_TCON0	20
> +#define RST_BUS_CSI	21
> +#define RST_BUS_ADDA	22
> +#define RST_BUS_WLAN	23
> +#define RST_MBUS	24
> +#define RST_BUS_DRAM	25
> +#define RST_BUS_PSRAM	26
> +#define RST_BUS_DMA	27
> +#define RST_BUS_UART0	28
> +#define RST_BUS_UART1	29
> +#define RST_BUS_UART2	30
> +#define RST_BUS_UART3	31
> +#define RST_BUS_UART4	32
> +#define RST_BUS_UART5	33
> +#define RST_BUS_I2C0	34
> +#define RST_BUS_I2C1	35
> +#define RST_BUS_I2C2	36
> +#define RST_BUS_GPADC	37
> +#define RST_BUS_KEYADC	38
> +
> +#endif

