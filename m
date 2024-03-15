Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A1E18E11
	for <linux-clk@vger.kernel.org>; Fri, 15 Mar 2024 10:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710498311; cv=none; b=UMeqUL59WCm4fUn95RBKM0zAJPKFFRzUre6Biv54Rx1AyaE254/nqRQdPrGupiaUh24oGoF8B9iEQn3xyAm11cvDjbf/ZflaDVmTSw/ETXkEOBeY1YhpiLxcSEG0hf2aXTV2OpDInZDCI4CxgvAz3sLJ+/Ft8IklREpI41YA1X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710498311; c=relaxed/simple;
	bh=NfFTjprpYpTx/YOcA395cb2tUELkt8+AWxFx0BohTVw=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=TK6cyQWWPJZ5uJDADZiikncN3p/ez7PmMpPwor8WyVlfivOvG7oPpjfxD63XcnXS88JVTCei81Foil59ATn2cIzk08EKZWInUwduUQseqOHaCXtDKdRcLN2k6omXjtzN37/acDB8P89NVLzGFzNHcVbM17/uoZRI1q/jUcfUgrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=scTyMV6t; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="scTyMV6t"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33e570ef661so761792f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 15 Mar 2024 03:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710498307; x=1711103107; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=I3EB/6PldhsbhWY9+bYWiu2w8/wr6W5dSP5c/9sIMoI=;
        b=scTyMV6tGxpPlH+TE8fWNj5v3IY+5bAIEbQwmbIVNN3XGjo9GTZz+InJd/EjxhUuZq
         Q9Ot2p8f+AOjQj6+U0vZhicYtDDqkq+P9saxDp5W48/Ueq1Ar2TaKf8LebWOrVL8Pqug
         Jmj16tfoojVaZWL7EJcEzgolSUXHFVPP65f5DlSnRQGt5KeOjJYN2DSKmBodnc5K668f
         P+R+lLYCxRO4Wqor3SqTkHfGN17d2n0vjk3RtNfPH1vbggffj+CgkGdnbROD6tAeXJTc
         jC6eosvqjs0KjmhMfv2w2TGnCWtqJJopYJCCPYpHq0b3qIC/Jl7PUhWLs0FhV599qsaf
         D8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710498307; x=1711103107;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3EB/6PldhsbhWY9+bYWiu2w8/wr6W5dSP5c/9sIMoI=;
        b=mXJJlhGGeu6UCoj33/vc8aTozx3Nd2ZjTx7vrwK7LYZwn/rcU+O5exe2y1yP5WRrsz
         ofwhTtqXER6Y/rx5Y91lwvcY/9RHQ2o+6p8IxG7/5vIpQgSVKU/kB0b6Dg8vKReTA2H/
         Zi3D9D26TQYzTTayaMT4ZSk6G0DiLnlu99Ok6PebriZ8SWwNDINJrYyH74LQf2uAh/Fo
         aNh2XpfHQ+7myNXzNVGENi1cld1BUDExhvlj3N7BUuadghrogwGg7v9Cr/Vpu13oqL/2
         2an8kOhcUCu4RejJbz91s5r8gOnBVW/g3Wn9kgSRRdKAgoQUY+KPum9827SD26W4jkX4
         2RIw==
X-Forwarded-Encrypted: i=1; AJvYcCWBdYX6RbZF0syYgSjljMZeXikbJIkn6g+eI0K8M/x5O6VZ3SuWdNPs7SZMzSy0kpyPbsdcejyUZ2LkQ/qLuV9W+2E0vYxHhWGG
X-Gm-Message-State: AOJu0YzPY4FRywrF9wTOKTNbtxNNPCO0DpSK4u2OrkUgCEMFSC2fSpcH
	dFuHo9YjJny+rpOVRjT2DKqODwKwAComxYKea3YjT3+OhIBrYlhg/LK5coWNAH8=
X-Google-Smtp-Source: AGHT+IGWDipfwojUVR3R0h/HAg8+ErMHQU1L9DU1QDqUHJY9+2A1t5wePivY0yDxiYGWnr60Q0NDnQ==
X-Received: by 2002:a5d:4cc1:0:b0:33e:7f5c:732c with SMTP id c1-20020a5d4cc1000000b0033e7f5c732cmr3060666wrt.62.1710498307090;
        Fri, 15 Mar 2024 03:25:07 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8151:4d0a:14d8:1124])
        by smtp.gmail.com with ESMTPSA id o14-20020adfe80e000000b0033e8c50fc3fsm2818997wrm.90.2024.03.15.03.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 03:25:06 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-14-jan.dakinevich@salutedevices.com>
 <ca80caab-2664-4797-a222-e14537eea440@linaro.org>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 kernel@salutedevices.com
Subject: Re: [PATCH 13/25] ASoC: dt-bindings: meson: axg-pdm: document
 'sysrate' property
Date: Fri, 15 Mar 2024 11:22:59 +0100
In-reply-to: <ca80caab-2664-4797-a222-e14537eea440@linaro.org>
Message-ID: <1jil1nhjwd.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On Fri 15 Mar 2024 at 11:00, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 15/03/2024 00:21, Jan Dakinevich wrote:
>> This option allow to redefine the rate of DSP system clock.
>
> And why is it suitable for bindings? Describe the hardware, not what you
> want to do in the driver.
>
>> 
>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>> ---
>>  Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml | 4 ++++
>>  1 file changed, 4 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
>> index df21dd72fc65..d2f23a59a6b6 100644
>> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
>> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
>> @@ -40,6 +40,10 @@ properties:
>>    resets:
>>      maxItems: 1
>>  
>> +  sysrate:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: redefine rate of DSP system clock
>
> No vendor prefix, so is it a generic property? Also, missing unit
> suffix, but more importantly I don't understand why this is a property
> of hardware.

+1.

The appropriate way to set rate of the clock before the driver take over
is 'assigned-rate', if you need to customize this for different
platform.

Then you don't have to deal with it in the device driver.

>
> Best regards,
> Krzysztof


-- 
Jerome
