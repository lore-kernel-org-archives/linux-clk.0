Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794753328;
	b=SNp6suVf0BCYxGcfOMQWFTpunDwbVBRptt3aMNPYaynm51b7bWS50bnoXIzjQ9Zg2p4z
	 +Y0TSRsxU0Cz+ZpQ1LdZatcBvV3kxFx1UQeee6LXukpUNdBIWi/weSDnagCwbKjF8r/1s
	 YdGycR5FbD0+t0lYTmxFvM5aAV2IwqD6evgZYyY3UTLmnSwqd5dS3a3wyAYQXtWIHG76w
	 zu9qP92qDAwPSl4mmW8j+76X3eSalWHsooy1AiCl+FLeNgO+wDfugduPD5U+rhWEap90F
	 IqgyKPp+OMy+lTYsMumsid9Wls9Kz/S21dVT2f8fPVHnYZhhmOLTg1bkPC6f3+PyIIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794753328;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=dx/+iiOPCtMp+fu+rJU+//PaBPNooE+FcTTmEvajr10=;
	b=jPcF+SSR2cdlW9dtRmA2lUglJdq2Xz8ADVW6A2dcUk4pKjwDkWYlOvw0LrK78Gs1s7T9
	 uPnLqwAAHvdXZanMLKUJC7rJ948o+Wribt7f+mv5id5PJxmx2KeW4LAqd8R5+dxRxp9aF
	 2/fKcTtGYi/pyArAibgMYIsHQld3JNM2x47Poz+M0NAkvP9nshtg/3TbvCUfxN4HFzgx+
	 lIBonxI9m1JWpOzQIww5+yXN85eO3Ip7GcDj460FlB26iMEzQ5hSGhl1SwcvqpMktO3Wj
	 HMIcFnsW04leoUY9IWu8sj51xxGYleUrmQrpGFASS8y6ZyJqFHBKnbWywCKkTEHwbSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PBuxgfFm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1445606A32D;
	Sun, 15 Nov 2026 14:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PBuxgfFm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F3461F000C4;
	Sun, 15 Nov 2026 14:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794753328;
	bh=dx/+iiOPCtMp+fu+rJU+//PaBPNooE+FcTTmEvajr10=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PBuxgfFmuP74vGd78CIsM7JTPGuZa4dLtkY6zRgLSQ+ynHwRLvM7tydmAXmkVKhF4
	 LT3c4ch1VnjsUMRogVXBxNRU3A4bkbpeosexf2AAUjGUqNQxx4fc3Mww1OojEHT9Nb
	 rua9aTEOLy0zVbG8VeUhwQX4pWYxe7BHh+NBtpp6RgDT7fM1Xk9oDGKTm7giOKUU18
	 UXQKqrOIC/ujma9yVdVz69PtZ4Yqz4wZU13UVw9l223cY0qEMR/WSwvNPLuGDOQT1g
	 4Dle/xtuHnaBIXrdXGbf2WJbJhl+MLiIKFQ/OLuL2V97zzug8jW827oCQddq+FF2a0
	 s4PYUxITDVJ4Q==
Message-ID: <0f0cc1da-46dc-431e-a10d-dcbbf7419960@kernel.org>
Date: Sun, 15 Nov 2026 16:35:23 +0200
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/16] dt-bindings: clock: at91: Split up per SoC
 partially
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-3-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20261105110715.2486432-3-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Alexaner,

On 11/5/26 13:06, Alexander Dahl wrote:
> Before adding even more new indexes creating more holes in the
> clk at91 drivers pmc_data->chws arrays, split this up.
> 
> This is a partial split up only for some of the old PMC definitions.
> 
> Binding splitup was proposed for several reasons:
> 
> 1) keep the driver code simple, readable, and efficient
> 2) avoid accidental array index duplication
> 3) avoid memory waste by creating more and more unused array members.
> 
> Old values are kept to not break dts, and to maintain dt ABI.
> 
> Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>      v4:
>      - "re-added" some definitions present in hardware but not used in dt
>      - reword header comment (at91 -> Microchip) for newer SoCs
>      - PMC_UTMI was renamed where appropriate according to datasheets
>      
>      v3:
>      - full splitup for all at91 family SoCs instead of just a few
>      
>      v2:
>      - new patch, not present in v1
> 
>   .../reset/atmel,at91sam9260-reset.yaml        |  3 ++-
>   .../bindings/usb/atmel,at91sam9rl-udc.yaml    |  3 ++-
>   .../dt-bindings/clock/atmel,at91rm9200-pmc.h  | 16 ++++++++++++
>   .../dt-bindings/clock/atmel,at91sam9260-pmc.h | 16 ++++++++++++
>   .../dt-bindings/clock/atmel,at91sam9g45-pmc.h | 16 ++++++++++++
>   .../dt-bindings/clock/atmel,at91sam9n12-pmc.h | 16 ++++++++++++
>   .../dt-bindings/clock/atmel,at91sam9rl-pmc.h  | 16 ++++++++++++
>   .../dt-bindings/clock/atmel,at91sam9x5-pmc.h  | 16 ++++++++++++
>   include/dt-bindings/clock/atmel,sama5d2-pmc.h | 20 ++++++++++++++
>   include/dt-bindings/clock/atmel,sama5d3-pmc.h | 16 ++++++++++++
>   include/dt-bindings/clock/atmel,sama5d4-pmc.h | 17 ++++++++++++
>   .../dt-bindings/clock/microchip,sam9x60-pmc.h | 15 +++++++++++
>   .../dt-bindings/clock/microchip,sam9x7-pmc.h  | 19 ++++++++++++++
>   .../clock/microchip,sama7d65-pmc.h            | 26 +++++++++++++++++++
>   .../dt-bindings/clock/microchip,sama7g5-pmc.h | 23 ++++++++++++++++
>   15 files changed, 236 insertions(+), 2 deletions(-)
>   create mode 100644 include/dt-bindings/clock/atmel,at91rm9200-pmc.h
>   create mode 100644 include/dt-bindings/clock/atmel,at91sam9260-pmc.h
>   create mode 100644 include/dt-bindings/clock/atmel,at91sam9g45-pmc.h
>   create mode 100644 include/dt-bindings/clock/atmel,at91sam9n12-pmc.h
>   create mode 100644 include/dt-bindings/clock/atmel,at91sam9rl-pmc.h
>   create mode 100644 include/dt-bindings/clock/atmel,at91sam9x5-pmc.h
>   create mode 100644 include/dt-bindings/clock/atmel,sama5d2-pmc.h
>   create mode 100644 include/dt-bindings/clock/atmel,sama5d3-pmc.h
>   create mode 100644 include/dt-bindings/clock/atmel,sama5d4-pmc.h
>   create mode 100644 include/dt-bindings/clock/microchip,sam9x60-pmc.h
>   create mode 100644 include/dt-bindings/clock/microchip,sam9x7-pmc.h
>   create mode 100644 include/dt-bindings/clock/microchip,sama7d65-pmc.h
>   create mode 100644 include/dt-bindings/clock/microchip,sama7g5-pmc.h
> 
> diff --git a/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml b/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
> index 84c4801df8d9a..8c89ccc3d6393 100644
> --- a/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
> @@ -67,9 +67,10 @@ additionalProperties: false
>   examples:
>     - |
>       #include <dt-bindings/clock/at91.h>
> +    #include <dt-bindings/clock/atmel,at91sam9260-pmc.h>
>   
>       reset-controller@fffffd00 {
>           compatible = "atmel,at91sam9260-rstc";
>           reg = <0xfffffd00 0x10>;
> -        clocks = <&pmc PMC_TYPE_CORE PMC_SLOW>;
> +        clocks = <&pmc PMC_TYPE_CORE AT91SAM9260_PMC_SLOW>;
>       };
> diff --git a/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml b/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml
> index cdbbd17f80363..15f5bb51fd8a7 100644
> --- a/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml
> +++ b/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml
> @@ -61,13 +61,14 @@ examples:
>     - |
>       #include <dt-bindings/interrupt-controller/irq.h>
>       #include <dt-bindings/clock/at91.h>
> +    #include <dt-bindings/clock/atmel,at91sam9rl-pmc.h>
>       #include <dt-bindings/gpio/gpio.h>
>       gadget@fff78000 {
>           compatible = "atmel,at91sam9g45-udc";
>           reg = <0x00600000 0x80000
>                  0xfff78000 0x400>;
>           interrupts = <27 IRQ_TYPE_LEVEL_HIGH 0>;
> -        clocks = <&pmc PMC_TYPE_PERIPHERAL 27>, <&pmc PMC_TYPE_CORE PMC_UTMI>;
> +        clocks = <&pmc PMC_TYPE_PERIPHERAL 27>, <&pmc PMC_TYPE_CORE AT91SAM9RL_PMC_UTMI>;
>           clock-names = "pclk", "hclk";
>           atmel,vbus-gpio = <&pioC 15 GPIO_ACTIVE_HIGH>;
>       };
> diff --git a/include/dt-bindings/clock/atmel,at91rm9200-pmc.h b/include/dt-bindings/clock/atmel,at91rm9200-pmc.h
> new file mode 100644
> index 0000000000000..35fce34e00b82
> --- /dev/null
> +++ b/include/dt-bindings/clock/atmel,at91rm9200-pmc.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91rm9200 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91RM9200_PMC_H
> +#define _DT_BINDINGS_CLOCK_ATMEL_AT91RM9200_PMC_H
> +
> +#define AT91RM9200_PMC_SLOW	0

This is not used anywhere anywhere accross the current code base. Let's drop it.

> +#define AT91RM9200_PMC_MCK	1
> +#define AT91RM9200_PMC_MAIN	3
> +#define AT91RM9200_PMC_PLLACK	7
> +#define AT91RM9200_PMC_PLLBCK	8
> +
> +#endif
> diff --git a/include/dt-bindings/clock/atmel,at91sam9260-pmc.h b/include/dt-bindings/clock/atmel,at91sam9260-pmc.h
> new file mode 100644
> index 0000000000000..6a5453cf70954
> --- /dev/null
> +++ b/include/dt-bindings/clock/atmel,at91sam9260-pmc.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91sam9260 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9260_PMC_H
> +#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9260_PMC_H
> +
> +#define AT91SAM9260_PMC_SLOW	0
> +#define AT91SAM9260_PMC_MCK	1
> +#define AT91SAM9260_PMC_MAIN	3
> +#define AT91SAM9260_PMC_PLLACK	7
> +#define AT91SAM9260_PMC_PLLBCK	8
> +
> +#endif
> diff --git a/include/dt-bindings/clock/atmel,at91sam9g45-pmc.h b/include/dt-bindings/clock/atmel,at91sam9g45-pmc.h
> new file mode 100644
> index 0000000000000..44a804ff96fff
> --- /dev/null
> +++ b/include/dt-bindings/clock/atmel,at91sam9g45-pmc.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91sam9g45 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9G45_PMC_H
> +#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9G45_PMC_H
> +
> +#define AT91SAM9G45_PMC_SLOW	0

This is not used. Lets introduce it when needed

> +#define AT91SAM9G45_PMC_MCK	1
> +#define AT91SAM9G45_PMC_UPLLCK	2
> +#define AT91SAM9G45_PMC_MAIN	3
> +#define AT91SAM9G45_PMC_PLLACK	7
> +
> +#endif
> diff --git a/include/dt-bindings/clock/atmel,at91sam9n12-pmc.h b/include/dt-bindings/clock/atmel,at91sam9n12-pmc.h
> new file mode 100644
> index 0000000000000..6eaef69242ee8
> --- /dev/null
> +++ b/include/dt-bindings/clock/atmel,at91sam9n12-pmc.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91sam9n12 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9N12_PMC_H
> +#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9N12_PMC_H
> +
> +#define AT91SAM9N12_PMC_SLOW	0

Not used.

> +#define AT91SAM9N12_PMC_MCK	1
> +#define AT91SAM9N12_PMC_MAIN	3
> +#define AT91SAM9N12_PMC_PLLACK	7
> +#define AT91SAM9N12_PMC_PLLBCK	8
> +
> +#endif
> diff --git a/include/dt-bindings/clock/atmel,at91sam9rl-pmc.h b/include/dt-bindings/clock/atmel,at91sam9rl-pmc.h
> new file mode 100644
> index 0000000000000..0bb195712f785
> --- /dev/null
> +++ b/include/dt-bindings/clock/atmel,at91sam9rl-pmc.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91sam9rl clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9RL_PMC_H
> +#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9RL_PMC_H
> +
> +#define AT91SAM9RL_PMC_SLOW	0

Not used.

> +#define AT91SAM9RL_PMC_MCK	1
> +#define AT91SAM9RL_PMC_UTMI	2

Manual also refers to this as UPLL (UTMI PLL). E.g.

"26.5 Main Oscillator
The Main Oscillator is designed for a 12 MHz fundamental crystal. The 12 MHz is 
also used to
generate the 480 MHz USB High Speed Clock (HSCK) thanks to the UTMI PLL (UPLL)."

[1] https://ww1.microchip.com/downloads/en/DeviceDoc/doc6289.pdf

> +#define AT91SAM9RL_PMC_MAIN	3
> +#define AT91SAM9RL_PMC_PLLACK	7
> +
> +#endif
> diff --git a/include/dt-bindings/clock/atmel,at91sam9x5-pmc.h b/include/dt-bindings/clock/atmel,at91sam9x5-pmc.h
> new file mode 100644
> index 0000000000000..d095dcc9b29ff
> --- /dev/null
> +++ b/include/dt-bindings/clock/atmel,at91sam9x5-pmc.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91sam9x5 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9X5_PMC_H
> +#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9X5_PMC_H
> +
> +#define AT91SAM9X5_PMC_SLOW	0

Not used.

> +#define AT91SAM9X5_PMC_MCK	1
> +#define AT91SAM9X5_PMC_UPLLCK	2
> +#define AT91SAM9X5_PMC_MAIN	3
> +#define AT91SAM9X5_PMC_PLLACK	7
> +
> +#endif
> diff --git a/include/dt-bindings/clock/atmel,sama5d2-pmc.h b/include/dt-bindings/clock/atmel,sama5d2-pmc.h
> new file mode 100644
> index 0000000000000..51bb410c699e2
> --- /dev/null
> +++ b/include/dt-bindings/clock/atmel,sama5d2-pmc.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91 sama5d2 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_ATMEL_SAMA5D2_PMC_H
> +#define _DT_BINDINGS_CLOCK_ATMEL_SAMA5D2_PMC_H
> +
> +#define SAMA5D2_PMC_MCK		1
> +#define SAMA5D2_PMC_UPLLCK	2
> +#define SAMA5D2_PMC_MAIN	3
> +#define SAMA5D2_PMC_MCK2	4
> +#define SAMA5D2_PMC_I2S0_MUX	5
> +#define SAMA5D2_PMC_I2S1_MUX	6
> +#define SAMA5D2_PMC_PLLACK	7
> +#define SAMA5D2_PMC_AUDIOPLLCK	9
> +#define SAMA5D2_PMC_AUDIOPINCK	10
> +
> +#endif
> diff --git a/include/dt-bindings/clock/atmel,sama5d3-pmc.h b/include/dt-bindings/clock/atmel,sama5d3-pmc.h
> new file mode 100644
> index 0000000000000..92210969104d6
> --- /dev/null
> +++ b/include/dt-bindings/clock/atmel,sama5d3-pmc.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91 sama5d3 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_ATMEL_SAMA5D3_PMC_H
> +#define _DT_BINDINGS_CLOCK_ATMEL_SAMA5D3_PMC_H
> +
> +#define SAMA5D3_PMC_SLOW	0

Not used.

> +#define SAMA5D3_PMC_MCK		1
> +#define SAMA5D3_PMC_UPLLCK	2
> +#define SAMA5D3_PMC_MAIN	3

Not used.

> +#define SAMA5D3_PMC_PLLACK	7
> +
> +#endif
> diff --git a/include/dt-bindings/clock/atmel,sama5d4-pmc.h b/include/dt-bindings/clock/atmel,sama5d4-pmc.h
> new file mode 100644
> index 0000000000000..53870448d6a1d
> --- /dev/null
> +++ b/include/dt-bindings/clock/atmel,sama5d4-pmc.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91 sama5d4 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_ATMEL_SAMA5D4_PMC_H
> +#define _DT_BINDINGS_CLOCK_ATMEL_SAMA5D4_PMC_H
> +
> +#define SAMA5D4_PMC_SLOW	0

Not used.

> +#define SAMA5D4_PMC_MCK		1
> +#define SAMA5D4_PMC_UPLLCK	2
> +#define SAMA5D4_PMC_MAIN	3

Not used.

Thank you,
Claudiu
