Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAD13242B0
	for <linux-clk@vger.kernel.org>; Thu,  5 Mar 2026 09:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701466; cv=none; b=VDUGuMixqWPc+KREthtsd8YyK8xFxsszgWsbYncpm8Nqlzsv9j5cVbrdbgNPDj8BXB3/qlxNTFXBkPHyCNpsJ4DM1lT99GyjPJ1bODJMoW1lmpx9mOUlimprnIK6vyurRd+F905bq7W9b787mi5pxSXESAcAwJIDUXovB8is2hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701466; c=relaxed/simple;
	bh=zCehJbWT6SYXtdrgE6S7AtPq7RU2KmAcGMToI84al5o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=V+Q3XSIoQEJNnv8QCij714wT4/ovr6Vt0xEZNaIh7Z4zPmbfhULx80ncOD3XmgSw16oJCkSrBxQ0g5Xz8hNhcuNCGVHhHPgUU12mabfYrjPiSO/3pbGyVSSr+KUiBbvmanWahe8FmJWkaIuhoBKGSd01lZOuohoA27Q1hsHtysg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Zc2Jrnas; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Zc2Jrnas"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439a90f194bso3931887f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 05 Mar 2026 01:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772701463; x=1773306263; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x29TSbD/9Rjft5iIHHQCYlLvvZ+GvP60F94LjzSbanc=;
        b=Zc2JrnasuMqyfKZwmiNGY60VHsdEMrxpPuT7GLGtAD8OFIkbDD6bS2ZMJj301gl7ZF
         7bmiyylcRHo4WKwmr3igBnPF9nXyhOB7Vs0wrO2AO2MxUO+8UlCxDIDT38j50Xv6/EjQ
         OFoxV7/Z84iTN0HGqdhZ2VV30F2yRTXMssI1UhKk7bjGsVA8scmaMSbeovJnwYERRG/W
         9ewx4IH4ww5AOlyvzHPwRvugXreWi3+0GNrDQu0RCXyq14QF22vBmdm7ia8YLMepivlI
         RTFZX7eMcHbTFs8z4mWrSaf526BEyFDQSE4Rrgv4bYWRhpPFKORhjlBgQh317LQ2aRkz
         JwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701463; x=1773306263;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x29TSbD/9Rjft5iIHHQCYlLvvZ+GvP60F94LjzSbanc=;
        b=DefAO9MdCxaSHpoieB0IteW/6bEOPJ4cotqSLttzBb48vt6QDJ7hU7G9qDuCFwI1Ed
         XofKafMnNmXldgdbk9mZhqetSufaOWJnleAQFBNrfsJfg6ak/zz81E5n1Mkj+rpZrHgY
         GI+CF7Fam0th7feI1wdCRj7QFac0kDoVinK54FAdclzcCzsKGbM8k4pQhTjrESlWGLkx
         KXYWtxyP046Nlt/wG94xNYcobVBdF1u8rEqLNH0y5A4vXj8DhhFRXOk0I5bGYVBOT1FW
         5DKYle4n1tAyVpWrUc/nt5teSjkmQ6EUI4XhmYizs+eIm8WWdh1OrwWeqFCz6B0ziG7M
         TAsg==
X-Forwarded-Encrypted: i=1; AJvYcCUGcbodUuT+BkQ/DDTvMbrlzdyMxpW9k3Qabj7MgxXjx8+m2GCrIh12plLhkbjg/VhQdiauD984vaI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3VxA95QIbiaKz7KcH5eilWDZz+i9gfRQKRz7XOZLAGt9GTkZx
	Mqjw9En3bdYpUdCEZAvczhArqSMGpEADCuoE+QGbeW/Hk505lLBS7/USbWI+SSXim2s=
X-Gm-Gg: ATEYQzwqcUHUY19iP8oCoYTdg8OFQXI7gxMzqZYPElY1gxreHNC+zbDbFyyupTibNAY
	QenE1xqTv8Tv/9fYHatfVenEmbdro13XRA4eDuSHWsP7a455vEds43ft+eXTIvQ3eZjnHkYJdwj
	sY+IhberZ2tqQueYdV0Cc8S+FXIq/7p77u7GMRbv4+lJaHQOKcGvWj5j4a/k5ADvtovwmuFfezl
	FE3CPuhgBOhURreGfCB06UfHM31nUccSWGGEyodRKHGTAY2nuxQdSVhVH7yRgPrhp8i1XeQqBE9
	IFz1IRM+HE9H2dKY5R0w4dSikmRtHwSVtn00UknjXK3PMKbdldO+3q9y70TpzJGOAE/QmabrXJN
	C7xi8fJL2JRJrNeyOx6V6Kd6PpSz+fgfNfu4d4nlNAFng7Hl0aXT3MQ4P0F2cg2j/pkuB3c32+Y
	unnyRaN6zC0IsWOPh/B9UaSYR15jWNkPk=
X-Received: by 2002:a5d:6409:0:b0:439:ca45:ae26 with SMTP id ffacd0b85a97d-439ca45af5cmr7015427f8f.18.1772701463400;
        Thu, 05 Mar 2026 01:04:23 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:5595:8450:af3:bbe3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-439c6129017sm13508505f8f.31.2026.03.05.01.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:04:22 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>,  Stephen Boyd <sboyd@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  robh+dt
 <robh+dt@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  devicetree
 <devicetree@vger.kernel.org>,  linux-clk <linux-clk@vger.kernel.org>,
  linux-amlogic <linux-amlogic@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>,  Ronald Claveau
 <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: t7: Add clock controller nodes
In-Reply-To: <20260305074328.639993-4-jian.hu@amlogic.com> (Jian Hu's message
	of "Thu, 5 Mar 2026 15:43:27 +0800")
References: <20260305074328.639993-1-jian.hu@amlogic.com>
	<20260305074328.639993-4-jian.hu@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 05 Mar 2026 10:04:21 +0100
Message-ID: <1jy0k6abqi.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 05 mars 2026 at 15:43, Jian Hu <jian.hu@amlogic.com> wrote:

> Add the required clock controller nodes for Amlogic T7 SoC family:
> - SCMI clock controller
> - PLL clock controller
> - Peripheral clock controller
>

Again I think you should credit Ronald.

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
Jerome
