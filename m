Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:50061 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S932401AbbLGRht convert rfc822-to-8bit (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 7 Dec 2015 12:37:49 -0500
From: Gregory CLEMENT <gregory.clement@free-electrons.com>
To: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: add Marvell core PLL and clock divider PMU documentation
References: <E1a5ijC-0007pd-SL@rmk-PC.arm.linux.org.uk>
Date: Mon, 07 Dec 2015 18:37:47 +0100
In-Reply-To: <E1a5ijC-0007pd-SL@rmk-PC.arm.linux.org.uk> (Russell King's
	message of "Sun, 06 Dec 2015 23:28:26 +0000")
Message-ID: <87oae2b1n8.fsf@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Russell,
 
 On lun., déc. 07 2015, Russell King <rmk+kernel@arm.linux.org.uk> wrote:

> Add documentation for the Marvell clock divider driver, which is used
> to source clocks for the AXI bus, video decoder, GPU and LCD blocks.
>
> Acked-by: Andrew Lunn <andrew@lunn.ch>
> Acked-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>

Applied on mvebu/dt

Thanks,

Gregory

> ---
>  .../bindings/clock/dove-divider-clock.txt          | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/dove-divider-clock.txt
>
> diff --git a/Documentation/devicetree/bindings/clock/dove-divider-clock.txt b/Documentation/devicetree/bindings/clock/dove-divider-clock.txt
> new file mode 100644
> index 000000000000..e3eb0f657c5e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/dove-divider-clock.txt
> @@ -0,0 +1,28 @@
> +PLL divider based Dove clocks
> +
> +Marvell Dove has a 2GHz PLL, which feeds into a set of dividers to provide
> +high speed clocks for a number of peripherals.  These dividers are part of
> +the PMU, and thus this node should be a child of the PMU node.
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

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
