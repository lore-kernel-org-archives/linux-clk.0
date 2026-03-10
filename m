Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C3B3D47B9
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 17:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773164019; cv=none; b=ZgPa+/SHGBChNCsFeVWfUwy5njoI+NcDbv8RnDOk/wTv1BVPGVinlsV+SUCM2A1sS0ZOIdk/S9XDje7lIfRPs2KfyiWMZgYc5JWBpPVMbj/2M/+VulO6xzZHbUVOpit0PwgTsNSgbbzA8hKUBu1QNK00or6ScKYOYhVVgOUXIkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773164019; c=relaxed/simple;
	bh=iDsUAnuGCJPA0EvA71qgJyApHhY1W5vY//J46Q2Ujtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=LBkbf8kHtPUCMVh7yiDzOZicnPpvYV/f9TSVApGumfCGB294rEOb301rf9irhamnJDMrDBDq6Teyt3jTPMQ3jKnwGDEN9nMayeVWZgOLkPal/Cr1uLQGwFZNaiRUBhpNkspwEnbKl7wr1YHLH90ck4lOaziLnez57j1BywBaWqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=pIm114EZ; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="pIm114EZ"
Date: Tue, 10 Mar 2026 17:30:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1773164011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pbRHkg6j9RRwu7gnA0/6n+CmNyUAf+QALaWx+a/gjiE=;
	b=pIm114EZhCnFvihJDz6EkqgldikGB5peLN/GNoPVUM8SKl14CnwYJIOE4ErMAHwCKfGtB3
	oiRo5WnSWNBtmG5SJUFTonIS3T48mLUDfhQRC8IJMHHuBXt0TisKqY/AYSO1npzSuETDi3
	gAAWkmCY+2/Ycd8B74gOr8ijLiy49hUQu6zDCk1n8iGqvuQukdPenkomdX6v5eaYRIq1PE
	IcCJb1wnZcWUm/PWHiyv4g4Fd4VasAJSTNWatypqr5ulUsI2qy0MSto4QGxM6/iPJ4stqb
	qeF3jkwOIT70sGs5srpp0wqvq8EhAVDnxWciCRok0RGf1q67atuqob0kXOhQ5Q==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, Jian Hu <jian.hu@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin  
 Blumenstingl <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>, devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, linux-amlogic <linux-amlogic@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: t7: Add clock controller nodes
References: <20260305074328.639993-1-jian.hu@amlogic.com> <20260305074328.639993-4-jian.hu@amlogic.com>
In-Reply-To: <20260305074328.639993-4-jian.hu@amlogic.com>
Message-ID: <tbp23s.3oymu5iyepvke@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-Migadu-Flow: FLOW_OUT

On Thu, 05 Mar 2026 07:43, Jian Hu <jian.hu@amlogic.com> wrote:
>Add the required clock controller nodes for Amlogic T7 SoC family:
>- SCMI clock controller
>- PLL clock controller
>- Peripheral clock controller
>
>Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>---
> arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 125 ++++++++++++++++++++
> 1 file changed, 125 insertions(+)
>
>diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>index 6510068bcff9..6ea1b583b13d 100644
>--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>@@ -6,6 +6,9 @@
> #include <dt-bindings/interrupt-controller/arm-gic.h>
> #include <dt-bindings/power/amlogic,t7-pwrc.h>
> #include "amlogic-t7-reset.h"
>+#include <dt-bindings/clock/amlogic,t7-scmi.h>
>+#include <dt-bindings/clock/amlogic,t7-pll-clkc.h>
>+#include <dt-bindings/clock/amlogic,t7-peripherals-clkc.h>
> 
> / {
> 	interrupt-parent = <&gic>;
>@@ -201,6 +204,33 @@ pwrc: power-controller {
> 		};
> 	};
> 
>+	sram@f7042000 {
>+		compatible = "mmio-sram";
>+		#address-cells = <1>;
>+		#size-cells = <1>;
>+		ranges = <0 0x0 0xf7042000 0x100>;
>+
>+		scmi_shmem: sram@0 {
>+			compatible = "arm,scmi-shmem";
>+			reg = <0x0 0x100>;
>+		};
>+	};
>+
>+	firmware {
>+		scmi: scmi {
>+			compatible = "arm,scmi-smc";
>+			arm,smc-id = <0x820000c1>;
>+			shmem = <&scmi_shmem>;
>+			#address-cells = <1>;
>+			#size-cells = <0>;
>+
>+			scmi_clk: protocol@14 {
>+				reg = <0x14>;
>+				#clock-cells = <1>;
>+			};
>+		};
>+	};
>+
> 	soc {
> 		compatible = "simple-bus";
> 		#address-cells = <2>;
>@@ -224,6 +254,42 @@ apb4: bus@fe000000 {
> 			#size-cells = <2>;
> 			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
> 
>+			clkc_periphs:clock-controller@0 {
>+				compatible = "amlogic,t7-peripherals-clkc";
>+				reg = <0x0 0x0 0x0 0x1c8>;
>+				#clock-cells = <1>;
>+				clocks = <&xtal>,
>+					 <&scmi_clk CLKID_SYS_CLK>,
>+					 <&scmi_clk CLKID_FIXED_PLL>,
>+					 <&scmi_clk CLKID_FCLK_DIV2>,
>+					 <&scmi_clk CLKID_FCLK_DIV2P5>,
>+					 <&scmi_clk CLKID_FCLK_DIV3>,
>+					 <&scmi_clk CLKID_FCLK_DIV4>,
>+					 <&scmi_clk CLKID_FCLK_DIV5>,
>+					 <&scmi_clk CLKID_FCLK_DIV7>,
>+					 <&hifi CLKID_HIFI_PLL>,
>+					 <&gp0 CLKID_GP0_PLL>,
>+					 <&gp1 CLKID_GP1_PLL>,
>+					 <&mpll CLKID_MPLL1>,
>+					 <&mpll CLKID_MPLL2>,
>+					 <&mpll CLKID_MPLL3>;
>+				clock-names = "xtal",
>+					      "sys",
>+					      "fix",
>+					      "fdiv2",
>+					      "fdiv2p5",
>+					      "fdiv3",
>+					      "fdiv4",
>+					      "fdiv5",
>+					      "fdiv7",
>+					      "hifi",
>+					      "gp0",
>+					      "gp1",
>+					      "mpll1",
>+					      "mpll2",
>+					      "mpll3";
>+			};
>+
> 			reset: reset-controller@2000 {
> 				compatible = "amlogic,t7-reset";
> 				reg = <0x0 0x2000 0x0 0x98>;
>@@ -234,6 +300,7 @@ watchdog@2100 {
> 				compatible = "amlogic,t7-wdt";
> 				reg = <0x0 0x2100 0x0 0x10>;
> 				clocks = <&xtal>;
>+
> 			};
> 
> 			periphs_pinctrl: pinctrl@4000 {
>@@ -269,6 +336,64 @@ uart_a: serial@78000 {
> 				status = "disabled";
> 			};
> 
>+			gp0:clock-controller@8080 {
>+				compatible = "amlogic,t7-gp0-pll";
>+				reg = <0x0 0x8080 0x0 0x20>;
>+				clocks = <&scmi_clk CLKID_TOP_PLL_OSC>;
>+				clock-names = "in0";
>+				#clock-cells = <1>;
>+			};

I would separate `gp0:` and `clock-controller@8080` with a space, like so:

			gp0: clock-controller@8080 {

Same for the others below (and `clkc_periphs:clock-controller@0` above).

>+
>+			gp1:clock-controller@80c0 {
>+				compatible = "amlogic,t7-gp1-pll";
>+				reg = <0x0 0x80c0 0x0 0x14>;
>+				clocks = <&scmi_clk CLKID_TOP_PLL_OSC>;
>+				clock-names = "in0";
>+				#clock-cells = <1>;
>+			};
>+
>+			hifi:clock-controller@8100 {
>+				compatible = "amlogic,t7-hifi-pll";
>+				reg = <0x0 0x8100 0x0 0x20>;
>+				clocks = <&scmi_clk CLKID_TOP_PLL_OSC>;
>+				clock-names = "in0";
>+				#clock-cells = <1>;
>+			};
>+
>+			pcie:clock-controller@8140 {
>+				compatible = "amlogic,t7-pcie-pll";
>+				reg = <0x0 0x8140 0x0 0x1c>;
>+				clocks = <&scmi_clk CLKID_PCIE_OSC>;
>+				clock-names = "in0";
>+				#clock-cells = <1>;
>+			};
>+
>+			mpll:clock-controller@8180 {
>+				compatible = "amlogic,t7-mpll";
>+				reg = <0x0 0x8180 0x0 0x28>;
>+				clocks = <&scmi_clk CLKID_FIXED_PLL_DCO>;
>+				clock-names = "in0";
>+				#clock-cells = <1>;
>+			};
>+
>+			hdmi:clock-controller@81c0 {
>+				compatible = "amlogic,t7-hdmi-pll";
>+				reg = <0x0 0x81c0 0x0 0x20>;
>+				clocks = <&scmi_clk CLKID_HDMI_PLL_OSC>;
>+				clock-names = "in0";
>+				#clock-cells = <1>;
>+			};
>+
>+			mclk:clock-controller@8300 {
>+				compatible = "amlogic,t7-mclk-pll";
>+				reg = <0x0 0x8300 0x0 0x18>;
>+				clocks = <&scmi_clk CLKID_MCLK_PLL_OSC>,
>+					 <&xtal>,
>+					 <&scmi_clk CLKID_FCLK_50M>;
>+				clock-names = "in0", "in1", "in2";
>+				#clock-cells = <1>;
>+			};
>+
> 			sec_ao: ao-secure@10220 {
> 				compatible = "amlogic,t7-ao-secure",
> 					     "amlogic,meson-gx-ao-secure",
>-- 
>2.47.1
>
>

Best regards,
Ferass

>_______________________________________________
>linux-amlogic mailing list
>linux-amlogic@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-amlogic
