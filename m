Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Wed, 9 Nov 2016 12:24:40 -0600
From: Rob Herring <robh@kernel.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: sboyd@codeaurora.org, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	mark.rutland@arm.com, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v7 3/3] clk: qcom: Add A53 clock driver
Message-ID: <20161109182440.hjiv725vpsh5dctd@rob-hp-laptop>
References: <20161031145526.5023-1-georgi.djakov@linaro.org>
 <20161031145526.5023-4-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20161031145526.5023-4-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Oct 31, 2016 at 04:55:26PM +0200, Georgi Djakov wrote:
> Add a driver for the A53 Clock Controller. It is a hardware block that
> implements a combined mux and half integer divider functionality. It can
> choose between a fixed-rate clock or the dedicated A53 PLL. The source
> and the divider can be set both at the same time.
> 
> This is required for enabling CPU frequency scaling on platforms like
> MSM8916.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,a53cc.txt       |  23 ++++
>  drivers/clk/qcom/Kconfig                           |   8 ++
>  drivers/clk/qcom/Makefile                          |   1 +
>  drivers/clk/qcom/a53cc.c                           | 152 +++++++++++++++++++++
>  4 files changed, 184 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53cc.txt
>  create mode 100644 drivers/clk/qcom/a53cc.c
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,a53cc.txt b/Documentation/devicetree/bindings/clock/qcom,a53cc.txt
> new file mode 100644
> index 000000000000..82d1634a2713
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,a53cc.txt
> @@ -0,0 +1,23 @@
> +Qualcomm A53 CPU Clock Controller Binding
> +------------------------------------------------
> +The A53 CPU Clock Controller is hardware, which provides a combined
> +mux and divider functionality for the CPU clocks. It can choose between
> +a fixed rate clock and the dedicated A53 PLL. This hardware block is used
> +on platforms such as msm8916.
> +
> +Required properties :
> +- compatible : shall contain:
> +
> +			"qcom,a53cc-msm8916"

Same comment on the ordering. With that, for the binding:

Acked-by: Rob Herring <robh@kernel.org>

> +
> +- reg : shall contain base register location and length
> +	of the APCS region
> +- #clock-cells : shall contain 1
> +
> +Example:
> +
> +	apcs: syscon@b011000 {
> +		compatible = "qcom,a53cc-msm8916";
> +		reg = <0x0b011000 0x1000>;
> +		#clock-cells = <1>;
> +	};
