Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAC42E83F
	for <linux-clk@vger.kernel.org>; Mon, 18 Mar 2024 10:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710759386; cv=none; b=VP7sJQTaRVtE06oDO03k9dRyGeVRBUUFeOYSds/vyNx0kX6s0X0G0zhVDIyDB9nHvOVI01eKpZVzJw+g5fvTZAKiryOFwh0Ktt0qFlWQXAEaoYStU0e0jMSp0eMY5WpfnXukOB558Bk+bik2/gsw1wXC6VokDImmcAwsdwtnW1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710759386; c=relaxed/simple;
	bh=ktqhDBsasebif64PIWUFmzzdHaGOsLDzz8vPPDymlSQ=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=HZSfUBHAnL45PtynQaJpVqiBRbBMgRdQ+oxVUQJ5F3E3Xi07oH+bW4QGLiehoVl5M9TbdkmGPLXdQEqnb2RPx64QEiBUHiH/G9L026Kklj2btETtSVsppf00Lv536AF0aafJDg0Od1ktqBt/JsOScHKEDJ3iphKpP1ZdHGjQp+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VBm3UaES; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VBm3UaES"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-513e25afabaso1422015e87.2
        for <linux-clk@vger.kernel.org>; Mon, 18 Mar 2024 03:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710759383; x=1711364183; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=F3i97oXHe0eAhEUjD88GKSO+6DE7eLwPQSdXhNfZFbQ=;
        b=VBm3UaESKKWDtqxB13mfadCGf6zYds154Uy2mVCfgBykHOzG3/r/bmkb0KV/dsks7S
         5MCO9IxlTDS74OpXloNO/nsDVtVMiqHRFFuTB1CCPXXko9xIkekIqijDy2Iswiolz3oV
         fr2DrlSfzQmA71cXmfvMezTY8fB6go2IgecSw+WWiljZ0ndQ3X7qm9RSZuhc3g88rkuH
         JsxQH537CH8+bHBFZrAwwiXhJvkv+zhlyMH8Z42Ny88iFOlAFhuYx3NH9yXH5dHM+kiZ
         q77IsGBwQ9iTVHqo64PBbj4H5SSy9AZcFVbHp72jbbQMIRDcfxAdbM9iCk1l1Rea9q49
         4axA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710759383; x=1711364183;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3i97oXHe0eAhEUjD88GKSO+6DE7eLwPQSdXhNfZFbQ=;
        b=B1aX1uHLR7SbImivTQg/NHUXA4OXNocEnY/jP7hDSy2gAAbK1+CECga1kjHBR1GM3b
         1acbOXN2TJgCcgmUNlul/qnDNJceyjJTz4BL9X71UmjP7gl/Sk88XHKmR+xjq3eVw2OH
         u+NofUvbvoLd0CboOQzjxr4aQNxP5fhe29iG4kxrb2rGKh+v9K7da98BfTA+Ipe4+9Pq
         HgYp6uXs/kWd6QfLXuBlq+1qF9L0o9iMVdvWDdJetWmW9JGGGOPzBPHXM3d30z1Nb8nO
         gjS+myf1hLc52NsUAt2DOtbDVHyusUUY6cC/UW5H5k+xpLRx12MwLFJ5bfofuF+A5nVl
         cW9A==
X-Forwarded-Encrypted: i=1; AJvYcCWWTOYvJalV3jgrX5rZlecKJbF/WNOD++Q+F/DtZ4xH2nAM591IFOBgCr1/i9hNIRjxVhdLmfzv2KqxxOCD5TwX7Dtivq30F2Pm
X-Gm-Message-State: AOJu0YzeN8OYLwrX23LLaiwQWm7R5Zpz12HIdErWi6I7oeDRGqr0q7Lo
	liEqkTMF5FJi+uhSXxszNKK7MPnxamLRLTGjwjUMVbKOWowyIfdD1ixxuapN85E=
X-Google-Smtp-Source: AGHT+IF2t1NObGaOQ+IPe7s03JmYlEbsyaNF+u7Gb3UFP+mZEEcwim7+2sDBYhdUxYtGEoaRHjxYsg==
X-Received: by 2002:a19:8c0f:0:b0:513:9da7:3792 with SMTP id o15-20020a198c0f000000b005139da73792mr7100240lfd.19.1710759382830;
        Mon, 18 Mar 2024 03:56:22 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e4d5:78c0:18b:ad85])
        by smtp.gmail.com with ESMTPSA id n18-20020a05600c3b9200b0041407100b3csm7809350wms.30.2024.03.18.03.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 03:56:22 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-14-jan.dakinevich@salutedevices.com>
 <ca80caab-2664-4797-a222-e14537eea440@linaro.org>
 <1jil1nhjwd.fsf@starbuckisacylon.baylibre.com>
 <6feba9ff-8bbf-4494-93f0-732679bc4032@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
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
Date: Mon, 18 Mar 2024 11:55:35 +0100
In-reply-to: <6feba9ff-8bbf-4494-93f0-732679bc4032@salutedevices.com>
Message-ID: <1j1q87hkq2.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On Sun 17 Mar 2024 at 18:52, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> On 3/15/24 13:22, Jerome Brunet wrote:
>> 
>> On Fri 15 Mar 2024 at 11:00, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>> 
>>> On 15/03/2024 00:21, Jan Dakinevich wrote:
>>>> This option allow to redefine the rate of DSP system clock.
>>>
>>> And why is it suitable for bindings? Describe the hardware, not what you
>>> want to do in the driver.
>>>
>>>>
>>>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
>>>> index df21dd72fc65..d2f23a59a6b6 100644
>>>> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
>>>> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
>>>> @@ -40,6 +40,10 @@ properties:
>>>>    resets:
>>>>      maxItems: 1
>>>>  
>>>> +  sysrate:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description: redefine rate of DSP system clock
>>>
>>> No vendor prefix, so is it a generic property? Also, missing unit
>>> suffix, but more importantly I don't understand why this is a property
>>> of hardware.
>> 
>> +1.
>> 
>> The appropriate way to set rate of the clock before the driver take over
>> is 'assigned-rate', if you need to customize this for different
>> platform.
>> 
>
> It would be great, but it doesn't work. Below, is what I want to see:
>
> 	assigned-clocks =
> 		<&clkc_audio AUD2_CLKID_PDM_SYSCLK_SEL>,
> 		<&clkc_audio AUD2_CLKID_PDM_SYSCLK_DIV>;
> 	assigned-clock-parents =
> 		<&clkc_pll CLKID_FCLK_DIV3>,
> 		<0>;
> 	assigned-clock-rates =
> 		<0>,
> 		<256000000>;
>
> But regardles of this declaration, PDM's driver unconditionally sets
> sysclk'rate to 250MHz and throws away everything that was configured
> before, reparents audio2_pdm_sysclk_mux to hifi_pll and changes
> hifi_pll's rate.
>
> This value 250MHz is declared here:
>
> static const struct axg_pdm_cfg axg_pdm_config = {
> 	.filters = &axg_default_filters,
> 	.sys_rate = 250000000,
> };
>
> The property 'sysrate' is intended to redefine hardcoded 'sys_rate'
> value in 'axg_pdm_config'.

What is stopping you from removing that from the driver and adding
assigned-rate to 250M is the existing platform ?

>
>> Then you don't have to deal with it in the device driver.
>> 
>>>
>>> Best regards,
>>> Krzysztof
>> 
>> 


-- 
Jerome
