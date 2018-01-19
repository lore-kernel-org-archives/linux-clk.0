Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 19 Jan 2018 15:11:31 -0600
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
Subject: Re: [PATCH v3 4/9] doc: dt-bindings: Add doc for the Ingenic TCU
 clocks driver
Message-ID: <20180119211131.w5ekt63w5j6uxgqx@rob-hp-laptop>
References: <20180101143344.2099-1-paul@crapouillou.net>
 <20180110224838.16711-1-paul@crapouillou.net>
 <20180110224838.16711-4-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180110224838.16711-4-paul@crapouillou.net>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jan 10, 2018 at 11:48:33PM +0100, Paul Cercueil wrote:
> Add documentation about how to properly use the Ingenic TCU
> (Timer/Counter Unit) clocks driver from devicetree.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../bindings/clock/ingenic,tcu-clocks.txt          | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/ingenic,tcu-clocks.txt
> 
>  v3: New patch in this series
> 
> diff --git a/Documentation/devicetree/bindings/clock/ingenic,tcu-clocks.txt b/Documentation/devicetree/bindings/clock/ingenic,tcu-clocks.txt
> new file mode 100644
> index 000000000000..90bb30e07b86
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ingenic,tcu-clocks.txt
> @@ -0,0 +1,36 @@
> +Ingenic SoC TCU binding
> +
> +The TCU is the Timer/Counter Unit present in all Ingenic SoCs. It features 8
> +channels, each one having its own clock, that can be started and stopped,
> +reparented, and reclocked.
> +
> +Required properties:
> +- compatible : One of:
> +  * ingenic,jz4740-tcu-clocks,
> +  * ingenic,jz4770-tcu-clocks,
> +  * ingenic,jz4780-tcu-clocks.
> +- clocks : List of phandle & clock specifiers for clocks external to the TCU.
> +  The "pclk", "rtc" and "ext" clocks should be provided.
> +- clock-names : List of name strings for the external clocks.
> +- #clock-cells: Should be 1.
> +  Clock consumers specify this argument to identify a clock. The valid values
> +  may be found in <dt-bindings/clock/ingenic,tcu.h>.

Need to say this is a child of "ingenic,tcu" and reference it's binding 
doc.

> +
> +Example:
> +
> +/ {
> +	mfd@10002000 {
> +		compatible = "ingenic,tcu", "simple-mfd", "syscon";
> +		reg = <0x10002000 0x1000>;
> +
> +		tcu_clk: clocks {

clocks@10002010

And ranges needed.

> +			compatible = "ingenic,jz4740-tcu-clocks";
> +			reg = <0x10002010 0xFF0>;

0xff0

> +
> +			clocks = <&ext>, <&rtc>, <&pclk>;
> +			clock-names = "ext", "rtc", "pclk";
> +
> +			#clock-cells = <1>;
> +		};
> +	};
> +};
> -- 
> 2.11.0
> 
