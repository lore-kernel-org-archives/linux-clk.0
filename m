Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <20e229f191031b0b0bff96dee118d1f2d988d7b3.1448263428.git.atx@atx.name>
References: <cover.1448263428.git.atx@atx.name> <20e229f191031b0b0bff96dee118d1f2d988d7b3.1448263428.git.atx@atx.name>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 23 Nov 2015 17:47:11 +0800
Message-ID: <CAGb2v675YHYR=eNczrP8srPr5aYG+8eK9GPA7vevsxjsHEW1RA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] dt-bindings: document sun8i_ths
To: Josef Gajdusek <atx@atx.name>
Cc: linux-sunxi <linux-sunxi@googlegroups.com>, linux-clk <linux-clk@vger.kernel.org>,
	linux-pm@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	devicetree <devicetree@vger.kernel.org>, gpatchesrdh@mveas.com,
	Mike Turquette <mturquette@linaro.org>, Hans De Goede <hdegoede@redhat.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>,
	Emilio Lopez <emilio@elopez.com.ar>, Russell King - ARM Linux <linux@arm.linux.org.uk>,
	Eduardo Valentin <edubezval@gmail.com>, Zhang Rui <rui.zhang@intel.com>, Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>, Kumar Gala <galak@codeaurora.org>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>,
	Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Mon, Nov 23, 2015 at 4:02 PM, Josef Gajdusek <atx@atx.name> wrote:
> This patch adds the binding documentation for the sun8i_ths driver
>
> Signed-off-by: Josef Gajdusek <atx@atx.name>
> ---
>  .../devicetree/bindings/thermal/sun8i-ths.txt      | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/sun8i-ths.txt
>
> diff --git a/Documentation/devicetree/bindings/thermal/sun8i-ths.txt b/Documentation/devicetree/bindings/thermal/sun8i-ths.txt
> new file mode 100644
> index 0000000..67056bf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/sun8i-ths.txt
> @@ -0,0 +1,31 @@
> +* sun8i THS
> +
> +Required properties:
> +- compatible : "allwinner,sun8i-h3-ths"
> +- reg : Address range of the thermal registers and location of the calibration
> +        value

You are now using nvmem for the calibration data. You don't need the second
entry.

> +- resets : Must contain an entry for each entry in reset-names.
> +           see ../reset/reset.txt for details
> +- reset-names : Must include the name "ahb"
> +- clocks : Must contain an entry for each entry in clock-names.
> +- clock-names : Must contain "ahb" for the bus gate and "ths" for the THS
> +  clock
> +
> +Optional properties:
> +- nvmem-cells : Must contain an entry for each entry in nvmem-cell-names
> +- nvmem-cell-names : Must contain "calibration" for the cell containing the
> +  temperature calibration cell, if available
> +
> +Example:
> +ths: ths@01c25000 {
> +       #thermal-sensor-cells = <0>;
> +       compatible = "allwinner,sun8i-h3-ths";
> +       reg = <0x01c25000 0x88>, <0x01c14234 0x4>;

Same here.

ChenYu

> +       interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
> +       resets = <&bus_rst 136>;
> +       reset-names = "ahb";
> +       clocks = <&bus_gates 72>, <&ths_clk>;
> +       clock-names = "ahb", "ths";
> +       nvmem-cells = <&ths_calibration>;
> +       nvmem-cell-names = "calibration";
> +};
> --
> 2.4.10
>
