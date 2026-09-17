Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B453AA4F1;
	Thu, 17 Sep 2026 22:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685208; cv=none; b=FrFlTemlTNDTGhlWIQnRAUjLQ6drqfHosLruEOgwZLLK8TdaN6KV/BZE2fQuirlPGPlto4qdCHp/4dr2V1kPWuIuhERc2IiBuP297SAPB7mm60pWCOr/8hX63K83/iRUiBCLjULdjnbd6NqBORlYNuhm2LWz4FB/Ay6+ztG5NSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685208; c=relaxed/simple;
	bh=9J4bzM0+JA3CQ2iN2QHp4Uac7iAHcFWoqWhnwxOidd4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XC0m/hLZ1KQk5bDFya66W7ChpLfoochvV4J30GzyGdk0AAvNAVuhB1irexTnakfCrrOdXeUIxQPN/4ptqkgEr4l41t7SapN5ERp9eYVuK0YpWW7RuqBT3XL10g5bG+t3sLFYB/YQuBuRvz+YTAY8EstSXQ3eZz6/IfOKIkXxbaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZSi+r/Xu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZSi+r/Xu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 650D51F000FF;
	Thu, 17 Sep 2026 22:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789685206;
	bh=YDvdtq5Ax/CJA08WN5o/JaZSEk9tqHgnc25GkZ7kdC4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZSi+r/XueSThaEKgisLaw1Dx8moPQL53x9Fop/uSNls9XcJ5NdzuOY14Y3L8ule6C
	 XpQbeO6hFKSQlySJpR+Ts/kie0f+oQ8H7v/xvFll4Dvsa1dPSxSDHCVGbof66K4SSw
	 IbYeTjxRZgQkkcJQrmwbBmU/lFNsQ3Ag2lrVqXRhxFbFJ0fUqINEfdpBAuJUsyQ9u3
	 7jmqXC9Xm9L9ICEyt9ieCaxodUMk6t56+kJLbOf1vy9iBwm0nz7bLaoqEIGK0GTv0p
	 /Hh0q3oovoVhAz5BBIplrc8J5NbdEGAtMaLSxsuI3QxH1KKFgYXLkdsl4KSgDAnjyG
	 cCJ4HNUPBNpbw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: allwinner: a523: add CPU clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260917223913.1855301-6-andre.przywara@arm.com>
References: <20260917223913.1855301-1-andre.przywara@arm.com>
 <20260917223913.1855301-6-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 22:46:45 +0000
Message-Id: <20260917224646.650D51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dt: sun55i-a523: incorrect #reset-cells in cpu_ccu
- [Low] dt: sun55i-a523: clock-names mismatch pll-periph0-600M
--

commit e064b2e2cf12882a6bab40a91b6eb61a493b3e06
Author: Andre Przywara <andre.przywara@arm.com>

arm64: dts: allwinner: a523: add CPU clocks

The Allwinner A523 family of SoCs feature a separate clock unit for the CPU
PLLs and muxes. This patch adds a DT node for the CPU clock controller and
lists the required clocks and sources for each CPU.

> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index 85ef492ffeae7..29af21372aba2 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi

[ ... ]

> @@ -1144,5 +1153,18 @@ npu: npu@7122000 {
>  			resets =3D <&mcu_ccu RST_BUS_MCU_NPU>;
>  			power-domains =3D <&ppu PD_NPU>;
>  		};
> +
> +		cpu_ccu: clock-controller@8817000 {
> +			compatible =3D "allwinner,sun55i-a523-cpu-ccu";
> +			reg =3D <0x08817000 0x80>;
> +			clocks =3D <&osc24M>, <&rtc CLK_OSC32K>,
> +				 <&rtc CLK_IOSC>, <&ccu CLK_PLL_PERIPH0_2X>,
> +				 <&ccu CLK_PLL_PERIPH0_600M>;
> +			clock-names =3D "hosc", "losc",
> +				      "iosc", "pll-periph0-2x",
> +				      "pll-periph0-600M";

[Severity: Low]
Will this clock name cause a validation regression during dtbs_check?

In the cpu_ccu node of arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi, the
device tree uses pll-periph0-600M. This matches the driver, but the YAML
binding strictly expects pll-periph0-600m.

This case mismatch will fail validation when running make dtbs_check.

> +			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;

[Severity: Low]
Does this introduce a regression in the DT description by erroneously decla=
ring
cpu_ccu as a reset controller provider?

The #reset-cells =3D <1> property in the cpu_ccu node describes it as a res=
et
controller, but the hardware and driver do not provide resets.

This appears to be satisfying a flawed YAML binding that erroneously mandat=
es
it globally for all compatibles.

> +		};
>  	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917223913.1855=
301-1-andre.przywara@arm.com?part=3D5
