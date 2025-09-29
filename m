Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30C0263C9E
	for <linux-clk@vger.kernel.org>; Mon, 29 Sep 2025 12:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759149390; cv=none; b=chs41K/jkVAQ2Vai7N3ceHsL8y2L1Rp9PtMLmAmlWD5/JwxqU4aAP1nU3LKZAkn46qPXdq/J7MSi7uXMgfEWWHybq3XTGe45KrsUcuwRM0yji3qBenMXlNfSMZ+nbHqZiO4v9HpbfKssNstoIfYAL6jW38Xmh9OXfAa92jn+GiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759149390; c=relaxed/simple;
	bh=lbe4TYsEeMKqVuQpR7VHFcFEHlUVlfr2EGTmCNN/Pxs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NzaqFEoXEwsIjzIrap88Lc9/Xb1e8eyplnJYdsS70JgiHG3cX2Mx3q+MTBBXh+T14kVdFaTxhXjajftLoRWvBBQxtDRJ5koJe+7DpRLOojN9bHF6oDX5GZPfFRPxviQzceh18mA7ZNxL+y0IQpCGzq49here/tom4s2yaeD65WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=oDgohOEc; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="oDgohOEc"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e37d6c21eso30300505e9.0
        for <linux-clk@vger.kernel.org>; Mon, 29 Sep 2025 05:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759149386; x=1759754186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5TiAseZcVQOtO3WU44wqIk3ETdplagD04sSEDVxBRM=;
        b=oDgohOEcdcOZWjy/do716ZqdIpvJglD6qhwOYXHaBDoYXtq9UeSd0NV7V7td/Z4PGX
         B6NiqvAxXP6U+lyTdpy1Lx6cpOmJ21NVDjwnzjEtE0qAPc+vW+tmSLA2Zr7q6t501Jzm
         nYz09Euc+MNQnA5wU+7rVPMTCqlZbyMr5wS7JjAuQ/m9BZFOxQwdpPGQHUojE931gB/J
         7a61sBc2WtINrWKxlH8EtrhlK4EvQl6dsIb8kheQXYGs2/NhTklVvdOXvGkUBJdrvLue
         HlcuaYJITKkXMuGYDVFD7MzJ5V++z2bJWUd44wGxS9U5eCayUSHo+sULVCNhf+Y7zRZP
         xv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759149386; x=1759754186;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t5TiAseZcVQOtO3WU44wqIk3ETdplagD04sSEDVxBRM=;
        b=T0RX0mDH6/1228gjacuMEvhO01kEvJLRQfZPHPR6Dc3xm4ZAWOO5I9y5l82hPOja56
         9nL3S7LHrfqW+95oFDtMrWXnJho9mUQa4a5uvLfKXseJdR6ezUTgM5KV+2mPX+V4QjPj
         9Xrh0AAZ8VCTV/1ItEMdWyZQEeIyKN/Z3YFmRhm6EpO4YgyQ6exbjMCevA5SW/wz12MV
         5JBnJsztsxaKjvFW+PW1ceAMOCC/gUTYixXtm+km3pKbZxGtpK1jodIglEgTkaO5Qu0Y
         UMp7L/ksz2laF49v9NBQmRXGZqqSRP03vDEsvdkYQm8QnxGLeslFw65nvE0bO0CQeGMD
         5hbw==
X-Forwarded-Encrypted: i=1; AJvYcCXFBkGTAAeRo2Z86zZa0azhOkKOVL3VMVibtyBDnkwtsk+PYXlMhw8EmUM71c+3B5K9JnGSUij693g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWy3ypZba1EWOHqxwlqhg/uHixUSa6lUnd6SkL1uPyJ1J/ORd1
	PH1bj9DaP4pW2EKxYaRoxCmdjAcKdq5zO38/FWOLuQ27V9oxeWDzZ676Mrw0g7Ovb54=
X-Gm-Gg: ASbGncsf8Spn1aSZVb9gMgXrX7oV7Qy5xwHBtfMcKSAwDD30dQWMuIQ52ExFf6+2Ik9
	GowM38tV+gWGN+Yaw2AlYooToTU+SxHTt57MFgYnomV0bFxS/MhCG9XWgqAj4I+nSlKsglrFF32
	whOjUNPMAmPMvDIbRinY0gOEn/JPvAN4EBC5EWEKjTqaUdfzd/3WdpPhUWG4p+n9bo1rnx3YOIS
	FYGjIu7tDcW2sOAQB3lP4pbYKfE2dt2RkId/671rKNvKGwMSVOrmHp2HmOyRAHid9IIlv7GwuFO
	7/hzvDjVxwm4FgF1QSIA2PAo0muMenu3yn5vWO0SxlLF5tOS9xWLfkjFSkZ7M167SWCLA10YNCJ
	frjnO/Q1YBQC4d3hF/MfpljDIANhlQBw=
X-Google-Smtp-Source: AGHT+IHo0QKRizwsJhQ5D0tkdyBpVp2YHvhvxBq16FZ5DocejNzdXKBFoyHjJt0irT3wdJx8Oxn2bA==
X-Received: by 2002:a05:600c:4453:b0:46d:cfc9:1d20 with SMTP id 5b1f17b1804b1-46e329fa931mr124081375e9.22.1759149385782;
        Mon, 29 Sep 2025 05:36:25 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9ad:4617:2761:d4d0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e2a9af27dsm229660415e9.8.2025.09.29.05.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 05:36:25 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,  Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] clk: meson: Fix glitch free mux related issues
In-Reply-To: <eee93d9d-2977-449d-8792-b2416f0c09ad@amlogic.com> (Chuan Liu's
	message of "Mon, 29 Sep 2025 11:15:46 +0800")
References: <20240929-fix_glitch_free-v1-0-22f9c36b7edf@amlogic.com>
	<20240929-fix_glitch_free-v1-2-22f9c36b7edf@amlogic.com>
	<CAFBinCBd5-s6vaBoJNerXavQiHgsv4Fm3v0svUX7geL=kJvVYg@mail.gmail.com>
	<20178015-4075-40e9-bbf4-20ae558c2bef@amlogic.com>
	<1jldyzrv2t.fsf@starbuckisacylon.baylibre.com>
	<e70e9aaa-f448-4f67-9149-cb5970c9bbd6@amlogic.com>
	<9834c7c5-9334-4c78-a2fe-588ff03cf935@amlogic.com>
	<CAFBinCCoX5+6+KQAtbhKx9KdSZhXVxS=cz8DfMVhjPX1c0iSPw@mail.gmail.com>
	<eee93d9d-2977-449d-8792-b2416f0c09ad@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 29 Sep 2025 14:36:24 +0200
Message-ID: <1ja52d5tbr.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon 29 Sep 2025 at 11:15, Chuan Liu <chuan.liu@amlogic.com> wrote:

> Hi Martin:
>
> Thanks for the detailed explanation.
>
>
> On 9/29/2025 4:55 AM, Martin Blumenstingl wrote:
>> [ EXTERNAL EMAIL ]
>>
>> Hello,
>>
>> On Sun, Sep 28, 2025 at 8:41=E2=80=AFAM Chuan Liu <chuan.liu@amlogic.com=
> wrote:
>>>
>>> On 9/28/2025 2:05 PM, Chuan Liu wrote:
>>>> Hi Jerome & Martin:
>>>>
>>>> Sorry for the imprecise description of the glitch-free mux earlier.
>>>>
>>>> Recently, while troubleshooting a CPU hang issue caused by glitches,
>>>> I realized there was a discrepancy from our previous understanding,
>>>> so I'd like to clarify it here.
>> [...]
>>> An example of the clock waveform is shown below:
>>>
>>>
>>>          __    __    __    __    __    __    __    __
>>> ori:  =E2=86=91  |__=E2=86=91  |__=E2=86=91  |__=E2=86=91  |__=E2=86=91=
  |__=E2=86=91  |__=E2=86=91  |__=E2=86=91  |__=E2=86=91
>>>                     ^
>>>                     1 * cycle original channel.
>>>          _   _   _   _   _   _   _   _   _   _   _   _
>>> new:  =E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=
=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=
=91 |_=E2=86=91
>>>                                         ^
>>>                                         5 * cycles new channel.
>>>          __    __                        _   _   _   _
>>> out:  =E2=86=91  |__=E2=86=91  |______________________=E2=86=91 |_=E2=
=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91
>>>                ^                        ^
>>>                start switching mux.     switch to new channel.
>> Thank you for the detailed report!
>> This is indeed problematic behavior. I guess the result is somewhat
>> random: depending on load (power draw), silicon lottery (quality),
>> temperature, voltage supply, ... - one may or may not see crashes
>> caused by this.
>
>
> Yes, our glitch-free mux is designed to prevent glitches caused by
> excessively short high or low levels in the clock output.
>
>
>>
>> Based on the previous discussion on this topic, my suggestion is to
>> split the original patch:
>> - one to add CLK_SET_RATE_GATE where needed (I think the meson8b.c
>> driver already has this where needed) to actually enable the
>> glitch-free mux behavior
>> - another one with the CLK_OPS_PARENT_ENABLE change (meson8b.c would
>> also need to be updated) to prevent the glitch-free mux from
>> temporarily outputting an electrical low signal. Jerome also asked to
>> document the behavior so we don't forget why we set this flag
>>
>> Both patches should get the proper "Fixes" tags.
>> I think it would also be great if you could include the waveform
>> example in at least the commit message as it helps understand the
>> problem.
>>
>> Let's also give Jerome some time to comment before you send patches.
>
>
> A V2 version was submitted later with changes based on your suggestions.
> Regarding the "Fixes" tag, Jerome had proposed some modifications.
>
> [PATCH v2 0/3] clk: Fix issues related to CLK_IGNORE_UNUSED failures and
> amlogic glitch free mux - Chuan Liu via B4 Relay
> <https://lore.kernel.org/all/20241111-fix_glitch_free-v2-0-0099fd9ad3e5@a=
mlogic.com/>
>

The comments I've provided on this still stands.

>
> Adding CLK_OPS_PARENT_ENABLE causes the CLK_IGNORE_UNUSED configuration
> of it's parent clocks on the chain to become ineffective, so this patch
> depends on fixing that issue before it can proceed.

Unused clocks are NOT a configuration.

They are by-product of the bootloader. You cannot rely on them. If
anything depends on them, you have a(nother) problem to solve.=20

>
>
> Jerome and I have submitted patches to address the issue of
> CLK_IGNORE_UNUSED becoming ineffective. I originally planned to wait
> for progress on this patch and then incorporate Jerome's feedback before
> sending the V3 version.

I've provided a suggestion but this something happening in clock core.
I suggest that you split this out of your series so things that need to
go through Stephen are not mixed with Amlogic stuff.

But again, you cannot rely on the state of clock just because it has
CLK_IGNORE_UNUSED:

* Nothing says it is enabled to begin with
* Nothing says it will stay on if a consumer comes and goes
* ... and yes, it does not survive CCF usage checking down the road.

It is unreliable and it is not meant to be more than that, AFAIK

>
> Hi Jerome, sorry if this caused any misunderstanding on your part; I
> will provide timely feedback moving forward.
>
>
>>
>>
>> Best regards,
>> Martin

--=20
Jerome
