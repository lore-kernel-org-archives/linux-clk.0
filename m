Return-Path: <jonathanh@nvidia.com>
Subject: Re: [PATCH 5/6] ARM: tegra: Add Tegra20 GMI support
To: Mirza Krak <mirza.krak@gmail.com>, <swarren@wwwdotorg.org>,
	<thierry.reding@gmail.com>, <gnurou@gmail.com>, <pdeschrijver@nvidia.com>,
	<pgaikwad@nvidia.com>
References: <1470512452-8322-1-git-send-email-mirza.krak@gmail.com>
 <1470512452-8322-6-git-send-email-mirza.krak@gmail.com>
CC: <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
	<pawel.moll@arm.com>, <ijc+devicetree@hellion.org.uk>,
	<mturquette@baylibre.com>, <sboyd@codeaurora.org>, <linux@armlinux.org.uk>,
	<robh+dt@kernel.org>, <galak@codeaurora.org>, <linux-tegra@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <af24f4d2-b8bf-993a-13f3-54dade1ebeb7@nvidia.com>
Date: Mon, 8 Aug 2016 16:09:17 +0100
MIME-Version: 1.0
In-Reply-To: <1470512452-8322-6-git-send-email-mirza.krak@gmail.com>
Return-Path: jonathanh@nvidia.com
Content-Type: text/plain; charset="windows-1252"
List-ID: <linux-clk.vger.kernel.org>



On 06/08/16 20:40, Mirza Krak wrote:
> From: Mirza Krak <mirza.krak@gmail.com>
> 
> Add a device node for the GMI controller found on Tegra20.
> 
> Signed-off-by: Mirza Krak <mirza.krak@gmail.com>
> ---
>  arch/arm/boot/dts/tegra20.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
> index 2207c08..9b97863 100644
> --- a/arch/arm/boot/dts/tegra20.dtsi
> +++ b/arch/arm/boot/dts/tegra20.dtsi
> @@ -376,6 +376,17 @@
>  		status = "disabled";
>  	};
>  
> +
> +	gmi@70009000 {
> +		compatible = "nvidia,tegra20-gmi";
> +		reg = <70009000 0x1000>;
> +		clocks = <&tegra_car TEGRA20_CLK_NOR>;
> +		clock-names = "gmi";
> +		resets = < &tegra_car 42>;
> +		reset-names = "gmi";
> +		status = "disabled";
> +	};

#address-cells, #size-cells and ranges appears to be missing.

Cheers
Jon

-- 
nvpublic
