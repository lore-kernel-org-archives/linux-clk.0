Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:36415 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753765AbbGXPXm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Fri, 24 Jul 2015 11:23:42 -0400
Date: Fri, 24 Jul 2015 16:23:36 +0100
From: Lee Jones <lee@kernel.org>
To: Eric Anholt <eric@anholt.net>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stephen Warren <swarren@wwwdotorg.org>,
	linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v4 7/8] ARM: bcm2835: Tie SPI clock to the core clock
 rate.
Message-ID: <20150724152336.GP3436@x1>
References: <1437420787-32137-1-git-send-email-eric@anholt.net>
 <1437420787-32137-8-git-send-email-eric@anholt.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1437420787-32137-8-git-send-email-eric@anholt.net>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, 20 Jul 2015, Eric Anholt wrote:

> We were previously using a fixed clock declared in the 2835 DT, but
> it's actually the core clock, and it might not be the same if you had
> adjusted it using the firmware's config.txt.
> 
> Signed-off-by: Eric Anholt <eric@anholt.net>
> Acked-by: Stephen Warren <swarren@wwwdotorg.org>
> ---
>  arch/arm/boot/dts/bcm2835-rpi.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)

For my own reference:
 Acked-by: Lee Jones <lee@kernel.org>

> diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
> index 9549eb8..0a32123 100644
> --- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
> +++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
> @@ -69,3 +69,7 @@
>  		 <&firmware_clocks RPI_CLOCK_CORE>;
>  	clock-names = "uartclk", "apb_pclk";
>  };
> +
> +&spi {
> +	clocks = <&firmware_clocks RPI_CLOCK_CORE>;
> +};
