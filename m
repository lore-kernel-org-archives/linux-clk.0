Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F5735B63B;
	Sat, 30 May 2026 09:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780132064; cv=none; b=DmaHo2hgIW9WutqNoM80qQ5dArPQujEkLETLJYUVoXp9/WeJOvVAOxRJ13cZQjXhcrfOPa3OY2OauViL1Dcy+zLW5xPJsGwoubcN28IuqqWDiU1WwCk2K3bkF89lvPnHHRXufraMd0Aodg+h+TJ3G8X1J+cDRYIMByAiZF3xhWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780132064; c=relaxed/simple;
	bh=yn66HElcfXy3ADHRMQdCNnfagQIg2KdxyR5NL90pobY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V1EjDKF0cUAROETsLmETwozozuaqqf3nYEo8FeP8l0tTc9/L/93+zLH3JftxHJvfJlAEiua3G6F2g5ZH/6atuAHPigCodjelZeTxt8z+H2f7m11HEaAMkfLLhukJv1xPIHiWyK4ftj8bVmIFgwl4yijmyuEcw/YPe/XGGQJY/wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmkPjIEd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmkPjIEd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB6E51F00893;
	Sat, 30 May 2026 09:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780132063;
	bh=eh6vH1NzwqKuUTPIZiPWB2xNT8lrQxfIA02cNL7FETA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=bmkPjIEdltwNWtPX2k44gknYsUptqZkgXqCIxhhR6h4jZNMTlsVlA8tr/7l0IhEsl
	 sTwv8z7Ty/znuBMU6tyCQENF9YqcRwfG8XB95XCgUYl5AsvjLIgS6USNTPqBA+o8pW
	 GdJs5lrNvBH4h6xTjuNu+Q5Q4Rl9NG07Mylpo1N+GId4UPAt8+QDvTH9B61xuGP0fH
	 TtfNJQ0pqpuB439RCHmZYnVBM3t7SZU6FE+oP2NaC77/SSpn+i3cTvvYyGs0W3P7Zu
	 ejBYo8LcoX/4KALKkZ8wWrqMBvSa3Kx2bIZpoP29T1vmDrtkHh/fR6G/Yq9yzh6wGe
	 yXO30MtiSDfiA==
Message-ID: <c68f29a0-1d5e-4568-bc70-52926c275623@kernel.org>
Date: Sat, 30 May 2026 11:07:39 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/7] arm64: dts: cix: sky1: add audss device nodes
To: joakim.zhang@cixtech.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, lgirdwood@gmail.com, broonie@kernel.org
Cc: cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20260530021642.64059-1-joakim.zhang@cixtech.com>
 <20260530021642.64059-8-joakim.zhang@cixtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260530021642.64059-8-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/05/2026 04:16, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Add audss support for cix sky1 platform, including
> clock, reset and hda controllers.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  arch/arm64/boot/dts/cix/sky1-orion-o6.dts | 34 ++++++++++++++
>  arch/arm64/boot/dts/cix/sky1.dtsi         | 56 +++++++++++++++++++++++
>  2 files changed, 90 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> index e39c87774c12..1700ecbfa1ce 100644
> --- a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> +++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> @@ -66,6 +66,20 @@ pins {
>  			drive-strength = <8>;
>  		};
>  	};
> +
> +	pinctrl_audss_hda: hda-cfg {
> +		pins {
> +			pinmux = <CIX_PAD_HDA_BITCLK_FUNC_HDA_BITCLK>,
> +			       <CIX_PAD_HDA_RST_L_FUNC_HDA_RST_L>,
> +			       <CIX_PAD_HDA_SDIN0_FUNC_HDA_SDIN0>,
> +			       <CIX_PAD_HDA_SDOUT0_FUNC_HDA_SDOUT0>,
> +			       <CIX_PAD_HDA_SYNC_FUNC_HDA_SYNC>,
> +			       <CIX_PAD_HDA_SDIN1_FUNC_HDA_SDIN1>,
> +			       <CIX_PAD_HDA_SDOUT1_FUNC_HDA_SDOUT1>;
> +			bias-pull-down;
> +			drive-strength = <20>;
> +		};
> +	};
>  };
>  
>  &iomuxc_s5 {
> @@ -82,6 +96,26 @@ pins {
>  	};
>  };
>  
> +&audss_cru {
> +	status = "okay";
> +};
> +
> +&audss_clk {
> +	status = "okay";
> +};
> +
> +&audss_rst {
> +	status = "okay";
> +};
> +
> +&audss_ipb_hda {
> +	model = "Radxa Orion O6 HDA";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_audss_hda>;
> +	memory-region = <&audio_alsa_hda>;
> +	status = "okay";
> +};
> +
>  &pcie_x8_rc {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
> index bb5cfb1f2113..fe096ab95f3b 100644
> --- a/arch/arm64/boot/dts/cix/sky1.dtsi
> +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
> @@ -6,6 +6,10 @@
>  
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/cix,sky1.h>
> +#include <dt-bindings/clock/sky1-audss.h>
> +#include <dt-bindings/reset/cix,sky1-system-control.h>
> +#include <dt-bindings/reset/cix,sky1-s5-system-control.h>
> +#include <dt-bindings/reset/sky1-reset-audss.h>
>  #include "sky1-power.h"
>  
>  / {
> @@ -155,6 +159,18 @@ core11 {
>  		};
>  	};
>  
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		audio_alsa_hda: audio_alsa_hda@d0c00000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x0 0xd0c00000 0x0 0x200000>;
> +			no-map;
> +		};
> +	};
> +
>  	firmware {
>  		ap_to_pm_scmi: scmi {
>  			compatible = "arm,scmi";
> @@ -488,6 +504,46 @@ mbox_pm2ap: mailbox@65a0080 {
>  			cix,mbox-dir = "rx";
>  		};
>  
> +		audss_ipb_hda: hda@70c0000 {
> +			compatible = "cix,sky1-ipbloq-hda";
> +			reg = <0x0 0x070c0000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&audss_clk CLK_HDA_SYS>,
> +				 <&audss_clk CLK_HDA_HDA>;
> +			clock-names = "ipg", "per";
> +			resets = <&audss_rst AUDSS_HDA_SW_RST_N>;
> +			status = "disabled";
> +		};
> +
> +		audss_cru: system-controller@7110000 {
> +			compatible = "cix,sky1-audss-cru", "simple-mfd", "syscon";
> +			reg = <0x0 0x07110000 0x0 0x10000>;
> +			status = "disabled";

What is missing on the board side? Why SoC component is disabled?

Best regards,
Krzysztof
