Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0F841D63F;
	Fri, 14 Aug 2026 07:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786694026; cv=none; b=O5X5GUi/8DmP3WbTnTI0MfwAl8eSG/4KNKgBpMVfBePHVYQSPz7zxQ/ufyJSxS3EbmwbVSq0URC5rrXQ5pDLLzp+eKMH4T5EHcsC90WsHTSgPGd1GR19jFPv3DadGdXZhhmiUZAGEwy3wVONzdY5JeZW/2iltai8IpkoL+1FnUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786694026; c=relaxed/simple;
	bh=MH9158r5ANy0BZKIhPEJ8d/Eif0qzC2k7v4jnWyzGh8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QGNhkyW+wxn6IbP+fCWvKXFJI48Hg/61MzA1REpxYT1FSvPCcNYUgbmzOZv6KfIIYPyrrcRaj11h/fWPaQCRL1h9C9NZFmvMfI7h4ZdWNzs1HC/ymD4LbBiRK7toa4v9IkKb6oSGK7+33edce3nJ9NUxAosp2j2bvher9Pnz7gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hwGfzKVB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hwGfzKVB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C0051F00A3A;
	Fri, 14 Aug 2026 07:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786694023;
	bh=/1rODbuZsezSSZjLPyHqYHB6QQxiNCzGk8Kgo7XW0pI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hwGfzKVByi3FlJs35SvemaCM2titoIH8dzHkpzd3btqViLNzQJmUr0IqbxxwnzeGi
	 QXWHRQakpUZ5fz0wgP6tjmYzbrCRd6Oa+6/25anm+gkXEIQLAREL5eqn+AOLkzYV8q
	 p3Kc2pLJubObFiYq8l654mXuo/KxumAr9ToKjSPdGb8AdIKiN166x2qQs0yoeLq35j
	 ICSqWDD+Z9CTXeEzTc1aXSs/ZuvLVt/a1EdumGy28mTkQNK9vClvBUFNCf8HGD8aDT
	 mCkk/hN5h4Rsk7MJbAV3dDfsEkAHeThXOWuG/3LjUk+FiUaYZqqZ7QG1ZsnnoNWH3P
	 BsUEkfIU6iKmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 15/15] ARM: dts: qcom: Add initial device tree for
 Kuno SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hardeep Sharma" <hardeep.sharma@oss.qualcomm.com>
Cc: conor+dt@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260814-kuno-soc-support-v2-15-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-15-3079794f0f73@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 07:53:43 +0000
Message-Id: <20260814075343.9C0051F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `tlmm` (pinctrl) node is missing the `wakeup-parent =3D <&pd=
c>;` property, which breaks GPIO-based system wakeup from deep sleep.
--

--- Patch [15]: [PATCH v2 15/15] ARM: dts: qcom: Add initial device tree fo=
r Kuno SoC ---
commit 788737dd9e1817959acde679eb75eaf0aa270260
Author: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

ARM: dts: qcom: Add initial device tree for Kuno SoC

This commit adds the SoC-level DTSI and IDP board DTS for the Qualcomm Kuno
SoC. It brings in initial peripheral nodes including the Cortex-A7 CPU, RPMh
RSC, GCC, TLMM pin controller, and GENI UART console.

> diff --git a/arch/arm/boot/dts/qcom/qcom-kuno.dtsi b/arch/arm/boot/dts/qc=
om/qcom-kuno.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
[ ... ]
> +		restart@c264000 {
> +			compatible =3D "qcom,pshold";
> +			reg =3D <0x0c264000 0x1000>;
> +		};
> +
> +		tlmm: pinctrl@f000000 {
> +			compatible =3D "qcom,kuno-tlmm";
> +			reg =3D <0x0f000000 0x400000>;
> +			interrupts =3D <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			gpio-ranges =3D <&tlmm 0 0 110>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;

[Severity: Medium]
Is the wakeup-parent property missing from the tlmm node?

Without wakeup-parent =3D <&pdc>; being set here, the hierarchical IRQ rout=
ing
to the PDC won't be established. This causes a regression where GPIO-based
system wakeup from deep sleep states will not function, as interrupts
configured as wakeups will only be routed to the GIC, which is bypassed or
unpowered during sleep.

> +
> +			uart_console_active: uart-console-active-state {
> +				pins =3D "gpio8", "gpio9";
> +				function =3D "qup0_se3_mira";
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814-kuno-soc-s=
upport-v2-0-3079794f0f73@oss.qualcomm.com?part=3D15
