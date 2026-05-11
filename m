Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A113A4F23;
	Mon, 11 May 2026 16:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778515641; cv=none; b=RpswnVKdru1GBGcJMp2muHxgaF3X6+AaQDicsQttVAIrNVp2n0SmplsePPGbEsie6l3UhzF4J1mSxowGCMiDmBpYJU+c4E8p+MVm2KSOy5OWC5bsjK/RMpOifICbIHBfQggGRlFHLPUSoJ87SOngw/mQuEGWjQhsJB1uGxMut80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778515641; c=relaxed/simple;
	bh=71uUKlvMw4F1TTJJY30wApPoOfQZt+0qMe5dKUS6mRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNRWeRYjo9Rim0HDu6PWRa4NvfxMYftXbIi85GzmBzxfGSx/iQRP24qHZu5uFtHLHvD7YToJCa9tsnwD6DeSqqQ3nIdUWlNz6PbBeL0y3sUAgzt539luoJXBwQ+gvrMUB9y/hiqKNiJ5mH4g03jwnFBCvi+B4huPsPJZgWY4LEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FzPlNBlF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FzPlNBlF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0AADC2BCB0;
	Mon, 11 May 2026 16:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778515641;
	bh=71uUKlvMw4F1TTJJY30wApPoOfQZt+0qMe5dKUS6mRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FzPlNBlFSnRf4iP9eodhrcYxBDnbPq8wF8DpFFOgNMFQU5m6iIn8FcPW7XKEJkg0M
	 HIIxOix1ENvOn2POhSWR0v+uXxw8Jr+DQVNi6vsoG4dEfnDqfJauBRr7CxkSgtUUpY
	 ZrQX2F3/j4hsoLy2TubHOWscMFdDDrqB7857YB3mVzpgIjDAxDZ5zzstMlLeRsgVnC
	 9vmobpcClHvyDas7+C6s6181rZyr6efxXrbOkql5J04toXqexzKoUuraNDxnu5fc62
	 9G89L7NXO7m0mscUOeS18LglSG7adXGNXTN/lwBynKaZ4u+seKFNCmyRtR8D9TddBa
	 bkYVSxvkF74Iw==
Date: Mon, 11 May 2026 17:07:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v2 1/4] dt-bindings: clk: zte: Add zx297520v3 clock
 and reset bindings.
Message-ID: <20260511-backstage-crewman-e44947ab6cfc@spud>
References: <20260511-zx29clk-v2-0-29f0edc300f5@gmail.com>
 <20260511-zx29clk-v2-1-29f0edc300f5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X42tWiqzEfN/q3j3"
Content-Disposition: inline
In-Reply-To: <20260511-zx29clk-v2-1-29f0edc300f5@gmail.com>


--X42tWiqzEfN/q3j3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 12:49:50AM +0300, Stefan D=F6singer wrote:
> These SoCs have 3 clock and reset controllers. The "top" controller -
> all names follow ZTE's naming - controls core devices like the AHB bus,
> most timers and the Cortex M0 that brings up the board. The register
> layout is fairly chaotic. Some patterns can be found, but nothing that
> holds true for all devices it controls.
>=20
> Generally every device has two clocks (one work clock, and one that
> connects it to the bus, I call it PCLK), two reset bits (I don't know
> what the difference is - sometimes asserting one is enough to reset the
> device, sometimes both need to be asserted) and one mux. Some devices,
> like the GPIO controller, only have reset bits and no clocks.
>=20
> The top clock controller is fed by a 26mhz external oscillator and has 4
> PLLs to generate other clock rates. ZTE's kernel does not manipulate the
> PLLs at all and relies on BROM and the boot loader to set them up. The
> bitfields in the control registers are somewhat documented in a
> Lauterback TRACE32 debug file in the kernel sources though. At the
> moment, my driver extracts clock rates from the PLLs, but cannot change
> them. A proper PLL clk is on my TODO list before I remove the [RFC] tag
> from the submission. It will be necessary for the LTE hardware with
> replacement boot loaders because BROM does not set up the LTE-related
> PLL.
>=20
> The "matrix" controller controls the main Cortex A53 CPU, the LTE ZSP,
> SDIO and a few others. It is even more chaotic than the "top"
> controller.
>=20
> The "LSP" controller - I suspect it stands for "low speed peripherals" -
> is very regular. One 32 bit register for 2 clock gates, two resets, one
> mux (1-3 bit) and in some cases a 4 bit divider.
>=20
> Not all clocks will have an explicit user in the end. I am defining a
> lot of them simply to shut them off. The boot loader sets up a few of
> the proprietary timers, which will send regular IRQs (although the
> kernel of course doesn't need to listen to them). I don't plan to add a
> driver for the proprietary timer as I see no use for them - the ARM arch
> timer works just fine. I will add a driver for the very similar
> proprietary watchdog though.
>=20
> The top and matrix list is not exhaustive. There are other bits
> that are enabled, but I couldn't deduce what they are controlling by
> trial and error. Some of them seem to do nothing. Others cause an
> instant hang of the board when disabled. I isolated a few (SRAM PCLK,
> arm arch timer clock) where I don't see a reason to manipulate them. It
> is quite likely that a handful more clocks will be added in the future,
> but not a large number.
>=20
> Signed-off-by: Stefan D=F6singer <stefandoesinger@gmail.com>
> ---
>  .../bindings/clock/zte,zx297520v3-clk.yaml         | 173 +++++++++++++++=
+++++
>  include/dt-bindings/clock/zte,zx297520v3-clk.h     | 179 +++++++++++++++=
++++++
>  2 files changed, 352 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-clk.y=
aml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-clk.yaml
> new file mode 100644
> index 000000000000..3b7084a18a97
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-clk.yaml
> @@ -0,0 +1,173 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/zte,zx297520v3-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ZTE zx297520v3 SoC clock and reset controller
> +
> +maintainers:
> +  - Stefan D=F6singer <stefandoesinger@gmail.com>
> +
> +description: |
> +  The zx297520v3's clock controller consists of 3 controllers, which gen=
erate
> +  clocks for internal SoC devices. In addition to clocks it also has res=
et
> +  controls for most, but not all, devices.
> +
> +  While there is a certain hierarchy among the controllers ("top" contro=
lls core
> +  parts like the boot-up Cortex M0, "matrix" controls the main CPU and L=
TE DSP,
> +  "lsp" controls peripherals"), in practise all 3 are required to reason=
ably
> +  operate the SoC.
> +
> +  The top controller has two inputs: a 26 MHz and a 32 KHz external osci=
llator.
> +  They need to be provided as input clocks. The matrix controller contro=
lls 10
> +  clock lines that get fed into the LSP controller. The LSP device node =
needs
> +  to list these input clocks.
> +
> +  The matrix controller consumes clocks generated by PLLs in the top
> +  controller, but there are no controls in the top controller to sever t=
his
> +  link. The interface between these controllers is not expressed in the =
device
> +  tree, but the matrix controller cannot work without the clock handles
> +  registered by the top controller.
> +
> +  All available clocks are defined as preprocessor macros in
> +  'dt-bindings/clock/zte,zx297520v3-clk.h' header.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - zte,zx297520v3-topclk
> +      - zte,zx297520v3-matrixclk

How come the "matrixclk" has no constraints on clock properties?

> +      - zte,zx297520v3-lspclk
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 10
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 10
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: zte,zx297520v3-topclk
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26 MHz)
> +            - description: External reference clock (32 KHz)
> +        clock-names:
> +          items:
> +            - const: osc26m
> +            - const: osc32k
> +      required:
> +        - clocks
> +        - clock-names
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: zte,zx297520v3-lspclk

Although, these two devices seem too different to be in the same
dt-binding. Do they have anyhting in common other than the SoC they are
part of?

Cheers,
Conor.

> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Main PLL divided by 5 output from matrixclk (=
124.8 MHz)
> +            - description: Main PLL divided by 4 output from matrixclk (=
156 MHz)
> +            - description: Main PLL divided by 6 output from matrixclk (=
104 MHz)
> +            - description: Main PLL divided by 8 output from matrixclk (=
78 MHz)
> +            - description: Main PLL divided by 12 output from matrixclk =
(52 MHz)
> +            - description: Main oscillator output from matrixclk (26 MHz)
> +            - description: Timer oscillator output from matrixclk (32 KH=
z)
> +            - description: LSP pclk output from matrixclk (26 MHz)
> +            - description: TDM wclk mux output from matrixclk
> +            - description: DPLL divided by 4 output from matrixclk (122.=
88 MHz)
> +        clock-names:
> +          items:
> +            - const: mpll_d5
> +            - const: mpll_d4
> +            - const: mpll_d6
> +            - const: mpll_d8
> +            - const: mpll_d12
> +            - const: osc26m
> +            - const: osc32k
> +            - const: pclk
> +            - const: tdm_wclk
> +            - const: dpll_d4
> +      required:
> +        - clocks
> +        - clock-names
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - '#clock-cells'
> +  - reg
> +  - '#reset-cells'
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
> +
> +    osc26m: osc26m {
> +      compatible =3D "fixed-clock";
> +      clock-output-names =3D "osc26m";
> +      #clock-cells =3D <0>;
> +    };
> +
> +    osc32k: osc32k {
> +      compatible =3D "fixed-clock";
> +      clock-output-names =3D "osc32k";
> +      #clock-cells =3D <0>;
> +    };
> +
> +    topclk: topclk@13b000 {
> +        compatible =3D "zte,zx297520v3-topclk";
> +        reg =3D <0x0013b000 0x400>;
> +        #clock-cells =3D <1>;
> +        #reset-cells =3D <1>;
> +        clocks =3D <&osc26m>, <&osc32k>;
> +        clock-names =3D "osc26m", "osc32k";
> +    };
> +
> +    matrixclk: matrixclk@1306000 {
> +        compatible =3D "zte,zx297520v3-matrixclk";
> +        reg =3D <0x01306000 0x400>;
> +        #clock-cells =3D <1>;
> +        #reset-cells =3D <1>;
> +    };
> +
> +    lspclk: lspclk@1400000 {
> +        compatible =3D "zte,zx297520v3-lspclk";
> +        reg =3D <0x01400000 0x100>;
> +        #clock-cells =3D <1>;
> +        #reset-cells =3D <1>;
> +
> +        clocks =3D <&matrixclk ZX297520V3_LSP_MPLL_D5_WCLK>,
> +                 <&matrixclk ZX297520V3_LSP_MPLL_D4_WCLK>,
> +                 <&matrixclk ZX297520V3_LSP_MPLL_D6_WCLK>,
> +                 <&matrixclk ZX297520V3_LSP_MPLL_D8_WCLK>,
> +                 <&matrixclk ZX297520V3_LSP_MPLL_D12_WCLK>,
> +                 <&matrixclk ZX297520V3_LSP_OSC26M_WCLK>,
> +                 <&matrixclk ZX297520V3_LSP_OSC32K_WCLK>,
> +                 <&matrixclk ZX297520V3_LSP_PCLK>,
> +                 <&matrixclk ZX297520V3_LSP_TDM_WCLK>,
> +                 <&matrixclk ZX297520V3_LSP_DPLL_D4_WCLK>;
> +        clock-names =3D "mpll_d5", "mpll_d4", "mpll_d6", "mpll_d8", "mpl=
l_d12",
> +                      "osc26m", "osc32k", "pclk", "tdm_wclk", "dpll_d4";
> +    };
> diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-=
bindings/clock/zte,zx297520v3-clk.h
> new file mode 100644
> index 000000000000..322b53be8b12
> --- /dev/null
> +++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
> @@ -0,0 +1,179 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) Stefan D=F6singer.
> + */
> +
> +#ifndef __DT_BINDINGS_CLOCK_ZX297520V3_H
> +#define __DT_BINDINGS_CLOCK_ZX297520V3_H
> +
> +#define ZX297520V3_AHB_WCLK			0
> +#define ZX297520V3_AHB_PCLK			1
> +#define ZX297520V3_PMM_WCLK			2
> +#define ZX297520V3_PMM_PCLK			3
> +#define ZX297520V3_USB_24M			4
> +#define ZX297520V3_USB_AHB			5
> +#define ZX297520V3_TIMER_T08_WCLK		6
> +#define ZX297520V3_TIMER_T08_PCLK		7
> +#define ZX297520V3_TIMER_T09_WCLK		8
> +#define ZX297520V3_TIMER_T09_PCLK		9
> +#define ZX297520V3_TIMER_T12_WCLK		10
> +#define ZX297520V3_TIMER_T12_PCLK		11
> +#define ZX297520V3_TIMER_T13_WCLK		12
> +#define ZX297520V3_TIMER_T13_PCLK		13
> +#define ZX297520V3_TIMER_T14_WCLK		14
> +#define ZX297520V3_TIMER_T14_PCLK		15
> +#define ZX297520V3_TIMER_T15_WCLK		16
> +#define ZX297520V3_TIMER_T15_PCLK		17
> +#define ZX297520V3_TIMER_T16_WCLK		18
> +#define ZX297520V3_TIMER_T16_PCLK		19
> +#define ZX297520V3_TIMER_T17_WCLK		20
> +#define ZX297520V3_TIMER_T17_PCLK		21
> +#define ZX297520V3_WDT_T18_WCLK			22
> +#define ZX297520V3_WDT_T18_PCLK			23
> +#define ZX297520V3_UART0_WCLK			24
> +#define ZX297520V3_UART0_PCLK			25
> +#define ZX297520V3_I2C0_WCLK			26
> +#define ZX297520V3_I2C0_PCLK			27
> +#define ZX297520V3_RTC_WCLK			28
> +#define ZX297520V3_RTC_PCLK			29
> +#define ZX297520V3_LPM_GSM_WCLK			30
> +#define ZX297520V3_LPM_GSM_PCLK			31
> +#define ZX297520V3_LPM_LTE_WCLK			32
> +#define ZX297520V3_LPM_LTE_PCLK			33
> +#define ZX297520V3_LPM_TD_WCLK			34
> +#define ZX297520V3_LPM_TD_PCLK			35
> +#define ZX297520V3_LPM_W_WCLK			36
> +#define ZX297520V3_LPM_W_PCLK			37
> +#define ZX297520V3_USIM1_WCLK			38
> +#define ZX297520V3_USIM1_PCLK			39
> +#define ZX297520V3_M0_WCLK			40
> +#define ZX297520V3_TOPCLK_END			41
> +
> +#define ZX297520V3_AHB_RESET			0
> +#define ZX297520V3_TIMER_T08_RESET		1
> +#define ZX297520V3_TIMER_T09_RESET		2
> +#define ZX297520V3_TIMER_T12_RESET		3
> +#define ZX297520V3_TIMER_T13_RESET		4
> +#define ZX297520V3_TIMER_T14_RESET		5
> +#define ZX297520V3_TIMER_T15_RESET		6
> +#define ZX297520V3_TIMER_T16_RESET		7
> +#define ZX297520V3_TIMER_T17_RESET		8
> +#define ZX297520V3_WDT_T18_RESET		9
> +#define ZX297520V3_UART0_RESET			10
> +#define ZX297520V3_I2C0_RESET			11
> +#define ZX297520V3_RTC_RESET			12
> +#define ZX297520V3_USIM1_RESET			13
> +#define ZX297520V3_PMM_RESET			14
> +#define ZX297520V3_GPIO8_RESET			15
> +#define ZX297520V3_GPIO_RESET			16
> +#define ZX297520V3_ZSP_RESET			17
> +#define ZX297520V3_USB_RESET			18
> +#define ZX297520V3_TOPRST_END			19
> +
> +#define ZX297520V3_CPU_WCLK			0
> +#define ZX297520V3_CPU_PCLK			1
> +#define ZX297520V3_SD0_WCLK			2
> +#define ZX297520V3_SD0_PCLK			3
> +#define ZX297520V3_SD1_WCLK			4
> +#define ZX297520V3_SD1_PCLK			5
> +#define ZX297520V3_SD1_CDET			6
> +#define ZX297520V3_NAND_WCLK			7
> +#define ZX297520V3_NAND_PCLK			8
> +#define ZX297520V3_SSC_WCLK			9
> +#define ZX297520V3_SSC_PCLK			10
> +#define ZX297520V3_EDCP_WCLK			11
> +#define ZX297520V3_EDCP_PCLK			12
> +#define ZX297520V3_EDCP_SYNCAXI			13
> +#define ZX297520V3_VOU_WCLK			14
> +#define ZX297520V3_VOU_PCLK			15
> +#define ZX297520V3_PDCFG_WCLK			16
> +#define ZX297520V3_PDCFG_PCLK			17
> +#define ZX297520V3_GMAC_WCLK			18
> +#define ZX297520V3_GMAC_RMII			19
> +#define ZX297520V3_GMAC_PCLK			20
> +#define ZX297520V3_ZSP_WCLK			21
> +#define ZX297520V3_MBOX_PCLK			22
> +#define ZX297520V3_DMA_PCLK			23
> +#define ZX297520V3_LSP_MPLL_D5_WCLK		24
> +#define ZX297520V3_LSP_MPLL_D4_WCLK		25
> +#define ZX297520V3_LSP_MPLL_D6_WCLK		26
> +#define ZX297520V3_LSP_MPLL_D8_WCLK		27
> +#define ZX297520V3_LSP_MPLL_D12_WCLK		28
> +#define ZX297520V3_LSP_OSC26M_WCLK		29
> +#define ZX297520V3_LSP_OSC32K_WCLK		30
> +#define ZX297520V3_LSP_PCLK			31
> +#define ZX297520V3_LSP_TDM_WCLK			32
> +#define ZX297520V3_LSP_DPLL_D4_WCLK		33
> +#define ZX297520V3_MATRIXCLK_END		34
> +
> +#define ZX297520V3_CPU_RESET			0
> +#define ZX297520V3_SD0_RESET			1
> +#define ZX297520V3_SD1_RESET			2
> +#define ZX297520V3_NAND_RESET			3
> +#define ZX297520V3_SSC_RESET			4
> +#define ZX297520V3_EDCP_RESET			5
> +#define ZX297520V3_VOU_RESET			6
> +#define ZX297520V3_PDCFG_RESET			7
> +#define ZX297520V3_GMAC_RESET			8
> +#define ZX297520V3_DMA_RESET			9
> +#define ZX297520V3_MATRIXRST_END		10
> +
> +#define ZX297520V3_TIMER_L1_WCLK		0
> +#define ZX297520V3_TIMER_L1_PCLK		1
> +#define ZX297520V3_WDT_L2_WCLK			2
> +#define ZX297520V3_WDT_L2_PCLK			3
> +#define ZX297520V3_WDT_L3_WCLK			4
> +#define ZX297520V3_WDT_L3_PCLK			5
> +#define ZX297520V3_I2C1_WCLK			6
> +#define ZX297520V3_I2C1_PCLK			7
> +#define ZX297520V3_I2S0_WCLK			8
> +#define ZX297520V3_I2S0_PCLK			9
> +#define ZX297520V3_I2S1_WCLK			10
> +#define ZX297520V3_I2S1_PCLK			11
> +#define ZX297520V3_QSPI_WCLK			12
> +#define ZX297520V3_QSPI_PCLK			13
> +#define ZX297520V3_UART1_WCLK			14
> +#define ZX297520V3_UART1_PCLK			15
> +#define ZX297520V3_I2C2_WCLK			16
> +#define ZX297520V3_I2C2_PCLK			17
> +#define ZX297520V3_SPI0_WCLK			18
> +#define ZX297520V3_SPI0_PCLK			19
> +#define ZX297520V3_TIMER_LB_WCLK		20
> +#define ZX297520V3_TIMER_LB_PCLK		21
> +#define ZX297520V3_TIMER_LC_WCLK		22
> +#define ZX297520V3_TIMER_LC_PCLK		23
> +#define ZX297520V3_UART2_WCLK			24
> +#define ZX297520V3_UART2_PCLK			25
> +#define ZX297520V3_WDT_LE_WCLK			26
> +#define ZX297520V3_WDT_LE_PCLK			27
> +#define ZX297520V3_TIMER_LF_WCLK		28
> +#define ZX297520V3_TIMER_LF_PCLK		29
> +#define ZX297520V3_SPI1_WCLK			30
> +#define ZX297520V3_SPI1_PCLK			31
> +#define ZX297520V3_TIMER_L11_WCLK		32
> +#define ZX297520V3_TIMER_L11_PCLK		33
> +#define ZX297520V3_TDM_WCLK			34
> +#define ZX297520V3_TDM_PCLK			35
> +#define ZX297520V3_LSPCLK_END			36
> +
> +#define ZX297520V3_TIMER_L1_RESET		0
> +#define ZX297520V3_WDT_L2_RESET			1
> +#define ZX297520V3_WDT_L3_RESET			2
> +#define ZX297520V3_I2C1_RESET			3
> +#define ZX297520V3_I2S0_RESET			4
> +#define ZX297520V3_I2S1_RESET			5
> +#define ZX297520V3_QSPI_RESET			6
> +#define ZX297520V3_UART1_RESET			7
> +#define ZX297520V3_I2C2_RESET			8
> +#define ZX297520V3_SPI0_RESET			9
> +#define ZX297520V3_TIMER_LB_RESET		10
> +#define ZX297520V3_TIMER_LC_RESET		11
> +#define ZX297520V3_UART2_RESET			12
> +#define ZX297520V3_WDT_LE_RESET			13
> +#define ZX297520V3_TIMER_LF_RESET		14
> +#define ZX297520V3_SPI1_RESET			15
> +#define ZX297520V3_TIMER_L11_RESET		16
> +#define ZX297520V3_TDM_RESET			17
> +#define ZX297520V3_LSPRST_END			18
> +
> +#endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */
>=20
> --=20
> 2.53.0
>=20

--X42tWiqzEfN/q3j3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagH+sgAKCRB4tDGHoIJi
0nysAQCYP4MmDyGBfpWnihc+5SLf5oFhw+0gSEOLOM0FdPvxQwEApjhCT6IBo5gz
FDJ3z5iIAZnaiMt9hAEXMpv/OfV9ZAw=
=QEGH
-----END PGP SIGNATURE-----

--X42tWiqzEfN/q3j3--
