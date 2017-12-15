Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:40836 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755503AbdLOOTh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Dec 2017 09:19:37 -0500
Received: by mail-wm0-f66.google.com with SMTP id f206so17817091wmf.5
        for <linux-clk@vger.kernel.org>; Fri, 15 Dec 2017 06:19:36 -0800 (PST)
Subject: Re: [PATCH v8] arm64: dts: meson-axg: switch uart_ao clock to CLK81
To: Yixun Lan <yixun.lan@amlogic.com>,
        Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Carlo Caione <carlo@caione.org>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20171215141741.175985-1-yixun.lan@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <8e5247c5-4de2-daaa-505d-971e83d9b1d9@baylibre.com>
Date: Fri, 15 Dec 2017 15:19:33 +0100
MIME-Version: 1.0
In-Reply-To: <20171215141741.175985-1-yixun.lan@amlogic.com>
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 15/12/2017 15:17, Yixun Lan wrote:
> Switch the uart_ao pclk to CLK81 since the clock driver is ready.
> 
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> 
> ---
> This is a fixup for the previous version
> 
> Changes in v8 since [1]
>  - move clock DT info into soc.dtsi
> 
> [1]
> http://lists.infradead.org/pipermail/linux-amlogic/2017-December/005741.html
> ---
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index 01beb211f442..d1f8043be426 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/axg-clkc.h>
>  
>  / {
>  	compatible = "amlogic,meson-axg";
> @@ -200,7 +201,7 @@
>  				compatible = "amlogic,meson-gx-uart", "amlogic,meson-ao-uart";
>  				reg = <0x0 0x3000 0x0 0x18>;
>  				interrupts = <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>;
> -				clocks = <&xtal>, <&xtal>, <&xtal>;
> +				clocks = <&xtal>, <&clkc CLKID_CLK81>, <&xtal>;
>  				clock-names = "xtal", "pclk", "baud";
>  				status = "disabled";
>  			};
> @@ -209,7 +210,7 @@
>  				compatible = "amlogic,meson-gx-uart", "amlogic,meson-ao-uart";
>  				reg = <0x0 0x4000 0x0 0x18>;
>  				interrupts = <GIC_SPI 197 IRQ_TYPE_EDGE_RISING>;
> -				clocks = <&xtal>, <&xtal>, <&xtal>;
> +				clocks = <&xtal>, <&clkc CLKID_CLK81>, <&xtal>;
>  				clock-names = "xtal", "pclk", "baud";
>  				status = "disabled";
>  			};
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
