Return-Path: <rjui@broadcom.com>
Subject: Re: [PATCH RESEND v2 4/4] ARM: dts: enable audio clock support for
 Cygnus
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>
References: <1453857521-8804-1-git-send-email-rjui@broadcom.com>
 <1453857521-8804-5-git-send-email-rjui@broadcom.com>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<bcm-kernel-feedback-list@broadcom.com>, Simran Rai <ssimran@broadcom.com>
From: Ray Jui <rjui@broadcom.com>
Message-ID: <56AC06E1.1040903@broadcom.com>
Date: Fri, 29 Jan 2016 16:42:09 -0800
MIME-Version: 1.0
In-Reply-To: <1453857521-8804-5-git-send-email-rjui@broadcom.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Return-Path: rjui@broadcom.com
List-ID: <linux-clk.vger.kernel.org>

Hi Florian,

With Stephen merging the first 3 patches into the clk tree, could you 
please take this DT patch now?

Thanks,

Ray

On 1/26/2016 5:18 PM, Ray Jui wrote:
> From: Simran Rai <ssimran@broadcom.com>
>
> Add audio clock to the existing Broadcom Cygnus clock DT
>
> Signed-off-by: Simran Rai <ssimran@broadcom.com>
> Reviewed-by: Ray Jui <rjui@broadcom.com>
> Reviewed-by: Scott Branden <sbranden@broadcom.com>
> ---
>   arch/arm/boot/dts/bcm-cygnus-clock.dtsi | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm/boot/dts/bcm-cygnus-clock.dtsi b/arch/arm/boot/dts/bcm-cygnus-clock.dtsi
> index 32bcd45..80b6ba4 100644
> --- a/arch/arm/boot/dts/bcm-cygnus-clock.dtsi
> +++ b/arch/arm/boot/dts/bcm-cygnus-clock.dtsi
> @@ -121,4 +121,13 @@ clocks {
>   		clocks = <&osc>;
>   		clock-output-names = "keypad", "adc/touch", "pwm";
>   	};
> +
> +	audiopll: audiopll {
> +		#clock-cells = <1>;
> +		compatible = "brcm,cygnus-audiopll";
> +		reg = <0x180aeb00 0x68>;
> +		clocks = <&osc>;
> +		clock-output-names = "audiopll", "ch0_audio",
> +					"ch1_audio", "ch2_audio";
> +	};
>   };
>
