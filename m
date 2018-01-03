Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Wed, 3 Jan 2018 14:58:17 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jason Cooper <jason@lakedaemon.net>,
	Marc Zyngier <marc.zyngier@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] irqchip: Add the ingenic-tcu-intc driver
Message-ID: <20180103205817.4hnoyyomtwmhri76@rob-hp-laptop>
References: <20171229125942.27305-2-paul@crapouillou.net>
 <20180101143344.2099-1-paul@crapouillou.net>
 <20180101143344.2099-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180101143344.2099-3-paul@crapouillou.net>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jan 01, 2018 at 03:33:41PM +0100, Paul Cercueil wrote:
> This simple driver handles the IRQ chip of the TCU
> (Timer Counter Unit) of the JZ47xx Ingenic SoCs.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../bindings/interrupt-controller/ingenic,tcu.txt  |  32 +++++
>  drivers/irqchip/Kconfig                            |   6 +
>  drivers/irqchip/Makefile                           |   1 +
>  drivers/irqchip/irq-ingenic-tcu.c                  | 151 +++++++++++++++++++++
>  4 files changed, 190 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ingenic,tcu.txt
>  create mode 100644 drivers/irqchip/irq-ingenic-tcu.c
> 
>  v2: Use SPDX identifier for the license
>      Make KConfig option select CONFIG_IRQ_DOMAIN since we depend on it
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/ingenic,tcu.txt b/Documentation/devicetree/bindings/interrupt-controller/ingenic,tcu.txt
> new file mode 100644
> index 000000000000..a3e6318f8461
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/ingenic,tcu.txt
> @@ -0,0 +1,32 @@
> +Ingenic SoCs Timer/Counter Unit Interrupt Controller
> +
> +Required properties:
> +
> +- compatible : should be "ingenic,<socname>-tcu-intc". Valid strings are:
> +  * ingenic,jz4740-tcu-intc
> +  * ingenic,jz4770-tcu-intc
> +  * ingenic,jz4780-tcu-intc
> +- interrupt-controller : Identifies the node as an interrupt controller
> +- #interrupt-cells : Specifies the number of cells needed to encode an
> +  interrupt source. The value shall be 1.
> +- interrupt-parent : phandle of the interrupt controller.
> +- interrupts : Specifies the interrupt the controller is connected to.
> +
> +Example:
> +
> +/ {
> +	regmap {

regmap is a Linuxism.

> +		compatible = "simple-mfd", "syscon";

Need a specific compatible string here. Neither of these are valid by 
themselves.

> +		reg = <0x10002000 0x1000>;
> +
> +		tcu: interrupt-controller {

The TCU is only an interrupt controller?

> +			compatible = "ingenic,jz4740-tcu-intc";

Is there a register range associated with this block? If so, add a reg 
property even if regmap doesn't need it.

> +
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			interrupt-parent = <&intc>;
> +			interrupts = <15>;
> +		};
> +	};
> +};
