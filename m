Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:54091 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752117AbbK0UVS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Fri, 27 Nov 2015 15:21:18 -0500
Date: Fri, 27 Nov 2015 14:21:14 -0600
From: Rob Herring <robh@kernel.org>
To: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@free-electrons.com>,
	Jason Cooper <jason@lakedaemon.net>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH 1/3] dt-bindings: add Marvell core PLL and clock divider
 PMU documentation
Message-ID: <20151127202114.GA613@rob-hp-laptop>
References: <E1a24wj-0004iw-Rf@rmk-PC.arm.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E1a24wj-0004iw-Rf@rmk-PC.arm.linux.org.uk>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Nov 26, 2015 at 10:23:21PM +0000, Russell King wrote:
> Add documentation for the Marvell clock divider driver, which is used
> to source clocks for the AXI bus, video decoder, GPU and LCD blocks.
> 
> Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
> ---
>  .../bindings/clock/dove-divider-clock.txt          | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/dove-divider-clock.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/dove-divider-clock.txt b/Documentation/devicetree/bindings/clock/dove-divider-clock.txt
> new file mode 100644
> index 000000000000..0c602de279e5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/dove-divider-clock.txt
> @@ -0,0 +1,28 @@
> +PLl divider based Dove clocks
> +
> +Marvell Dove has a 2GHz PLL, which feeds into a set of dividers to provide
> +high speed clocks for a number of peripherals.  These dividers are part of
> +the PMU, and thus this node should be a child of the PMU node.

It seems a bit strange to just be documenting these clocks. What about 
the rest of the SOC clocks?

> +
> +The following clocks are provided:
> +
> +ID	Clock
> +-------------
> +0	AXI bus clock
> +1	GPU clock
> +2	VMeta clock
> +3	LCD clock
> +
> +Required properties:
> +- compatible : shall be "marvell,dove-divider-clock"
> +- reg : shall be the register address of the Core PLL and Clock Divider
> +   Control 0 register.  This will cover that register, as well as the
> +   Core PLL and Clock Divider Control 1 register.  Thus, it will have
> +   a size of 8.
> +- #clock-cells : from common clock binding; shall be set to 1
> +
> +divider_clk: core-clock@0064 {
> +	compatible = "marvell,dove-divider-clock";
> +	reg = <0x0064 0x8>;
> +	#clock-cells = <1>;
> +};
> -- 
> 2.1.0
> 
