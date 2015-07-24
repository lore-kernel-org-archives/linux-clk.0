Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:36053 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751895AbbGXPWG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Fri, 24 Jul 2015 11:22:06 -0400
Date: Fri, 24 Jul 2015 16:22:00 +0100
From: Lee Jones <lee@kernel.org>
To: Eric Anholt <eric@anholt.net>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stephen Warren <swarren@wwwdotorg.org>,
	linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v4 6/8] ARM: bcm2835: Use the RPi firmware clocks for
 uart.
Message-ID: <20150724152200.GL3436@x1>
References: <1437420787-32137-1-git-send-email-eric@anholt.net>
 <1437420787-32137-7-git-send-email-eric@anholt.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1437420787-32137-7-git-send-email-eric@anholt.net>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, 20 Jul 2015, Eric Anholt wrote:

> This gets us a correct apb_pclk, which previously was accidentally
> using the "20201000.uart" clock from clk-bcm2835.c, due to the
> fallback clk_get_sys() path.
> 
> Signed-off-by: Eric Anholt <eric@anholt.net>
> Acked-by: Stephen Warren <swarren@wwwdotorg.org>
> ---
>  arch/arm/boot/dts/bcm2835-rpi.dtsi | 7 +++++++
>  arch/arm/boot/dts/bcm2835.dtsi     | 2 +-
>  2 files changed, 8 insertions(+), 1 deletion(-)

For my own reference:
 Acked-by: Lee Jones <lee@kernel.org>

> diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
> index 7cc47fb..9549eb8 100644
> --- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
> +++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
> @@ -1,3 +1,4 @@
> +#include <dt-bindings/clk/raspberrypi.h>
>  #include "bcm2835.dtsi"
>  
>  / {
> @@ -62,3 +63,9 @@
>  	status = "okay";
>  	bus-width = <4>;
>  };
> +
> +&uart0 {
> +	clocks = <&firmware_clocks RPI_CLOCK_UART0>,
> +		 <&firmware_clocks RPI_CLOCK_CORE>;
> +	clock-names = "uartclk", "apb_pclk";
> +};
> diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
> index 32f5830..5be2862 100644
> --- a/arch/arm/boot/dts/bcm2835.dtsi
> +++ b/arch/arm/boot/dts/bcm2835.dtsi
> @@ -92,7 +92,7 @@
>  			#interrupt-cells = <2>;
>  		};
>  
> -		uart@7e201000 {
> +		uart0: uart@7e201000 {
>  			compatible = "brcm,bcm2835-pl011", "arm,pl011", "arm,primecell";
>  			reg = <0x7e201000 0x1000>;
>  			interrupts = <2 25>;
