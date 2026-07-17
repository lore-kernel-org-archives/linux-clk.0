Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232DD2BDC26;
	Fri, 17 Jul 2026 06:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784270209; cv=none; b=HDsheMpywTPBZsxNkInMnTcf6o903e3hXMU5XvflUopFtgzw4N9cHHWbWaoK1T+xccZssLe5CROYS/EOe915NaX4i4TNtYT6oXT6HE5s9d5ws8n+PMbBK/KC4EhVzAMB1C0QGB4Ovw0d+Ig/maJ2G+7CPpoiabqLMnCVR++JsaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784270209; c=relaxed/simple;
	bh=1dyWJ7BNjXPKQ91vN4hr5IebREH/q569lnAIZat0Wqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sZs4XM1S/3EwUewGfC37UMA887W8fHflkE3gMIxHk78tMOc/u8T/eiNKQK8Bzk5EsvaQ2EiEjvH/R8RfrUa2XzCUqWeWsr4OMCcEZ5N8p2G9IxdOv4CkQ92bAtWYX2mvwiuH73wnUTbUx2+zrCvixzr0OzCH470v3Y2JvyIBA+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/i0xzEM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D/i0xzEM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38AB81F000E9;
	Fri, 17 Jul 2026 06:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784270207;
	bh=Lljk+JIhcAb/zEjJzyuuqqatn2RTMTgui2137D8pfLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D/i0xzEMwfTibnDac22AeQ0bkbAd92QYFS8pe+rFdVGOnOWGRY9amt96rHJkAwJSq
	 gc+HDWoV6Ln+rssf92JW57A1O5iXAGGP97GhlCKFPo5eJOIAuyO+dZikURyhByNAFr
	 hEiFVl9Tr5x9ge5qthNRspo8+1FPQ3osGIg/qqzEAKXxYoeB5CSxru9I6S4VEaSQ9n
	 mpfoxhKrGngRSstIN7+yhQkV3OR6PsE7Y61Kv3eXeNU9NHhpvXprJ85VWX0gTOBLfs
	 Z8Stdik+W7/isBChIK9qqlDE8KNoArY6i1tFUeXzdmUqzfS9upRBLEk0zYbwm4YMId
	 MeOb8cywPHusQ==
Date: Fri, 17 Jul 2026 08:36:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan =?utf-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v7 02/13] dt-bindings: clk: zte: Add zx297520v3 top clock
 and reset controller
Message-ID: <20260717-berserk-faithful-cat-a34ad8@quoll>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
 <20260717-zx29clk-v7-2-408411cfcf36@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260717-zx29clk-v7-2-408411cfcf36@gmail.com>

On Fri, Jul 17, 2026 at 12:35:38AM +0300, Stefan D=C3=B6singer wrote:
> diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-topcr=
m.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
> new file mode 100644
> index 000000000000..454997063573
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/zte,zx297520v3-topcrm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ZTE zx297520v3 SoC top clock and reset controller
> +
> +maintainers:
> +  - Stefan D=C3=B6singer <stefandoesinger@gmail.com>
> +
> +description: |
> +  The zx297520v3 top clock and reset controller generates clocks for core
> +  devices on the board like the main bus, USB and timers. In addition to=
 clocks
> +  it has reset controls for peripherals, a global board reset, watchdog =
reset
> +  controls and a USB status register.
> +
> +  The controller has two clock inputs: a 26 MHz and a 32 KHz external
> +  oscillator. They need to be provided as input clocks. The controller p=
rovides
> +  PLL output frequencies to downstream clock controllers.
> +
> +  The USB PHY functionality is exposed as a child node documented in
> +  zte,zx297520v3-usb-phy.yaml.
> +
> +  All available clocks are defined as preprocessor macros in the
> +  "include/dt-bindings/clock/zte,zx297520v3-clk.h" header. The resets are
> +  defined in the "include/dt-bindings/reset/zte,zx297520v3-reset.h" head=
er.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: zte,zx297520v3-topcrm
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: 26 MHz external oscillator
> +      - description: 32 KHz external oscillator
> +
> +  clock-names:
> +    items:
> +      - const: osc26m
> +      - const: osc32k
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +  syscon-reboot:
> +    type: object
> +    $ref: /schemas/power/reset/syscon-reboot.yaml#
> +    description:
> +      Reboot method for the SoC.
> +
> +  usb-phy@84:

No, do not children with and without addressing. syscon-reboot should
have address as well. Or this one should not, since it looks pretty
redundant - it is deducible from the top level compatible, no? So just
usb-phy.

> +          compatible =3D "zte,zx297520v3-usb-phy";
> +    type: object
> +    $ref: /schemas/phy/zte,zx297520v3-usb-phy.yaml#
> +    description:
> +      USB and HSIC PHY controller.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - syscon-reboot
> +  - usb-phy@84
> +  - "#address-cells"
> +  - "#size-cells"
> +  - "#clock-cells"
> +  - "#reset-cells"
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/zte,zx297520v3-reset.h>
> +    #include <dt-bindings/phy/phy-zte-zx297520v3-usb.h>
> +    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
> +
> +    topcrm: clock-controller@13b000 {
> +        compatible =3D "zte,zx297520v3-topcrm", "syscon";
> +        reg =3D <0x0013b000 0x400>;
> +        clocks =3D <&osc26m>, <&osc32k>;
> +        clock-names =3D "osc26m", "osc32k";
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        #clock-cells =3D <1>;
> +        #reset-cells =3D <1>;
> +
> +        syscon-reboot {
> +          compatible =3D "syscon-reboot";
> +          offset =3D <0x0>;
> +          mask =3D <0x1>;
> +          value =3D <0x1>;
> +        };
> +
> +        usb-phy@84 {

> +          reg =3D <0x84>;
> +          interrupts =3D <GIC_SPI 42 IRQ_TYPE_EDGE_RISING>,
> +            <GIC_SPI 43 IRQ_TYPE_EDGE_RISING>,
> +            <GIC_SPI 45 IRQ_TYPE_EDGE_RISING>,
> +            <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;

Here also misaligned.

> +          interrupt-names =3D "usb-up", "usb-down", "hsic-up", "hsic-dow=
n";
> +          resets =3D <&topcrm ZX297520V3_USB_PHY_RESET>,
> +            <&topcrm ZX297520V3_HSIC_PHY_RESET>;
> +          reset-names =3D "usb", "hsic";
> +          #phy-cells =3D <1>;
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cb50c2e3b4ea..5f962b9947ab 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3878,10 +3878,13 @@ L:	linux-arm-kernel@lists.infradead.org (moderate=
d for non-subscribers)
>  S:	Odd fixes
>  F:	Documentation/arch/arm/zte/
>  F:	Documentation/devicetree/bindings/arm/zte.yaml
> +F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
>  F:	Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy.yaml
>  F:	arch/arm/boot/dts/zte/
>  F:	arch/arm/mach-zte/
> +F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
>  F:	include/dt-bindings/phy/phy-zte-zx297520v3-usb.h
> +F:	include/dt-bindings/reset/zte,zx297520v3-reset.h
> =20
>  ARM/ZYNQ ARCHITECTURE
>  M:	Michal Simek <michal.simek@amd.com>
> diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-=
bindings/clock/zte,zx297520v3-clk.h

Same mistake. Filename MUST match the compatible.

> new file mode 100644
> index 000000000000..1f010ff4e6ca
> --- /dev/null
> +++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
> @@ -0,0 +1,66 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) Stefan D=C3=B6singer.
> + */
> +
> +#ifndef __DT_BINDINGS_CLOCK_ZX297520V3_H
> +#define __DT_BINDINGS_CLOCK_ZX297520V3_H
> +
> +#define ZX297520V3_M0_WCLK			1

Start from 0 since you started resets also from 0.

> +#define ZX297520V3_SRAM1_PCLK			2
> +#define ZX297520V3_SRAM2_PCLK			3
> +#define ZX297520V3_UART0_WCLK			4
> +#define ZX297520V3_UART0_PCLK			5
> +#define ZX297520V3_I2C0_WCLK			6
> +#define ZX297520V3_I2C0_PCLK			7
> +#define ZX297520V3_RTC_WCLK			8
> +#define ZX297520V3_RTC_PCLK			9
> +#define ZX297520V3_LPM_GSM_WCLK			10
> +#define ZX297520V3_LPM_GSM_PCLK			11
> +#define ZX297520V3_LPM_LTE_WCLK			12
> +#define ZX297520V3_LPM_LTE_PCLK			13
> +#define ZX297520V3_LPM_TD_WCLK			14
> +#define ZX297520V3_LPM_TD_PCLK			15
> +#define ZX297520V3_LPM_W_WCLK			16
> +#define ZX297520V3_LPM_W_PCLK			17
> +#define ZX297520V3_TIMER_T08_WCLK		18
> +#define ZX297520V3_TIMER_T08_PCLK		19
> +#define ZX297520V3_TIMER_T09_WCLK		20
> +#define ZX297520V3_TIMER_T09_PCLK		21
> +#define ZX297520V3_MPLL				22
> +#define ZX297520V3_MPLL_D5			23
> +#define ZX297520V3_DPLL				24
> +#define ZX297520V3_GPLL				25
> +#define ZX297520V3_GPLL_D2			26
> +#define ZX297520V3_GATED_OSC26M			27
> +#define ZX297520V3_PMM_WCLK			28
> +#define ZX297520V3_PMM_PCLK			29
> +#define ZX297520V3_OUT0_WCLK			30
> +#define ZX297520V3_OUT1_WCLK			31
> +#define ZX297520V3_OUT2_WCLK			32
> +#define ZX297520V3_OUT32K_WCLK			33
> +#define ZX297520V3_RMIIPHY_WCLK			34
> +#define ZX297520V3_TIMER_T12_WCLK		35
> +#define ZX297520V3_TIMER_T12_PCLK		36
> +#define ZX297520V3_TIMER_T13_WCLK		37
> +#define ZX297520V3_TIMER_T13_PCLK		38
> +#define ZX297520V3_TIMER_T14_WCLK		39
> +#define ZX297520V3_TIMER_T14_PCLK		40
> +#define ZX297520V3_TIMER_T15_WCLK		41
> +#define ZX297520V3_TIMER_T15_PCLK		42
> +#define ZX297520V3_TIMER_T16_WCLK		43
> +#define ZX297520V3_TIMER_T16_PCLK		44
> +#define ZX297520V3_TIMER_T17_WCLK		45
> +#define ZX297520V3_TIMER_T17_PCLK		46
> +#define ZX297520V3_WDT_T18_WCLK			47
> +#define ZX297520V3_WDT_T18_PCLK			48
> +#define ZX297520V3_USIM1_WCLK			49
> +#define ZX297520V3_USIM1_PCLK			50
> +#define ZX297520V3_AHB_WCLK			51
> +#define ZX297520V3_AHB_PCLK			52
> +#define ZX297520V3_USB_WCLK			53
> +#define ZX297520V3_USB_PCLK			54
> +#define ZX297520V3_HSIC_WCLK			55
> +#define ZX297520V3_HSIC_PCLK			56
> +
> +#endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */
> diff --git a/include/dt-bindings/reset/zte,zx297520v3-reset.h b/include/d=
t-bindings/reset/zte,zx297520v3-reset.h
> new file mode 100644
> index 000000000000..43db72bb59de
> --- /dev/null
> +++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h

Same here.

Best regards,
Krzysztof

