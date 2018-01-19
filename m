Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 19 Jan 2018 15:05:01 -0600
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
Subject: Re: [PATCH v3 3/9] doc: dt-bindings: Add doc for Ingenic TCU IRQ
 driver
Message-ID: <20180119210501.q2chp3pt4dpzvf4l@rob-hp-laptop>
References: <20180101143344.2099-1-paul@crapouillou.net>
 <20180110224838.16711-1-paul@crapouillou.net>
 <20180110224838.16711-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180110224838.16711-3-paul@crapouillou.net>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jan 10, 2018 at 11:48:32PM +0100, Paul Cercueil wrote:
> Add documentation about how to properly use the Ingenic TCU
> (Timer/Counter Unit) IRQ driver from devicetree.

Drop "doc: " from the subject in this and others.

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../bindings/interrupt-controller/ingenic,tcu.txt  | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ingenic,tcu.txt
> 
>  v3: New patch in this series
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/ingenic,tcu.txt b/Documentation/devicetree/bindings/interrupt-controller/ingenic,tcu.txt
> new file mode 100644
> index 000000000000..e3a7d2354172
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/ingenic,tcu.txt
> @@ -0,0 +1,33 @@
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
> +	mfd@10002000 {
> +		compatible = "ingenic,tcu", "simple-mfd", "syscon";
> +		reg = <0x10002000 0x1000>;

Need a "ranges;" here. Better yet make ranges translate child address 0 
to 0x10002000 base.

> +
> +		tcu_irq: interrupt-controller {

Need a unit-address. Building with W=1 will tell you this (assuming this 
is cut-n-paste from your dts).

interrupt-controlleer@10002020 (or @20 with a ranges translation)

> +			compatible = "ingenic,jz4740-tcu-intc";
> +			reg = <0x10002020 0x20>;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			interrupt-parent = <&intc>;
> +			interrupts = <15>;
> +		};
> +	};
> +};
> -- 
> 2.11.0
> 
