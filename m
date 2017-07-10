Return-Path: <oliver@schinagl.nl>
Subject: Re: [linux-sunxi] [PATCH v5 5/6] ARM: sun7i: Convert to CCU
To: plaes@plaes.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, Russell King <linux@armlinux.org.uk>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.23e9103a2becf2261d7e145bb1516221a5cfb8a4.1499197129.git-series.plaes@plaes.org>
 <2ff8930c51b90a0bb875ecc6c4737f44b3314e7f.1499197129.git-series.plaes@plaes.org>
Cc: linux-sunxi@googlegroups.com, Jonathan Liu <net147@gmail.com>
From: Olliver Schinagl <oliver@schinagl.nl>
Message-ID: <4091e67f-6207-26ef-85f1-e9ff509dd3b7@schinagl.nl>
Date: Mon, 10 Jul 2017 13:23:51 +0200
MIME-Version: 1.0
In-Reply-To: <2ff8930c51b90a0bb875ecc6c4737f44b3314e7f.1499197129.git-series.plaes@plaes.org>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Pleas,

On 04-07-17 22:05, Priit Laes wrote:
> Convert sun7i-a20.dtsi to new CCU driver.
>
> Tested on Cubietruck.
>
> Signed-off-by: Priit Laes <plaes@plaes.org>
> ---
>  arch/arm/boot/dts/sun7i-a20.dtsi | 719 +++-----------------------------
>  1 file changed, 84 insertions(+), 635 deletions(-)
>
> diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
> index 96bee77..a5ca5a8 100644
> --- a/arch/arm/boot/dts/sun7i-a20.dtsi
> +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
> @@ -46,8 +46,6 @@
>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/thermal/thermal.h>
> -
> -#include <dt-bindings/clock/sun4i-a10-pll2.h>
>  #include <dt-bindings/dma/sun4i-a10.h>
I had to add these includes here to make this all work:

+ #include <dt-bindings/clock/sun4i-a10-ccu.h>
+ #include <dt-bindings/clock/sun7i-a20-ccu.h>
   #include <dt-bindings/interrupt-controller/arm-gic.h>
+ #include <dt-bindings/reset/sun4i-a10-ccu.h>
   #include <dt-bindings/thermal/thermal.h>
   #include <dt-bindings/dma/sun4i-a10.h>

Olliver

>
>  / {
> @@ -66,9 +64,10 @@
>  			compatible = "allwinner,simple-framebuffer",
>  				     "simple-framebuffer";
>  			allwinner,pipeline = "de_be0-lcd0-hdmi";
> -			clocks = <&ahb_gates 36>, <&ahb_gates 43>,
> -				 <&ahb_gates 44>, <&de_be0_clk>,
> -				 <&tcon0_ch1_clk>, <&dram_gates 26>;
> +			clocks = <&ccu 56>, <&ccu 60>,
> +				 <&ccu 62>, <&ccu 144>,
> +				 <&ccu 155>, <&ccu 140>,
> +				 <&ccu 164>;
>  			status = "disabled";
>
<snip>
