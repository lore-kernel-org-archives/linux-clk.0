Return-Path: <f.fainelli@gmail.com>
Return-Path: <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 2/4] dt: bindings: Add bindings for bcm2835-aux-intc
To: Phil Elwell <phil@raspberrypi.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Stefan Wahren <stefan.wahren@i2se.com>, Eric Anholt <eric@anholt.net>,
 Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <d097e5d9-0ee6-9ea4-184f-1dd997849892@raspberrypi.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <5093ed34-a930-dea5-6642-03e1e4910362@gmail.com>
Date: Mon, 12 Jun 2017 11:21:19 -0700
MIME-Version: 1.0
In-Reply-To: <d097e5d9-0ee6-9ea4-184f-1dd997849892@raspberrypi.org>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 06/12/2017 07:25 AM, Phil Elwell wrote:
> Add bindings documentation for brcm,bcm2835-aux-intc and human-readable
> declarations for the BCM2835 AUX IRQs.
> 
> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
> ---
>  .../interrupt-controller/brcm,bcm2835-aux-intc.txt | 28 ++++++++++++++++++++++
>  .../interrupt-controller/bcm2835-aux-intc.h        | 20 ++++++++++++++++
>  2 files changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-aux-intc.txt
>  create mode 100644 include/dt-bindings/interrupt-controller/bcm2835-aux-intc.h
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-aux-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-aux-intc.txt
> new file mode 100644
> index 0000000..f3f895c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-aux-intc.txt
> @@ -0,0 +1,28 @@
> +BCM2835 Auxiliary ("AUXIRQ") Interrupt Controller
> +
> +The BCM2835 family of SoCs multiplexes the interrupts for peripherals in
> +the AUX block into a single IRQ. The AUXIRQ register shows the IRQ status
> +of each of the peripherals. Note that there are no masking or clearing
> +facilities - interrupts must be enabled and acknowledged in the
> +individual peripherals.
> +
> +Required properties:
> +- compatible :	     Should be "brcm,bcm2835-aux-intc".
> +- reg :		     Specifies base physical address and size of the registers.
> +- interrupts :	     The interrupt number - see
> +		     bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
> +- interrupt-controller : Identifies the node as an interrupt controller
> +- #interrupt-cells : Specifies the number of cells needed to encode an
> +		     interrupt source. The value shall be 1.
> +
> +  The cell contains the interrupt specifier, as found in
> +  include/dt-bindings/interrupt-controller/bcm2835-aux-intc.h. Valid values
> +  are 0..2.

This last sentence is sort of doomed for failure in case there are
additional interrupts being added in the future, referring to
bcm2835-aux-intc.h seems to be good enough IMHO.

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
