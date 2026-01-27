Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F1126CE39
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 09:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769505622; cv=none; b=m6LjN6Jrmf23wCjw6sAdhrHJz9fC22h0Wlxt4AaSCl2rBjVxnuFTvkjSztt+FPfrfAoX1QpJAAvlbojDQkIJdJwvJIPjVO9gcvl5LC4/YcYyDdXGDJ9/CYKZbI8LZSEY94q+NDyTB6BV+w8dAbtwzXlERqOgg+oMBLyobLK0+JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769505622; c=relaxed/simple;
	bh=NRaJIBsOgwkV+eg1RM+W3L4+CnbMHXTkmYHk3spsKPM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=r1+R6+jYJXmk6XjCPuxYH2B6tDQLVfbl/OXPqdFpGJ9wEMekW38FPbx2H+t/eh4l93y9o8k4j1uk5GnkiVlcSES0OVb3+5X/Q46feDSO7k0lP65jaq4i2e13OC8G6sl27rWurtPrbnr1VuSCD1wF1XfA9AxtbZ9vsZklWNqIv08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXEzkjDm; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXEzkjDm"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8863db032dso635708966b.0
        for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 01:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769505619; x=1770110419; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRaJIBsOgwkV+eg1RM+W3L4+CnbMHXTkmYHk3spsKPM=;
        b=UXEzkjDm6qwK1BqyIrUwDRCx/k+zmjBTxPxSbmozC/Tklkhc1tiNOBK3lC+UOXQEkR
         TqocH+sDDld736nY/D1Osoz4iNDo6/nayIILqksJKNPefHaVqWKuWgoMI/1CCOONWyNJ
         rFj+6LpEoEx2VpnPzwz1aN4fdYdcp7lhyO4i1dtE86qw8VLbZtPSmRPX9Io6RbGw91IK
         dboawPT3z2Tev8GLTA0g3e1vW+5ZmoG1Uo3gs4VHny+6M3yrjEuTpRWrLZ6rNtuzFRBs
         5J5jufiQ5lLQLOGLhdVX7Z7ykMv4OYWvIJtepSqWGHkng05C1crl3vceAKOWvJDnACRl
         VfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769505619; x=1770110419;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NRaJIBsOgwkV+eg1RM+W3L4+CnbMHXTkmYHk3spsKPM=;
        b=Aj8wMI8UDG/eZwyp7/yYRKS7bPhkjbxKsnewYOeC82SxH04Z2gPv99zK8vIEoNUmfi
         GcHtU69Q29LGZoTnqfC6KshbzGuY6/RCwTcJpkp8LpWN+HoA55ZxGWRuRV4O8coIVnyK
         GPD0XYpu7GEsZyCCqEluSynDf9g4P3xyrtLMQ9YUbv1UDabsHqvpzOPE9wVu4q767PFF
         tmNWPJrElLYkPZGPMdAWagVg7GSPHcoAidsjlW+hESV2sdzsU14TiRj1gyZQn4ZrENaR
         S3kmDIjOH7z0zmI5ooPCDdS1S6c3STuQThLR52dTtISbwhNGiJVWSpKHq1WY35owHaYJ
         UZqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvQ2zCPjIgUsNVDpfVOVFxrplKLClTjyDIYxrercP290uQHK370RN2rJ4ebta0mGsbmshDSleYGGc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa9JM51AkT6B/Ha/IkutqLjvm45TgEqYAccnBchpQLptGk/zZA
	FWCjtMZGDjkfay1ov99ZhMiLyWUPf+YEw5ZlMeNQIRJa6+EMNQgSmaPW
X-Gm-Gg: AZuq6aLox2v2izMpg/eixG7zg6Djq7iBV2IXKDABoKBdjlBkLqhupXJRShLtGmxAXDt
	HpPE7qm3mfLh+gZDoWESzDYsqYxSunSVbyjp53DqEQQUppPLz4Yb53Sqq/jTP+A+CP3m6rIrw49
	RE+/4wsfYXgygo0ghmHiUJL//npgwoTK43+VRpdH0gmuiNSt53rCOdPjuDZnv/zdOCwIOIgA+9p
	1+j4odCTh1NH9eUO5B05ggmEyTfsgo8isXGL59C5G7tjiEzO1YeOnsysUFOZ5yOQDukjlz3hC7k
	Q8mDCELD57A6aLfnq3LZeneBeOvqI4gYuFQaPtGCxY56AqtvAKbIV0KSGEGAg89YWBpv3A5Sf94
	clMTxCrFlzTpIWn0L1wri8dGwMd46RQhFbHlOgl7B2Yjcq15oNm5FQ6BZS+6FCz0CYeZKF6IGp5
	zE9/dcw7QZPvwmKOEshZ3I1nXX1VyROTTiRJPzX0ks87LChJerR5ZfXJgaZWNioh2N
X-Received: by 2002:a17:907:7287:b0:b88:5b35:914b with SMTP id a640c23a62f3a-b8dab3d056bmr95912366b.59.1769505619057;
        Tue, 27 Jan 2026 01:20:19 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b700d43sm776257066b.41.2026.01.27.01.20.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Jan 2026 01:20:18 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH v6 0/5] Add support for S4 audio
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
Date: Tue, 27 Jan 2026 10:20:03 +0100
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org,
 jian.xu@amlogic.com,
 shuai.li@amlogic.com,
 zhe.wang@amlogic.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <35CAE0E9-4C3F-4B41-BA1A-19761671F392@gmail.com>
References: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
To: jiebing.chen@amlogic.com
X-Mailer: Apple Mail (2.3826.700.81.1.4)



> Wiadomo=C5=9B=C4=87 napisana przez Jiebing Chen via B4 Relay =
<devnull+jiebing.chen.amlogic.com@kernel.org> w dniu 26 sty 2026, o =
godz. 07:01:
>=20
> This series completes the end-to-end audio support
> for S4 SoC from hardware bindings to driver implementation
> and system integration.
>=20
> 1 Device Tree Bindings Updates=20
> Added audio power domain and S4 audio clock support for S4 SoC.
> Added S4 audio tocodec binding support.
>=20
> 2 Driver Implementation
> Implemented S4 tocodec driver for G12A architecture.
> Added S4 audio clock support in AXG audio clock=20
>=20
> 3 Device Tree Integration
> Add Amlogic S4 audio subsystem support in arm64 DTS.
>=20
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
> Changes in v6:
> - Fix the problem of string for =
Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> - Remove clock pad register, and it will be submitted as an =
independent patch.
> - Redescribe sound/soc/meson/g12a-toacodec.c
> - Link to v5: =
https://lore.kernel.org/r/20250710-audio_drvier-v5-0-d4155f1e7464@amlogic.=
com
>=20

Jiebing,

FYI

I applied this series over 6.18.7 and tested on s905w2 device.

With audio routing like this:

amixer cset numid=3D40,iface=3DMIXER,name=3D'FRDDR_A SINK 1 SEL' 0
amixer cset numid=3D73,iface=3DMIXER,name=3D'TDMOUT_A SRC SEL' 0
amixer cset numid=3D37,iface=3DMIXER,name=3D'FRDDR_A SRC 1 EN Switch' 1
amixer cset numid=3D61,iface=3DMIXER,name=3D'TOACODEC SRC' 0
amixer cset numid=3D1,iface=3DMIXER,name=3D'TOACODEC Lane Select' 0
amixer cset numid=3D62,iface=3DMIXER,name=3D'TOACODEC OUT EN Switch' 1
amixer cset numid=3D17,iface=3DMIXER,name=3D'ACODEC Playback Volume' 251 =
251

i'm getting working audio on analog headset.

Great work!


