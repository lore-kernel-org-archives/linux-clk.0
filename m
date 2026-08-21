Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420CE3537F8;
	Fri, 21 Aug 2026 16:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329404; cv=none; b=cQfYkHcNitcBN+EtK0RXd+cwS5ikauVnjx30r0+eYhjCDqOlDdAE2809yoHGF73A0Iyi7WNTrr0E7crdwzJgEmtLMXa8LcGamk0xg1EpaOmJWoAaQcmmYBDuj8yHrnn9xibWChAZc3dI9iuspa9sFZhX8i4+uxwTW/vAfi26zJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329404; c=relaxed/simple;
	bh=ulvfZXQzTUkFvEz7JU/Z3XzucEqMxotA0JOVjSTfcRw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PyBUSCkL7WtWFpeVYs6nzubUrqmBLT8sHzOJkHwSaXfIIiYLNy9YjUforqsdD43j4akV8eWh1agS8x62ZLpYYRvrs7SoSlit5DIsotGlnDQ1yxsIuDXfO8zjDIBeGvkszP9jYpl6DT4POV4rM1d+L6/+nY6swVY4nk+S0+F9m08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ASRciImN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ASRciImN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B4E01F000E9;
	Fri, 21 Aug 2026 16:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787329402;
	bh=N2UDTYfmLglZrKw1/bB4MPJY7i/oQkrP8HXDbP6lJBE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ASRciImNYvEkrq70UHirGpfdQJG49z1vN9GUwDmS6A1rLr/ffnRuDiXxORrG4ynow
	 CYqadqEG+0WTb+Gv9ks7DrBU4noaLcdxSCPUuqpfAb3KcJTswNbrcQuX9FYupK9had
	 cAZrBAMMXPJ1jRNTaLk2ZleV0KpYMErZcbPF80N0I1ePKYisx3JrVLsfEeMCsopSPB
	 yjD75cbC3EWWdjhF62N2rAQBG8XQYbo37/GpIxkaS/9anhcwM3D02axGow8RfeTz9t
	 svqOxm7ekMpzDT9KpjnSYInImxc+EbsdyVE3kwa6NmG41GXzNvcxaTPfUUZMq/8lC2
	 5A+iH3IaGspbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 15/15] ARM: dts: qcom: Add initial device tree for
 Kuno SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hardeep Sharma" <hardeep.sharma@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260821-kuno-soc-support-v3-15-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-15-196e2b306368@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 16:23:22 +0000
Message-Id: <20260821162322.8B4E01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `tlmm` node is missing the `wakeup-parent` property, which b=
reaks GPIO-based system wakeups from deep sleep.
--

--- Patch [15]: [PATCH v3 15/15] ARM: dts: qcom: Add initial device tree fo=
r Kuno SoC ---
commit a3ae80ec946ae96cfeef01d12c9e58806dffcb0b
Author: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

ARM: dts: qcom: Add initial device tree for Kuno SoC

This commit adds the initial SoC-level device tree (qcom-kuno.dtsi) and
IDP board device tree (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC. It
includes basic peripherals like the CPU, RPMh RSC, GCC, TLMM, and GENI UART.

[ ... ]

> diff --git a/arch/arm/boot/dts/qcom/qcom-kuno.dtsi b/arch/arm/boot/dts/qc=
om/qcom-kuno.dtsi
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom/qcom-kuno.dtsi

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

[Severity: Medium]
Will GPIO-based interrupts be able to wake the system from deep sleep witho=
ut
a wakeup-parent property here?

The Kuno SoC defines deep sleep states (standalone-pc and pc) where the
primary GIC is powered off. Without wakeup-parent =3D <&pdc>; in the tlmm n=
ode,
the pinctrl-msm driver won't establish the hierarchical IRQ domain linking
GPIO interrupts to the always-on Power Domain Controller.=20

Doesn't this mean GPIO wakeups will only route to the GIC and be lost during
sleep?

> +
> +			uart_console_active: uart-console-active-state {
> +				pins =3D "gpio8", "gpio9";

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-kuno-soc-s=
upport-v3-0-196e2b306368@oss.qualcomm.com?part=3D15
