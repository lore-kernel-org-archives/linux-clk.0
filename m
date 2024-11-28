Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4B91BD039
	for <linux-clk@vger.kernel.org>; Thu, 28 Nov 2024 15:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732809230; cv=none; b=H1xKLOkt37n4BP6Eze88S3fP7Zmrff+LUu/WyunmnA6zs4HVU4YJPP7UsqdpcrvhL4T20wwx/LE7alplbtgYVCs4zkVRzin525bQa26X/pSYT8i5Pi0nfT6CwRniAV8Wcrn1E/4PkYCjetWrED6yc45KjaDvez839mkZlilL+tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732809230; c=relaxed/simple;
	bh=W0nbNECqaoQgQy8wCcT3w89EsIp4bVSjckOvFyN+LiY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=m9XmC50HbYINsqnFzYbudxHEBnzBrdXNOk0GlaL5T16BX81TEeQFHMyNdo2Nv660Sfwxpai6DlZWLXfocoQ22lUuwILfxHYWma/MTKhoD7SrdGab+jRS3Lt32jSHGmgVUb3LpwImiLzSZCzKUiSCs/fFT4qb/nkn6BQN3xF5zfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=rPgJGwDS; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rPgJGwDS"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434a83c6b01so8520615e9.0
        for <linux-clk@vger.kernel.org>; Thu, 28 Nov 2024 07:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732809227; x=1733414027; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qJcLS7Y+TNZg8kTiOzR+IwHTehRXvL7IIhIVM5JxoUs=;
        b=rPgJGwDSagSjg3rwMDWPAjXFUZGP4uXbrnvLSe5OPy/p0SFIHy9NPRJfYtQWwvWpAo
         PuDsAxU+ZBomCoz4oIeqH6K2oTFmyczehToqlNFKQ5zM9HjptliYNRyjRPIplWx5NHkP
         PRKtmAO9eFCEsbTmfxH41OBdj/t/dHpszPk+oBP5dlrF95oLxZtBz7pfcL6zUo0AS9Bf
         eA0eaWZU/OtRjSGaHV7IlkviTWzplHqdCdypNJiXE3cek6wvbzpAgiXOK1fDKt3e60Kt
         nlVdaef9EfIDelt0PyFLlK3CvCNPftFYPgNRabubC0CIIXXYgICTcRjdBBjmmwxedANL
         XBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732809227; x=1733414027;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJcLS7Y+TNZg8kTiOzR+IwHTehRXvL7IIhIVM5JxoUs=;
        b=Sd4fiVcmxK/XJ9t5/qoX41d+GojllaTY9smnjejvHWKi+ewWhR7IY8/TIAjr3oQbaY
         DleFKEqwfn9LC9bKnVJmTH33Z/aj7D/jLOATwDOlYOukm6zGM/e0IeSXNUrVlNyIo7z7
         SKsEl8Uvgq4ELi3Hy1WQpwqlEhDT3eiwkZ3I6UgwK8C20YmgsljfMZMFzgL9LfF+ivbc
         V5bUcVH6wQl6WZMw3bPZlr+8s3uQpqW18/u9mEuiHsBAwtfPr+In9w9dXQb3op60e+VV
         OyGa8LJTmbmy+VqzU6G3ZIKhaEqxJjrxg8CukmnyIw8lam/Ooz5A928VoFE9vQc4S92k
         9HjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHsHZ24Lm4NMw3QIdOGGqOl0Tk2xUl+toDOc56YcH2ygg96mzsiERMGgpR9641/OCW13X96jhTovY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzex121ff8orW+jLVHexqsiHFvUAfb8TpaMqr1J7DegXc1PzcMf
	HmWKLEHVsv9jCYfNXKhx8lVLqlVLml5v7IDze5s34/s+Ny5Y10RDeTJnlvaR524=
X-Gm-Gg: ASbGnctDgD5uqTIARllx7fEVFxZ+U72AjnEaeX8s2NUTvh6aOCKUniqBQ+6S88Khdw6
	Qx10PezbwS8D8YQ/8mnF3zD4YB86znnmSOHpqI6ZL0h/Sv6s29NknuU6o5+nIk0bkqE2Kv8GAQt
	oLzMmBMgM53FYNSRL1KZM/RN58TtAZNAMusC8F5fsOMT1Fv+OUqT3LxXZQpxuceHd4YRcPyw8em
	xyYrsI5MRGw4gh5f07xKTivcOpF8rZeV8nyeVIFeHgcsqU0ZA==
X-Google-Smtp-Source: AGHT+IGniJq3jqV+EYYIMc2ZyU15P38lX7DI3pP8iwwIHzl+aDRDGlHZnT2XwseXds/67vDoiz4FKQ==
X-Received: by 2002:a05:600c:4747:b0:434:a07d:b709 with SMTP id 5b1f17b1804b1-434a9dfc3d4mr61829395e9.29.1732809226700;
        Thu, 28 Nov 2024 07:53:46 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b89d:29e9:7047:2d6f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa76b52bsm57165365e9.18.2024.11.28.07.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 07:53:46 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>,  "Michael Turquette"
 <mturquette@baylibre.com>,  "Stephen Boyd" <sboyd@kernel.org>,  "Kevin
 Hilman" <khilman@baylibre.com>,  "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  "Mark Brown" <broonie@kernel.org>
Subject: Re: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
In-Reply-To: <ce67e512-a15b-4482-8194-b917096f4eeb@app.fastmail.com> (Arnd
	Bergmann's message of "Thu, 28 Nov 2024 16:34:46 +0100")
References: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com>
	<12f29978-c8ce-4bee-a447-dcd086eb936d@app.fastmail.com>
	<1ja5dk2y5l.fsf@starbuckisacylon.baylibre.com>
	<f8de4a2a-776f-4c10-b75e-e845bcc38dde@app.fastmail.com>
	<1j4j3r32ld.fsf@starbuckisacylon.baylibre.com>
	<306b0b30-5a32-4c7c-86b4-57d50e2307e8@app.fastmail.com>
	<1jy1131kxz.fsf@starbuckisacylon.baylibre.com>
	<c06317c6-b2b2-4b6d-96e4-0c2cfc6846de@app.fastmail.com>
	<1jplmf1jqa.fsf@starbuckisacylon.baylibre.com>
	<ce67e512-a15b-4482-8194-b917096f4eeb@app.fastmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 28 Nov 2024 16:53:45 +0100
Message-ID: <1jjzcn1hiu.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 28 Nov 2024 at 16:34, "Arnd Bergmann" <arnd@arndb.de> wrote:

> On Thu, Nov 28, 2024, at 16:06, Jerome Brunet wrote:
>> On Thu 28 Nov 2024 at 15:51, "Arnd Bergmann" <arnd@arndb.de> wrote:
>>> On Thu, Nov 28, 2024, at 15:39, Jerome Brunet wrote:
>>>> On Thu 28 Nov 2024 at 15:11, "Arnd Bergmann" <arnd@arndb.de> wrote:
>>>> Eventually that will happen for the rest of the reset implemented
>>>> under drivers/clk/meson.
>>>>
>>>> It allows to make some code common between the platform reset
>>>> drivers and the aux ones. It also ease maintainance for both
>>>> Stephen and Philipp.
>>>
>>> I don't understand how this helps: the entire point of using
>>> an auxiliary device is to separate the lifetime rules of
>>> the different bits, but by doing the creation of the device
>>> in the same file as the implementation, you are not taking
>>> advantage of that at all, but instead get the complexity of
>>> a link-time dependency in addition to a lot of extra code
>>> for dealing with the additional device.
>>
>> My initial rework had the creation in clock (note: that is why I
>> initially used 'imply', and forgot to update when the creation moved to
>> reset).
>>
>> I was asked to move the creation in reset:
>> https://lore.kernel.org/r/217a785212d7c1a5b504c6040b3636e6.sboyd@kernel.org
>>
>> We are deviating a bit from the initial regression reported by Mark.
>> Is Ok with you to proceed with that fix and then continue this discussion
>> ?
>
> I really don't want to see those stray 'select' statements
> in there, as that leave very little incentive for anyone to
> fix it properly.
>
> It sounds like Stephen gave you bad advice for how it should
> be structured, so my best suggestion would be to move the
> the problem (and the reset driver) back into his subsystem
> and leave only a simple 'select RESET_CONTROLLER'.

Okay, though I don't really understand why that select is okay and not
the the proposed one. There is apparently a subtility I'm missing I'd
like to avoid repeating that.

>
> From the message you cited, I think Stephen had the right
> intentions ("so that the clk and reset drivers are decoupled"),
> but the end result did not actually do what he intended
> even if you did what he asked for.
>
> Stephen, can you please take a look here and see if you
> have a better idea for either decoupling the two drivers
> enough to avoid the link time dependency, or to reintegrate
> the reset controller code into the clk driver and avoid
> the complexity?

If I may,

* short term fix: revert both your fix and the initial clock
  change that needed fixing. That will essentially bring back the reset
  implementation in clock.

* after that: remove the creation part from driver/reset and bring back
  something similar to what was proposed in the initial RFC for the
  creation and finally switch the clock driver back to it.
  That should provide the proper decoupling your are requesting I think.

>
>       Arnd

-- 
Jerome
