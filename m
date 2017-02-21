Return-Path: <narmstrong@baylibre.com>
Return-Path: <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 2/3] ARM64: dts: meson-gx: add clock CLKID_RNG0 to
 hwrng node
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-amlogic@lists.infradead.org,
 linux-crypto@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
References: <daf765e2-1a60-8dea-fee0-8af6ddecdf8e@gmail.com>
 <8bf052e3-de8f-dbdf-be76-369a7bb1ed15@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <a80f9487-b385-b886-5a4c-e8f5da506b7f@baylibre.com>
Date: Tue, 21 Feb 2017 13:20:44 -0800
MIME-Version: 1.0
In-Reply-To: <8bf052e3-de8f-dbdf-be76-369a7bb1ed15@gmail.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 02/21/2017 12:18 PM, Heiner Kallweit wrote:
> Add clock CLKID_RNG0 to HW randon number generator node and
> extend the DT binding documentation accordingly.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - splitted first version of patch into two
> - add DT binding documentation

Hi Heiner,

Can you move the dt-bindings to a separate patch ?

> - mention that clock is optional
> - replace spaces with tabs in DT binding example
> ---
>  Documentation/devicetree/bindings/rng/amlogic,meson-rng.txt | 8 ++++++--
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi                   | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi                 | 5 +++++
>  3 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/rng/amlogic,meson-rng.txt b/Documentation/devicetree/bindings/rng/amlogic,meson-rng.txt
> index 202f2d09..4c012a04 100644
> --- a/Documentation/devicetree/bindings/rng/amlogic,meson-rng.txt
> +++ b/Documentation/devicetree/bindings/rng/amlogic,meson-rng.txt
> @@ -5,10 +5,14 @@ Required properties:
>  
>  - compatible : should be "amlogic,meson-rng"
>  - reg : Specifies base physical address and size of the registers.
> +- clocks : Optional core clock
> +- clock-names: Name of core clock, must be "core"

Please put these in a separate "Optional Properties" :

Optional Properties:
- clocks : phandle to the following named clocks
- clock-names: Name of core clock, must be "core"

>  
>  Example:
>  
>  rng {
> -        compatible = "amlogic,meson-rng";
> -        reg = <0x0 0xc8834000 0x0 0x4>;
> +	compatible = "amlogic,meson-rng";
> +	reg = <0x0 0xc8834000 0x0 0x4>;
> +	clocks = <&clkc CLKID_RNG0>;
> +	clock-names = "core";
>  };
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> index 5d995f77..620495a4 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> @@ -380,7 +380,7 @@
>  			#size-cells = <2>;
>  			ranges = <0x0 0x0 0x0 0xc8834000 0x0 0x2000>;
>  
> -			rng {
> +			hwrng: rng {
>  				compatible = "amlogic,meson-rng";
>  				reg = <0x0 0x0 0x0 0x4>;
>  			};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> index 04b3324b..a375cb21 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> @@ -524,3 +524,8 @@
>  &vpu {
>  	compatible = "amlogic,meson-gxbb-vpu", "amlogic,meson-gx-vpu";
>  };
> +
> +&hwrng {
> +	clocks = <&clkc CLKID_RNG0>;
> +	clock-names = "core";
> +};
> 
