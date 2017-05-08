Return-Path: <robh+dt@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170508201159.31634-1-linus.walleij@linaro.org>
References: <20170508201159.31634-1-linus.walleij@linaro.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 8 May 2017 16:24:08 -0500
Message-ID: <CAL_JsqLAMObobPrBDdA8bjaKTX4rEo2=_qd86ibbA2kQP6AvBg@mail.gmail.com>
Subject: Re: [PATCH 1/2 v2] clk: Add bindings for the Gemini Clock Controller
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Janos Laube <janos.dev@gmail.com>,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>, openwrt-devel@openwrt.org,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>, Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Mon, May 8, 2017 at 3:11 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> This adds device tree bindings and a header for the Gemini SoC
> Clock Controller.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Move the clock controller to be directly in the parent syscon
>   node.
> ---
>  .../clock/cortina,gemini-clock-controller.txt      | 22 ++++++++++++++++
>  include/dt-bindings/clock/cortina,gemini-clock.h   | 29 ++++++++++++++++++++++
>  2 files changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/cortina,gemini-clock-controller.txt
>  create mode 100644 include/dt-bindings/clock/cortina,gemini-clock.h
>
> diff --git a/Documentation/devicetree/bindings/clock/cortina,gemini-clock-controller.txt b/Documentation/devicetree/bindings/clock/cortina,gemini-clock-controller.txt
> new file mode 100644
> index 000000000000..ae0046bccba0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/cortina,gemini-clock-controller.txt
> @@ -0,0 +1,22 @@
> +Clock bindings for the Cortina Systems Gemini SoC Clock Controller
> +
> +Required properties :
> +- compatible : shall contain the following:
> +  "cortina,gemini-clock-controller"
> +- #clock-cells should be <1>
> +
> +The Gemini clock controller needs to be identical to the system controller
> +node.
> +
> +All available clocks are defined as preprocessor macros in
> +dt-bindings/clock/cortina,gemini-clock.h header and can be used in device
> +tree sources.
> +
> +Example:
> +
> +syscon: syscon@40000000 {
> +       compatible = "cortina,gemini-syscon", "cortina,gemini-clock-controller",
> +                    "syscon", "simple-mfd";

There are no child nodes, so you don't need simple-mfd.

> +       reg = <0x40000000 0x1000>;

Looks like you have 2 nodes pointing to the same address with your
reset binding? You shouldn't have overlapping resources. It's allowed
for historical reasons but breaks resource creation in Linux.

Rob
