Return-Path: <alexandre.torgue@st.com>
Subject: Re: [PATCH v4 8/9] ARM: dts: stm32f4: Add external I2S clock
To: Gabriel FERNANDEZ <gabriel.fernandez@st.com>,
        Rob Herring
	<robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Russell King
	<linux@armlinux.org.uk>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Michael
 Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, Nicolas Pitre <nico@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
        "andrea.merello@gmail.com" <andrea.merello@gmail.com>,
        "radoslaw.pietrzyk@gmail.com" <radoslaw.pietrzyk@gmail.com>
References: <1481638820-29324-1-git-send-email-gabriel.fernandez@st.com>
 <1481638820-29324-9-git-send-email-gabriel.fernandez@st.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>,
        "kernel@stlinux.com" <kernel@stlinux.com>,
        Ludovic BARRE <ludovic.barre@st.com>,
        Olivier BIDEAU <olivier.bideau@st.com>,
        Amelie DELAUNAY <amelie.delaunay@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <340234ae-8d01-82e0-8a29-06f401c20d75@st.com>
Date: Tue, 10 Jan 2017 11:59:10 +0100
MIME-Version: 1.0
In-Reply-To: <1481638820-29324-9-git-send-email-gabriel.fernandez@st.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi

On 12/13/2016 03:20 PM, Gabriel FERNANDEZ wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
>
> This patch adds an external I2S clock in the DT.
> The I2S clock could be derived from an external I2S clock or by I2S pll.
>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> ---
>  arch/arm/boot/dts/stm32f429.dtsi | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
> index e4dae0e..7c7dfbd 100644
> --- a/arch/arm/boot/dts/stm32f429.dtsi
> +++ b/arch/arm/boot/dts/stm32f429.dtsi
> @@ -68,6 +68,12 @@
>  			compatible = "fixed-clock";
>  			clock-frequency = <32000>;
>  		};
> +
> +		clk_i2s_ckin: i2s-ckin {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <0>;
> +		};
>  	};
>
>  	soc {
> @@ -362,7 +368,7 @@
>  			#clock-cells = <2>;
>  			compatible = "st,stm32f42xx-rcc", "st,stm32-rcc";
>  			reg = <0x40023800 0x400>;
> -			clocks = <&clk_hse>;
> +			clocks = <&clk_hse>, <&clk_i2s_ckin>;
>  			st,syscfg = <&pwrcfg>;
>  		};
>
>
Applied on stm32-dt-for-v4.11

Thanks
