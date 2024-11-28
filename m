Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C391B6CF3
	for <linux-clk@vger.kernel.org>; Thu, 28 Nov 2024 15:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732806370; cv=none; b=QzAZ4D734kgGvID6aMwIQQs0aDNC0GOTcNiDzIBPfSWrzJUHTZ373//sUpDHBtOhrsWHd3b1YSjFGVE8g2Fj5p5p3BxmdXHV6BHoVmDi8PtpLqZM8d4FsxSKhlYRrl1+esRko4o1BT0lnuyLOsowlEYJMoZf6GterLa38Msk7KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732806370; c=relaxed/simple;
	bh=a6/nS/LAkmkFczhCXDlE23aLgYtYNdlVnoTtS3chYXo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ksR5cvNlSSleqAXReff1F2Lmy3wDwy3iaNQU5oA7aIID4S2V/0NTQEw7O75z6xd7TZZNeXTVoZ605pNB5rbnIsRkgl2IUtW4bAjyk2KslfKiiTrpDCmrM4TtcI94lrgO4MJIlLEsFBYhNfV/u2kBC2zr7vaaG8pjEQ/3gTGvNPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Zqn3Uhkg; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Zqn3Uhkg"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-434a83c6b01so8091215e9.0
        for <linux-clk@vger.kernel.org>; Thu, 28 Nov 2024 07:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732806366; x=1733411166; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MgMI2XaAkzSEk7PCM+/3QfgY6sh/m9iqNd+K6a7QDCs=;
        b=Zqn3UhkgR/hBZLtimVKhnKXJsSiRw53txRqrsKFI0r5u8BdbYeMV6iCnE1d2c5ynX8
         E01Oim7V5nFJWlQ4/zanWPa7KeJNeQGuiqoVTv2JhyyUQCDLzf5y88udwQr04fS1XuS2
         6YKlcMUqHltu61kyMDI8zmv4Qb//uQkKvwb7Y9sgNOlDIZAFBxSeL6B4MQrZUpR6C0KA
         tcc6dzk3yDHX7pndQ/+YNddipjGiiVUepyCOVDMmdtUM8Yir2UzsGQL/Nij3pF5bXSlr
         WvCzicyuC4yhmUEs55B2nDkua2odcBldj2AmGtwMAcbNqSbHh3rHJ+Ze20Kk87a4tjkW
         28gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732806366; x=1733411166;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MgMI2XaAkzSEk7PCM+/3QfgY6sh/m9iqNd+K6a7QDCs=;
        b=hfZpZK1pV7Q6UjAGfPU08C9Nwqiwl5tckCY3ya2jcQ137N7G2kzlUc19gciXK1+/cy
         OfVsVEpAlfYUh2pGSzWE7P4/HZ+xByGplRAHVF+io6ri80TzdQYNHUwyV6eF82tSgyxg
         8sTSG+35woVKfPYO4qSqvCx9E3dZHG5wDYuuPUPO6/DRbw1naLy3xBzZ/HZ9qhJleupB
         G3RFrCGwPgliZJhXAm7XU0qlRZ1LAHQP+I1rXe2uhH4yTHhQBDxiwv+TRLjDvDuyn7Np
         VdbjKfQLIg5oyCfQbJex5c5Iyxv67kizbc8O1i0HVtcMIPqE2wbcLx+LqcCfSB4LUK4I
         xB/g==
X-Forwarded-Encrypted: i=1; AJvYcCUPlyI7xkVB/nQjgYOF0jvg2yPj1PwxJweS3G55vzkSG1p2tPE855x5bSV5dwZ7qIz9TAwkRAM8DMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBKlzaCzQM2rWJ81NUbPlVLiIHOt12qY827bMvSLg7Ubhxhbeb
	wflPQDhR2W2JY/1OeNzNVocQ8mDsy15SszgKKk5f54YSAOqJIAC73LIdpN5atbo=
X-Gm-Gg: ASbGncvgrOoVLzDzNc7MugPnvoYwRNg4OzWVkErnAsFYxHMC3ndohgSmD6ohm1OPAzS
	QYHGrqW77Sek9ANbkq83KoYlr97lPKb1yMh0HFLFkapNWifdnX/teGTA6/ITEY0FBbx94whutwD
	9t+jbWdNti1su79khVUaJeJrSgYtwcji2bOX0uztIW6CdzE36g6ouS9y2adrWTifS+p9n/XBXeB
	cWgNOiEZmYulYG0+n9O5guczlf5CXIyOjH2vjFbpli/ii0sMQ==
X-Google-Smtp-Source: AGHT+IFCQOlNDI8ArzCZ2jGZrEopkwYDeCZvjEQAGp3/JK0gSJIUVVZoGTxQH/hrEMSp6P2HzE11Pw==
X-Received: by 2002:a5d:64cb:0:b0:382:4978:2aaf with SMTP id ffacd0b85a97d-385c6edc515mr5523043f8f.57.1732806365996;
        Thu, 28 Nov 2024 07:06:05 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b89d:29e9:7047:2d6f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd2dba8sm1893959f8f.1.2024.11.28.07.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 07:06:05 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>,  "Michael Turquette"
 <mturquette@baylibre.com>,  "Stephen Boyd" <sboyd@kernel.org>,  "Kevin
 Hilman" <khilman@baylibre.com>,  "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  "Mark Brown" <broonie@kernel.org>
Subject: Re: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
In-Reply-To: <c06317c6-b2b2-4b6d-96e4-0c2cfc6846de@app.fastmail.com> (Arnd
	Bergmann's message of "Thu, 28 Nov 2024 15:51:28 +0100")
References: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com>
	<12f29978-c8ce-4bee-a447-dcd086eb936d@app.fastmail.com>
	<1ja5dk2y5l.fsf@starbuckisacylon.baylibre.com>
	<f8de4a2a-776f-4c10-b75e-e845bcc38dde@app.fastmail.com>
	<1j4j3r32ld.fsf@starbuckisacylon.baylibre.com>
	<306b0b30-5a32-4c7c-86b4-57d50e2307e8@app.fastmail.com>
	<1jy1131kxz.fsf@starbuckisacylon.baylibre.com>
	<c06317c6-b2b2-4b6d-96e4-0c2cfc6846de@app.fastmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 28 Nov 2024 16:06:05 +0100
Message-ID: <1jplmf1jqa.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 28 Nov 2024 at 15:51, "Arnd Bergmann" <arnd@arndb.de> wrote:

> On Thu, Nov 28, 2024, at 15:39, Jerome Brunet wrote:
>> On Thu 28 Nov 2024 at 15:11, "Arnd Bergmann" <arnd@arndb.de> wrote:
>>
>>>> All clk, pinctrl or regulator are used by other driver yes, this one as
>>>> well, sure.
>>>>
>>>> What special about this on is that it is an auxiliary bus driver.
>>>> It is directly instantiated by another driver. That's where
>>>> it differs. The axg-audio clock driver instantiate the auxiliary reset,
>>>> it does not use it, which is why it makes sense for it to select the
>>>> driver.
>>>
>>> Can you explain the logic behind this design? It seems that the
>>> entire problem here is the split into more drivers than it
>>> should be. It's common for clk drivers to also act as a
>>> reset driver, and my impression here is that you were trying
>>> too hard to split out the reset functionality into file
>>> in drivers/reset/ rather than to have it in drivers/clk/.
>>>
>>> Could you perhaps move the contents of
>>> drivers/reset/amlogic/reset-meson-aux.c into
>>> drivers/clk/meson/axg-audio.c, and change the exported
>>> symbol to a static function? This would still require
>>> a dependency on the exported meson_reset_toggle_ops,
>>> but that feels like a more natural interface here,
>>> since it's just a library module.
>>
>> That's what we originally had. Reset implemented in clock.
>> I was specically asked to move the reset part in reset using
>> aux drivers.
>>
>> https://lore.kernel.org/r/e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org
>>
>> Eventually that will happen for the rest of the reset implemented
>> under drivers/clk/meson.
>>
>> It allows to make some code common between the platform reset
>> drivers and the aux ones. It also ease maintainance for both
>> Stephen and Philipp.
>
> I don't understand how this helps: the entire point of using
> an auxiliary device is to separate the lifetime rules of
> the different bits, but by doing the creation of the device
> in the same file as the implementation, you are not taking
> advantage of that at all, but instead get the complexity of
> a link-time dependency in addition to a lot of extra code
> for dealing with the additional device.

My initial rework had the creation in clock (note: that is why I
initially used 'imply', and forgot to update when the creation moved to
reset).

I was asked to move the creation in reset:
https://lore.kernel.org/r/217a785212d7c1a5b504c6040b3636e6.sboyd@kernel.org

We are deviating a bit from the initial regression reported by Mark.
Is Ok with you to proceed with that fix and then continue this discussion
?

>
>      Arnd

-- 
Jerome
