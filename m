Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793004388;
	b=3NIwBO/B/Ter0xULI4XNmYJItn0rNNb3MBpU1Fsw83LT/Po1FsQxvB/Knfmg7QNxBium
	 pqFQIffGrzgasaBC1XBwgeOCUOLCziTA4jBfiwRGE6DT23Sa9zVMI2do/f8O7wNLcXwd2
	 l9U13phtlPhB2USj6OyBJMJfWW6TOxicReelh7D/P976Xa1gWrg9ydC+E6l8hvRi+azP8
	 /r8F782N7woFobyaL7GC2+dofEIxk+aNfi+sQ4cRJ1rXXihv+4Y5BVGGoUrk0Cny6sHel
	 a2HLhYvdlVWRN29JuG7yaOuf0zyHc7f2zGaqVgFwljqzVYRCyjHYa9e0R07gUndeImg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=5I9G++sBFZBEvdUOgC96XBerDJBhmVoXeNlZeIKbjBA=;
	b=s9I9YxDZo/lbojxG2HE/drXDf1aIEkr5iPD6ZhvexNVLa9LCbiKb22YgX+SymTgLNaBX
	 34XLJtnYqdYiiXiiEFme6Hgm30g+jwcbwCn/v3lbS6J6S87mnW5qdpuE+lI1OuH5nSAGI
	 tAfdOfKp7pw44Op32A4b1w2TmVezTSyTOG2m+p4x4dCx6DE2kFgUvCD+9+tg8tzrCgx/6
	 dHAf19SVrcSloIopf9EzH2xkqgiRrE0nq5lWCZiaGzNmx2i4K852gmNL6Pb9BffKNevsk
	 5kwrCK8yRjFOmbgTJsGpIQdltqJP0mi8XrT1nSkUM7kQK8RU1s+izaNyzyuCokkuVMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KNGrYKqm;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18E3606A31D
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 08:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C18E3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KNGrYKqm
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so17010685e9.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 01:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793004385; x=1793609185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5I9G++sBFZBEvdUOgC96XBerDJBhmVoXeNlZeIKbjBA=;
        b=KNGrYKqmfIoQx7G26nK+hU0aEiCpetb+aODEa24JtTAW1UqmeHkN8uRhPqBtcvoyIl
         OM+wsoA4rANZUWbhu+xg1RYG8r+spNwUHybHWEaYQS9F8skZl9NtRhDbMXaK6UpTAerh
         oSIK44IDmEf33YtYLu/VRTt4bz0bXGJHlkCz0H2A/NeXdLB1vepv5ExBs21q5Nl81TV9
         f3VGCHK7T5KM9xIe0O/ZkK0bqbaRq8Hj2wnqleQ9YPUnPXLuzQL4qXi/kEbypit6PmwG
         yJoAYoNsqvjaUBDMf+QucyHqNwXJMlO6Bo8O1RR6yKHzWMOzLSpnF48RXrYKj++avAV/
         uqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793004385; x=1793609185;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5I9G++sBFZBEvdUOgC96XBerDJBhmVoXeNlZeIKbjBA=;
        b=0SZlgG3UlTwo2oD59fVnLJ5jMA7LfiIVvSMqsrETszU6uE+j2FLK0j0UoVrqWdf0R4
         TcnIIatF+zjBVrC7dKXjYvsw6ncHcGtJGW12dFNp0Vm+7a1KUUF+au0nlagKXsId2UO3
         zavu3VTniZ7e7hOYVmwq//irqL2i3b7d0Gs1grRaqHLFxVZUJk/092ueKB5ClnQfSXqu
         d2HWe3fEzSaB40N2PxR/cX2WpWxauldIf7HNAqmzr2GsdoZqIkeHIFv7PEj/rlsag78f
         GN0v3Dx4M80JVT7XQ5A0goZatpo53FFGzLw6QVDEkDqrGA7jxBhD2o+be035Q358GYWO
         aMfg==
X-Forwarded-Encrypted: i=1; AKwUvBw9H/1U8TZoKYsKx91TnsAr6L9dVOOX2IyH1tGicfSqW3pt2n60vEXHWIip9RST+X7qTp3fHj7hzwA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIS9tNTrR32zP2nBhVUKlDtX7vwher1zNot/8cbpaORDXWxX/6g
	p0MtRLAdqpIl5VEl5rZQwtjLdlf5o43mESwYrzCjsWRVXTAKcQ/qqyjbeqmCbOrtjPg=
X-Gm-Gg: AYBFou0tF/VEjx+5OLLFSRcOaPq93GNa4jQ6+g+miRNXnkX54yqZsgZgR10wwE9Rjvj
	M4+gmt1qE4+5YTm1q1935N3LxvJPV34TTtb1V/KYN4d6c9zSZ930fcbPoRmk5jX/QmP4kviV2IB
	611IRccW081LleA2BEBj2B41Raet/57Px4BvWMFhEUZxqdXZHXIk6QnOVyWBDXTrxjwO2tqepXQ
	ZWP3a77L3FxNTT8Y9gmlLJtvLqOCtaCyL4iwfekHC/Q0wV0e5QWR+Mwy7yaCEYCK4altLAbQ6oQ
	5Ui+H1wwK+k/YzQluORXAR329teWhomA5mmiipbK9NTVKvuLoDgrS2HDD3P0Bq8/9qjkkRCzbVf
	9PdRaqmgT01Y1fJwhtNt+dKENF6ehI9ZR1Tj6XECpb5fUKD2vv0+I2+z24qLP5R0ksWcCMv0jtb
	XfEoH4aEHgFgSd2aolyMHvotxXs6tWSsR3RoHIGwLZ81UBLNZMc2eN3OIwl5xXdCsqhT5P/QSpQ
	vIPDckDAPEJWV4Lrgy7/sFSgpa6v6I7gjT8oHOjW2IdofKCsCXFVNnS6IshOl5l3RISDXthyNw=
X-Received: by 2002:a05:600c:6384:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4a35ac3acb7mr105232365e9.3.1793004385073;
        Mon, 26 Oct 2026 01:46:25 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a033702sm146277845e9.2.2026.10.26.01.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:46:23 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: christian.koever-draxl@student.uibk.ac.at, neil.armstrong@linaro.org,
 sboyd@kernel.org, bmasney+clk@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, perex@perex.cz, tiwai@suse.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH v7 0/7] Add support for S4 audio
In-Reply-To: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
Date: Mon, 26 Oct 2026 09:46:21 +0100
Message-ID: <1jik2okfxe.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On dim. 25 oct. 2026 at 20:23, christian.koever-draxl@student.uibk.ac.at wr=
ote:

> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> This picks up Jiebing Chen's "[PATCH v6 0/4] Add support for S4 audio"
> (and the tohdmitx S4 patch) unchanged apart from rebasing, with
> Jiebing's authorship kept, and adds one fix on top:
>
>  6: g12a-toacodec: fix the S4 source mux read-back. The S4 DAT_SEL
>     field moved, so the mux always read back as input A and DAPM never
>     powered the selected path.
>

Jiebing has posted a v7 already.

Using AI is certainly nice but I would advise that you slow down a
little and get used to working with the mainling before sending 7 series
in a matter of hours.

> [ckoever: Jiebing, if you have a newer version or prefer to post this
> yourself, I am happy to rebase the fix onto that instead.]
>

For example, instead of this you could have tried to ping him privately
before trying to takeover from him. He would probably have told you
that he has already sent a v7 and (I suppose) is working on v8.

So please be patient.

> Tested: HDMI audio up to 192 kHz; the TDM-C to internal codec path
> plays without errors at 44.1 to 192 kHz (not listened to).
>
> Tool use (Documentation/process/generated-content.rst):
> This work was done with the help of an AI coding assistant, Claude
> (Anthropic), used through Claude Code over many sessions. It did a large
> part of the hands-on work: it read the vendor kernel and the firmware
> interfaces, probed registers on the board, drafted the code and the
> changelogs, and ran the builds, checkpatch, dt_binding_check and the
> tests on the hardware. I directed the work, reviewed every change and
> the final patches, and take responsibility for them. There is no single
> prompt to quote; the sessions were of the form "find out why X fails on
> this board, fix it, test it on the box".
>
> Tested on an Amediatech X98Q TV box (Amlogic S905W2, S4 family, 2 GiB),
> vendor U-Boot and BL31/OP-TEE, Linux 7.3 plus this work.
>
> Christian Stefan K=C3=B6v=C3=A9r-Draxl (1):
>   ASoC: meson: g12a-toacodec: fix the S4 source mux read-back
>
> Jiebing Chen (6):
>   dt-bindings: clock: meson: Add audio power domain for S4 soc
>   dt-bindings: Asoc: axg-audio: Add S4 audio tocodec
>   ASoC: meson: g12a-toacodec: Add S4 tocodec driver
>   clk: meson: axg_audio: add S4 support
>   ASoC: dt-bindings: amlogic,g12a-tohdmitx: add S4 compatible
>   ASoC: meson: g12a-tohdmitx: add S4 support
>
>  .../clock/amlogic,axg-audio-clkc.yaml         |  18 +-
>  .../bindings/sound/amlogic,g12a-toacodec.yaml |   1 +
>  .../bindings/sound/amlogic,g12a-tohdmitx.yaml |   1 +
>  drivers/clk/meson/axg-audio.c                 | 165 ++++++++++++++++++
>  sound/soc/meson/g12a-toacodec.c               |  51 ++++++
>  sound/soc/meson/g12a-tohdmitx.c               |  80 ++++++++-
>  6 files changed, 312 insertions(+), 4 deletions(-)
>
>
> base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
> --=20
> 2.56.0
>

--=20
Jerome
