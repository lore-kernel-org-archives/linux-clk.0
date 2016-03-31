Return-Path: <shawnguo@kernel.org>
Date: Thu, 31 Mar 2016 16:34:41 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Stefan Agner <stefan@agner.ch>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, kernel@pengutronix.de,
	sergeimir@emcraft.com, tglx@linutronix.de, jason@lakedaemon.net,
	marc.zyngier@arm.com, robh+dt@kernel.org, pawel.moll@arm.com,
	mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
	galak@codeaurora.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 05/18] ARM: dts: vf610: add modules required for PM
Message-ID: <20160331083441.GY28207@tiger>
References: <1457576219-7971-1-git-send-email-stefan@agner.ch>
 <1457576219-7971-6-git-send-email-stefan@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1457576219-7971-6-git-send-email-stefan@agner.ch>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Mar 09, 2016 at 06:16:46PM -0800, Stefan Agner wrote:
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  arch/arm/boot/dts/vfxxx.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
> index b038ea4..335f4e5 100644
> --- a/arch/arm/boot/dts/vfxxx.dtsi
> +++ b/arch/arm/boot/dts/vfxxx.dtsi
> @@ -434,6 +434,11 @@
>  				reg = <0x40050000 0x400>;
>  			};
>  
> +			scsc: scsc@40052000 {
> +				compatible = "fsl,vf610-scsc";

These new compatible strings should be documented somewhere.

Shawn

> +				reg = <0x40052000 0x1000>;
> +			};
> +
>  			usbphy0: usbphy@40050800 {
>  				compatible = "fsl,vf610-usbphy";
>  				reg = <0x40050800 0x400>;
> @@ -480,6 +485,13 @@
>  				status = "disabled";
>  			};
>  
> +			wakeup: wkpu@4006a000 {
> +				compatible = "fsl,vf610-wkpu";
> +				reg = <0x4006a000 0x1000>;
> +				interrupts = <92 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clks VF610_CLK_WKPU>;
> +			};
> +
>  			clks: ccm@4006b000 {
>  				compatible = "fsl,vf610-ccm";
>  				reg = <0x4006b000 0x1000>;
> @@ -600,6 +612,13 @@
>  				status = "disabled";
>  			};
>  
> +			ddrmc: ddrmc@400ae000 {
> +				compatible = "fsl,vf610-ddrmc";
> +				reg = <0x400ae000 0x400>;
> +				clocks = <&clks VF610_CLK_DDRMC>;
> +				clock-names = "ddrc";
> +			};
> +
>  			adc1: adc@400bb000 {
>  				compatible = "fsl,vf610-adc";
>  				reg = <0x400bb000 0x1000>;
> -- 
> 2.7.2
> 
> 
