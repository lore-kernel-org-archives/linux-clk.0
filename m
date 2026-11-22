Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361124;
	b=K7jDmV2/PPs8YXZ/sgIG4sjP9lMEjFaAq7MN1jQYw9uKEnW5iWAjCZyYhsHHH9OCezhX
	 fBw701ah60VB4l+8tCvP365XthsYf0w3+TH43PQVKswx1nkY4sdfO8s2Obip74wEU6nH7
	 46gQkz+vNvl/mowHWA5QTu1TXWFNel38ciCZus+p4v8piju1ya1BHbBTAUKNnuzlRrzcp
	 ZkP1xs/vfyrDYGsMtgMP6PI/bNw9cA2QdSOWglkwidM4Y4mCxkwReGqfbEe3qLDJoX4u+
	 IXq4uSJpsKzMZV6MeoaJtg/amWJXCjt3Iev3hMBLnkDVJpOEtRj3kjNdwx/AzzsuXTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=GNHxpl/UQde3/iMNVri3Fkhz/8Z7fKwj6N11BqGjFJg=;
	b=Fo3jYBg9Pc8RE7j4zI1toG13w4cMVNDyY8DzGvg2A8PQ0BLylZXKH5uKQwNrep0La76E
	 YmU32LN+uOUocouWNe0Y51iuoC8KTzKfd8aFUCZI2+yF5QPQT6VI4/KDlDTQpdAx/j5x1
	 0zP0uEcjvX8t7r5CXRLhpq7h0yewWaivwijlp3laueRl3kRLUJwwBPgggudKKty6s7oeY
	 oDVTER3pGCGAk1iXldRQ/bqzNx3zTWTe5Tl5a0pKKZdPot6BlqqtMbdMVkz1ALFa8v1d1
	 WemQ0lD7NQBqoL9BtfV0FHYEzO2QI+qtCaY125X9Ek6fjVCNhdvnhAFhcmCZ254xi5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=hefhoLX0;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112D1606A32C
	for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 15:25:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 112D1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=hefhoLX0
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so18014835e9.2
        for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 07:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795361121; x=1795965921; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GNHxpl/UQde3/iMNVri3Fkhz/8Z7fKwj6N11BqGjFJg=;
        b=hefhoLX0g0Vs13uUzBDieJb6xDttsUz2cyUIj/E8sBZasAJposoxP1u7cgaEG5pmDr
         +RISHjuUpyPmnYNyah/30wVzGxlPIXhEcfh9io2MjKeXRGcVaNnWGmQhQYistA/gGGw5
         4yA/gDBDMC2fmZ2Bp4s7ZJR4ngQr8j7R4bNNCU7dj9HPj/T7cy/NdANJLHwfgw/LvfGp
         HGYqx2ga84EJQiHz7yoeatAxc0EbCkNq9J9A8PGLw/PDTOjIUHoSlIMTV50num92tfKm
         Z8XtCpYa7ulllvaiSCG+J0tOCBrZpN77xd5PU2TQ9/B7uJmKHeldAHDYjZ4tYfUKCZoB
         50YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361121; x=1795965921;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNHxpl/UQde3/iMNVri3Fkhz/8Z7fKwj6N11BqGjFJg=;
        b=oFU5m7yti6oh54+uNBl6NtxstAEIMKOgT16m42B8bOcL3Snlq9XRZNS7aJc0D6+vgu
         pkMbqFAQlkism4re2tZKmm3V183+4JZ4lB04i4WSTIY/V+aLJ4Fru99zOM8UZhg6CAUE
         R1BMIF7muL3bBR6eQOuvDeRgqXtMCUPbxQeJMVGTLuYmyfbGYEv8OepKEbX7HtyxfZk3
         1+89KGCuzdSvT+kWce/F+97UkQ55jhvgnl6swgbNrO8pTkY7eu2Loe8oyrhthu0dTEa3
         fQoxVaFI16vyHp40gyyiC5A8LJfBIXcPfKMlyXmMhR/DIFc1vHlrUJki3jHa3RcZRI9e
         YHWg==
X-Forwarded-Encrypted: i=1; AL+hErEqiAmbGWrlsGZxVc3XbFhHZa+ychDeBOCUHvyKA7Tu8m8VcfcXCE+vQDhY3Z41h3hLO6OxYeGU7uA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZRtR9n3b95q+IrKNMXUa1FW47XQqK+CTjLsMtAOSbHtPMFA4B
	K7Qg47HY4f73gO5ALW4OAmfY7uzIENW9xCwzXDKt9Kriz+KDrAdrEEkFLjPfO97zAoo=
X-Gm-Gg: AZFdTZeQSZY+z7/Q6T5nYbAZXsR0wGqbF/2pRlAyJ6MrUarOEdzBRd+79sKURVzj1ys
	zpQ5TqahQhvCHKz8YxnevMrTrjl3RY3aL4bheDEsHR7rFurBlFMv8IomFAeAyM+yoWYl5bZEDIO
	kV2hWL4VjM0NeS4X2vaXd0Yjz2/KgKUyaGSUr9+f9kP9fmvWZRFSbMcTLuqL2fCl4yIebK3pJJU
	CDS4SGENoCnGe0O9Q26OgCykpb80S3fA6CmuFUJEs4CFiti9g9gY8yYxyP95n6C0y6w3ovdPaDO
	F5iImNJAo8HGIoklGIwKgSHPdQwY6JUXhV/3K9TbAz59Z/xE9udqXVMZpjMS6Ua2MPMfHy/1qyz
	lOTmXaGUCci0GWLyP9VnCRCK/Oe9684BY/fUhY1ImfGMvoqQlqdLtXgnaNggYbtLAShm20ooWW0
	vtZa6rhrfbP5+RlFjp28+XhNA+ap0aCPpvZjSSwnhYrmBkRAAXJcmsVcgsnAH2/5MMhIQ3XXsXC
	4aq92Zrqo8tQcwwGnwbSnEQyb32JoDTdGB2vCc2oek+aN/ofxc92FzUZKvmp22/J7TPq1Yo7AiG
	Cq27byFco3zRMXmaCIcPpMA7Zap93aRHVswvweUlnyMj80oV
X-Received: by 2002:a05:600c:46d3:b0:4bb:5c92:ce12 with SMTP id 5b1f17b1804b1-4bb88812200mr202639425e9.17.1795361121451;
        Sun, 22 Nov 2026 07:25:21 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm313799095e9.10.2026.11.22.07.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:25:20 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 5/5] arm64: dts: amlogic: Add Amlogic S4 Audio
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, jian.xu@amlogic.com, shuai.li@amlogic.com, 
 zhe.wang@amlogic.com
In-Reply-To: <20261110-audio_drvier-v8-5-1489241e4c83@amlogic.com>
References: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
 <20261110-audio_drvier-v8-5-1489241e4c83@amlogic.com>
Date: Sun, 22 Nov 2026 16:25:15 +0100
Message-Id: <179536111581.2728475.9919460533427781841.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7779; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=pV/1UXNxA/LpQP+cFIdmAq4U0LBxmofpDDOb6Try3Jk=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNnMnPFPjy9z2xljcWfG5SXGe9i5r+8W9JhgmxZ8YcO8N
 NYJCt/DOkpZGMS4GGTFFFlquKvF30lqfZk1Xec2zBxWJpAhDFycAjCRk9MYGU6HMU6PO7XnVt/l
 NTJXfj985xqYztH0uLfJ5WXb7nUK1coMf7gOcW6rrOlnORf6dFrkmQ7RA0F3Lr1WXTlHsy1eToz
 flB8A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Add basic audio driver support for the Amlogic S4 based
> Amlogic AQ222 board.
> 
> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
> ---
>  .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 311 ++++++++++++++++
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 396 +++++++++++++++++++++
>  2 files changed, 707 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> index 0a3f81ea0fb0..334b57bde4de 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> @@ -75,6 +75,17 @@ vddio_ao1v8: regulator-vddio-ao1v8 {
>  	       regulator-always-on;
>  	};
>  
> +	vcc5v_reg: regulator-vcc-5v {
> +		compatible = "regulator-fixed";
> +		vin-supply = <&main_12v>;
> +		regulator-name = "VCC5V";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio GPIOH_7 GPIO_ACTIVE_HIGH>;
> +		startup-delay-us = <7000>;
> +		enable-active-high;
> +	};
> +
>  	/* SY8120B1ABC DC/DC Regulator. */
>  	vddcpu: regulator-vddcpu {
>  		compatible = "pwm-regulator";
> @@ -129,6 +140,207 @@ vddcpu: regulator-vddcpu {
>  				<699000 98>,
>  				<689000 100>;
>  	};
> +
> +	dioo2133: audio-amplifier-0 {
> +		compatible = "simple-audio-amplifier";
> +		enable-gpios = <&gpio GPIOH_8 GPIO_ACTIVE_HIGH>;
> +		VCC-supply = <&vcc5v_reg>;
> +		sound-name-prefix = "Analog_PA";
> +	};
> +
> +	spdif_dir: audio-spdif-in {
> +		compatible = "linux,spdif-dir";
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "DIR";
> +	};
> +
> +	spdif_dit: audio-spdif-out {
> +		compatible = "linux,spdif-dit";
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "DIT";
> +	};
> +
> +	sound {
> +		compatible = "amlogic,axg-sound-card";
> +		model = "aq222";
> +		audio-widgets = "Line", "Lineout";
> +		audio-aux-devs = <&tdmout_a>, <&tdmout_b>, <&tdmout_c>,
> +				 <&tdmin_a>, <&tdmin_b>, <&tdmin_c>,
> +				 <&tdmin_lb>, <&dioo2133>;
> +		audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
> +				"TDMOUT_A IN 1", "FRDDR_B OUT 0",
> +				"TDMOUT_A IN 2", "FRDDR_C OUT 0",
> +				"TDM_A Playback", "TDMOUT_A OUT",
> +				"TDMOUT_B IN 0", "FRDDR_A OUT 1",
> +				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
> +				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
> +				"TDM_B Playback", "TDMOUT_B OUT",
> +				"TDMOUT_C IN 0", "FRDDR_A OUT 2",
> +				"TDMOUT_C IN 1", "FRDDR_B OUT 2",
> +				"TDMOUT_C IN 2", "FRDDR_C OUT 2",
> +				"TDM_C Playback", "TDMOUT_C OUT",
> +				"SPDIFOUT_A IN 0", "FRDDR_A OUT 3",
> +				"SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
> +				"SPDIFOUT_A IN 2", "FRDDR_C OUT 3",
> +				"SPDIFOUT_B IN 0", "FRDDR_A OUT 4",
> +				"SPDIFOUT_B IN 1", "FRDDR_B OUT 4",
> +				"SPDIFOUT_B IN 2", "FRDDR_C OUT 4",
> +				"TDMIN_A IN 0", "TDM_A Capture",
> +				"TDMIN_A IN 1", "TDM_B Capture",
> +				"TDMIN_A IN 2", "TDM_C Capture",
> +				"TDMIN_A IN 3", "TDM_A Loopback",
> +				"TDMIN_A IN 4", "TDM_B Loopback",
> +				"TDMIN_A IN 5", "TDM_C Loopback",
> +				"TDMIN_B IN 0", "TDM_A Capture",
> +				"TDMIN_B IN 1", "TDM_B Capture",
> +				"TDMIN_B IN 2", "TDM_C Capture",
> +				"TDMIN_B IN 3", "TDM_A Loopback",
> +				"TDMIN_B IN 4", "TDM_B Loopback",
> +				"TDMIN_B IN 5", "TDM_C Loopback",
> +				"TDMIN_C IN 0", "TDM_A Capture",
> +				"TDMIN_C IN 1", "TDM_B Capture",
> +				"TDMIN_C IN 2", "TDM_C Capture",
> +				"TDMIN_C IN 3", "TDM_A Loopback",
> +				"TDMIN_C IN 4", "TDM_B Loopback",
> +				"TDMIN_C IN 5", "TDM_C Loopback",
> +				"TDMIN_LB IN 3", "TDM_A Capture",
> +				"TDMIN_LB IN 4", "TDM_B Capture",
> +				"TDMIN_LB IN 5", "TDM_C Capture",
> +				"TDMIN_LB IN 0", "TDM_A Loopback",
> +				"TDMIN_LB IN 1", "TDM_B Loopback",
> +				"TDMIN_LB IN 2", "TDM_C Loopback",
> +				"TODDR_A IN 0", "TDMIN_A OUT",
> +				"TODDR_B IN 0", "TDMIN_A OUT",
> +				"TODDR_C IN 0", "TDMIN_A OUT",
> +				"TODDR_A IN 1", "TDMIN_B OUT",
> +				"TODDR_B IN 1", "TDMIN_B OUT",
> +				"TODDR_C IN 1", "TDMIN_B OUT",
> +				"TODDR_A IN 2", "TDMIN_C OUT",
> +				"TODDR_B IN 2", "TDMIN_C OUT",
> +				"TODDR_C IN 2", "TDMIN_C OUT",
> +				"TODDR_A IN 3", "SPDIFIN Capture",
> +				"TODDR_B IN 3", "SPDIFIN Capture",
> +				"TODDR_C IN 3", "SPDIFIN Capture",
> +				"TODDR_A IN 6", "TDMIN_LB OUT",
> +				"TODDR_B IN 6", "TDMIN_LB OUT",
> +				"TODDR_C IN 6", "TDMIN_LB OUT",
> +				"Analog_PA INL", "ACODEC LOLP",
> +				"Analog_PA INR", "ACODEC LORP",
> +				"Lineout", "Analog_PA OUTL",
> +				"Lineout", "Analog_PA OUTR";
> +		clocks = <&clkc_pll CLKID_HIFI_PLL>,
> +			 <&clkc_pll CLKID_MPLL0>,
> +			 <&clkc_pll CLKID_MPLL1>;
> +		assigned-clocks = <&clkc_pll CLKID_HIFI_PLL>,
> +				  <&clkc_pll CLKID_MPLL0>,
> +				  <&clkc_pll CLKID_MPLL1>;
> +		assigned-clock-rates = <1179648000>,
> +				       <270950400>,
> +				       <393216000>;
> +
> +		dai-link-0 {
> +			sound-dai = <&frddr_a>;
> +		};
> +
> +		dai-link-1 {
> +			sound-dai = <&frddr_b>;
> +		};
> +
> +		dai-link-2 {
> +			sound-dai = <&frddr_c>;
> +		};
> +
> +		dai-link-3 {
> +			sound-dai = <&toddr_a>;
> +		};
> +
> +		dai-link-4 {
> +			sound-dai = <&toddr_b>;
> +		};
> +
> +		dai-link-5 {
> +			sound-dai = <&toddr_c>;
> +		};
> +
> +		dai-link-6 {
> +			sound-dai = <&tdmif_a>;
> +			dai-format = "i2s";
> +			dai-tdm-slot-tx-mask-0 = <1 1>;
> +			mclk-fs = <256>;
> +			codec-0 {
> +				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_A>;
> +			};
> +			codec-1 {
> +				sound-dai = <&toacodec TOACODEC_IN_A>;
> +			};
> +		};
> +
> +		dai-link-7 {
> +			sound-dai = <&tdmif_b>;
> +			dai-format = "i2s";
> +			dai-tdm-slot-tx-mask-0 = <1 1>;
> +			mclk-fs = <256>;
> +			codec-0 {
> +				sound-dai = <&toacodec TOACODEC_IN_B>;
> +			};
> +			codec-1 {
> +				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
> +			};
> +		};
> +
> +		/* 8ch HDMI interface */
> +		dai-link-8 {
> +			sound-dai = <&tdmif_c>;
> +			dai-format = "i2s";
> +			dai-tdm-slot-tx-mask-0 = <1 1>;
> +			dai-tdm-slot-tx-mask-1 = <1 1>;
> +			dai-tdm-slot-tx-mask-2 = <1 1>;
> +			dai-tdm-slot-tx-mask-3 = <1 1>;
> +			mclk-fs = <256>;
> +			codec-0 {
> +				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_C>;
> +			};
> +		};
> +
> +		/* spdif hdmi and coax output */
> +		dai-link-9 {
> +			sound-dai = <&spdifout_a>;
> +
> +			codec-0 {
> +				sound-dai = <&spdif_dit>;
> +			};
> +
> +			codec-1 {
> +				sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_A>;
> +			};
> +		};
> +
> +		/* spdif hdmi interface */
> +		dai-link-10 {
> +			sound-dai = <&spdifout_b>;
> +
> +			codec {
> +				sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_B>;
> +			};
> +		};
> +
> +		/* spdif coax input */
> +		dai-link-11 {
> +			sound-dai = <&spdifin>;
> +
> +			codec {
> +				sound-dai = <&spdif_dir>;
> +			};

Was this tested ? ...

> +		};
> +
> +		dai-link-12 {
> +			sound-dai = <&toacodec TOACODEC_OUT>;
> +
> +			codec {
> +				sound-dai = <&acodec>;
> +			};
> +		};
> +	};
>  };
>  
>  &pwm_ef {
> @@ -235,3 +447,102 @@ &ethmac {
>  	phy-handle = <&internal_ephy>;
>  	phy-mode = "rmii";
>  };
> +
> +&acodec {
> +	AVDD-supply = <&vddio_ao1v8>;
> +	status = "okay";
> +};
> +
> +&arb {
> +	status = "okay";
> +};
> +
> +&clkc_audio {
> +	status = "okay";
> +};
> +
> +&frddr_a {
> +	status = "okay";
> +};
> +
> +&frddr_b {
> +	status = "okay";
> +};
> +
> +&frddr_c {
> +	status = "okay";
> +};
> +
> +&spdifin {
> +	status = "okay";

... as sashiko pointed out, you are indeed missing a pinctrl for it.

With sashiko remarks handled

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

