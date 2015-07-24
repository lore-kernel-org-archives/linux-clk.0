Return-Path: <lee@kernel.org>
Date: Fri, 24 Jul 2015 16:22:17 +0100
From: Lee Jones <lee@kernel.org>
To: Eric Anholt <eric@anholt.net>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stephen Warren <swarren@wwwdotorg.org>, linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v4 8/8] ARM: bcm2835: Use the firmware on rpi to get the
 EMMC clock.
Message-ID: <20150724152217.GM3436@x1>
References: <1437420787-32137-1-git-send-email-eric@anholt.net>
 <1437420787-32137-9-git-send-email-eric@anholt.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1437420787-32137-9-git-send-email-eric@anholt.net>
List-ID: <linux-clk.vger.kernel.org>

On Mon, 20 Jul 2015, Eric Anholt wrote:

> This updates the MMC frequency from 100Mhz to 250Mhz.
> 
> Signed-off-by: Eric Anholt <eric@anholt.net>
> ---
>  arch/arm/boot/dts/bcm2835-rpi.dtsi | 1 +
>  1 file changed, 1 insertion(+)

For my own reference:
 Acked-by: Lee Jones <lee@kernel.org>

> diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
> index 0a32123..5d370cb 100644
> --- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
> +++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
> @@ -62,6 +62,7 @@
>  &sdhci {
>  	status = "okay";
>  	bus-width = <4>;
> +	clocks = <&firmware_clocks RPI_CLOCK_EMMC>;
>  };
>  
>  &uart0 {
