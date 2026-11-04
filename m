Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816450;
	b=GOLkQlK9tSf2KqfOYnZjVQ79Txgep7NOtBXlj+Lw/yo5s6D8htoTx1xagFmbt/ailq2z
	 roZfmfbhTUur2PBnDz44MU1+rTK1jdQIz1WkC5BdgAyxtd+y6qAY4h+e1amW7YNixcKOz
	 O+EeciG590Dr1tjwSwntGV/YY0g5B5dDld8FLcEyzOG2ClfAyPJbpkvXQmuYyZAgjM1K6
	 dPL8RAyhJFXuzX5rf/2pjf/GrdVq6yjl8gJDRGbKSjToYa+/lUxGDk4fJ7rX8ycjCOBoM
	 KY/TZUpQ8ylihibxgiN/Q2uaemFOyZj7aqxKXnYkXM2oIcUsIScqN3cChtxCX/ZTj0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816450;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6cRoPWabrGRdi2lo3+Y9ZP0w1fcPeMxolUurBKt+2P4=;
	b=z5unxZAL0GAZ7TW/6WQtw9cMwc4ZAhQHROcDUI3Gg8yrZt05loPXjCvJhfK9AkCrpAuE
	 /wOjhCu2+ezcLHgnZGPolnin6OO3807EoSypjfHZZeo7IA24d7FwBBVi+gHNduC2VMbbj
	 lsknqLCbvqkZafqvquYE2ds4KkMGvi9QhvWQKXGO/ng2pmCtvvgxbELUZ/EeOyMWKS77c
	 SvDD9cMJhWCCyjbCfIR2N17/U8PxqGpjXyioljHrtDyCg/ergQssKUNTVV9te3XGhW2c7
	 HkDAKH1rJTah9Wr9qJNtsZgFRP2ltXRxOPczk6NqJPHjxhAwaVGjYaf9N+/kWynH9qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bN3c4+jq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41F2606D80C;
	Wed,  4 Nov 2026 18:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bN3c4+jq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204B31F00A16;
	Wed,  4 Nov 2026 18:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793816449;
	bh=6cRoPWabrGRdi2lo3+Y9ZP0w1fcPeMxolUurBKt+2P4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bN3c4+jqe3FNrWkRh1NqW2rzNNjbU9vXIoXnGglze1F0xMREhQFyPAwW9XAIS87E7
	 U+e4a8eMOQDgLxmsW5tdhvLqxvBixDPcT6WlWCTtIrgBDUqieHhkwxWy+RilMjApbT
	 9f+mYw1MlfUNWAkdGQAQoR/9WSjZgfFUFoWWeBhU5jOvgMmOg9icDKZxt2f6Q1Hhot
	 14ssxlPKXuriuTCXS1IlWLWuxT3bkg4RieoL14BkJDgjvwX5lCVjxky+10fI48qyNg
	 YfI40OxzmwJ6VjXjUTlm5WmsPLx5+iHJhROZ5Nd5xjyM3OtfJK0AxsZ5bUCFlNo20n
	 DXhaWDzouJbxw==
Message-ID: <sashiko-outbox-197830@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm8350: Add SoundWire and LPASS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Demeter Barna" <me@fromdisposition.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-sound@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-b4-sm8350-sound-v1-6-4c872df294fa@fromdisposition.org>
References: <20261104-b4-sm8350-sound-v1-0-4c872df294fa@fromdisposition.org>
 <20261104-b4-sm8350-sound-v1-6-4c872df294fa@fromdisposition.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 18:20:48 +0000
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
- [Medium] arm64: dts: qcom: sm8350: wrong PDC wakeup interrupt on swr2 node
--

commit e0bc0fd5876d3b09082c8770bf88a52e98e61a79
Author: Demeter Barna <me@fromdisposition.org>

arm64: dts: qcom: sm8350: Add SoundWire and LPASS

This commit adds the LPASS RX, TX, and VA macro nodes, the RX and TX
SoundWire controller nodes along with the LPASS audio clock controller,
and the LPI pin configuration states for SoundWire and DMICs on SM8350.

> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/q=
com/sm8350.dtsi
> index 55b32050ce9c8..85476a04ea3fd 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
[ ... ]
> @@ -2022,6 +2023,133 @@ compute-cb@5 {
[ ... ]
> +		swr2: soundwire@3230000 {
> +			compatible =3D "qcom,soundwire-v1.6.0";
> +			reg =3D <0 0x03230000 0 0x2000>;
> +			interrupts-extended =3D <&intc GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 130 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "core", "wakeup";

[Severity: Medium]
Should the wakeup interrupt on swr2 use PDC pin 70 instead of 130 on
SM8350?

When swr2 enters runtime suspend via swrm_runtime_suspend() in
drivers/soundwire/qcom.c, it stops the bus clock and enables
ctrl->wake_irq so that a peripheral pulling TX data lane 0
(WCD_SWR_TX_DATA0, LPI gpio1 / TLMM gpio169 on SM8350) high can wake the
controller.

In drivers/pinctrl/qcom/pinctrl-sm8350.c, sm8350_pdc_map routes TLMM
gpio169 to PDC pin 70 (which pdc maps to GIC_SPI 520 via
qcom,pdc-ranges), whereas PDC pin 130 is the SC7280 mapping and is not
mapped to any GPIO on SM8350:

drivers/pinctrl/qcom/pinctrl-sm8350.c:sm8350_pdc_map[] =3D {
	...
	{ 169, 70 }, { 172, 132 }, { 174, 87 }, { 175, 88 }, { 177, 89 },
	...
};

With <&pdc 130 IRQ_TYPE_LEVEL_HIGH>, peripheral wakeup events on the TX
SoundWire bus will not fire during runtime suspend.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-b4-sm8350-=
sound-v1-0-4c872df294fa@fromdisposition.org?part=3D6
