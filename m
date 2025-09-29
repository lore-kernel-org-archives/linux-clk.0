Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F11C26B2B0
	for <linux-clk@vger.kernel.org>; Mon, 29 Sep 2025 08:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759135690; cv=none; b=nBBajld5aOqiimC262lPx26E5ZTXTBurBBPy/thFKoMSLFmzwoBt59ZoGgQPyrAGBo4slHCS/9Xc/fdr/QiDXogKgohrafhAUGM5+XJ815eLJykKImLyHJyOzhGtX/i5XmLeFQ/OV949gzm6SQLVs5szr5bGA/kFWl1QcOC3Ob4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759135690; c=relaxed/simple;
	bh=ipcd2RHyYDEBjL29RjOErCJnGZ4m2L37yFw6N1BWRao=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TVxM0Q5ZHna/awmwosnobopRxD7xc/hrTSlLAd1yBePfYkwZ2evLhBPgyYSBPzWICn+LEzjJutEGZSxs8q7k4nZGrflukAkXgxDp6tBmHir9JOk1PhKp/jJUlDiY5zk3IxAuQTaEIOhlCvU6WBkspkZrUdmdCS+wu7eMDBpVnAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CWBqfZO0; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CWBqfZO0"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3f2cf786abeso3125470f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 29 Sep 2025 01:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759135687; x=1759740487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9mWuuUO2oTiIhZB/31OQZAO1jKBhIUPfx0Zm8nC4/A=;
        b=CWBqfZO09hD7C+A5RYxdq+wwvlLx/8umLO3F2S39jkZJztsjqhC9/xYOonURCjA/7p
         a5JuQGUjLFcV/VHBPZkBNKmYE0M0zynfNiy/mu2c/9jQ1OxmzVW/RU1u8xEXQdqowHx5
         T19RVvNyccwA86wpOhabO4xnk+3Gz1vDhfIbCifNzRXJHZ6qL/0S946WiXocLaCQ3HPX
         iDSCr4llp1QcMHddQmd9VtijRVfUsH7fCpofIhwytgsb54vnvZEIKVrICdw+hnQvTULH
         cGfdpMR2q/o3GjZJsXYRluRGVV76yj69O+B+GlhwrW10CxpLf58ESvwzqYicFGGzryHq
         VDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759135687; x=1759740487;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y9mWuuUO2oTiIhZB/31OQZAO1jKBhIUPfx0Zm8nC4/A=;
        b=hNbQKcxYQUegDKKe8vybQ3bIPY97PZgLumWqFF6hGZtWtO83gIVvCecfMixsTbJjQ9
         CidtCV6V1YBLkzBHNEdhm/i/n+zEVnV6N/fhCP25Q2v1lruygCEtYLuynVqN+V/58e/h
         zOQisSeQuHe9/Ld+LKEgvPNbxEdoUd849xX7Tp0SNbzS4AnXHQPI49IhosSP8JRvkXTv
         E/HLD4Wke5SkwKOougaRHJuEWjHy1HUZZnEImDT+73UF9LJi2krOq7225k0+1VA3FtjH
         qikDbOSKfajeRgyuQF1pM4MNxaxNUSVwPxFbqof9wXNTt0FMpqynBZT9Rb8NyhRzVLBX
         cxmg==
X-Forwarded-Encrypted: i=1; AJvYcCUjgSOefUteU84pjjZ9uWJHoQSBjUxNAPa3brig/4gj22C7J1aQg6e0AlhZEDxpRomietdj/oRZl4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YynXTCYAh5s3FT+Zu9DsGRNiMsNGyRdeP3EnV8om2Sfk8DhOx82
	fHOeqfLkZi6fiepuhwed86A4QMH9QVjv+cSjjXYY5ukIivu/mxG5zLJY2Nw3ecFWZb0=
X-Gm-Gg: ASbGncsvFSbI29A2yWpXfBP6lbidpb7U0Rx/3EHA7uenqqVaotlhpUeZtzyaU8wmP08
	5o4oex8zm/C9MgLWQs+JagvjCUX/CwuLaUMhsmUx1geAVdCu6gra3fXURdKYgOw4lkZzvR65C42
	w+oZrrMTcOrGJQSWgsfUMSbD02lgnz6O3663MWjJETWWI9DA9Zzs8T8nJSUaCa4YyEpsjx7YCuv
	W4os17CWre0ur3L+9jDcAT2KSfyK4OBpIdmzX5NS0aovxaZS3KutRdPqlDYGBDL+vhBAL0A9b0e
	Nhfd/YSIIe1JeSYPy95EFBDgO8D5H1TuHyZRTFZ9IhgtBHZRtVx/3T27YO0/0gj6PFRem5nZTuX
	A1KB8QYshnSAfE7K5dqBxslV1cmv3Gt9B
X-Google-Smtp-Source: AGHT+IEuJjQ2ywEf1FmcgUiPlzRMP7EQ4wv/Yzx58fshvg0ascmwTL+/3T4ksUZ0TgAGJ3QGBI0S5Q==
X-Received: by 2002:a05:6000:2586:b0:3ec:ea73:a91e with SMTP id ffacd0b85a97d-40e498b77bfmr13575306f8f.12.1759135686798;
        Mon, 29 Sep 2025 01:48:06 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9891:6c55:82b6:bfe9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-40fb7203b8asm17522265f8f.9.2025.09.29.01.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 01:48:06 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Chuan Liu <chuan.liu@amlogic.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] clk: meson: Fix glitch free mux related issues
In-Reply-To: <CAFBinCCoX5+6+KQAtbhKx9KdSZhXVxS=cz8DfMVhjPX1c0iSPw@mail.gmail.com>
	(Martin Blumenstingl's message of "Sun, 28 Sep 2025 22:55:50 +0200")
References: <20240929-fix_glitch_free-v1-0-22f9c36b7edf@amlogic.com>
	<20240929-fix_glitch_free-v1-2-22f9c36b7edf@amlogic.com>
	<CAFBinCBd5-s6vaBoJNerXavQiHgsv4Fm3v0svUX7geL=kJvVYg@mail.gmail.com>
	<20178015-4075-40e9-bbf4-20ae558c2bef@amlogic.com>
	<1jldyzrv2t.fsf@starbuckisacylon.baylibre.com>
	<e70e9aaa-f448-4f67-9149-cb5970c9bbd6@amlogic.com>
	<9834c7c5-9334-4c78-a2fe-588ff03cf935@amlogic.com>
	<CAFBinCCoX5+6+KQAtbhKx9KdSZhXVxS=cz8DfMVhjPX1c0iSPw@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 29 Sep 2025 10:48:05 +0200
Message-ID: <1jfrc563wa.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun 28 Sep 2025 at 22:55, Martin Blumenstingl <martin.blumenstingl@googl=
email.com> wrote:

> Hello,
>
> On Sun, Sep 28, 2025 at 8:41=E2=80=AFAM Chuan Liu <chuan.liu@amlogic.com>=
 wrote:
>>
>>
>> On 9/28/2025 2:05 PM, Chuan Liu wrote:
>> > Hi Jerome & Martin:
>> >
>> > Sorry for the imprecise description of the glitch-free mux earlier.
>> >
>> > Recently, while troubleshooting a CPU hang issue caused by glitches,
>> > I realized there was a discrepancy from our previous understanding,
>> > so I'd like to clarify it here.
> [...]
>> An example of the clock waveform is shown below:
>>
>>
                     1                  2
                     v                  v
>>         __    __    __    __    __    __    __    __
>> ori:  =E2=86=91  |__=E2=86=91  |__=E2=86=91  |__=E2=86=91  |__=E2=86=91 =
 |__=E2=86=91  |__=E2=86=91  |__=E2=86=91  |__=E2=86=91
>>                    ^
>>                    1 * cycle original channel.
>>         _   _   _   _   _   _   _   _   _   _   _   _
>> new:  =E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=
=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91=
 |_=E2=86=91
>>                                        ^
>>                                        5 * cycles new channel.
>>         __    __                        _   _   _   _
>> out:  =E2=86=91  |__=E2=86=91  |______________________=E2=86=91 |_=E2=86=
=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91
>>               ^                        ^
>>               start switching mux.     switch to new channel.

Ok ... but when is it safe to disable the "ori" clock ?
Can you do it at '1' already ? or do you have to wait for '2' ?


> Thank you for the detailed report!
> This is indeed problematic behavior. I guess the result is somewhat
> random: depending on load (power draw), silicon lottery (quality),
> temperature, voltage supply, ... - one may or may not see crashes
> caused by this.
>
> Based on the previous discussion on this topic, my suggestion is to
> split the original patch:
> - one to add CLK_SET_RATE_GATE where needed (I think the meson8b.c
> driver already has this where needed) to actually enable the
> glitch-free mux behavior
> - another one with the CLK_OPS_PARENT_ENABLE change (meson8b.c would
> also need to be updated) to prevent the glitch-free mux from
> temporarily outputting an electrical low signal. Jerome also asked to
> document the behavior so we don't forget why we set this flag

Yes please split the changes and visit all the controllers shipping this
type of muxes.

>
> Both patches should get the proper "Fixes" tags.

... and proper fixes tag maybe different depending on the controller so
there might more that just 2 changes.

> I think it would also be great if you could include the waveform
> example in at least the commit message as it helps understand the
> problem.
>
> Let's also give Jerome some time to comment before you send patches.
>
>
> Best regards,
> Martin

--=20
Jerome
