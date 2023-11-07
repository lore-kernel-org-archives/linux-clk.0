Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2EF17C3;
	Tue,  7 Nov 2023 07:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OVHUiGbY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DA25C433C7;
	Tue,  7 Nov 2023 07:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699342086;
	bh=Oeo7abSq3CtzoDpqum8ZKNA5cr+aGoQC0Mlx1lKoCrE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OVHUiGbYydy/W6SH8NuD8f8xIxz2hEb8HNOUZ4gO5g3ro6aCR+ckIcchojCcGC1Ko
	 FjNf4uVyZBkCA4c2OAM5N6Ng2GgjrNmNn8XfZzBZA/nHC/aWsntzym2o1oUfqSIi3J
	 j+pMU2XgNX+35D5caua9BGqwoy6ZDgbc3Uv/m+PfwRd/DocmrjZVd3oOtSG8ktZURA
	 dhxjP9nAnphvA7YtIgCgrlh/Z2Bh5hxqY5QOLCSL9rtz+zYuVlmGx6FOWahbWK8Sb4
	 n8+lt3ltA32im5to08Dj3F7tXiKDLr7pdFEqSzDt/KdNyRKd9sEU7fo8TjOzKDrweE
	 u6GOfJVSt1klw==
Message-ID: <d44ce895-6b88-4db1-9cd4-5913c82a8244@kernel.org>
Date: Tue, 7 Nov 2023 08:28:03 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: st: add rcc support in stm32mp251
Content-Language: en-US
To: gabriel.fernandez@foss.st.com, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231106141845.102648-1-gabriel.fernandez@foss.st.com>
 <20231106141845.102648-5-gabriel.fernandez@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20231106141845.102648-5-gabriel.fernandez@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/11/2023 15:18, gabriel.fernandez@foss.st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> Add RCC support used for to manage clocks and resets on stm32mp251.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  arch/arm64/boot/dts/st/stm32mp251.dtsi | 59 ++++++++++++++------------
>  1 file changed, 31 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index 124403f5f1f4..698d0f68b98d 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -3,7 +3,9 @@
>   * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
>   * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
>   */
> +#include <dt-bindings/clock/stm32mp25-clks.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/reset/stm32mp25-resets.h>
>  
>  / {
>  	#address-cells = <2>;
> @@ -35,22 +37,10 @@ arm_wdt: watchdog {
>  	};
>  
>  	clocks {
> -		ck_flexgen_08: ck-flexgen-08 {
> +		clk_rcbsec: clk-rcbsec {
>  			#clock-cells = <0>;
>  			compatible = "fixed-clock";
> -			clock-frequency = <100000000>;
> -		};
> -
> -		ck_flexgen_51: ck-flexgen-51 {
> -			#clock-cells = <0>;
> -			compatible = "fixed-clock";
> -			clock-frequency = <200000000>;
> -		};
> -
> -		ck_icn_ls_mcu: ck-icn-ls-mcu {
> -			#clock-cells = <0>;
> -			compatible = "fixed-clock";
> -			clock-frequency = <200000000>;
> +			clock-frequency = <64000000>;
>  		};
>  	};
>  
> @@ -122,7 +112,7 @@ usart2: serial@400e0000 {
>  				compatible = "st,stm32h7-uart";
>  				reg = <0x400e0000 0x400>;
>  				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
> -				clocks = <&ck_flexgen_08>;
> +				clocks = <&rcc CK_KER_USART2>;
>  				status = "disabled";
>  			};
>  
> @@ -131,7 +121,7 @@ sdmmc1: mmc@48220000 {
>  				arm,primecell-periphid = <0x00353180>;
>  				reg = <0x48220000 0x400>, <0x44230400 0x8>;
>  				interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
> -				clocks = <&ck_flexgen_51>;
> +				clocks = <&rcc CK_KER_SDMMC1 >;
>  				clock-names = "apb_pclk";
>  				cap-sd-highspeed;
>  				cap-mmc-highspeed;
> @@ -140,6 +130,19 @@ sdmmc1: mmc@48220000 {
>  			};
>  		};
>  
> +		rcc: rcc@44200000 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


Best regards,
Krzysztof

