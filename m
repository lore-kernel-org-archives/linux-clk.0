Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Mon, 10 Oct 2016 08:01:21 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 16/18] dt-bindings: Document img,boston-clock binding
Message-ID: <20161010130121.GA31827@rob-hp-laptop>
References: <20161005171824.18014-1-paul.burton@imgtec.com>
 <20161005171824.18014-17-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20161005171824.18014-17-paul.burton@imgtec.com>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Oct 05, 2016 at 06:18:22PM +0100, Paul Burton wrote:
> Add device tree binding documentation for the clocks provided by the
> MIPS Boston development board from Imagination Technologies, and a
> header file describing the available clocks for use by device trees &
> driver.
> 
> Signed-off-by: Paul Burton <paul.burton@imgtec.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: linux-clk@vger.kernel.org
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> 
> ---
> 
> Changes in v3: None
> Changes in v2:
> - Add BOSTON_CLK_INPUT to expose the input clock.
> 
>  .../devicetree/bindings/clock/img,boston-clock.txt | 27 ++++++++++++++++++++++
>  include/dt-bindings/clock/boston-clock.h           | 14 +++++++++++
>  2 files changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/img,boston-clock.txt
>  create mode 100644 include/dt-bindings/clock/boston-clock.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/img,boston-clock.txt b/Documentation/devicetree/bindings/clock/img,boston-clock.txt
> new file mode 100644
> index 0000000..c01ea60
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/img,boston-clock.txt
> @@ -0,0 +1,27 @@
> +Binding for Imagination Technologies MIPS Boston clock sources.
> +
> +This binding uses the common clock binding[1].
> +
> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +Required properties:
> +- compatible : Should be "img,boston-clock".
> +- #clock-cells : Should be set to 1.
> +  Values available for clock consumers can be found in the header file:
> +    <dt-bindings/clock/boston-clock.h>
> +- regmap : Phandle to the Boston platform register system controller.
> +  This should contain a phandle to the system controller node covering the
> +  platform registers provided by the Boston board.

Can you just make the clock node a child of the system controller and 
drop this?

Rob
