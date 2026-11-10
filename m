Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278947;
	b=egq4sM5BZmex2T1xAjofjt81G/qJZSpO4n8lZSD4WXnELEsxoAKXsGXLjqhf3pU91h7K
	 wop2OxM4USc/YGhjB8BN8WlfPklzYf8uDJMCLtk1NEOlUA+EZBybszyUexkzb+0IM+nBd
	 8MO2BDYhdYtJa66vW5brWHG9d7AxtuHdnth/5fbwXWJM+AhcLD59V3qZ1x9pMWeocucMv
	 qPtLF1AssXQSro/1NuyY5mXRYYz/Lt4Z6WXXivizQApRnqua17wPfmcifMBNqklouspgM
	 450/lazuu+v4rw5QrVtnmk36fVCVEam6svxDMGqOfyHM/XNZHjedrSwZDCSItc/GSow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278947;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BWKvH/OjHWbKXA6A9HL2uzCDLGobFi9XpMtJ+4XFWG8=;
	b=F6hTieAIRepHXZKYAVLxkrlmEANTHKeyHXUVOuf94H+mSUrKiVEXPZ9VainqDyjk2qFZ
	 39orO8FEmsdpGsw87eHLHCM3sLn+aebaT1yNQp7AY7IAIrX9mNi8rNqL1J8UDPHWH0w8x
	 +3/xrb5s3Q0JuKuUCoygE659RpbtC2ksYUgl4w5nUgc2qYLZsXMKffxDYHHN1EzM0jiV9
	 zhK5f3FlFA3uT5sHFLOITw8dL/CoJlOMwaAoMLrhYJj5yUafyLkLAuUshpFZlplQOQq4k
	 hS7rU/ZdAT9MRUgoWUNyVKMWpS95KBUNj5ffuGxQWfP18l1LWZOJRgnwtGh8kkarljg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ExmSTTIC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC73606A325;
	Tue, 10 Nov 2026 02:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ExmSTTIC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61CF11F0089F;
	Tue, 10 Nov 2026 02:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794278946;
	bh=BWKvH/OjHWbKXA6A9HL2uzCDLGobFi9XpMtJ+4XFWG8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ExmSTTICFqGUvQ/013AEAixSsbQRgn9rwwIkbZ4cDbwMvm0ajSeDtxYW28ZGIAU9P
	 3B1V28iEmJbZSukUTXmx8ZZUGxtDeOyrv/BGxBTVZBZ9zZH8tJ8jC3rF7fTv2cpMHf
	 vjRX3GOxf1SXNKRu9Z4qvghZ7zxXQhQAx6AQhbwqq3qPRJgffT8ia2d2NWGR/aPBek
	 umG4/6LBhsuQFLjEfGRFndLvzevgdXSIxadq1X3nPPj0hq3vDrwxnBH2EJcpDQGAcD
	 6wgHvhvtfaBa5vEg88IGh57YAxbLmHtPphPw5nKMPiwTGUg5PIMYevACq7J0E8Rl1V
	 10IbQgifEI6Fw==
Message-ID: <sashiko-outbox-206068@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 5/5] arm64: dts: amlogic: Add Amlogic S4 Audio
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiebing Chen" <jiebing.chen@amlogic.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261110-audio_drvier-v8-5-1489241e4c83@amlogic.com>
References: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
 <20261110-audio_drvier-v8-5-1489241e4c83@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 02:49:05 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] arm64: dts: amlogic: wrong spdifin interrupt number in
  meson-s4.dtsi
- [Medium] arm64: dts: amlogic: missing pinctrl configuration for
  spdifin on AQ222
--

commit ba863296d8a1f9c2893c9c4c64db87474f58e6e7
Author: Jiebing Chen <jiebing.chen@amlogic.com>

arm64: dts: amlogic: Add Amlogic S4 Audio

This commit adds audio controller device tree nodes for the Amlogic S4 SoC
and enables the sound card and audio peripherals on the AQ222 board.

> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch=
/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> index 0a3f81ea0fb0a..334b57bde4def 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts

[ ... ]

> @@ -129,6 +140,207 @@ vddcpu: regulator-vddcpu {
>  				<699000 98>,
>  				<689000 100>;
>  	};

[ ... ]

> +		/* spdif coax input */
> +		dai-link-11 {
> +			sound-dai =3D <&spdifin>;
> +
> +			codec {
> +				sound-dai =3D <&spdif_dir>;
> +			};
> +		};

[ ... ]

> @@ -235,3 +447,102 @@ &ethmac {
>  	phy-handle =3D <&internal_ephy>;
>  	phy-mode =3D "rmii";
>  };

[ ... ]

> +&spdifin {
> +	status =3D "okay";
> +};
> +
> +&spdifout_a {
> +	pinctrl-0 =3D <&spdif_out_h_pins>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +};

[Severity: Medium]
Is &spdifin missing pinctrl-0 and pinctrl-names properties to mux the
spdif_in pin (and a corresponding spdif_in pinmux node in meson-s4.dtsi)?

dai-link-11 wires &spdifin to the external coaxial receiver &spdif_dir,
and pinctrl-meson-s4.c defines the spdif_in function on the pad next to
spdif_out_h, but unlike &spdifout_a, &spdifin has no pinctrl configuration
and will not receive an external input signal unless the pin was already
muxed by firmware.

> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/=
dts/amlogic/meson-s4.dtsi
> index dfc0a30a6e61b..98ac01c5d6adb 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi

[ ... ]

> @@ -863,4 +878,385 @@ emmc: mmc@fe08c000 {

[ ... ]

> +	toddr_a: audio-controller@330100 {
> +		compatible =3D "amlogic,sm1-toddr",
> +				 "amlogic,axg-toddr";
> +		reg =3D <0x0 0x330100 0x0 0x2c>;
> +		#sound-dai-cells =3D <0>;
> +		sound-name-prefix =3D "TODDR_A";
> +		interrupts =3D <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
> +		clocks =3D <&clkc_audio AUD_CLKID_TODDR_A>;
> +		resets =3D <&arb AXG_ARB_TODDR_A>,
> +			 <&clkc_audio AUD_RESET_TODDR_A>;
> +		reset-names =3D "arb", "rst";
> +		amlogic,fifo-depth =3D <8192>;
> +		status =3D "disabled";
> +	};
> +
> +	toddr_b: audio-controller@330140 {
> +		compatible =3D "amlogic,sm1-toddr",
> +				 "amlogic,axg-toddr";
> +		reg =3D <0x0 0x330140 0x0 0x2c>;
> +		#sound-dai-cells =3D <0>;
> +		sound-name-prefix =3D "TODDR_B";
> +		interrupts =3D <GIC_SPI 33 IRQ_TYPE_EDGE_RISING>;
> +		clocks =3D <&clkc_audio AUD_CLKID_TODDR_B>;
> +		resets =3D <&arb AXG_ARB_TODDR_B>,
> +			 <&clkc_audio AUD_RESET_TODDR_B>;
> +		reset-names =3D "arb", "rst";
> +		amlogic,fifo-depth =3D <256>;
> +		status =3D "disabled";
> +	};
> +
> +	toddr_c: audio-controller@330180 {
> +		compatible =3D "amlogic,sm1-toddr",
> +				 "amlogic,axg-toddr";
> +		reg =3D <0x0 0x330180 0x0 0x2c>;
> +		#sound-dai-cells =3D <0>;
> +		sound-name-prefix =3D "TODDR_C";
> +		interrupts =3D <GIC_SPI 34 IRQ_TYPE_EDGE_RISING>;
> +		clocks =3D <&clkc_audio AUD_CLKID_TODDR_C>;
> +		resets =3D <&arb AXG_ARB_TODDR_C>,
> +			 <&clkc_audio AUD_RESET_TODDR_C>;
> +		reset-names =3D "arb", "rst";
> +		amlogic,fifo-depth =3D <256>;
> +		status =3D "disabled";
> +	};
> +
> +	frddr_a: audio-controller@3301c0 {
> +		compatible =3D "amlogic,sm1-frddr",
> +				 "amlogic,axg-frddr";
> +		reg =3D <0x0 0x3301c0 0x0 0x2c>;
> +		#sound-dai-cells =3D <0>;
> +		sound-name-prefix =3D "FRDDR_A";
> +		interrupts =3D <GIC_SPI 36 IRQ_TYPE_EDGE_RISING>;

[ ... ]

> +	spdifin: audio-controller@330400 {
> +		compatible =3D "amlogic,g12a-spdifin",
> +				 "amlogic,axg-spdifin";
> +		reg =3D <0x0 0x330400 0x0 0x30>;
> +		#sound-dai-cells =3D <0>;
> +		sound-name-prefix =3D "SPDIFIN";
> +		interrupts =3D <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;
> +		clocks =3D <&clkc_audio AUD_CLKID_SPDIFIN>,
> +		<&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
> +		clock-names =3D "pclk", "refclk";
> +		resets =3D <&clkc_audio AUD_RESET_SPDIFIN>;
> +		status =3D "disabled";
> +	};

[Severity: Medium]
Should the spdifin interrupt be 35 instead of 151?

On Amlogic SoCs (such as meson-g12.dtsi and meson-sm1.dtsi, which use
148..154), the interrupts for toddr_a..toddr_c, spdifin, and
frddr_a..frddr_c form a contiguous block.  Here toddr_a..toddr_c are at
32..34 and frddr_a..frddr_c are at 36..38, while spdifin still has 151
from G12A/SM1, so any consumer of the spdifin interrupt will bind to the
wrong line.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-audio_drvi=
er-v8-0-1489241e4c83@amlogic.com?part=3D5
