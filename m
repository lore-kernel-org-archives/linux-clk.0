Return-Path: <jonathanh@nvidia.com>
Subject: Re: [PATCH V3 5/6] ARM: tegra: Add Tegra20 GMI support
To: Mirza Krak <mirza.krak@gmail.com>, <swarren@wwwdotorg.org>,
	<thierry.reding@gmail.com>
References: <1477576872-2665-1-git-send-email-mirza.krak@gmail.com>
 <1477576872-2665-6-git-send-email-mirza.krak@gmail.com>
CC: <gnurou@gmail.com>, <linux@armlinux.org.uk>, <pdeschrijver@nvidia.com>,
	<pgaikwad@nvidia.com>, <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
	<robh+dt@kernel.org>, <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <d8ab8a32-8019-45e6-59b1-8914937e1705@nvidia.com>
Date: Thu, 3 Nov 2016 10:29:14 +0000
MIME-Version: 1.0
In-Reply-To: <1477576872-2665-6-git-send-email-mirza.krak@gmail.com>
Return-Path: jonathanh@nvidia.com
Content-Type: text/plain; charset="windows-1252"; format=flowed
List-ID: <linux-clk.vger.kernel.org>


On 27/10/16 15:01, Mirza Krak wrote:
> From: Mirza Krak <mirza.krak@gmail.com>
>
> Add a device node for the GMI controller found on Tegra20.
>
> Signed-off-by: Mirza Krak <mirza.krak@gmail.com>
> Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Tested-on: Colibri T20/T30 on EvalBoard V3.x and GMI-Memory Board
> ---
>
> Changes in v2:
> - added address-cells, size-cells and ranges properties
>
> Changes in v3:
> - fixed range address which is not the same as Tegra30.
>
>  arch/arm/boot/dts/tegra20.dtsi | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
> index 2207c08..b22cddb 100644
> --- a/arch/arm/boot/dts/tegra20.dtsi
> +++ b/arch/arm/boot/dts/tegra20.dtsi
> @@ -1,4 +1,4 @@
> -#include <dt-bindings/clock/tegra20-car.h>
> +include <dt-bindings/clock/tegra20-car.h>

After fixing up this, can you also ...

>  #include <dt-bindings/gpio/tegra-gpio.h>
>  #include <dt-bindings/pinctrl/pinctrl-tegra.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -376,6 +376,20 @@
>  		status = "disabled";
>  	};
>
> +

Drop this additional line?

> +	gmi@70009000 {
> +		compatible = "nvidia,tegra20-gmi";
> +		reg = <0x70009000 0x1000>;
> +		#address-cells = <2>;
> +		#size-cells = <1>;
> +		ranges = <0 0 0xd0000000 0xfffffff>;
> +		clocks = <&tegra_car TEGRA20_CLK_NOR>;
> +		clock-names = "gmi";
> +		resets = < &tegra_car 42>;

Get rid of this additional space?

> +		reset-names = "gmi";
> +		status = "disabled";
> +	};
> +

Otherwise ...

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
