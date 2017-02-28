Return-Path: <emilio@elopez.com.ar>
Subject: Re: [linux-sunxi] [PATCH 3/4] ARM: sun7i: Convert to CCU
To: plaes@plaes.org
References: <20170227210914.18954-1-plaes@plaes.org>
 <20170227210914.18954-4-plaes@plaes.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, Russell King <linux@armlinux.org.uk>,
 Icenowy Zheng <icenowy@aosc.xyz>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
From: =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio@elopez.com.ar>
Message-ID: <bca96944-bd58-5011-5eb9-01c4a1440fe2@elopez.com.ar>
Date: Tue, 28 Feb 2017 14:01:48 -0300
MIME-Version: 1.0
In-Reply-To: <20170227210914.18954-4-plaes@plaes.org>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi,

I spotted a couple of things here on a quick look, see below

El 27/02/17 a las 18:09, Priit Laes escribió:
> Convert sun7i-a20.dtsi to new CCU driver.
> 
> Signed-off-by: Priit Laes <plaes@plaes.org>
> ---
>  arch/arm/boot/dts/sun7i-a20.dtsi | 719 +++++----------------------------------
>  1 file changed, 86 insertions(+), 633 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
> index 04c9977..6f80cb8 100644
> --- a/arch/arm/boot/dts/sun7i-a20.dtsi
> +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
> @@ -47,7 +47,8 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/thermal/thermal.h>
>  
> -#include <dt-bindings/clock/sun4i-a10-pll2.h>
> +#include <dt-bindings/clock/sun7i-ccu.h>
> +#include <dt-bindings/reset/sun7i-ccu.h>
>  #include <dt-bindings/dma/sun4i-a10.h>
>  #include <dt-bindings/pinctrl/sun4i-a10.h>
>  
> @@ -67,19 +68,19 @@
>  			compatible = "allwinner,simple-framebuffer",
>  				     "simple-framebuffer";
>  			allwinner,pipeline = "de_be0-lcd0-hdmi";
> -			clocks = <&ahb_gates 36>, <&ahb_gates 43>,
> -				 <&ahb_gates 44>, <&de_be0_clk>,
> -				 <&tcon0_ch1_clk>, <&dram_gates 26>;
> +			clocks = <&ccu CLK_AHB_LCD0>, <&ccu CLK_AHB_HDMI1>,
> +				 <&ccu CLK_AHB_DE_BE0>, <&ccu CLK_DE_BE0>,
> +				 <&ccu CLK_TCON0_CH1>, <&ccu CLK_DRAM_DE_BE0>;
>  			status = "disabled";
>  		};
>  
> -		framebuffer@1 {
> +		framebuffer@0 {

This looks like an unrelated change

> @@ -184,21 +185,11 @@
>  
>  		osc24M: clk@01c20050 {
>  			#clock-cells = <0>;
> -			compatible = "allwinner,sun4i-a10-osc-clk";
> -			reg = <0x01c20050 0x4>;
> +			compatible = "fixed-clock";
>  			clock-frequency = <24000000>;
>  			clock-output-names = "osc24M";
>  		};

allwinner,sun4i-a10-osc-clk implements a gate apart from a fixed clock,
is the feature loss intended?

Cheers,
Emilio
