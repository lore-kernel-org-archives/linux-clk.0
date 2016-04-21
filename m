Return-Path: <Jose.Abreu@synopsys.com>
Subject: Re: [PATCH 2/2 v6] arc: axs10x: Add DT bindings for I2S PLL Clock
To: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-snps-arc@lists.infradead.org>, <devicetree@vger.kernel.org>
References: <cover.1461258787.git.joabreu@synopsys.com>
 <e98c3f738b3a8f6755793959d89b4e43c9410fb1.1461258787.git.joabreu@synopsys.com>
CC: <CARLOS.PALMINHA@synopsys.com>, <Alexey.Brodkin@synopsys.com>,
	<Vineet.Gupta1@synopsys.com>, <mturquette@baylibre.com>,
	<sboyd@codeaurora.org>, <robh+dt@kernel.org>
From: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <5719143B.2080901@synopsys.com>
Date: Thu, 21 Apr 2016 18:56:11 +0100
MIME-Version: 1.0
In-Reply-To: <e98c3f738b3a8f6755793959d89b4e43c9410fb1.1461258787.git.joabreu@synopsys.com>
Content-Type: text/plain; charset="windows-1252"
List-ID: <linux-clk.vger.kernel.org>

Adding device tree mailing list and Rob Herring.

On 21-04-2016 18:19, Jose Abreu wrote:
> Add device tree bindings for AXS10X I2S PLL Clock driver.
>
> Signed-off-by: Jose Abreu <joabreu@synopsys.com>
> ---
>
> Changes v5 -> v6:
> * Added 'clocks' field
>
> This patch was only introduced in v5.
>
>  arch/arc/boot/dts/axs10x_mb.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
> index ab5d570..5c6489e 100644
> --- a/arch/arc/boot/dts/axs10x_mb.dtsi
> +++ b/arch/arc/boot/dts/axs10x_mb.dtsi
> @@ -16,7 +16,20 @@
>  		ranges = <0x00000000 0xe0000000 0x10000000>;
>  		interrupt-parent = <&mb_intc>;
>  
> +		i2sclk: i2sclk@100a0 {
> +			compatible = "snps,axs10x-i2s-pll-clock";
> +			reg = <0x100a0 0x10>;
> +			clocks = <&i2spll_clk>;
> +			#clock-cells = <0>;
> +		};
> +
>  		clocks {
> +			i2spll_clk: i2spll_clk {
> +				compatible = "fixed-clock";
> +				clock-frequency = <27000000>;
> +				#clock-cells = <0>;
> +			};
> +
>  			i2cclk: i2cclk {
>  				compatible = "fixed-clock";
>  				clock-frequency = <50000000>;
