Return-Path: <robh+dt@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170124003853.16418-2-eric@anholt.net>
References: <20170124003853.16418-1-eric@anholt.net> <20170124003853.16418-2-eric@anholt.net>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 27 Jan 2017 16:34:18 -0600
Message-ID: <CAL_JsqJ=VQSUO5MeHJSCB=_SnmOnA7G1=GhmWYKhjm-47kYV-w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: Document the VC4 DSI module nodes.
To: Eric Anholt <eric@anholt.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>,
	dri-devel <dri-devel@lists.freedesktop.org>, linux-rpi-kernel@lists.infradead.org,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@wwwdotorg.org>,
	Lee Jones <lee@kernel.org>,
	"bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Need to cc DT list if you want it in my queue.

On Mon, Jan 23, 2017 at 6:38 PM, Eric Anholt <eric@anholt.net> wrote:
> These are part of the vc4 display pipeline.
>
> Signed-off-by: Eric Anholt <eric@anholt.net>
> ---
>  .../devicetree/bindings/display/brcm,bcm-vc4.txt   | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt b/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
> index e2768703ac2b..34c7fddcea39 100644
> --- a/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
> +++ b/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
> @@ -56,6 +56,18 @@ Required properties for V3D:
>  - interrupts:  The interrupt number
>                   See bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
>
> +Required properties for DSI:
> +- compatible:  Should be "brcm,bcm2835-dsi0" or "brcm,bcm2835-dsi1"

Are the blocks different?

> +- reg:         Physical base address and length of the DSI block's registers
> +- interrupts:  The interrupt number
> +                 See bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
> +- clocks:      a) phy: The DSI PLL clock feeding the DSI analog PHY
> +               b) escape: The DSI ESC clock from CPRMAN
> +               c) pixel: The DSI pixel clock from CPRMAN
> +- clock-output-names:
> +               The 3 clocks output from the DSI analog PHY: dsi[01]_byte,
> +               dsi[01]_ddr2, and dsi[01]_ddr
> +
>  [1] Documentation/devicetree/bindings/media/video-interfaces.txt
>
>  Example:
> @@ -99,6 +111,29 @@ dpi: dpi@7e208000 {
>         };
>  };
>
> +dsi1: dsi@7e700000 {
> +       compatible = "brcm,bcm2835-dsi1";
> +       reg = <0x7e700000 0x8c>;
> +       interrupts = <2 12>;
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       #clock-cells = <1>;
> +
> +       clocks = <&clocks BCM2835_PLLD_DSI1>,
> +                <&clocks BCM2835_CLOCK_DSI1E>,
> +                <&clocks BCM2835_CLOCK_DSI1P>;
> +       clock-names = "phy", "escape", "pixel";
> +
> +       clock-output-names = "dsi1_byte", "dsi1_ddr2", "dsi1_ddr";
> +
> +       pitouchscreen: panel@0 {
> +               compatible = "raspberrypi,touchscreen";
> +               reg = <0>;
> +
> +               <...>
> +       };
> +};
> +
>  vec: vec@7e806000 {
>         compatible = "brcm,bcm2835-vec";
>         reg = <0x7e806000 0x1000>;
> --
> 2.11.0
>
