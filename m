Return-Path: <info@lategoodbye.de>
Subject: Re: [PATCH v3 4/4] clk: bcm2835: Add PWM clock support to the device
 tree
To: Remi Pommarel <repk@triplefau.lt>
References: <1449418969-5565-1-git-send-email-repk@triplefau.lt>
 <1449418969-5565-5-git-send-email-repk@triplefau.lt>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Eric Anholt <eric@anholt.net>,
 Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
From: Stefan Wahren <info@lategoodbye.de>
Message-ID: <5664A5A9.4030204@lategoodbye.de>
Date: Sun, 6 Dec 2015 22:16:25 +0100
MIME-Version: 1.0
In-Reply-To: <1449418969-5565-5-git-send-email-repk@triplefau.lt>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Remi,

please send this patch to devicetree@vger.kernel.org.

Am 06.12.2015 um 17:22 schrieb Remi Pommarel:
> Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> ---
>   arch/arm/boot/dts/bcm2835-rpi.dtsi | 4 ++++
>   arch/arm/boot/dts/bcm2835.dtsi     | 9 +++++++++
>   2 files changed, 13 insertions(+)
>
> diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
> index 3572f03..55801e0 100644
> --- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
> +++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
> @@ -60,3 +60,7 @@
>   	status = "okay";
>   	bus-width = <4>;
>   };
> +
> +&pwm {
> +	status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
> index aef64de..641f7f4 100644
> --- a/arch/arm/boot/dts/bcm2835.dtsi
> +++ b/arch/arm/boot/dts/bcm2835.dtsi
> @@ -149,6 +149,15 @@
>   			status = "disabled";
>   		};
>
> +		pwm: pwm@7e20c000 {
> +			compatible = "brcm,bcm2835-pwm";
> +			reg = <0x7e20c000 0x28>;
> +			clocks = <&clocks BCM2835_CLOCK_PWM>;

Looks like #pwm-cells is missing.

Regards
Stefan

> +			assigned-clocks = <&clocks BCM2835_CLOCK_PWM>;
> +			assigned-clock-rates = <10000000>;
> +			status = "disabled";
> +		};
> +
>   		sdhci: sdhci@7e300000 {
>   			compatible = "brcm,bcm2835-sdhci";
>   			reg = <0x7e300000 0x100>;
>
