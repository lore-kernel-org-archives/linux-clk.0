Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 27 Jan 2017 15:15:59 -0600
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 06/11] clk: sunxi-ng: Add A80 USB CCU
Message-ID: <20170127211559.ztsauntipyiheopu@rob-hp-laptop>
References: <20170124023230.3990-1-wens@csie.org>
 <20170124023230.3990-7-wens@csie.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170124023230.3990-7-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jan 24, 2017 at 10:32:25AM +0800, Chen-Yu Tsai wrote:
> Add support for the USB clock controls found on the A80.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  .../devicetree/bindings/clock/sun9i-usb.txt        |  24 ++++
>  drivers/clk/sunxi-ng/Makefile                      |   1 +
>  drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c           | 144 +++++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.h           |  25 ++++
>  include/dt-bindings/clock/sun9i-a80-usb.h          |  59 +++++++++
>  include/dt-bindings/reset/sun9i-a80-usb.h          |  56 ++++++++
>  6 files changed, 309 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sun9i-usb.txt
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.h
>  create mode 100644 include/dt-bindings/clock/sun9i-a80-usb.h
>  create mode 100644 include/dt-bindings/reset/sun9i-a80-usb.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/sun9i-usb.txt b/Documentation/devicetree/bindings/clock/sun9i-usb.txt
> new file mode 100644
> index 000000000000..c2d38626eaaa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/sun9i-usb.txt
> @@ -0,0 +1,24 @@
> +Allwinner A80 USB Clock Control Binding
> +------------------------------------
> +
> +Required properties :
> +- compatible: must contain one of the following compatibles:
> +		- "allwinner,sun9i-a80-usb-clocks"
> +
> +- reg: Must contain the registers base address and length
> +- clocks: phandle to the clocks feeding the USB subsystem. Two are needed:
> +  - "bus": the bus clock for the whole USB subsystem
> +  - "hosc": the high frequency oscillator (usually at 24MHz)
> +- clock-names: Must contain the clock names described just above
> +- #clock-cells : must contain 1
> +- #reset-cells : must contain 1
> +
> +Example:
> +usb_clocks: clock@00a08000 {

Drop leading 0s.

With that, for the binding:

Acked-by: Rob Herring <robh@kernel.org>

> +	compatible = "allwinner,sun9i-a80-usb-clks";
> +	reg = <0x00a08000 0x8>;
> +	clocks = <&ccu CLK_BUS_USB>, <&osc24M>;
> +	clock-names = "bus", "hosc";
> +	#clock-cells = <1>;
> +	#reset-cells = <1>;
> +};
