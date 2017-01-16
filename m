Return-Path: <t-kristo@ti.com>
Subject: Re: [PATCH] Documentation: dt-bindings: Add binding documentation for
 TI clkctrl clocks
To: Tony Lindgren <tony@atomide.com>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
References: <20170109234226.9449-1-tony@atomide.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, Paul Walmsley <paul@pwsan.com>,
        Rob Herring
	<robh@kernel.org>
From: Tero Kristo <t-kristo@ti.com>
Message-ID: <7acb6824-0e64-960b-1490-9b7a8b867b3b@ti.com>
Date: Mon, 16 Jan 2017 17:19:33 +0200
MIME-Version: 1.0
In-Reply-To: <20170109234226.9449-1-tony@atomide.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 10/01/17 01:42, Tony Lindgren wrote:
> Texas Instruments omap variant SoCs starting with omap4 have a clkctrl
> clock controller instance for each interconnect target module. The clkctrl
> controls functional and interface clocks for the module.
>
> The clkctrl clocks are currently handled by arch/arm/mach-omap2 hwmod code.
> With this binding and a related clock device driver we can start moving the
> clkctrl clock handling to live in drivers/clk/ti.
>
> For hardware reference, see omap4430 TRM "Table 3-1312. L4PER_CM2 Registers
> Mapping Summary" for example. It show one instance of a clkctrl clock
> controller with multiple clkctrl registers.
>
> Note that this binding allows keeping the clockdomain related parts out of
> drivers/clock. The CLKCTCTRL and DYNAMICDEP registers can be handled by
> using a separate driver in drivers/soc/ti and genpd. If the clockdomain
> driver needs to know it's clocks, we can just set the the clkctrl device
> instances to be children of the related clockdomain device.
>
> On omap4 CM_L3INIT_USB_HOST_HS_CLKCTRL on omap5 has eight OPTFCLKEN bits.
> So we need to shift the clock index to avoid index conflict for the clock
> consumer binding with the next clkctrl offset on omap4.
>
> Cc: Paul Walmsley <paul@pwsan.com>
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>
> So here's what I was able to come up for the clkctr binding based on
> all we've discussed so far. Can you guys please take a look and see
> if it looks OK to you before we do the device driver?
>
> Also, does anybody have better suggestions for addressing the optional
> clocks in each clkctrl register?
>
> ---
>  .../devicetree/bindings/clock/ti-clkctrl.txt       | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/ti-clkctrl.txt
>
> diff --git a/Documentation/devicetree/bindings/clock/ti-clkctrl.txt b/Documentation/devicetree/bindings/clock/ti-clkctrl.txt
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti-clkctrl.txt
> @@ -0,0 +1,56 @@
> +Texas Instruments clkctrl clock binding
> +
> +Texas Instruments SoCs can have a clkctrl clock controller for each
> +interconnect target module. The clkctrl clock controller manages functional
> +and interface clocks for each module. Each clkctrl controller can also
> +gate one or more optional functional clocks for a module. The clkctrl
> +clock controller is typical for omap3 and later variants.
> +
> +The clock consumers can specify the index of the clkctrl clock using
> +the hardware offset from the clkctrl instance register space. The optional
> +functional clocks can be specified by clkctrl hardware offset plus the
> +index of the optional clock. Please see the Linux clock framework binding
> +at Documentation/devicetree/bindings/clock/clock-bindings.txt.
> +
> +Required properties :
> +- compatible : shall be "ti,clkctrl"
> +- #clock-cells : shall contain 1
> +
> +Optional properties :
> +- "ti,modulemode-auto" : list of clkctrl offsets using automatic gating
> +
> +Example: Clock controller node:
> +
> +&cm_l4per {
> +	cm_l4per_clkctrl: clk@20 {
> +		compatible = "ti,clkctrl";
> +		reg = <0x20 0x1b0>;
> +		#clock-cells = 1;
> +		ti,modulemode-auto = <OMAP4_GPIO2_CLKCTRL>;
> +	};
> +};

So, in this example, what would cm_l4per be? Is it a clockdomain? Or is 
it just an arbitrary interconnect instance, and the clockdomain would 
also be a separate node under cm_l4per?

Shall we add power-domains = <&cm_l4per_clkdm>; entry under the 
cm_l4per_clkctrl in this example? (My thinking is that we will represent 
both OMAP clock and power domains as generic power domains within kernel 
/ DT.)

-Tero

> +
> +Example: Preprocessor helper macros in dt-bindings/ti-clkctrl.h
> +
> +#define OMAP4_CLKCTRL_OFFSET		0x20
> +
> +#define OMAP_CLKCTRL_INDEX(offset)		\
> +	(((offset) - OMAP4_CLKCTRL_OFFSET) << 8)
> +
> +#define OMAP_CLKCTRL_OPT_INDEX(offset, optclk)	\
> +	(OMAP_CLKCTRL_INDEX(offset) + (optclk))
> +
> +#define OMAP4_GPTIMER10_CLKTRL		OMAP_CLKCTRL_INDEX(0x28)
> +#define OMAP4_GPTIMER11_CLKTRL		OMAP_CLKCTRL_INDEX(0x30)
> +#define OMAP4_GPTIMER2_CLKTRL		OMAP_CLKCTRL_INDEX(0x38)
> +...
> +#define OMAP4_GPIO2_CLKCTRL		OMAP_CLKCTRL_INDEX(0x60)
> +#define OMAP4_GPIO2_CLKCTRL_DBCLK	OMAP_CLKCTRL_OPT_INDEX(0x60, 1)
> +...
> +
> +Example: Clock consumer node for GPIO2:
> +
> +&gpio2 {
> +       clocks = <&cm_l4per_clkctrl OMAP4_GPIO2_CLKCTRL
> +		 &cm_l4per_clkctrl OMAP4_GPIO2_CLKCTRL_DBCLK>;
> +};
>
