Return-Path: <mcoquelin.stm32@gmail.com>
Return-Path: <mcoquelin.stm32@gmail.com>
Message-ID: <55698104.2070205@gmail.com>
Date: Sat, 30 May 2015 11:21:08 +0200
From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
MIME-Version: 1.0
To: Daniel Thompson <daniel.thompson@linaro.org>,
 Mike Turquette <mturquette@linaro.org>,
 Stephen Boyd <sboyd@codeaurora.org>
CC: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>,
 Russell King <linux@arm.linux.org.uk>, Kamil Lulko <rev13@wp.pl>,
 Andreas Farber <afaerber@suse.de>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: Re: [PATCH v2 2/4] dt-bindings: Document the STM32F4 clock bindings
References: <1432327273-6810-1-git-send-email-daniel.thompson@linaro.org> <1432972448-10332-1-git-send-email-daniel.thompson@linaro.org> <1432972448-10332-3-git-send-email-daniel.thompson@linaro.org>
In-Reply-To: <1432972448-10332-3-git-send-email-daniel.thompson@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

HI Daniel,

On 05/30/2015 09:54 AM, Daniel Thompson wrote:
> This adds documentation of device tree bindings for the clock related
> portions of the STM32 RCC block.
>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>   .../devicetree/bindings/clock/st,stm32-rcc.txt     | 65 ++++++++++++++++++++++
>   1 file changed, 65 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
>
> diff --git a/Documentation/devicetree/bindings/clock/st,stm32-rcc.txt b/Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
> new file mode 100644
> index 0000000..9715d09
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
> @@ -0,0 +1,65 @@
> +STMicroelectronics STM32 Reset and Clock Controller
> +===================================================
> +
> +The RCC IP is both a reset and a clock controller. This documentation only
> +describes the clock part.
> +
> +Please also refer to clock-bindings.txt in this directory for common clock
> +controller binding usage.
> +
> +Required properties:
> +- compatible: Should be "st,stm32f42xx-rcc"
> +- reg: should be register base and length as documented in the
> +  datasheet
> +- #clock-cells: 2, device nodes should specify the clock in their "clocks"
> +  property, containing a phandle to the clock device node, an index selecting
> +  between gated clocks and other clocks and an index specifying the clock to
> +  use.
> +
> +Example:
> +
> +	rcc: rcc@40023800 {
> +		#clock-cells = <2>
> +		compatible = "st,stm32f42xx-rcc", "st,stm32-rcc";
> +		reg = <0x40023800 0x400>;
> +	};
> +
> +Specifying gated clocks
> +=======================
> +
> +The primary index must be set to 0.
> +
> +The secondary index is the bit number within the RCC register bank, starting
> +from the first RCC clock enable register (RCC_AHB1ENR, address offset 0x30).
> +
> +It is calculated as: index = register_offset / 4 * 32 + bit_offset.
> +Where bit_offset is the bit offset within the register (LSB is 0, MSB is 31).
> +
> +Example:
> +
> +	/* Gated clock, AHB1 bit 0 (GPIOA) */
> +	... {
> +		clocks = <&rcc 0 0>
> +	};
> +
> +	/* Gated clock, AHB2 bit 4 (GPIOA) */
s/GPIOA/CRYP/
> +	... {
> +		clocks = <&rcc 0 36>
> +	};
> +
> +Specifying other clocks
> +=======================
> +
> +The primary index must be set to 1.
> +
> +The secondary index is bound with the following magic numbers:
> +
> +	0	SYSTICK
> +	1	FCLK
How do you plan to handle the SAI & I2S clocks?
By adding index 3?
