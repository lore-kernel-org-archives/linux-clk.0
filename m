Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6616C36C0AB;
	Thu, 27 Aug 2026 16:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849944; cv=none; b=U6U8VDtipM/qSe5IvfBTLXyNkaf0E52ukuD+CvFlNYvozfci6wc3puRE9HqJbidML/beSOoO3YTdcSLlN2HwCAOn5HULuUP+saaWDa9LClZuUWSLJgitJuPzULewutjMsccXmoV+JkZI56sBF55uuQY+pFtl2QM29MfA4C9olAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849944; c=relaxed/simple;
	bh=u/wZIgD+kxT88SpRfKFGlkLoZm5tJ25Zo62DlMWZaZE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YGnY9Lbmcv43CbQyIamsvb7sGxSzgQFTfTzXuOI804o7ig/PbuzZT5ZYmYYSsRJOOiRcaN1hyZD/2umlmA+WUjGf9u2I8eMTOyCwJ4qmpKW0n2M0h8QmM9hA6DDOSSgzfwklK34k9NNpZuJ8zl17DQDrSmYGnFzcIkxpcXmc12E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R6R8xg9I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R6R8xg9I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 917261F000E9;
	Thu, 27 Aug 2026 16:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787849938;
	bh=ZggADCl/ASrnToVnGNEuZbhajcH5YmYfbkpRjthybOI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R6R8xg9IIOJ8Oc1sIz9Pyqxiu2Mjh69j+e977eOW0im9SJhizJccKba4RSDYTTwlZ
	 sy2wlJvGvL4aOBaeGBIMBicI/zJY42erX9j63og0p+NTQHxMy78QqIRPFa4DE/SCHK
	 L3CDCZIexQ8qJtx6AsRgjRgjqSqO9hEd8TJ4C1adqHyg5C/5O2UA+rzldlV27LGYzt
	 64zEHBrc+QqGktgMaUe08gj4ePu1AzyZesI/0OvhKGtP7WJAcpv1Pg4t/eZqSut7ZN
	 Wu5MJC0j7s9aqc2vqDivffeQKAE7DnR6acKRlpHQifaibqaeBylr0RenPxZhKtsmu5
	 XZVEPQBg7LU4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 15/15] ARM: dts: qcom: Add initial device tree for
 Kuno SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hardeep Sharma" <hardeep.sharma@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260827-kuno-soc-support-v4-15-dd34f235fc1a@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
 <20260827-kuno-soc-support-v4-15-dd34f235fc1a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 16:58:58 +0000
Message-Id: <20260827165858.917261F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `tlmm` pinctrl node is missing the `wakeup-parent` property, b=
reaking GPIO deep sleep wakeups.
- [High] The `rpmhpd` power domains lack consumers and will be automaticall=
y disabled by the PM core, causing a hardware crash.
- [Low] The `memory` node has a `reg` property but lacks a unit-address in =
its name.
--

commit b57e8c90f6a902093ad16d840222fdf3db7d8fd8
Author: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

ARM: dts: qcom: Add initial device tree for Kuno SoC

Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS for the Qualcomm
Kuno SoC. This includes support for the Cortex-A7 CPU, RPMh, GCC, TLMM,
interconnect, UART, and SMEM.

> diff --git a/arch/arm/boot/dts/qcom/qcom-kuno.dtsi b/arch/arm/boot/dts/qc=
om/qcom-kuno.dtsi
> new file mode 100644
> index 0000000000000..d0c6e3f21a14f
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
[ ... ]
> +	memory {
> +		device_type =3D "memory";
> +		/* Bootloader will fill base and size */
> +		reg =3D <0x0 0x0>;
> +	};

[Severity: Low]
Since this node defines a reg property starting at address 0x0, should
the node name be memory@0 to conform to DT specifications?

[ ... ]
> +		gcc: clock-controller@80000 {
> +			compatible =3D "qcom,kuno-gcc";
> +			reg =3D <0x00080000 0x1f4200>;

[Severity: High]
Should this node declare a power-domains property?

Foundational IP blocks like GCC typically reside in the CX power domain.
Is a non-zero voltage vote required here to avoid a hardware crash?

> +			clocks =3D <&rpmhcc RPMH_CXO_CLK>,
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
Should this node specify wakeup-parent =3D <&pdc>; to route GPIO
wakeup interrupts to the Power Domain Controller?

Without this property, if the SoC enters a low-power mode, will a GPIO
interrupt fail to reach the PDC and GIC, fundamentally breaking system
suspend/resume functionality?

[ ... ]
> +			rpmhpd: power-controller {
> +				compatible =3D "qcom,kuno-rpmhpd";
> +				#power-domain-cells =3D <1>;

[Severity: High]
Are there any active consumers for this power domain provider across
the device tree?

Without consumers (like GCC above), the generic power domain (genpd)
framework will evaluate reference counts at late_initcall and power off
all rpmhpd domains.

Will this drop core SoC voltage domains to 0V and cause an immediate
boot failure?

> +				operating-points-v2 =3D <&rpmhpd_opp_table>;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827-kuno-soc-s=
upport-v4-0-dd34f235fc1a@oss.qualcomm.com?part=3D15
