Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71124477E8;
	Thu, 13 Aug 2026 10:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786615676; cv=none; b=qfSlOyCyTMeIRA1Jsd0gW9kXdGx3we08m7AAKK82bznAF/srfeTLHjB6iCsv1zhqDodFTC26pA4BnAX9LlDEENQK2jb0pCoUyPMxNVFA6wuFDJvPP4zjAS3Qk1OLFPRcKE4fT/x+ov+o/BmG4NyHF2ln7/2Ng4IHpmLjbdWNHJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786615676; c=relaxed/simple;
	bh=zdwvl04VMvjigzmMvNZcs0DSpMGDUK+4G/xN5AifIDI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=asLK/as0P+APmrrCMKFHFCHnUirQo5XLg1rzEs+r6105LJcgFW4j8iXlx/iZtTbsFQC92dFGTbCahzsYxNFEb6gJXVo5ns8N/XUXY+OZDvcz+bZCzo9m70MvinDT2+B8g1kY6TtSwRyIM1XOJxjiiJdmewEjh41W4pM3cc6G+5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HnJ9dOas; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HnJ9dOas"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAFE51F000E9;
	Thu, 13 Aug 2026 10:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786615670;
	bh=TSkgADSrazBb3o6mhO9EJ7pdpDO7nRNmTYhku+6twQw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HnJ9dOasRPqnO5vQoPirjmmGwGR2LSSBsYdNt+QWUw+q1S/j84aV5IdnymxNvK3PF
	 MXdJFsYPdLAJgF36k01w7VJLgh4ENbAUBAnSGSfarSSI0q877klf2HLFwUjXm+MPx4
	 ZCT4IRzXS1NtDp1rR0BZgn0qiCot5kgUe1m+E3OW6Cah9kPLXtwdUTjKH/LeCLzMLW
	 dp7sBzaYXNexAuNUPhQpjMiHpanZei83wf6Si7BIiFnrG70vrFjVeuwjaAxPh0qm9b
	 IKsstTfm1UATUjIJgyaJrvreJTZ+Orh/3BMW+z2Q0otjOS2S62l8JU6IvpATP8jWWU
	 NInlB1RbRjb5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/6] arm64: ambarella: add ARCH_AMBARELLA and CV75
 EVK DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: robh@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260813-cv75-v3-a-v3-5-cfdd20b1b4dd@ambarella.com>
References: <20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com>
 <20260813-cv75-v3-a-v3-5-cfdd20b1b4dd@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 10:07:49 +0000
Message-Id: <20260813100749.EAFE51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] ARCH_AMBARELLA selects non-existent and architecture-mismatched Kc=
onfig symbols, violating Kconfig dependency rules.
- [Low] The GIC interrupt controller node specifies `#size-cells =3D <1>` w=
hile `#address-cells =3D <0>`, which is structurally invalid in Devicetree.
--

--- Patch [5]: [PATCH v3 5/6] arm64: ambarella: add ARCH_AMBARELLA and CV75=
 EVK DT ---
commit cf8659acda73b48006f17101c5f47d5bf1d510a1
Author: Long Zhao <longzhao@ambarella.com>

arm64: ambarella: add ARCH_AMBARELLA and CV75 EVK DT

Enable ARCH_AMBARELLA and add a minimal CV75 SoC / EVK device tree for
console bring-up with the RCT clocks, UART, pinctrl and GPIO banks.

> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index d2acfac730037..166430ddb3c93 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -26,6 +26,15 @@ config ARCH_SUNXI
>  	help
>  	  This enables support for Allwinner sunxi based SoCs like the A64.
> =20
> +config ARCH_AMBARELLA
> +	bool "Ambarella SoC family"
> +	select ARM_PSCI
> +	select HAVE_ARM_ARCH_TIMER
> +	select PINCTRL
> +	select PINCTRL_AMB

[Severity: High]
Does PINCTRL_AMB exist in the kernel tree?

Selecting a non-existent config symbol leaves intended features silently
disabled when a user enables the SoC config.

Also, are ARM_PSCI and HAVE_ARM_ARCH_TIMER the correct symbols for arm64?

These appear to be 32-bit ARM-specific symbols. On arm64, it seems PSCI
and the architected timer are managed by ARM_PSCI_FW and ARM_ARCH_TIMER,
which are already selected by default.

> +	help
> +	  This enables support for the ARM64 based Ambarella SoCs like CV75.
> +

[ ... ]

> diff --git a/arch/arm64/boot/dts/ambarella/cv75.dtsi b/arch/arm64/boot/dt=
s/ambarella/cv75.dtsi
> new file mode 100644
> index 0000000000000..994eac6728ce8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ambarella/cv75.dtsi

[ ... ]

> +		gic: interrupt-controller@fff0101000 {
> +			compatible =3D "arm,gic-400";
> +			reg =3D <0xff 0xf0101000 0x0 0x1000>,
> +			      <0xff 0xf0102000 0x0 0x2000>,
> +			      <0xff 0xf0104000 0x0 0x2000>,
> +			      <0xff 0xf0106000 0x0 0x2000>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <3>;
> +			#address-cells =3D <0>;
> +			#size-cells =3D <1>;

[Severity: Low]
Is this #size-cells value correct given that #address-cells is 0?

When a node has an #address-cells value of 0, it does not define an address
space for its children, and its #size-cells property should also be 0.

While this will be ignored at runtime since there are no children, it will
trigger a dtc compiler warning for being structurally invalid.

> +			interrupts =3D <GIC_PPI 9
> +				      (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-cv75-v3-a-=
v3-0-cfdd20b1b4dd@ambarella.com?part=3D5
