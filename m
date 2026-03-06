Received: from courrier.aliel.fr (pouet.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8207733509E;
	Fri,  6 Mar 2026 07:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772783276; cv=none; b=oE8T2IRZ6bLxel8ZF11wJxkBjgMLdKs8D+ry1kI8Ep5tCo0x86ysA0R2VYYNqBBqdYWH9FfRlFi/Wh476ECZwiwoWHZm9xtseOfot37G3D7iIRCmaCcY84dkEQ0LZyExR7EddemNd3ttFx17a5G8mN2CnHB16Ptm6Irb4nk9ofI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772783276; c=relaxed/simple;
	bh=GJbk3EYD30NiOVRPHD92mUzUsX2DdDJmKW1uLLv40cM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gW+qepaT+I+d4IOq4oxRv9kg8vNrCzZQr0A5KkFYbkh8loc+6HliGpwKiFhvcfDRZkAGTK86N03bUBUWQKYKreX1fbIjhMCDPRN6dvGN/qFyMuT1mTcN/XggZ5jxDHIezfGt2MsD5wAjeT9cDtYMEf5U31c+Tv6LzPOpaYchLz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=X+ZZyijX; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="X+ZZyijX"
Received: from [IPV6:2a02:842b:8136:1:1033:1579:e8cc:83d5] (2A02-842B-8136-0001-1033-1579-E8CC-83d5.rev.sfr.net [IPv6:2a02:842b:8136:1:1033:1579:e8cc:83d5])
	by courrier.aliel.fr (Postfix) with ESMTPSA id 73C97426E9;
	Fri, 06 Mar 2026 07:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1772783271;
	bh=GJbk3EYD30NiOVRPHD92mUzUsX2DdDJmKW1uLLv40cM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=X+ZZyijXUwzAj7llgamkLWbvZoAsd+G/6EU2ebWkYEr5VMpHrE7z548GvmOGpN944
	 rLWajxtjJ3UuALx81J7/uu/KOB3vP9ydbw7uSAf4Pm4SHrRzitOMIfSjR3nCLvVFSw
	 Ay/G3kjnEiATTYlEGeaSaYgpzXi51cGytYFLHnSE=
Message-ID: <e8d1ee42-2e57-423e-a431-90b241709158@aliel.fr>
Date: Fri, 6 Mar 2026 08:47:49 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: t7: Add clock controller nodes
To: Jian Hu <jian.hu@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20260305074328.639993-1-jian.hu@amlogic.com>
 <20260305074328.639993-4-jian.hu@amlogic.com>
Content-Language: en-US
In-Reply-To: <20260305074328.639993-4-jian.hu@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/5/26 8:43 AM, Jian Hu wrote:
> Add the required clock controller nodes for Amlogic T7 SoC family:
> - SCMI clock controller
> - PLL clock controller
> - Peripheral clock controller
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 125 ++++++++++++++++++++
>  1 file changed, 125 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 6510068bcff9..6ea1b583b13d 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -6,6 +6,9 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/power/amlogic,t7-pwrc.h>
>  #include "amlogic-t7-reset.h"
> +#include <dt-bindings/clock/amlogic,t7-scmi.h>
> +#include <dt-bindings/clock/amlogic,t7-pll-clkc.h>
> +#include <dt-bindings/clock/amlogic,t7-peripherals-clkc.h>
>  
>  / {
>  	interrupt-parent = <&gic>;
> @@ -201,6 +204,33 @@ pwrc: power-controller {
>  		};
>  	};
>  
> +	sram@f7042000 {
> +		compatible = "mmio-sram";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0x0 0xf7042000 0x100>;
> +
> +		scmi_shmem: sram@0 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0x0 0x100>;
> +		};
> +	};
> +
> +	firmware {
> +		scmi: scmi {
> +			compatible = "arm,scmi-smc";
> +			arm,smc-id = <0x820000c1>;
> +			shmem = <&scmi_shmem>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			scmi_clk: protocol@14 {
> +				reg = <0x14>;
> +				#clock-cells = <1>;
> +			};
> +		};
> +	};
> +
>  	soc {
>  		compatible = "simple-bus";
>  		#address-cells = <2>;
> @@ -224,6 +254,42 @@ apb4: bus@fe000000 {
>  			#size-cells = <2>;
>  			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
>  
> +			clkc_periphs:clock-controller@0 {
> +				compatible = "amlogic,t7-peripherals-clkc";
> +				reg = <0x0 0x0 0x0 0x1c8>;
> +				#clock-cells = <1>;
> +				clocks = <&xtal>,
> +					 <&scmi_clk CLKID_SYS_CLK>,
> +					 <&scmi_clk CLKID_FIXED_PLL>,
> +					 <&scmi_clk CLKID_FCLK_DIV2>,
> +					 <&scmi_clk CLKID_FCLK_DIV2P5>,
> +					 <&scmi_clk CLKID_FCLK_DIV3>,
> +					 <&scmi_clk CLKID_FCLK_DIV4>,
> +					 <&scmi_clk CLKID_FCLK_DIV5>,
> +					 <&scmi_clk CLKID_FCLK_DIV7>,
> +					 <&hifi CLKID_HIFI_PLL>,
> +					 <&gp0 CLKID_GP0_PLL>,
> +					 <&gp1 CLKID_GP1_PLL>,
> +					 <&mpll CLKID_MPLL1>,
> +					 <&mpll CLKID_MPLL2>,
> +					 <&mpll CLKID_MPLL3>;
> +				clock-names = "xtal",
> +					      "sys",
> +					      "fix",
> +					      "fdiv2",
> +					      "fdiv2p5",
> +					      "fdiv3",
> +					      "fdiv4",
> +					      "fdiv5",
> +					      "fdiv7",
> +					      "hifi",
> +					      "gp0",
> +					      "gp1",
> +					      "mpll1",
> +					      "mpll2",
> +					      "mpll3";
> +			};
> +
>  			reset: reset-controller@2000 {
>  				compatible = "amlogic,t7-reset";
>  				reg = <0x0 0x2000 0x0 0x98>;
> @@ -234,6 +300,7 @@ watchdog@2100 {
>  				compatible = "amlogic,t7-wdt";
>  				reg = <0x0 0x2100 0x0 0x10>;
>  				clocks = <&xtal>;
> +
>  			};

Did you forget to add something here for watchdog ?
If not I think you can remove that blank line.

>  
>  			periphs_pinctrl: pinctrl@4000 {
> @@ -269,6 +336,64 @@ uart_a: serial@78000 {
>  				status = "disabled";
>  			};
>  
> +			gp0:clock-controller@8080 {
> +				compatible = "amlogic,t7-gp0-pll";
> +				reg = <0x0 0x8080 0x0 0x20>;
> +				clocks = <&scmi_clk CLKID_TOP_PLL_OSC>;
> +				clock-names = "in0";
> +				#clock-cells = <1>;
> +			};
> +
> +			gp1:clock-controller@80c0 {
> +				compatible = "amlogic,t7-gp1-pll";
> +				reg = <0x0 0x80c0 0x0 0x14>;
> +				clocks = <&scmi_clk CLKID_TOP_PLL_OSC>;
> +				clock-names = "in0";
> +				#clock-cells = <1>;
> +			};
> +
> +			hifi:clock-controller@8100 {
> +				compatible = "amlogic,t7-hifi-pll";
> +				reg = <0x0 0x8100 0x0 0x20>;
> +				clocks = <&scmi_clk CLKID_TOP_PLL_OSC>;
> +				clock-names = "in0";
> +				#clock-cells = <1>;
> +			};
> +
> +			pcie:clock-controller@8140 {
> +				compatible = "amlogic,t7-pcie-pll";
> +				reg = <0x0 0x8140 0x0 0x1c>;
> +				clocks = <&scmi_clk CLKID_PCIE_OSC>;
> +				clock-names = "in0";
> +				#clock-cells = <1>;
> +			};
> +
> +			mpll:clock-controller@8180 {
> +				compatible = "amlogic,t7-mpll";
> +				reg = <0x0 0x8180 0x0 0x28>;
> +				clocks = <&scmi_clk CLKID_FIXED_PLL_DCO>;
> +				clock-names = "in0";
> +				#clock-cells = <1>;
> +			};
> +
> +			hdmi:clock-controller@81c0 {
> +				compatible = "amlogic,t7-hdmi-pll";
> +				reg = <0x0 0x81c0 0x0 0x20>;
> +				clocks = <&scmi_clk CLKID_HDMI_PLL_OSC>;
> +				clock-names = "in0";
> +				#clock-cells = <1>;
> +			};
> +
> +			mclk:clock-controller@8300 {
> +				compatible = "amlogic,t7-mclk-pll";
> +				reg = <0x0 0x8300 0x0 0x18>;
> +				clocks = <&scmi_clk CLKID_MCLK_PLL_OSC>,
> +					 <&xtal>,
> +					 <&scmi_clk CLKID_FCLK_50M>;
> +				clock-names = "in0", "in1", "in2";
> +				#clock-cells = <1>;
> +			};
> +
>  			sec_ao: ao-secure@10220 {
>  				compatible = "amlogic,t7-ao-secure",
>  					     "amlogic,meson-gx-ao-secure",


-- 
Best regards,
Ronald
