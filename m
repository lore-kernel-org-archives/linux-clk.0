Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769112;
	b=uxeA9QV9wbJjpP8ONcelZZoTnt0FDPzAjnhl+HcOx65ZazbtNyj+8GSCyXKOCSU+MnIt
	 fz7RwXTv1BgbcEGbdglYIpP8uYCRDxoKe9Cn/Wq34iodWxItZzmZT5eWtXSjatdhlZFMO
	 YzPtSlvTNjFTazCYaWSFqIHRQ4ZHvGaYkAfBvI80nCbl3D+HX3jdvh6eZXMuJF7JSUA5F
	 j+s+iIgRTYTQWMNSkoQpiCGTjr3aEiQ84XR3AK0ybr6WAxG/kYA7CDhjt3WLRre85/lsC
	 TW2lztKrxuNfQsYTnIT2xr3y35y/frtYWL0HwnPZPPxmxoOOZ09vzp7bTYBOUn1Ek8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=/Dn2D8XkSGEfDxJntGFmwA2DusnT2l4fyR3s26i/q2k=;
	b=f112aFr0NzZ+7iQNB1qJte1Mu2B+M1CbnBJCQosWOyg1HZo8hjQVgKEabysCqZbgvp1x
	 4wDpSM1Y4DhzeFFn4xQB3A7Jm0MBnkVeRXjNQLmkba5da7XHYi/JQBM8e0u6q3qp/XU7g
	 hp32fUNPPdZb24or6sfGcnDQTp/1AzSAvlw3g3VavRKPUwNsKEG6AWKpxZ+zQHoUA0IbF
	 V5k+RpjyDHym7VlrRv7dfSUQp0XdnaLTYAjkRy5BgnRqu348MT+XUT9H9PYTfcuLTdjSQ
	 shUE4aAFF2KBJnauxvC/TR/ZU0BedOGytuBcNkus3taku9tMcqxXOQina1XgrltmV7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MRD64OoM;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C074606A32F
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 08:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C074606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MRD64OoM
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c516a192844so832746166b.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 00:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795769109; x=1796373909; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Dn2D8XkSGEfDxJntGFmwA2DusnT2l4fyR3s26i/q2k=;
        b=MRD64OoMvCFGHZzsUp9+PwRr600pYUT0w3py/Lhu8RIPbqz6DXgVcMB/2Yq02pK7Jk
         zIr7Bip3xailSfRQcn5XGVNVqY9qud32SG3Dh/HIncZv/GYYDGBs/yjGvu6uagZJ3jPH
         EFINEQR8KwtgdsJpdpN/TGnxBzOw/N8Fm7ivr3hJXlrbYE4F3S+5wVPl5IpGYJ4GFeCY
         MaYws/JsouoDxUGRRwa85698slMGV7CjYPGuL/hUtgKI3+gg/PgfrUtBbLfNah4xjtVW
         munMq2IlGI+FdDn19++xCQ259D97pO+8nQPNtINOJhw74xx1qVicWNXaQidZ9Ok+FWl7
         keIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769109; x=1796373909;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Dn2D8XkSGEfDxJntGFmwA2DusnT2l4fyR3s26i/q2k=;
        b=Y5MKJSja3jiDp3N5MTN+80k30waTzuris1p1////lDPteVAarrI3Ds3DWM6WEk/LlD
         iIcdG31lit3ph0otu7OGatNGoigg1ecnxNzbPJPhhqezAYtnJoQwtb428JDrM2SLuWRe
         fszdyMZdIi5Nqb9Lir+NlqojdCsIBMQSCWttlQ3XZYbOGSXFZF3PEdZ54MoUIr2Gahed
         Uzp/aO79Y+AwB70bO3sE81NRx0nKzn+Ghx0A6ugG0EH3eVZdGjzjX6pc2NAW12mVx3KW
         RXclIrQFLy4XNfMV4jM+40BRaRFvDOwrTr/Zhyndz58muVCrJ+TbdESRpRHLVCHqJd8L
         wQUQ==
X-Forwarded-Encrypted: i=1; AL+hErFdCcRFsfgbpHTDZsBe3utZ8nkL8aieefo5J8x9IcFI1rxJZsUgXTXOjtp6mn4xR70nwuRG1e4GHWU=@vger.kernel.org
X-Gm-Message-State: APuU4Z81ik+x0j3879qdTCtKwfomEVHeIdA8i+ocJm8BPvqLFlMGsElm
	DJmkzj6q1xXLVURLLuhjVzUAk87MjNmNGUJXhN7f62zEdoZg95c8gZeZjtZ3fA5hkJw=
X-Gm-Gg: AZFdTZdSgOa8cXKDDoNeIRziGNyXAI3QwGn5nBb2X+SkGvHC1Bty6F2LGb8epdx2Wky
	e+AD8IGru13p9lgiELgBvV2/pl5PRsByvnJuEhrQNQXk0TAf4VYM6pegkzzlO091/vUctZoiBRP
	a/CoUUWLR0wbAnbKGGMGD51ac22WeOPEAv3mP3dfAlar5v8ZnvcsYhCNHjUYWb856sdjrFZXDn7
	H6camhvs3Jy8tdOoP1TBKL0iRbcEyMvaObzhmuzzUkqAeYCg9uNNvhaSvXO+h0fyZd6ntkKYgJD
	w5FuuK8nmK0YYGnCWXYNrEzuzrzUABI+f+dhIgezrYOCksuh51cZvG3USNOQsMadF02xw1wRehU
	MHI6+alPtxi+9rDC+SwSYV89CTJBLQRQlncf3doEcYp9eLJepPEMRkXj+PZZUtAbsPXrBbA3MYq
	LkW2I2u6MhY5VAKurHG74ekAnYUf5YDgwCkyuQ6J8a69ToSOQwxUdqnI8ZyGA4pO7mqyHEFtq4a
	2eqdZq92Fd7zgSK4NafjlBUrOKV74F1MzwTbNnffDifDRP0pjI3AW3wL98ZwyVVJIl35CyH/1Lx
	ZQWRw1fWL+8kmtccNbdb+7B2guxqeyHXS5WYLLx+u2Dc7cBQ
X-Received: by 2002:a17:907:6c17:b0:c51:3cb6:5b11 with SMTP id a640c23a62f3a-c513cb65d73mr1971796666b.49.1795769109636;
        Fri, 27 Nov 2026 00:45:09 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea31e4sm851467866b.39.2026.11.27.00.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:45:08 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
Subject: Re: [PATCH v8 5/5] arm64: dts: amlogic: Add Amlogic S4 Audio
In-Reply-To: <832c4090-d6d7-4c3b-85e7-ed7dfb8c85c4@amlogic.com>
References: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
 <20261110-audio_drvier-v8-5-1489241e4c83@amlogic.com>
 <179536111581.2728475.9919460533427781841.b4-review@b4>
 <832c4090-d6d7-4c3b-85e7-ed7dfb8c85c4@amlogic.com>
Date: Fri, 27 Nov 2026 09:45:08 +0100
Message-ID: <1j5wxi3bor.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On lun. 23 nov. 2026 at 10:48, Jiebing Chen <jiebing.chen@amlogic.com> wrote:

>>> +
>>> +&spdifin {
>>> +     status = "okay";
>> ... as sashiko pointed out, you are indeed missing a pinctrl for it.
>>
>> With sashiko remarks handled
> AP222 does not have an SPDIF IN port. I will remove it and update the 
> interrupt number for SPDIF IN.

If you need an immutable branch for the clock changes, I need you to
submit them in a dedicated series. Let me know

>>
>> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
>>
>> --
>> Jerome
>>

-- 
Jerome
