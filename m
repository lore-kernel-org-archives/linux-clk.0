Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8DC301027
	for <linux-clk@vger.kernel.org>; Mon, 29 Sep 2025 12:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759150526; cv=none; b=r9ACIVHVGTdHpifKuhmSaNi2ZSrcjHscGoaVmRWb+zckrW70sLX0Wdv3oHnda09agQNf9lkWN7374asj8TQdHAryHKGeqF4VCEnZ4sw5ir7U7Pe822XUa6hYk7Y3q9UDDnIlNT5f8EBbkrbd0xa2tOtR2YHzeUzyGpgUni5MctM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759150526; c=relaxed/simple;
	bh=jrwBbbXXDaBjS/wd/tHW0cdSBXmArxaZRUoB6beYLM0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aeNApdNwb37oHoeVgiYVtBrpoDAWqb0BxTtuhKn/suf8cUOUA6JeQKIquCTmgLT5n21MMwSBEh3sOcqLEygleaETDPnuzdmjsMkUe2KaBOStRgB9TlMHBPFQ2JSoorpedYTGQUt5kbOOpqeowyssg0Lebxum9FWjtu4wKfZKTlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Eu1ilJTh; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Eu1ilJTh"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e37d6c21eso30455385e9.0
        for <linux-clk@vger.kernel.org>; Mon, 29 Sep 2025 05:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759150522; x=1759755322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4AJhIRDhtQztFOcWyZbbOIS6wbTlWTjViXERoklQ24=;
        b=Eu1ilJThNuzLjztuSWjmFDwpen6iRw7wG6Be4GmbZHmj/kq2XcTPMTvyqPiAZ2edGq
         5RjvDB6aAps+v/MkIDHGseMgmlFO4wndRP0BxpVheCf5CuXoSSnGrxSzlbPnhtBBC4Q5
         w1pctru5Q5xT7MWW71HI0sdber0zQe2xTpdsGnH867GEfxts+z6RZ7U4eiV/umMS3jxv
         kVBQchw9ocdImE4k/SQ4pmOIWaRwL/8Gc6dXLkX8RslT7nA43vhiRoIl1Pel4uHET6en
         rv1QLZtg40F3Nbu7cHY/my4uik4C5zUWNZy+lBSQgkR10jSygRtwySZiPOu2NlVzXuyn
         O05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759150522; x=1759755322;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p4AJhIRDhtQztFOcWyZbbOIS6wbTlWTjViXERoklQ24=;
        b=ZydO92t21qWfppBv5u4gCpECKiIqhw35DCeedSsmFU9Sfb0bA+l/+whlnToYiJCu5f
         uxtl1UvKe7QcTAq0Vf3HKbAHyM9lkDXZ1oQZ5kvviu1lnpcMFCHNyxOFMBsCwziG9gJ9
         JGuxT74ztlbGdEGbDd/D5EaIG0k4KqME7ZN66zZWUS991kjXLRMaUtiDdNwUwwcVSAvD
         pZhHvnKexrQKZFYk1kr2r0a3mo9x3WLMxpyWa4FNCuRwZP1PgBlvg4HPK+dQfgl2AlYY
         OBRJxitE8SP+NFZVuy6ihYKEaJzsc0DFvVe3eFerFKYLkBmfGKVIkyP/NTAi/vzyACxN
         NKUg==
X-Forwarded-Encrypted: i=1; AJvYcCVp+gmDbHk4EM4EzNre3Uu/96weKu1HbVckrHA2wNM+ShkX4E2/ag3EOC6kKsoEVf5pBMt/vl9bi+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzprwXlo7lMtBEAafSA2R3tYK7bU0HPDY0dp6oPrK7FhriofC31
	Wg+kmhTPEi0whocvt8BqiNdzZtlx3/cmzDqYvmL8MF9xX6jlZsSiuFdXadXbV8ZD8QI=
X-Gm-Gg: ASbGncsXq6aRlqA4Tg0Aagf0jvUdnkrojIo/9Wq4MnjsiJtZsouhAl/4uNkOnub/uG5
	jHIg22qwQom/cs4h4nibD/03QmXD570gdnTu53XqTdiVvYKRpxiBSKBX4erq5mwS6VokU438gUu
	RrmZ0BFxRQcFFqtsUiSrBx/kJPXBT7GlymCavllehNUxtIf1npikqGvsLfwdScuV436qEuIzKRA
	c7iP9QVuuXEExADumYXH5fUzq45qA5LtN25FNGDFby8rvae/UW7j/fLLIeHn8w7tVC4JP8HSjNT
	ByP6J0/Lv1rSb+2wLp67R6oSl5cosyA86e8hqWYUkID7Nho0jL9S6J8PqkqLyO73gWklm8BcoRC
	Lotx8j3aRw2KbbQgGCWeazdkLOsrpZBA=
X-Google-Smtp-Source: AGHT+IFVFN0XLFy2t2r8lsVdrqYeMn/8TCLqXkS7DTElSFf2//cTI3KRbqZwOsdLupaXoEn5NrWF2w==
X-Received: by 2002:a05:600c:3b23:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-46e32dd1cbemr151873375e9.7.1759150522095;
        Mon, 29 Sep 2025 05:55:22 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9ad:4617:2761:d4d0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e56f64849sm12304965e9.11.2025.09.29.05.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 05:55:21 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,  Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] clk: meson: Fix glitch free mux related issues
In-Reply-To: <36cd6282-ae1d-43f3-8738-592f043d0ba6@amlogic.com> (Chuan Liu's
	message of "Mon, 29 Sep 2025 17:31:07 +0800")
References: <20240929-fix_glitch_free-v1-0-22f9c36b7edf@amlogic.com>
	<20240929-fix_glitch_free-v1-2-22f9c36b7edf@amlogic.com>
	<CAFBinCBd5-s6vaBoJNerXavQiHgsv4Fm3v0svUX7geL=kJvVYg@mail.gmail.com>
	<20178015-4075-40e9-bbf4-20ae558c2bef@amlogic.com>
	<1jldyzrv2t.fsf@starbuckisacylon.baylibre.com>
	<e70e9aaa-f448-4f67-9149-cb5970c9bbd6@amlogic.com>
	<9834c7c5-9334-4c78-a2fe-588ff03cf935@amlogic.com>
	<CAFBinCCoX5+6+KQAtbhKx9KdSZhXVxS=cz8DfMVhjPX1c0iSPw@mail.gmail.com>
	<1jfrc563wa.fsf@starbuckisacylon.baylibre.com>
	<36cd6282-ae1d-43f3-8738-592f043d0ba6@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 29 Sep 2025 14:55:20 +0200
Message-ID: <1j1pnp5sg7.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon 29 Sep 2025 at 17:31, Chuan Liu <chuan.liu@amlogic.com> wrote:

> On 9/29/2025 4:48 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On Sun 28 Sep 2025 at 22:55, Martin Blumenstingl
>> <martin.blumenstingl@googlemail.com> wrote:
>>
>>> Hello,
>>>
>>> On Sun, Sep 28, 2025 at 8:41=E2=80=AFAM Chuan Liu <chuan.liu@amlogic.co=
m> wrote:
>>>>
>>>> On 9/28/2025 2:05 PM, Chuan Liu wrote:
>>>>> Hi Jerome & Martin:
>>>>>
>>>>> Sorry for the imprecise description of the glitch-free mux earlier.
>>>>>
>>>>> Recently, while troubleshooting a CPU hang issue caused by glitches,
>>>>> I realized there was a discrepancy from our previous understanding,
>>>>> so I'd like to clarify it here.
>>> [...]
>>>> An example of the clock waveform is shown below:
>>>>
>>>>
>>                       1                  2
>>                       v                  v
>>>>          __    __    __    __    __    __    __    __
>>>> ori:  =E2=86=91  |__=E2=86=91  |__=E2=86=91  |__=E2=86=91  |__=E2=86=
=91  |__=E2=86=91  |__=E2=86=91  |__=E2=86=91  |__=E2=86=91
>>>>                     ^
>>>>                     1 * cycle original channel.
>>>>          _   _   _   _   _   _   _   _   _   _   _   _
>>>> new:  =E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=
=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=
=91 |_=E2=86=91
>>>>                                         ^
>>>>                                         5 * cycles new channel.
>>>>          __    __                        _   _   _   _
>>>> out:  =E2=86=91  |__=E2=86=91  |______________________=E2=86=91 |_=E2=
=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91
>>>>                ^                        ^
>>>>                start switching mux.     switch to new channel.
>> Ok ... but when is it safe to disable the "ori" clock ?
>> Can you do it at '1' already ? or do you have to wait for '2' ?
>
>
> It should wait for "2", because there is a state machine in the
> glitch-free mux, this state machine is driven by the working clock
> provided by its channel 0.

Then I don't think the 2 flags are enough to make it safe

Nothing guarantees that CCF will wait for those 5 cycles to turn off
the clock noted 'ori' above.

I think you need new specific ops for this mux

Something that would
* protect both parents before changing the mux
* do the actual change
* wait for it to settle
* remove the protection

>
>
>>
>>> Thank you for the detailed report!
>>> This is indeed problematic behavior. I guess the result is somewhat
>>> random: depending on load (power draw), silicon lottery (quality),
>>> temperature, voltage supply, ... - one may or may not see crashes
>>> caused by this.
>>>
>>> Based on the previous discussion on this topic, my suggestion is to
>>> split the original patch:
>>> - one to add CLK_SET_RATE_GATE where needed (I think the meson8b.c
>>> driver already has this where needed) to actually enable the
>>> glitch-free mux behavior
>>> - another one with the CLK_OPS_PARENT_ENABLE change (meson8b.c would
>>> also need to be updated) to prevent the glitch-free mux from
>>> temporarily outputting an electrical low signal. Jerome also asked to
>>> document the behavior so we don't forget why we set this flag
>> Yes please split the changes and visit all the controllers shipping this
>> type of muxes.
>>
>>> Both patches should get the proper "Fixes" tags.
>> ... and proper fixes tag maybe different depending on the controller so
>> there might more that just 2 changes.
>>
>>> I think it would also be great if you could include the waveform
>>> example in at least the commit message as it helps understand the
>>> problem.
>>>
>>> Let's also give Jerome some time to comment before you send patches.
>>>
>>>
>>> Best regards,
>>> Martin
>> --
>> Jerome

--=20
Jerome
