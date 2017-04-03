Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Mon, 3 Apr 2017 10:33:23 -0500
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v3 01/11] dt-bindings: add binding for the Allwinner DE2
 CCU
Message-ID: <20170403153323.kmq3ku7h3sj7fp4g@rob-hp-laptop>
References: <20170329194613.55548-1-icenowy@aosc.io>
 <20170329194613.55548-2-icenowy@aosc.io>
MIME-Version: 1.0
In-Reply-To: <20170329194613.55548-2-icenowy@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Icenowy Zheng <icenowy@aosc.xyz>,
 Maxime Ripard <maxime.ripard@free-electrons.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Mar 30, 2017 at 03:46:03AM +0800, Icenowy Zheng wrote:
> From: Icenowy Zheng <icenowy@aosc.xyz>
> 
> Allwinner "Display Engine 2.0" contains some clock controls in it.
> 
> In order to add them as clock drivers, we need a device tree binding.
> Add the binding here.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
> Changes in v3:
> - Fill the address space length of DE2 CCU to 0x100000, just reach the start of mixer0.

Why? You waste virtual memory space making this bigger than it needs to 
be. Not an issue so much for 64-bit.

> 
>  .../devicetree/bindings/clock/sun8i-de2.txt        | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sun8i-de2.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/sun8i-de2.txt b/Documentation/devicetree/bindings/clock/sun8i-de2.txt
> new file mode 100644
> index 000000000000..34cf79c05f13
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/sun8i-de2.txt
> @@ -0,0 +1,31 @@
> +Allwinner Display Engine 2.0 Clock Control Binding
> +--------------------------------------------------
> +
> +Required properties :
> +- compatible: must contain one of the following compatibles:
> +		- "allwinner,sun8i-a83t-de2-clk"
> +		- "allwinner,sun50i-a64-de2-clk"
> +		- "allwinner,sun50i-h5-de2-clk"
> +
> +- reg: Must contain the registers base address and length
> +- clocks: phandle to the clocks feeding the display engine subsystem.
> +	  Three are needed:
> +  - "mod": the display engine module clock
> +  - "bus": the bus clock for the whole display engine subsystem
> +- clock-names: Must contain the clock names described just above
> +- resets: phandle to the reset control for the display engine subsystem.
> +- #clock-cells : must contain 1
> +- #reset-cells : must contain 1
> +
> +Example:
> +de2_clocks: clock@01000000 {

Drop the leading 0s. dtc in linux-next will now warn on this with W=1 
compile. Looks like sunxi has a lot of them. Please fix so we don't keep 
repeating this same copy-n-paste.

> +	compatible = "allwinner,sun50i-a64-de2-clk";
> +	reg = <0x01000000 0x100000>;
> +	clocks = <&ccu CLK_DE>,
> +		 <&ccu CLK_BUS_DE>;
> +	clock-names = "mod",
> +		      "bus";
> +	resets = <&ccu RST_BUS_DE>;
> +	#clock-cells = <1>;
> +	#reset-cells = <1>;
> +};
> -- 
> 2.12.0
> 

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
