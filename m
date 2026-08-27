Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16277385D8A;
	Thu, 27 Aug 2026 18:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854166; cv=none; b=Ugsg7KJCJHUjrqgDo/7mkMh3FNdkvC1/pSbehnOn+MguZDdPD8vAvZcKFGjOAytdarzntQ9zMafSJwTJlMG5vdUgVqjo61LfgbPjKM2L5uomTAIuaE2L93v4dl+6s69caDFE/uSGIsyXSKwzLNe4/XuKRQi7as9i9e7pJ7HjVPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854166; c=relaxed/simple;
	bh=QmnGXpSLhCVI3BavvS2xul6VgRjauDuWDchnsEQbP0M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GOpPAhoG+CkZRgQBglvlREzPP2PPhZ+fm/AhLR/EjB0VIy52Vaixk55UI0sFsDOV6HBkm6x18VMGOsq2ikjvE+xlZyNh0p1AfH5H8oaw+bi251UBAXh4W3d/VWLom5TVmp/vYj0ZOrmwdqwTWcavbzTyL14gFs8cbrkGEbHV6lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PjNkMQPu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PjNkMQPu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687881F000E9;
	Thu, 27 Aug 2026 18:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787854164;
	bh=wVA/VMjBsr1b1JlR5xmRQ9oiQdkeE5iSiO+7fIZ8Keg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PjNkMQPuahY50gI5D1tnLPC1wmvDNLe/fLuHMlqZpCnlD4hoEXDCwYV5ru1n33WSC
	 QHBAIu2rBDFqrmb4oJVzAEQ+hypsnb97ye5NTesPz5aLEbUaveIAju+Ws6qnicr68u
	 /Y4mFBsgmEXj81fjBK5Fl5tAj+Nv9000egkGlPio8EFMrSk/srNqJcLL26TbaxDCs3
	 QFawuQX+vpb7PZl8zsG1SVCoCUHqwxpd4uIs+Izvya1PrPGoU95dKyVnVpnh/A0nzp
	 idoOY7GqK9dFyg92+ESpwUwWfdbjGeCeuAKGmt1XWjxFLeCl/bhL1bk4A/EV1rIhxF
	 /ga9eFdcCRL6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 15/15] ARM: dts: qcom: Add initial device tree for
 Kuno SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hardeep Sharma" <hardeep.sharma@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 18:09:24 +0000
Message-Id: <20260827180924.687881F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The TLMM (pinctrl) node is missing the `wakeup-parent =3D <&pdc>;`=
 property.
- [High] Incorrect architected timer GIC PPI mapping and ordering.
- [Medium] The `ranges` property in the `soc` node truncates the bus mappin=
g by one byte.
--

commit 429df2d2736988037173b656c9a9508e2e6b4476
Author: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

ARM: dts: qcom: Add initial device tree for Kuno SoC

This adds the initial device tree source and include files for the
Qualcomm Kuno SoC and IDP board. It includes initial peripheral
nodes such as PSCI, RPMh, GCC, TLMM, interconnects, and UART.

> diff --git a/arch/arm/boot/dts/qcom/qcom-kuno.dtsi b/arch/arm/boot/dts/qc=
om/qcom-kuno.dtsi
> new file mode 100644
> index 0000000000000..d0c6e3f21a14f
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
[ ... ]
> +	soc: soc@0 {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges =3D <0 0 0xffffffff>;

[Severity: Medium]
Does this truncate the 32-bit address space bus mapping by one byte?
A size of 0xffffffff leaves the final byte of the 4GB address space unmappe=
d.
Should this use an empty ranges property to map the entire address space
correctly?

[ ... ]
> +		tlmm: pinctrl@f000000 {
> +			compatible =3D "qcom,kuno-tlmm";
> +			reg =3D <0x0f000000 0x400000>;
> +			interrupts =3D <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			gpio-ranges =3D <&tlmm 0 0 110>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;

[Severity: High]
Is the tlmm node missing the wakeup-parent property?
Without chaining the TLMM to the Power Domain Controller (pdc node) via
wakeup-parent, any GPIOs configured as wakeup sources cannot wake the system
from deep sleep states.

[ ... ]
> +	timer {
> +		compatible =3D "arm,armv7-timer";
> +		interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LO=
W)>,
> +			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
> +	};
> +};

[Severity: High]
Are these GIC PPI numbers correctly mapped and ordered?
The non-secure timer appears to be incorrectly set to PPI 12 instead of 14,
and the virtual and hypervisor interrupts (10 and 11) seem to be swapped.
This incorrect mapping will cause the kernel to request the wrong IRQs and
can lead to early boot hangs when timer interrupts fail to arrive.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827-kuno-soc-s=
upport-v5-0-6d47636a8f09@oss.qualcomm.com?part=3D15
