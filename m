Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5B913473D
	for <linux-clk@vger.kernel.org>; Thu, 25 Jan 2024 19:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706210123; cv=none; b=m8ZXgBBuEZbWTFm922uF0EMfFFBbIuVJgfZccUHkBnhzRWZIA/bD5ws02VnCB4BLBcAQgC5q5ae3FlrOmkaZ/tYVIXlzlPk2H0TtfFzOqwP0KTdhfNXKIoF8iiUYiFnoN3A1pdeKx8Qe1q8Eus33TTO0XJm1xr9Qe1qkWdQ1tp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706210123; c=relaxed/simple;
	bh=kzQaYPUWbynoSnERWzMhIZje2cAZDJ5JaR8kt7YTbqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H5J2IVxl4BLZyDtBJPu/gf7/r/Pkg8JjWOTrZB4on6dvc7HI1Uu9XbxOf43kazTVJyUnHuO18SDgKm5mje2L0uCVYNNc2+qINC9/eW65AExEuLhMx4g+41tOtIfvlFqCGqeLe8owizSCwdkhIOm6gzO+fXy88OeV5nc+NgZO1Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=y8R1QLd/; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="y8R1QLd/"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50eab4bf47aso1149597e87.0
        for <linux-clk@vger.kernel.org>; Thu, 25 Jan 2024 11:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1706210118; x=1706814918; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l5lfCYOS1NBrTdzjyrz70RC7raHVrIJ2n0SqF7ll480=;
        b=y8R1QLd/NE2Dacorgmlgs6dJwoApduA794o+quFH7F6aviM93eTf/pF3sgVSjaFSVG
         Td1PM9psxOXQ7QA6AJjwpK6rWSHnPXvnhJ2C45VRQ7SmwMUNQyKeEk3vQyIY+c6zX1UT
         AyxlzypawPWvtzMx7wqVhMvUxT2dJ+xIBRg7h6kJ011nXYc3vSK6SHqKc9dmifPRf0fK
         xIL7enjWq+ZoSZqWvjNZJ72S/furaO2dGdF0tXkBpikrfIUEsmgE9B/d5jeCPouSYB5t
         4tB0iEr+9yMSEU4FOTbFzptoKegm9l09ZcnTpD7jt1P97vmf4fCgoYRXsuITEGkgOub4
         IYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706210118; x=1706814918;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l5lfCYOS1NBrTdzjyrz70RC7raHVrIJ2n0SqF7ll480=;
        b=qP35Uyp7Qo+bAahsqFa+XLxqEHs917ueZ7gYtvr1mg3JOKPdFZOrY2N51zr/GH1Fbz
         Ci0dQ2Aej4Il30h+wAxVuJusnGQ/G9qVgcsybIKHoQTgiYM2Vptsxn77rwicHx6H3yd0
         Cz/tWJctrg9vRaIs5aZz6+TbkJKLeMwCNUJPLGzfrxusZlB4UCzOh6/OAyBLP+nFOpat
         9WuaHK48zFC9ZMumkgDQw1sT18mVqOEQV8Nm7I0MlCT13luOrICqMzuS1/W/bF7pg/yr
         am/h8JyoAUQdN32TCSElyTO69vn0FPafsRA2ohwkcPye6/G76+Hhcfoz3dOBgBN9MBi0
         PBQg==
X-Gm-Message-State: AOJu0YzLRh+uBBPCFN+3A8izEIz+Fhf9O3JtRkduNGh/vE5SamUP1/nz
	jUS645OxWV0wNHfeVsGuVlng8kPs7R1ksHKj2oYCMPPGZgTcKA/ZUyIekj3Bzh4=
X-Google-Smtp-Source: AGHT+IHdhRRf00wGnpJGNkIlMig5CfXGMbmF8O8TgwEHLBg4n1bEZ9kzRmDO2Ym2ZF/YsbEisx9tNA==
X-Received: by 2002:ac2:5b0f:0:b0:50e:74f3:c320 with SMTP id v15-20020ac25b0f000000b0050e74f3c320mr7358lfn.21.1706210118492;
        Thu, 25 Jan 2024 11:15:18 -0800 (PST)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id j11-20020ac2454b000000b005100d4455a2sm635122lfm.72.2024.01.25.11.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 11:15:17 -0800 (PST)
Date: Thu, 25 Jan 2024 20:15:17 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	Cong Dang <cong.dang.xn@renesas.com>,
	Duy Nguyen <duy.nguyen.rh@renesas.com>,
	Hai Pham <hai.pham.ud@renesas.com>,
	Linh Phung <linh.phung.jy@renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 13/15] arm64: dts: renesas: Add Renesas R8A779H0 SoC
 support
Message-ID: <20240125191517.GP4126432@ragnatech.se>
References: <cover.1706194617.git.geert+renesas@glider.be>
 <4107bc3d7c31932da29e671ddf4b1564ba38a84c.1706194617.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4107bc3d7c31932da29e671ddf4b1564ba38a84c.1706194617.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your work.

On 2024-01-25 16:34:41 +0100, Geert Uytterhoeven wrote:
> From: Hai Pham <hai.pham.ud@renesas.com>
> 
> Add initial support for the Renesas R-Car V4M (R8A779H0) SoC.
> 
> Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> v2:
>   - Add vendor-prefixes to DT binding definition header files.
> 
> Changes compared to the BSP:
>   - Add "-clk" suffix to clock node names,
>   - Rename "pmu_a76" node to "pmu-a76",
>   - Drop bogus CPU masks from GICv3 PPI interrupt specifiers,
>   - Drop hscif0 dmas and dma-names placeholder,
>   - Add missing hypervisor virtual timer IRQ to timer node.
> ---
>  arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 121 ++++++++++++++++++++++
>  1 file changed, 121 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> new file mode 100644
> index 0000000000000000..a082e2d06b696019
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> @@ -0,0 +1,121 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the R-Car V4M (R8A779H0) SoC
> + *
> + * Copyright (C) 2023 Renesas Electronics Corp.
> + */
> +
> +#include <dt-bindings/clock/renesas,r8a779h0-cpg-mssr.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/power/renesas,r8a779h0-sysc.h>
> +
> +/ {
> +	compatible = "renesas,r8a779h0";
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		a76_0: cpu@0 {
> +			compatible = "arm,cortex-a76";
> +			reg = <0>;
> +			device_type = "cpu";
> +			power-domains = <&sysc R8A779H0_PD_A1E0D0C0>;
> +		};
> +	};
> +
> +	extal_clk: extal-clk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		/* This value must be overridden by the board */
> +		clock-frequency = <0>;
> +	};
> +
> +	extalr_clk: extalr-clk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		/* This value must be overridden by the board */
> +		clock-frequency = <0>;
> +	};
> +
> +	pmu-a76 {
> +		compatible = "arm,cortex-a76-pmu";
> +		interrupts-extended = <&gic GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	/* External SCIF clock - to be overridden by boards that provide it */
> +	scif_clk: scif-clk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <0>;
> +	};
> +
> +	soc: soc {
> +		compatible = "simple-bus";
> +		interrupt-parent = <&gic>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		cpg: clock-controller@e6150000 {
> +			compatible = "renesas,r8a779h0-cpg-mssr";
> +			reg = <0 0xe6150000 0 0x4000>;
> +			clocks = <&extal_clk>, <&extalr_clk>;
> +			clock-names = "extal", "extalr";
> +			#clock-cells = <2>;
> +			#power-domain-cells = <0>;
> +			#reset-cells = <1>;
> +		};
> +
> +		rst: reset-controller@e6160000 {
> +			compatible = "renesas,r8a779h0-rst";
> +			reg = <0 0xe6160000 0 0x4000>;
> +		};
> +
> +		sysc: system-controller@e6180000 {
> +			compatible = "renesas,r8a779h0-sysc";
> +			reg = <0 0xe6180000 0 0x4000>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		hscif0: serial@e6540000 {
> +			compatible = "renesas,hscif-r8a779h0",
> +				     "renesas,rcar-gen4-hscif", "renesas,hscif";
> +			reg = <0 0xe6540000 0 0x60>;
> +			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 514>,
> +				 <&cpg CPG_CORE R8A779H0_CLK_SASYNCPERD1>,
> +				 <&scif_clk>;
> +			clock-names = "fck", "brg_int", "scif_clk";
> +			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
> +			resets = <&cpg 514>;
> +			status = "disabled";
> +		};
> +
> +		gic: interrupt-controller@f1000000 {
> +			compatible = "arm,gic-v3";
> +			#interrupt-cells = <3>;
> +			#address-cells = <0>;
> +			interrupt-controller;
> +			reg = <0x0 0xf1000000 0 0x20000>,
> +			      <0x0 0xf1060000 0 0x110000>;
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		prr: chipid@fff00044 {
> +			compatible = "renesas,prr";
> +			reg = <0 0xfff00044 0 4>;
> +		};
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts-extended = <&gic GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +				      <&gic GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +				      <&gic GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +				      <&gic GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
> +				      <&gic GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund
