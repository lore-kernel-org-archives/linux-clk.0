Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 27 Apr 2018 09:05:22 -0500
From: Rob Herring <robh@kernel.org>
To: David Lechner <david@lechnology.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Mark Rutland <mark.rutland@arm.com>, Sekhar Nori <nsekhar@ti.com>,
	Kevin Hilman <khilman@kernel.org>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 24/27] dt-bindings: timer: new bindings for TI DaVinci
 timer
Message-ID: <20180427140522.npmhjamhwxgp7y73@rob-hp-laptop>
References: <20180427001745.4116-1-david@lechnology.com>
 <20180427001745.4116-25-david@lechnology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180427001745.4116-25-david@lechnology.com>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Apr 26, 2018 at 07:17:42PM -0500, David Lechner wrote:
> This adds new device tree bindings for the timer IP block of TI
> DaVinci-like SoCs.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> ---
> 
> v9 changes:
> - new patch in v9
> 
> 
>  .../bindings/timer/ti,davinci-timer.txt       | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/ti,davinci-timer.txt
> 
> diff --git a/Documentation/devicetree/bindings/timer/ti,davinci-timer.txt b/Documentation/devicetree/bindings/timer/ti,davinci-timer.txt
> new file mode 100644
> index 000000000000..2091eca46981
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/ti,davinci-timer.txt
> @@ -0,0 +1,24 @@
> +* Device tree bindings for Texas Instruments DaVinci timer
> +
> +This document provides bindings for the 64-bit timer in the DaVinci
> +architecture devices. The timer can be configured as a general-purpose 64-bit
> +timer, dual general-purpose 32-bit timers. When configured as dual 32-bit
> +timers, each half can operate in conjunction (chain mode) or independently
> +(unchained mode) of each other.
> +
> +It is global timer is a free running up-counter and can generate interrupt

Doesn't make sense, too many 'is'.

There's no interrupt property listed.

> +when the counter reaches preset counter values.
> +
> +Required properties:
> +
> +- compatible : should be "ti,davinci-timer".
> +- reg : specifies base physical address and count of the registers.
> +- clocks : the clock feeding the timer clock.
> +
> +Example:
> +
> +	clocksource: timer@20000 {
> +		compatible = "ti,davinci-timer";
> +		reg = <0x20000 0x1000>;
> +		clocks = <&pll0_auxclk>;
> +	};
> -- 
> 2.17.0
> 
