Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314E8336EF8
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 14:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769439454; cv=none; b=BsmmPL9pS6wBJLYPkBNDL7Q+wNXeZGarZGNSenL2JaZHtILkaRCLuW4xp/v+Xjzh5QJWYblrpQNkx0ziNI72SWYOH6/siiyeqX2+kJGNjMW7Q51TNiIRZ0MYcz8axF0Iv5Be/DUYHZssTlnqs8XgD/Jt5YRw4fdQkfDt5AkeTvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769439454; c=relaxed/simple;
	bh=Kps8e+xIyMcbzmKash27gyObD27rQWNWixpmAroTMl0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K3xd7kUDOh+jewY37VEgsr5iXWbKe0m956u+Chl2aPJelYYn084YBUVqGf8JoD9+hNS+qaqjqnRjb9FWYQMnUMeZIo2QRN6Bq2dkgPgJcwn7izr9E0q7JYrSBXfY4rL108t9r/+rMQ65UIq3rSjQbVaoO60QaKEEq25tnxuqMuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Vu8DuvY5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Vu8DuvY5"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4801ea9bafdso18518245e9.3
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 06:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769439449; x=1770044249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccY2MYTQuuLx3ceRItzTDJvkJVU3f6vCx5RFr2SHaRk=;
        b=Vu8DuvY5UZQTvxorh9WA7/d2Vesn95gFb5IQ9pjSldZOi0qKqsILC6rhTR2hy+rSgm
         TdJLS4fIWvWNW4LAgIexAacoYc1mqEnUKMxdKDaiN4LYKlTjHBbYhothJcGfWPW61oD9
         8lXrySF0y1gW4ab2Nhz/HhbmZ/LTpT0yDAHwJKziNz8bXj2sxqd05Kn8m9/VDrRdgcen
         2v+XcmFv33IOqWz2lplASYZieYPQevaNbvpWYnDLK5wqJdvGW9fT69o8krq3FTVJDTrg
         6B0ejbw2gZd4vZtOUX2aIgS9K9308aC9O/bnbDW6bchX4CI3/qhTHceP3+hDb87NoF/u
         xXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769439449; x=1770044249;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ccY2MYTQuuLx3ceRItzTDJvkJVU3f6vCx5RFr2SHaRk=;
        b=Y8ULqt9GO954KQJciBFjaqqIsb8Vn5FKX+zvKkfPp8FbUgJgtrXZywYc+ftvNRrbuT
         SEXKqx1pQfuK0zhR+izifBtclYBIHgP0OzGA74yHFufRdKClgN8WEnfTgE/0BnJcX2ww
         HX/qNYkOI7tYZsNO68YL0A8YgktPvPhFmBKQs5stKvFGPPbSF1P+/oA1Df88yUUJD87e
         eDCrutjrYw18aRiuSIPX3qi1+uNPQasaJ8TXFYBudbNkWWVrJkFZcHJXFt1J0A5NDuzO
         tDsSLxSxN16pqwanwPq+GRe66whLB2WR/Xr+6C+d2HR8EvW9TF1CBdSBBAQkrv3aNkDS
         7F9A==
X-Forwarded-Encrypted: i=1; AJvYcCWlPDaug2WJtExast1mFrtTP+Lo5J0VXOm/OFvCzD9Pm+gmUNdHcgRGQDCt2coj5/T8eZDp1FjVg0A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1MwT2JoHD+FXyJvXG8xcT/rsNLlal1LEALztQ5Kqk2IP2L5ht
	Z1DyzY0/8Ahp00lBKPAE86hJQkQlPrJJ1U20YA6Ctg64tke1W84tgDvuZQ3g+eeBl8Q=
X-Gm-Gg: AZuq6aKzidLPpcRnjpaoon/BpHIqgb/fKsvVsUWhzOGztEgWn3N8z94SNW1/tAAxNft
	HuGDwWtzC0bT0+DuEpwCX1lzFF574/R19R5piG5B3xrukpHrzwhUvvurlWdjzEHxUkA6uGjFE23
	2spN5p5gerqhHioGC4vWZTOJpWpTlDSA6yE810qCmo7G5Ms4PpuF2zUxr2TgaKXSkGeLOLTH4m9
	TWQXFVJJCLTV7P9fJ7gbnC+WhgTdK5WUc7BV1LZi+W0DxFrJmlicyEepK6uiHEk7P2jdJVJc0Zx
	QtaJu/2xUm4uJzAWBcmDVPLRleVSnJNper+etkgoDQ0RI2ReGlZ4ycxhg3UgtmOD0AzQ38jnY/w
	K8YS822G5cEv6DBPQKvBh4oONmIZ5iz97SX27XdHAShJbwbQODwbBhUolFVlm+sGZp5o8fTjC33
	2+OA1VT3zi1Q==
X-Received: by 2002:a05:600c:b8a:b0:480:3ad0:93bf with SMTP id 5b1f17b1804b1-4805cf5ec21mr79571265e9.24.1769439448586;
        Mon, 26 Jan 2026 06:57:28 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:3c20:9c51:97f5:c0a4])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4804d84ebb9sm249666455e9.4.2026.01.26.06.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 06:57:28 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>,
  Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  linux-sound@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  jian.xu@amlogic.com,  shuai.li@amlogic.com,  zhe.wang@amlogic.com
Subject: Re: [PATCH v6 5/5] arm64: dts: amlogic: Add Amlogic S4 Audio
In-Reply-To: <d403bf7d-6e73-460c-b2db-8019d9d44a67@amlogic.com> (Jiebing
	Chen's message of "Mon, 26 Jan 2026 21:20:52 +0800")
References: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
	<20260126-audio_drvier-v6-5-99e350855bc2@amlogic.com>
	<1jcy2whb9k.fsf@starbuckisacylon.baylibre.com>
	<d403bf7d-6e73-460c-b2db-8019d9d44a67@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 26 Jan 2026 15:57:26 +0100
Message-ID: <1j7bt4h161.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On lun. 26 janv. 2026 at 21:20, Jiebing Chen <jiebing.chen@amlogic.com> wro=
te:

> =E5=9C=A8 2026/1/26 19:19, Jerome Brunet =E5=86=99=E9=81=93:
>> [ EXTERNAL EMAIL ]
>>
>> On lun. 26 janv. 2026 at 06:01, Jiebing Chen via B4 Relay <devnull+jiebi=
ng.chen.amlogic.com@kernel.org> wrote:
>>
>>> From: Jiebing Chen <jiebing.chen@amlogic.com>
>>>
>>> Add basic audio driver support for the Amlogic S4 based
>>> Amlogic AQ222 board.
>>>
>>> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
>>> ---
>>>   .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 222 +++++++++++++
>>>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 361 ++++++++++++=
+++++++++
>>>   2 files changed, 583 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/ar=
ch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>>> index 0a3f81ea0fb0..43493bc9da46 100644
>>> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>>> @@ -75,6 +75,19 @@ vddio_ao1v8: regulator-vddio-ao1v8 {
>>>               regulator-always-on;
>>>        };
>>>
>>> +     vcc5v_reg: regulator-vcc-5v {
>>> +             compatible =3D "regulator-fixed";
>>> +             vin-supply =3D <&main_12v>;
>>> +             regulator-name =3D "VCC5V";
>>> +             regulator-min-microvolt =3D <5000000>;
>>> +             regulator-max-microvolt =3D <5000000>;
>>> +             gpio =3D <&gpio GPIOH_7 GPIO_ACTIVE_HIGH>;
>>> +             startup-delay-us =3D <7000>;
>>> +             enable-active-high;
>>> +             regulator-boot-on;
>>> +             regulator-always-on;
>>> +     };
>>> +
>>>        /* SY8120B1ABC DC/DC Regulator. */
>>>        vddcpu: regulator-vddcpu {
>>>                compatible =3D "pwm-regulator";
>>> @@ -129,6 +142,215 @@ vddcpu: regulator-vddcpu {
>>>                                <699000 98>,
>>>                                <689000 100>;
>>>        };
>>> +
>>> +     dmics: audio-codec-1 {
>>> +             compatible =3D "dmic-codec";
>>> +             #sound-dai-cells =3D <0>;
>>> +             num-channels =3D <2>;
>>> +             wakeup-delay-ms =3D <50>;
>>> +             sound-name-prefix =3D "MIC";
>>> +     };
>>> +
>>> +     dioo2133: audio-amplifier-0 {
>>> +             compatible =3D "simple-audio-amplifier";
>>> +             enable-gpios =3D <&gpio GPIOH_8 GPIO_ACTIVE_HIGH>;
>>> +             VCC-supply =3D <&vcc5v_reg>;
>>> +             sound-name-prefix =3D "10U2";
>>> +     };
>>> +
>>> +     spdif_dir: audio-spdif-in {
>>> +             compatible =3D "linux,spdif-dir";
>>> +             #sound-dai-cells =3D <0>;
>>> +             sound-name-prefix =3D "DIR";
>>> +     };
>>> +
>>> +     spdif_dit: audio-spdif-out {
>>> +             compatible =3D "linux,spdif-dit";
>>> +             #sound-dai-cells =3D <0>;
>>> +             sound-name-prefix =3D "DIT";
>>> +     };
>>> +
>>> +     sound {
>>> +             compatible =3D "amlogic,axg-sound-card";
>>> +             model =3D "aq222";
>>> +             audio-widgets =3D "Line", "Lineout";
>>> +             audio-aux-devs =3D <&tdmout_a>, <&tdmout_b>, <&tdmout_c>,
>>> +                              <&tdmin_a>, <&tdmin_b>, <&tdmin_c>,
>>> +                              <&tdmin_lb>, <&dioo2133>;
>>> +             audio-routing =3D "TDMOUT_A IN 0", "FRDDR_A OUT 0",
>>> +                             "TDMOUT_A IN 1", "FRDDR_B OUT 0",
>>> +                             "TDMOUT_A IN 2", "FRDDR_C OUT 0",
>>> +                             "TDM_A Playback", "TDMOUT_A OUT",
>>> +                             "TDMOUT_B IN 0", "FRDDR_A OUT 1",
>>> +                             "TDMOUT_B IN 1", "FRDDR_B OUT 1",
>>> +                             "TDMOUT_B IN 2", "FRDDR_C OUT 1",
>>> +                             "TDM_B Playback", "TDMOUT_B OUT",
>>> +                             "TDMOUT_C IN 0", "FRDDR_A OUT 2",
>>> +                             "TDMOUT_C IN 1", "FRDDR_B OUT 2",
>>> +                             "TDMOUT_C IN 2", "FRDDR_C OUT 2",
>>> +                             "TDM_C Playback", "TDMOUT_C OUT",
>>> +                             "SPDIFOUT_A IN 0", "FRDDR_A OUT 3",
>>> +                             "SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
>>> +                             "SPDIFOUT_A IN 2", "FRDDR_C OUT 3",
>>> +                             "SPDIFOUT_B IN 0", "FRDDR_A OUT 4",
>>> +                             "SPDIFOUT_B IN 1", "FRDDR_B OUT 4",
>>> +                             "SPDIFOUT_B IN 2", "FRDDR_C OUT 4",
>>> +                             "TDMIN_A IN 0", "TDM_A Capture",
>>> +                             "TDMIN_A IN 1", "TDM_B Capture",
>>> +                             "TDMIN_A IN 2", "TDM_C Capture",
>>> +                             "TDMIN_A IN 3", "TDM_A Loopback",
>>> +                             "TDMIN_A IN 4", "TDM_B Loopback",
>>> +                             "TDMIN_A IN 5", "TDM_C Loopback",
>>> +                             "TDMIN_B IN 0", "TDM_A Capture",
>>> +                             "TDMIN_B IN 1", "TDM_B Capture",
>>> +                             "TDMIN_B IN 2", "TDM_C Capture",
>>> +                             "TDMIN_B IN 3", "TDM_A Loopback",
>>> +                             "TDMIN_B IN 4", "TDM_B Loopback",
>>> +                             "TDMIN_B IN 5", "TDM_C Loopback",
>>> +                             "TDMIN_C IN 0", "TDM_A Capture",
>>> +                             "TDMIN_C IN 1", "TDM_B Capture",
>>> +                             "TDMIN_C IN 2", "TDM_C Capture",
>>> +                             "TDMIN_C IN 3", "TDM_A Loopback",
>>> +                             "TDMIN_C IN 4", "TDM_B Loopback",
>>> +                             "TDMIN_C IN 5", "TDM_C Loopback",
>>> +                             "TDMIN_LB IN 3", "TDM_A Capture",
>>> +                             "TDMIN_LB IN 4", "TDM_B Capture",
>>> +                             "TDMIN_LB IN 5", "TDM_C Capture",
>>> +                             "TDMIN_LB IN 0", "TDM_A Loopback",
>>> +                             "TDMIN_LB IN 1", "TDM_B Loopback",
>>> +                             "TDMIN_LB IN 2", "TDM_C Loopback",
>>> +                             "TODDR_A IN 0", "TDMIN_A OUT",
>>> +                             "TODDR_B IN 0", "TDMIN_A OUT",
>>> +                             "TODDR_C IN 0", "TDMIN_A OUT",
>>> +                             "TODDR_A IN 1", "TDMIN_B OUT",
>>> +                             "TODDR_B IN 1", "TDMIN_B OUT",
>>> +                             "TODDR_C IN 1", "TDMIN_B OUT",
>>> +                             "TODDR_A IN 2", "TDMIN_C OUT",
>>> +                             "TODDR_B IN 2", "TDMIN_C OUT",
>>> +                             "TODDR_C IN 2", "TDMIN_C OUT",
>>> +                             "TODDR_A IN 3", "SPDIFIN Capture",
>>> +                             "TODDR_B IN 3", "SPDIFIN Capture",
>>> +                             "TODDR_C IN 3", "SPDIFIN Capture",
>>> +                             "TODDR_A IN 6", "TDMIN_LB OUT",
>>> +                             "TODDR_B IN 6", "TDMIN_LB OUT",
>>> +                             "TODDR_C IN 6", "TDMIN_LB OUT",
>>> +                             "10U2 INL", "ACODEC LOLP",
>>> +                             "10U2 INR", "ACODEC LORP",
>>> +                             "Lineout", "10U2 OUTL",
>>> +                             "Lineout", "10U2 OUTR";
>>> +             clocks =3D <&clkc_pll CLKID_HIFI_PLL>,
>>> +                             <&clkc_pll CLKID_MPLL0>,
>>> +                             <&clkc_pll CLKID_MPLL1>;
>>> +             assigned-clocks =3D <&clkc_pll CLKID_HIFI_PLL>,
>>> +                               <&clkc_pll CLKID_MPLL0>,
>>> +                               <&clkc_pll CLKID_MPLL1>;
>>> +             assigned-clock-rates =3D <1179648000>,
>>> +                                    <270950400>,
>>> +                                    <338688000>;
>> Seems like you've got the 2 last PLLs serving the 44.1kHz rate family.
>> Why is this needed ?
>
> Hi, jermoe
>
> Considering that the sample rate is up to 176.4K

That's not really the question here and there are interfaces (internal
for example) for which it can go higher than that.

>
> PLL0 270.950400M max support 24bit *176.4k, 32ch for tdm mode
>
> Perhaps PLL1 PLL1 calculation error , it should be set up 361.2672M for
> 32bit * 176.4k * 32ch.
>
> In fact, most situations are limited by the speed of the IO pin.

... again, no everything goes through those pins.

>
> Can we remove MPLL1 here and keep MPLL0?

That's up to you really. I'm merely pointing out that out of the 3 clock
sources, 2 are setup to serve derivative of 44.1kHz, which is useless.

>
>>> +
>>> +             dai-link-0 {
>>> +                     sound-dai =3D <&frddr_a>;
>>> +             };
>>> +
>>> +             dai-link-1 {
>>> +                     sound-dai =3D <&frddr_b>;
>>> +             };
>>> +
>>> +             dai-link-2 {
>>> +                     sound-dai =3D <&frddr_c>;
>>> +             };
>>> +
>>> +             dai-link-3 {
>>> +                     sound-dai =3D <&toddr_a>;
>>> +             };
>>> +
>>> +             dai-link-4 {
>>> +                     sound-dai =3D <&toddr_b>;
>>> +             };
>>> +
>>> +             dai-link-5 {
>>> +                     sound-dai =3D <&toddr_c>;
>>> +             };
>>> +
>>> +             dai-link-6 {
>>> +                     sound-dai =3D <&tdmif_a>;
>>> +                     dai-format =3D "i2s";
>>> +                     dai-tdm-slot-tx-mask-0 =3D <1 1>;
>>> +                     mclk-fs =3D <256>;
>>> +                     codec-0 {
>>> +                             sound-dai =3D <&tohdmitx TOHDMITX_I2S_IN_=
A>;
>>> +                     };
>>> +                     codec-1 {
>>> +                             sound-dai =3D <&toacodec TOACODEC_IN_A>;
>>> +                     };
>>> +             };
>>> +
>>> +             dai-link-7 {
>>> +                     sound-dai =3D <&tdmif_b>;
>>> +                     dai-format =3D "i2s";
>>> +                     dai-tdm-slot-tx-mask-0 =3D <1 1>;
>>> +                     mclk-fs =3D <256>;
>>> +                     codec-0 {
>>> +                             sound-dai =3D <&toacodec TOACODEC_IN_B>;
>>> +                     };
>>> +                     codec-1 {
>>> +                             sound-dai =3D <&tohdmitx TOHDMITX_I2S_IN_=
B>;
>>> +                     };
>>> +             };
>>> +
>>> +             /* 8ch HDMI interface */
>>> +             dai-link-8 {
>>> +                     sound-dai =3D <&tdmif_c>;
>>> +                     dai-format =3D "i2s";
>>> +                     dai-tdm-slot-tx-mask-0 =3D <1 1>;
>>> +                     dai-tdm-slot-tx-mask-1 =3D <1 1>;
>>> +                     dai-tdm-slot-tx-mask-2 =3D <1 1>;
>>> +                     dai-tdm-slot-tx-mask-3 =3D <1 1>;
>>> +                     mclk-fs =3D <256>;
>>> +                     codec-0 {
>>> +                             sound-dai =3D <&tohdmitx TOHDMITX_I2S_IN_=
C>;
>>> +                     };
>>> +             };
>>> +
>>> +             /* spdif hdmi and coax output */
>>> +             dai-link-9 {
>>> +                     sound-dai =3D <&spdifout_a>;
>>> +
>>> +                     codec-0 {
>>> +                             sound-dai =3D <&spdif_dit>;
>>> +                     };
>>> +
>>> +                     codec-1 {
>>> +                             sound-dai =3D <&tohdmitx TOHDMITX_SPDIF_I=
N_A>;
>>> +                     };
>>> +             };
>>> +
>>> +             /* spdif hdmi interface */
>>> +             dai-link-10 {
>>> +                     sound-dai =3D <&spdifout_b>;
>>> +
>>> +                     codec {
>>> +                             sound-dai =3D <&tohdmitx TOHDMITX_SPDIF_I=
N_B>;
>>> +                     };
>>> +             };
>>> +
>>> +             /* spdif coax input */
>>> +             dai-link-11 {
>>> +                     sound-dai =3D <&spdifin>;
>>> +
>>> +                     codec {
>>> +                             sound-dai =3D <&spdif_dir>;
>>> +                     };
>>> +             };
>>> +
>>> +             dai-link-12 {
>>> +                     sound-dai =3D <&toacodec TOACODEC_OUT>;
>>> +
>>> +                     codec {
>>> +                             sound-dai =3D <&acodec>;
>>> +                     };
>>> +             };
>>> +     };
>>>   };
>>>
>>>   &pwm_ef {
>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boo=
t/dts/amlogic/meson-s4.dtsi
>>> index dfc0a30a6e61..a6c2c83eea16 100644
>>> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>> @@ -11,6 +11,11 @@
>>>   #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
>>>   #include <dt-bindings/power/meson-s4-power.h>
>>>   #include <dt-bindings/reset/amlogic,meson-s4-reset.h>
>>> +#include <dt-bindings/clock/axg-audio-clkc.h>
>>> +#include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
>>> +#include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
>>> +#include <dt-bindings/sound/meson-g12a-toacodec.h>
>>> +#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>>>
>>>   / {
>>>        cpus {
>>> @@ -863,4 +868,360 @@ emmc: mmc@fe08c000 {
>>>                        assigned-clock-rates =3D <24000000>;
>>>                };
>>>        };
>>> +
>>> +     tdmif_a: audio-controller-0 {
>>> +             compatible =3D "amlogic,axg-tdm-iface";
>>> +             #sound-dai-cells =3D <0>;
>>> +             sound-name-prefix =3D "TDM_A";
>>> +             clocks =3D <&clkc_audio AUD_CLKID_MST_A_SCLK>,
>>> +                      <&clkc_audio AUD_CLKID_MST_A_LRCLK>,
>>> +                      <&clkc_audio AUD_CLKID_MST_A_MCLK>;
>>> +             clock-names =3D "sclk", "lrclk","mclk";
>>> +     };
>>> +
>>> +     tdmif_b: audio-controller-1 {
>>> +             compatible =3D "amlogic,axg-tdm-iface";
>>> +             #sound-dai-cells =3D <0>;
>>> +             sound-name-prefix =3D "TDM_B";
>>> +             clocks =3D <&clkc_audio AUD_CLKID_MST_A_SCLK>,
>>> +                      <&clkc_audio AUD_CLKID_MST_B_LRCLK>,
>>> +                      <&clkc_audio AUD_CLKID_MST_B_MCLK>;
>>> +             clock-names =3D "sclk", "lrclk","mclk";
>>> +     };
>>> +
>>> +     tdmif_c: audio-controller-2 {
>>> +             compatible =3D "amlogic,axg-tdm-iface";
>>> +             #sound-dai-cells =3D <0>;
>>> +             sound-name-prefix =3D "TDM_C";
>>> +             clocks =3D <&clkc_audio AUD_CLKID_MST_C_SCLK>,
>>> +                      <&clkc_audio AUD_CLKID_MST_C_LRCLK>,
>>> +                      <&clkc_audio AUD_CLKID_MST_C_MCLK>;
>>> +             clock-names =3D "sclk", "lrclk","mclk";
>>> +     };
>>> +};
>>> +
>>> +&apb4 {
>>> +     acodec: audio-controller@1a000 {
>>> +             compatible =3D "amlogic,t9015";
>>> +             reg =3D <0x0 0x1a000 0x0 0x14>;
>>> +             #sound-dai-cells =3D <0>;
>>> +             sound-name-prefix =3D "ACODEC";
>>> +             clocks =3D <&clkc_periphs CLKID_ACODEC>;
>>> +             clock-names =3D "pclk";
>>> +             resets =3D <&reset RESET_ACODEC>;
>>> +             AVDD-supply =3D <&vddio_ao1v8>;
>>> +     };
>>> +
>>> +     clkc_audio: clock-controller@330000 {
>>> +             compatible =3D "amlogic,s4-audio-clkc";
>>> +             reg =3D <0x0 0x330000 0x0 0xd8>,
>>> +                       <0x0 0x330e80 0x0 0x10>;
>>> +             #clock-cells =3D <1>;
>>> +             #reset-cells =3D <1>;
>>> +             power-domains =3D <&pwrc PWRC_S4_AUDIO_ID>;
>>> +             clocks =3D <&clkc_periphs CLKID_AUDIO>,
>>> +                      <&clkc_pll CLKID_MPLL0>,
>>> +                      <&clkc_pll CLKID_MPLL1>,
>>> +                      <&clkc_pll CLKID_MPLL2>,
>>> +                      <&clkc_pll CLKID_MPLL3>,
>>> +                      <&clkc_pll CLKID_HIFI_PLL>,
>>> +                      <&clkc_pll CLKID_FCLK_DIV3>,
>>> +                      <&clkc_pll CLKID_FCLK_DIV4>,
>>> +                      <&clkc_pll CLKID_FCLK_DIV5>;
>>> +             clock-names =3D "pclk",
>>> +                               "mst_in0",
>>> +                               "mst_in1",
>>> +                               "mst_in2",
>>> +                               "mst_in3",
>>> +                               "mst_in4",
>>> +                               "mst_in5",
>>> +                               "mst_in6",
>>> +                               "mst_in7";
>>> +             resets =3D <&reset RESET_AUDIO>;
>>> +     };
>>> +
>>> +     toddr_a: audio-controller@330100 {
>>> +             compatible =3D "amlogic,sm1-toddr",
>>> +                              "amlogic,axg-toddr";
>> no s4 compat ?
>>
>>> +             reg =3D <0x0 0x330100 0x0 0x2c>;
>>> +             #sound-dai-cells =3D <0>;
>>> +             sound-name-prefix =3D "TODDR_A";
>>> +             interrupts =3D <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
>>> +             clocks =3D <&clkc_audio AUD_CLKID_TODDR_A>;
>>> +             resets =3D <&arb AXG_ARB_TODDR_A>,
>>> +                      <&clkc_audio AUD_RESET_TODDR_A>;
>>> +             reset-names =3D "arb", "rst";
>>> +             amlogic,fifo-depth =3D <8192>;
>>> +     };
>>> +
>>> +     toddr_b: audio-controller@330140 {
>>> +             compatible =3D "amlogic,sm1-toddr",
>>> +                              "amlogic,axg-toddr";
>>> +             reg =3D <0x0 0x330140 0x0 0x2c>;
>>> +             #sound-dai-cells =3D <0>;
>>> +             sound-name-prefix =3D "TODDR_B";
>>> +             interrupts =3D <GIC_SPI 33 IRQ_TYPE_EDGE_RISING>;
>>> +             clocks =3D <&clkc_audio AUD_CLKID_TODDR_B>;
>>> +             resets =3D <&arb AXG_ARB_TODDR_B>,
>>> +                      <&clkc_audio AUD_RESET_TODDR_B>;
>>> +             reset-names =3D "arb", "rst";
>>> +             amlogic,fifo-depth =3D <256>;
>>> +     };
>>> +
>>> +     toddr_c: audio-controller@330180 {
>>> +             compatible =3D "amlogic,sm1-toddr",
>>> +                              "amlogic,axg-toddr";
>>> +             reg =3D <0x0 0x330180 0x0 0x2c>;
>>> +             #sound-dai-cells =3D <0>;
>>> +             sound-name-prefix =3D "TODDR_C";
>>> +             interrupts =3D <GIC_SPI 34 IRQ_TYPE_EDGE_RISING>;
>>> +             clocks =3D <&clkc_audio AUD_CLKID_TODDR_C>;
>>> +             resets =3D <&arb AXG_ARB_TODDR_C>,
>>> +                      <&clkc_audio AUD_RESET_TODDR_C>;
>>> +             reset-names =3D "arb", "rst";
>>> +             amlogic,fifo-depth =3D <256>;
>>> +     };
>>> +
>>> +     frddr_a: audio-controller@3301c0 {
>>> +             compatible =3D "amlogic,sm1-frddr",
>>> +                              "amlogic,axg-frddr";
>>> +             reg =3D <0x0 0x3301c0 0x0 0x2c>;
>>> +             #sound-dai-cells =3D <0>;
>>> +             sound-name-prefix =3D "FRDDR_A";
>>> +             interrupts =3D <GIC_SPI 36 IRQ_TYPE_EDGE_RISING>;
>>> +             clocks =3D <&clkc_audio AUD_CLKID_FRDDR_A>;
>>> +             resets =3D <&arb AXG_ARB_FRDDR_A>,
>>> +                      <&clkc_audio AUD_RESET_FRDDR_A>;
>>> +             reset-names =3D "arb", "rst";
>>> +             amlogic,fifo-depth =3D <512>;
>>> +     };
>>> +
>>> +     frddr_b: audio-controller@330200 {
>>> +             compatible =3D "amlogic,sm1-frddr",
>>> +                              "amlogic,axg-frddr";
>>> +             reg =3D <0x0 0x330200 0x0 0x2c>;
>>> +             #sound-dai-cells =3D <0>;
>>> +             sound-name-prefix =3D "FRDDR_B";
>>> +             interrupts =3D <GIC_SPI 37 IRQ_TYPE_EDGE_RISING>;
>>> +             clocks =3D <&clkc_audio AUD_CLKID_FRDDR_B>;
>>> +             resets =3D <&arb AXG_ARB_FRDDR_B>,
>>> +                      <&clkc_audio AUD_RESET_FRDDR_B>;
>>> +             reset-names =3D "arb", "rst";
>>> +             amlogic,fifo-depth =3D <256>;
>>> +     };
>>> +
>>> +     frddr_c: audio-controller@330240 {
>>> +             compatible =3D "amlogic,sm1-frddr",
>>> +                              "amlogic,axg-frddr";
>>> +             reg =3D <0x0 0x330240 0x0 0x2c>;
>>> +             #sound-dai-cells =3D <0>;
>>> +             sound-name-prefix =3D "FRDDR_C";
>>> +             interrupts =3D <GIC_SPI 38 IRQ_TYPE_EDGE_RISING>;
>>> +             clocks =3D <&clkc_audio AUD_CLKID_FRDDR_C>;
>>> +             resets =3D <&arb AXG_ARB_FRDDR_C>,
>>> +                      <&clkc_audio AUD_RESET_FRDDR_C>;
>>> +             reset-names =3D "arb", "rst";
>>> +             amlogic,fifo-depth =3D <256>;
>>> +     };
>>> +
>>> +     arb: reset-controller@330280 {
>>> +             compatible =3D "amlogic,meson-sm1-audio-arb";
>>> +             reg =3D <0x0 0x330280 0x0 0x4>;
>>> +             #reset-cells =3D <1>;
>>> +             clocks =3D <&clkc_audio AUD_CLKID_DDR_ARB>;
>>> +     };
>>> +
>>> +     tdmin_a: audio-controller@330300 {
>>> +             compatible =3D "amlogic,sm1-tdmin";
>>> +             reg =3D <0x0 0x330300 0x0 0x40>;
>>> +             sound-name-prefix =3D "TDMIN_A";
>>> +             resets =3D <&clkc_audio AUD_RESET_TDMIN_A>;
>>> +             clocks =3D <&clkc_audio AUD_CLKID_TDMIN_A>,
>>> +                      <&clkc_audio AUD_CLKID_TDMIN_A_SCLK>,
>>> +                      <&clkc_audio AUD_CLKID_TDMIN_A_SCLK_SEL>,
>>> +                      <&clkc_audio AUD_CLKID_TDMIN_A_LRCLK>,
>>> +                      <&clkc_audio AUD_CLKID_TDMIN_A_LRCLK>;
>>> +             clock-names =3D "pclk", "sclk", "sclk_sel",
>>> +                               "lrclk", "lrclk_sel";
>>> +     };
>>> +
>>> +     tdmin_b: audio-controller@330340 {
>>> +             compatible =3D "amlogic,sm1-tdmin";
>>> +             reg =3D <0x0 0x330340 0x0 0x40>;
>>> +             sound-name-prefix =3D "TDMIN_B";
>>> +             resets =3D <&clkc_audio AUD_RESET_TDMIN_B>;
>>> +             clocks =3D <&clkc_audio AUD_CLKID_TDMIN_B>,
>>> +                      <&clkc_audio AUD_CLKID_TDMIN_B_SCLK>,
>>> +                      <&clkc_audio AUD_CLKID_TDMIN_B_SCLK_SEL>,
>>> +                      <&clkc_audio AUD_CLKID_TDMIN_B_LRCLK>,
>>> +                      <&clkc_audio AUD_CLKID_TDMIN_B_LRCLK>;
>>> +             clock-names =3D "pclk", "sclk", "sclk_sel",
>>> +                               "lrclk", "lrclk_sel";
>>> +     };
>>> +
>>> +     tdmin_c: audio-controller@330380 {
>>> +             compatible =3D "amlogic,sm1-tdmin";
>>> +             reg =3D <0x0 0x330380 0x0 0x40>;
>>> +             sound-name-prefix =3D "TDMIN_C";
>>> +             resets =3D <&clkc_audio AUD_RESET_TDMIN_C>;
>>> +             clocks =3D <&clkc_audio AUD_CLKID_TDMIN_C>,
>>> +                      <&clkc_audio AUD_CLKID_TDMIN_C_SCLK>,
>>> +                      <&clkc_audio AUD_CLKID_TDMIN_C_SCLK_SEL>,
>>> +                      <&clkc_audio AUD_CLKID_TDMIN_C_LRCLK>,
>>> +                      <&clkc_audio AUD_CLKID_TDMIN_C_LRCLK>;
>>> +             clock-names =3D "pclk", "sclk", "sclk_sel",
>>> +                               "lrclk", "lrclk_sel";
>>> +     };
>>> +
>>> +     tdmin_lb: audio-controller@3303c0 {
>>> +             compatible =3D "amlogic,sm1-tdmin";
>>> +             reg =3D <0x0 0x3303c0 0x0 0x40>;
>>> +             sound-name-prefix =3D "TDMIN_LB";
>>> +             resets =3D <&clkc_audio AUD_RESET_TDMIN_LB>;
>>> +             clocks =3D <&clkc_audio AUD_CLKID_TDMIN_LB>,
>>> +                      <&clkc_audio AUD_CLKID_TDMIN_LB_SCLK>,
>>> +                      <&clkc_audio AUD_CLKID_TDMIN_LB_SCLK_SEL>,
>>> +                      <&clkc_audio AUD_CLKID_TDMIN_LB_LRCLK>,
>>> +                      <&clkc_audio AUD_CLKID_TDMIN_LB_LRCLK>;
>>> +             clock-names =3D "pclk", "sclk", "sclk_sel",
>>> +                               "lrclk", "lrclk_sel";
>>> +     };
>>> +
>>> +     spdifin: audio-controller@330400 {
>>> +             compatible =3D "amlogic,g12a-spdifin",
>>> +                              "amlogic,axg-spdifin";
>>> +             reg =3D <0x0 0x330400 0x0 0x30>;
>>> +             #sound-dai-cells =3D <0>;
>>> +             sound-name-prefix =3D "SPDIFIN";
>>> +             interrupts =3D <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;
>>> +             clocks =3D <&clkc_audio AUD_CLKID_SPDIFIN>,
>>> +             <&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
>>> +             clock-names =3D "pclk", "refclk";
>>> +             resets =3D <&clkc_audio AUD_RESET_SPDIFIN>;
>>> +     };
>>> +
>>> +     spdifout_a: audio-controller@330480 {
>>> +             compatible =3D "amlogic,g12a-spdifout",
>>> +                              "amlogic,axg-spdifout";
>>> +             reg =3D <0x0 0x330480 0x0 0x50>;
>>> +             #sound-dai-cells =3D <0>;
>>> +             sound-name-prefix =3D "SPDIFOUT_A";
>>> +             clocks =3D <&clkc_audio AUD_CLKID_SPDIFOUT>,
>>> +             <&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
>>> +             clock-names =3D "pclk", "mclk";
>>> +             resets =3D <&clkc_audio AUD_RESET_SPDIFOUT>;
>>> +     };
>>> +
>>> +     tdmout_a: audio-controller@330500 {
>>> +             compatible =3D "amlogic,sm1-tdmout";
>>> +             reg =3D <0x0 0x330500 0x0 0x40>;
>>> +             sound-name-prefix =3D "TDMOUT_A";
>>> +             resets =3D <&clkc_audio AUD_RESET_TDMOUT_A>;
>>> +             clocks =3D <&clkc_audio AUD_CLKID_TDMOUT_A>,
>>> +                      <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK>,
>>> +                      <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK_SEL>,
>>> +                      <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>,
>>> +                      <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>;
>>> +             clock-names =3D "pclk", "sclk", "sclk_sel",
>>> +                               "lrclk", "lrclk_sel";
>>> +     };
>>> +
>>> +     tdmout_b: audio-controller@330540 {
>>> +             compatible =3D "amlogic,sm1-tdmout";
>>> +             reg =3D <0x0 0x330540 0x0 0x40>;
>>> +             sound-name-prefix =3D "TDMOUT_B";
>>> +             resets =3D <&clkc_audio AUD_RESET_TDMOUT_B>;
>>> +             clocks =3D <&clkc_audio AUD_CLKID_TDMOUT_B>,
>>> +                      <&clkc_audio AUD_CLKID_TDMOUT_B_SCLK>,
>>> +                      <&clkc_audio AUD_CLKID_TDMOUT_B_SCLK_SEL>,
>>> +                      <&clkc_audio AUD_CLKID_TDMOUT_B_LRCLK>,
>>> +                      <&clkc_audio AUD_CLKID_TDMOUT_B_LRCLK>;
>>> +             clock-names =3D "pclk", "sclk", "sclk_sel",
>>> +                               "lrclk", "lrclk_sel";
>>> +     };
>>> +
>>> +     tdmout_c: audio-controller@330580 {
>>> +             compatible =3D "amlogic,sm1-tdmout";
>>> +             reg =3D <0x0 0x330580 0x0 0x40>;
>>> +             sound-name-prefix =3D "TDMOUT_C";
>>> +             resets =3D <&clkc_audio AUD_RESET_TDMOUT_C>;
>>> +             clocks =3D <&clkc_audio AUD_CLKID_TDMOUT_C>,
>>> +                      <&clkc_audio AUD_CLKID_TDMOUT_C_SCLK>,
>>> +                      <&clkc_audio AUD_CLKID_TDMOUT_C_SCLK_SEL>,
>>> +                      <&clkc_audio AUD_CLKID_TDMOUT_C_LRCLK>,
>>> +                      <&clkc_audio AUD_CLKID_TDMOUT_C_LRCLK>;
>>> +             clock-names =3D "pclk", "sclk", "sclk_sel",
>>> +                               "lrclk", "lrclk_sel";
>>> +     };
>>> +
>>> +     spdifout_b: audio-controller@330680 {
>>> +             compatible =3D "amlogic,g12a-spdifout",
>>> +                              "amlogic,axg-spdifout";
>>> +             reg =3D <0x0 0x330680 0x0 0x50>;
>>> +             #sound-dai-cells =3D <0>;
>>> +             sound-name-prefix =3D "SPDIFOUT_B";
>>> +             clocks =3D <&clkc_audio AUD_CLKID_SPDIFOUT_B>,
>>> +                      <&clkc_audio AUD_CLKID_SPDIFOUT_B_CLK>;
>>> +             clock-names =3D "pclk", "mclk";
>>> +             resets =3D <&clkc_audio AUD_RESET_SPDIFOUT_B>;
>>> +     };
>>> +
>>> +     toacodec: audio-controller@330740 {
>>> +             compatible =3D "amlogic,s4-toacodec",
>>> +                              "amlogic,g12a-toacodec";
>>> +             reg =3D <0x0 0x330740 0x0 0x4>;
>>> +             sound-name-prefix =3D "TOACODEC";
>>> +             #sound-dai-cells =3D <1>;
>>> +             resets =3D <&clkc_audio AUD_RESET_TOACODEC>;
>>> +     };
>>> +
>>> +     tohdmitx: audio-controller@330744 {
>>> +             compatible =3D "amlogic,sm1-tohdmitx",
>>> +                              "amlogic,g12a-tohdmitx";
>>> +             reg =3D <0x0 0x330744 0x0 0x4>;
>>> +             #sound-dai-cells =3D <1>;
>>> +             sound-name-prefix =3D "TOHDMITX";
>>> +             resets =3D <&clkc_audio AUD_RESET_TOHDMITX>;
>>> +     };
>>> +
>>> +     toddr_d: audio-controller@330840 {
>>> +             compatible =3D "amlogic,sm1-toddr",
>>> +                              "amlogic,axg-toddr";
>>> +             reg =3D <0x0 0x330840 0x0 0x2c>;
>>> +             #sound-dai-cells =3D <0>;
>>> +             sound-name-prefix =3D "TODDR_D";
>>> +             interrupts =3D <GIC_SPI 45 IRQ_TYPE_EDGE_RISING>;
>>> +             clocks =3D <&clkc_audio AUD_CLKID_TODDR_D>;
>>> +             resets =3D <&arb AXG_ARB_TODDR_D>,
>>> +                      <&clkc_audio AUD_RESET_TODDR_D>;
>>> +             reset-names =3D "arb", "rst";
>>> +             amlogic,fifo-depth =3D <256>;
>>> +     };
>>> +
>>> +     frddr_d: audio-controller@330880 {
>>> +              compatible =3D "amlogic,sm1-frddr",
>>> +                               "amlogic,axg-frddr";
>>> +             reg =3D <0x0 0x330880 0x0 0x2c>;
>>> +             #sound-dai-cells =3D <0>;
>>> +             sound-name-prefix =3D "FRDDR_D";
>>> +             interrupts =3D <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;
>>> +             clocks =3D <&clkc_audio AUD_CLKID_FRDDR_D>;
>>> +             resets =3D <&arb AXG_ARB_FRDDR_D>,
>>> +                      <&clkc_audio AUD_RESET_FRDDR_D>;
>>> +             reset-names =3D "arb", "rst";
>>> +             amlogic,fifo-depth =3D <256>;
>>> +     };
>>> +
>>> +     pdm: audio-controller@331000 {
>>> +             compatible =3D "amlogic,sm1-pdm",
>>> +                          "amlogic,axg-pdm";
>>> +             reg =3D <0x0 0x331000 0x0 0x34>;
>>> +             #sound-dai-cells =3D <0>;
>>> +             sound-name-prefix =3D "PDM";
>>> +             clocks =3D <&clkc_audio AUD_CLKID_PDM>,
>>> +                      <&clkc_audio AUD_CLKID_PDM_DCLK>,
>>> +                      <&clkc_audio AUD_CLKID_PDM_SYSCLK>;
>>> +             clock-names =3D "pclk", "dclk", "sysclk";
>>> +             resets =3D <&clkc_audio AUD_RESET_PDM>;
>>> +     };
>>>   };
>> --
>> Jerome

--=20
Jerome
