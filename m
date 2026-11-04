Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811797;
	b=cOMbvrizhD8mRa3Hlw6f82WVSjJB+6MjDLzOlgmaSqmBmAeYWQr92/nqZlOUcGIXDlI5
	 zqyaipZOtU0NSmHyB2K90YkHriPfvkNtNqpf3aRipR1WFP1gut8twGd/cDUvDrAXTV/cA
	 vHM005JD5dAqwC/zWDza1k0xJR30W3nqiTRK9wO2MpfCaCUzCT2/LD2ADdVwKEH60Hs8e
	 IT2TzgM2HBpXhNDMlU5gFQubw8ZLcdeCIyp3iNQH0ohzYjMxFL0C56BJY+8qkkNn12IWi
	 t846eove+HSZrVY5TIw8ytm1cIeDEbzTck9Immn9AQXoXz/lxQHTZ/MFrsc0zuUZ7YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811797;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VzzSEK3Kcr50pPNGnevj9bNGG5cnaUoCiFN3njOIOwQ=;
	b=W8KFP5hmK3hwBVPOUN/lH8niFVbnX49nukkBD1bUhlMcUhPbA/low/FiFHd/WE3vJrtm
	 ClNGR6/J4GF9UrtqKoXvB7eU7jiNkenfCPd5xBV0WphknW6KGQu53r+5hq2ohpNUNH+T3
	 p9fKcgLj/zWPMFEItJyXzfjzXzW8irCE5kVOzuOBwyN2pOftEehoWR4Lqg7DB5J/QLwbd
	 YOkaco3hahcCM9UXkGBZ3NN5igqgWMg/7q/WEuJI9Gjy2ca4VmEUJqpmtjLvBmN3pkG/r
	 9xWrP5h3N688vcVZ0Tyzjp3EHp/+6tA7bAU2MHXlOnrpDgGVSzTNsqMmAFbUuAI04AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=htpO0LGK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1B0606A31B;
	Wed,  4 Nov 2026 17:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=htpO0LGK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7121F000C1;
	Wed,  4 Nov 2026 17:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793811796;
	bh=VzzSEK3Kcr50pPNGnevj9bNGG5cnaUoCiFN3njOIOwQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=htpO0LGKZzgaspIPtzye7HCjoBW+4IsWvNGleKFrDVoLZ3JOYsK9kHReK/VFyEFX2
	 yVNFWUrMoJsAnASgdC033CfNGyKMxKsjFMPAsJBTd4z4yz5du338LwBOR/ErRAWVqG
	 gIfVSSLwVrixhmmGOCxxN9ipRZpPp79xfkE/vDsgLEsQmJlCSqUzUkIk43HDsSstYE
	 zKEfWFahPdbC3Cs/G0CL3lEptucbXz86FVVDMzM3sIqFEKKLIsTwmugkzCmrQWwHd3
	 4snjnq9f08xShY4i0nKT0H8UuL18nZ2a83vsmWfBbuUqznH7004HqXRxqRLnSyrSEI
	 xSn44jrlELMKQ==
Message-ID: <sashiko-outbox-197707@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 8/8] arm64: dts: qcom: Add SM7250 devicetree file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeshankar K" <sreeshankar0910@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-master-v13-8-355b65c6f764@gmail.com>
References: <20261104-master-v13-0-355b65c6f764@gmail.com>
 <20261104-master-v13-8-355b65c6f764@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 17:03:15 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] arm64: dts: qcom: sm7250: child nodes under soc@0 not sorted by uni=
t address
--

commit 48e074939e46ccf1a214eda37c1751a4c6df68db
Author: Sreeshankar K <sreeshankar0910@gmail.com>

arm64: dts: qcom: Add SM7250 devicetree file

This commit adds the base devicetree file for the Qualcomm SM7250 SoC,
including CPU, PSCI, clock, interrupt, and serial console nodes.

> diff --git a/arch/arm64/boot/dts/qcom/sm7250.dtsi b/arch/arm64/boot/dts/q=
com/sm7250.dtsi
> new file mode 100644
> index 0000000000000..f2e77198065a4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7250.dtsi
> @@ -0,0 +1,803 @@

[ ... ]

> +	soc: soc@0 {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges =3D <0 0 0 0 0x10 0>;
> +		dma-ranges =3D <0 0 0 0 0x10 0>;

[ ... ]

> +		tcsr_mutex: hwlock@1f40000 {
> +			compatible =3D "qcom,tcsr-mutex";
> +			reg =3D <0x0 0x01f40000 0x0 0x40000>;
> +			#hwlock-cells =3D <1>;
> +		};
> +
> +		intc: interrupt-controller@17a00000 {
> +			compatible =3D "arm,gic-v3";
> +			reg =3D <0x0 0x17a00000 0x0 0x10000>,     /* GICD */
> +			      <0x0 0x17a60000 0x0 0x100000>;    /* GICR * 8 */
> +			#interrupt-cells =3D <3>;
> +			interrupt-controller;
> +			interrupts =3D <GIC_PPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		timer@17c20000 {

[ ... ]

> +		};
> +
> +		pdc: interrupt-controller@b220000 {
> +			compatible =3D "qcom,sm7250-pdc", "qcom,pdc";
> +			reg =3D <0 0xb220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
> +			qcom,pdc-ranges =3D <0 480 42>,
> +					  <42 612 28>,
> +					  <70 63 1>,
> +					  <71 640 15>,
> +					  <86 522 52>;
> +			#interrupt-cells =3D <2>;
> +			interrupt-parent =3D <&intc>;
> +			interrupt-controller;
> +		};
> +
> +		spmi_bus: spmi@c440000 {

[Severity: Low]
As reported by Sashiko on v12 [1], under soc: soc@0 in
arch/arm64/boot/dts/qcom/sm7250.dtsi, interrupt-controller@17a00000
(0x17a00000) and timer@17c20000 (0x17c20000) are placed before
interrupt-controller@b220000 (0x0b220000) and spmi@c440000 (0x0c440000).

Should interrupt-controller@b220000 and spmi@c440000 be moved before
interrupt-controller@17a00000 so that child nodes under soc@0 are ordered by
unit address in ascending numerical order?

[1] https://lore.kernel.org/r/20261104-master-v12-6-57fbe9eef978@gmail.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-master-v13=
-0-355b65c6f764@gmail.com?part=3D8
