Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB001E525
	for <linux-clk@vger.kernel.org>; Tue,  2 Apr 2024 09:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712050543; cv=none; b=ggfJvjvLz4pwLRQzr00Zf2/NtCc5OoGWVo0td0grmCJC1+G7D8D9zun0fQd2u2YuOjuoTl5u2PCx0/LTxeRWyM3+cmun18B6xum5abYqKpgcEELV8JzOdUVyFaWdE/143GI1fxQa6GW75k6t/QzHYlkSwgbwSBl9fLJPrxtQQBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712050543; c=relaxed/simple;
	bh=f9gGtJ5XnRkBgiXLLDIUwbhuajuBWtDh4xQcAdHy98M=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=rwVxlvfZ2yyjI0s3Mhf9a/n4aX53xMHM/REeJZoOIpVGX7MEPOYzvSmxQtSUQOg6+RtrHaj+jIGbnHUiy1Jv0HQ18rxlj0vWUV/TOUMHmF23xTvg3IZaloKlUP/U1/r4tHZKb54Ls7eUIfx30EatIHfnQj+Ibc6/PfSDF0/MPrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Xkj6mA52; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Xkj6mA52"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33ff53528ceso3554942f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 02 Apr 2024 02:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712050540; x=1712655340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t55JrH3SjWQfNiNN3GlWq9T+unk5wlRC/u7IUzNfWDo=;
        b=Xkj6mA52fijYlp10DL90N8+vKNQ+6BYfI0H6C5iGQqCzKv67xKP7JE862O9/btKu0Y
         bhCGlkhYilq/ZaFRYmbXOB4PpuWwdxYW2cM5rfRVt0MCII8rZdoK1ZJaiB9hXj8V7D3a
         DFoUXx41kFhaP05HgL+C02UzasgVjzW70Hq0CNWW2xmVgnQqNoDFNR6y+h6XaAhzgv4R
         w6GSC+pmKpMLRM3Q+2HnH+NDdaDRA0BzcMSWOTzQFBZIQp4fq5yNFqrTH8mhPgNWBMYS
         EivHd2mgLoMp8WtXM8wSIUlCWi6X5VvASLp6DbK2273HHZXLrNmxpm7ZZxpepl8q6Sur
         CoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712050540; x=1712655340;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t55JrH3SjWQfNiNN3GlWq9T+unk5wlRC/u7IUzNfWDo=;
        b=Vuv6ihavHxn4YXDh8Stc93+0jU3Uib9YR37tLTdAfWcUrzLTIcuydpI7VzyBho8kPG
         XeAYvHKKiTi4FwRD7lxvS7onQvbXQ2m/RjlMi9F5j9Es5z/hlW8F/Yd3OtPWnVsKU2Kn
         AwEk1bOD+1wv9naPu14Jzz8JDnD5Y2NB7YT2On5cyLg1EvGnKaY8ySPmlYdIHHkEvPQB
         lfL+QlEyK7EfarB67Z2srjF1Ki7FO1pyOd29oL7mi/r+zJNkUJUtvoIOaH2xgTAz/+RC
         2E+UKvy4IDMcthA4LP0+79SjUTtWjFTO4eGqXQOArWoeeWCqMlnL1z5Q/XqJCioWgLf8
         4jiA==
X-Forwarded-Encrypted: i=1; AJvYcCUYYPFZcy9yAd5deQ0SZ+4CdCYzpJIiHy54EisNv6v0d8TuBZkDLjXfkIBkjstnX7lkSZGijM+4QJhuSUPdLAF30PUTPox7V8eW
X-Gm-Message-State: AOJu0YyZzPPq8h54VtVCcxPU8yo5ki/25uypIdObVMH6vt8l7I1/kSVH
	OSq2j1dZUra0AXx+vfg5dHFkquGaVA9TmAFjD5f+ZohkfpICjcGG6Je05U8V+IM=
X-Google-Smtp-Source: AGHT+IHhm1TN2m/8h7xq9XVC6c2eoeVECv02Fp+GF4LtMIozj3PFQdmk7yKpQKnxTnferlbKIze4bQ==
X-Received: by 2002:a5d:4c86:0:b0:343:79b4:5371 with SMTP id z6-20020a5d4c86000000b0034379b45371mr89238wrs.69.1712050534961;
        Tue, 02 Apr 2024 02:35:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:db22:d5c9:a527:a4cf])
        by smtp.gmail.com with ESMTPSA id dn13-20020a0560000c0d00b00341b7d5054bsm13754980wrb.72.2024.04.02.02.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 02:35:34 -0700 (PDT)
References: <20240329205904.25002-1-ddrokosov@salutedevices.com>
 <20240329205904.25002-7-ddrokosov@salutedevices.com>
 <CAFBinCCC5KK-4_w41B-+ZJ3zdZckq_EDuAW+Kak2C0Ow8uuD6Q@mail.gmail.com>
 <20240401171237.qoewp2pgcdrqvc3e@CAB-WSD-L081021>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com,
 sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 khilman@baylibre.com, kernel@salutedevices.com, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 6/6] clk: meson: a1: add Amlogic A1 CPU clock
 controller driver
Date: Tue, 02 Apr 2024 11:27:24 +0200
In-reply-to: <20240401171237.qoewp2pgcdrqvc3e@CAB-WSD-L081021>
Message-ID: <1jzfuchztl.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Mon 01 Apr 2024 at 20:12, Dmitry Rokosov <ddrokosov@salutedevices.com> w=
rote:

> Hello Martin,
>
> Thank you for quick response. Please find my thoughts below.
>
> On Sun, Mar 31, 2024 at 11:40:13PM +0200, Martin Blumenstingl wrote:
>> Hi Dmitry,
>>=20
>> On Fri, Mar 29, 2024 at 9:59=E2=80=AFPM Dmitry Rokosov
>> <ddrokosov@salutedevices.com> wrote:
>> [...]
>> > +static struct clk_regmap cpu_fclk =3D {
>> > +       .data =3D &(struct clk_regmap_mux_data) {
>> > +               .offset =3D CPUCTRL_CLK_CTRL0,
>> > +               .mask =3D 0x1,
>> > +               .shift =3D 10,
>> > +       },
>> > +       .hw.init =3D &(struct clk_init_data) {
>> > +               .name =3D "cpu_fclk",
>> > +               .ops =3D &clk_regmap_mux_ops,
>> > +               .parent_hws =3D (const struct clk_hw *[]) {
>> > +                       &cpu_fsel0.hw,
>> > +                       &cpu_fsel1.hw,
>> Have you considered the CLK_SET_RATE_GATE flag for &cpu_fsel0.hw and
>> &cpu_fsel1.hw and then dropping the clock notifier below?
>> We use that approach with the Mali GPU clock on other SoCs, see for
>> example commit 8daeaea99caa ("clk: meson: meson8b: make the CCF use
>> the glitch-free mali mux").
>> It may differ from what Amlogic does in their BSP,
>
> Amlogic in their BSP takes a different approach, which is slightly
> different from mine. They cleverly change the parent of cpu_clk directly
> by forking the cpufreq driver to a custom version. I must admit, it's
> quite an "interesting and amazing" idea :) but it's not architecturally
> correct totally.

I disagree. Martin's suggestion is correct for the fsel part which is
symetric.

>
>> but I don't think
>> that there's any harm (if it works in general) because CCF (common
>> clock framework) will set all clocks in the "inactive" tree and then
>> as a last step just change the mux (&cpu_fclk.hw). So at no point in
>> time will we get any other rate than a) the original CPU clock rate
>> before the rate change b) the new desired CPU clock rate. This is
>> because we have two symmetric clock trees.
>
> Now, let's dive into the specifics of the issue we're facing. I've
> examined the CLK_SET_RATE_GATE flag, which, to my understanding, blocks
> rate changes for the entire clock chain. However, in this particular
> situation, it doesn't provide the solution we need.
>
> Here's the problem we're dealing with:
>
> 1) The CPU clock can have the following frequency points:
>
>   available frequency steps:  128 MHz, 256 MHz, 512 MHz, 768 MHz, 1.01 GH=
z, 1.20 GHz
>
> When we run the cpupower, we get the following information:
> # cpupower -c 0,1 frequency-info
> analyzing CPU 0:
>   driver: cpufreq-dt
>   CPUs which run at the same hardware frequency: 0 1
>   CPUs which need to have their frequency coordinated by software: 0 1
>   maximum transition latency: 50.0 us
>   hardware limits: 128 MHz - 1.20 GHz
>   available frequency steps:  128 MHz, 256 MHz, 512 MHz, 768 MHz, 1.01 GH=
z, 1.20 GHz
>   available cpufreq governors: conservative ondemand userspace performanc=
e schedutil
>   current policy: frequency should be within 128 MHz and 128 MHz.
>                   The governor "schedutil" may decide which speed to use
>                   within this range.
>   current CPU frequency: 128 MHz (asserted by call to hardware)
> analyzing CPU 1:
>   driver: cpufreq-dt
>   CPUs which run at the same hardware frequency: 0 1
>   CPUs which need to have their frequency coordinated by software: 0 1
>   maximum transition latency: 50.0 us
>   hardware limits: 128 MHz - 1.20 GHz
>   available frequency steps:  128 MHz, 256 MHz, 512 MHz, 768 MHz, 1.01 GH=
z, 1.20 GHz
>   available cpufreq governors: conservative ondemand userspace performanc=
e schedutil
>   current policy: frequency should be within 128 MHz and 128 MHz.
>                   The governor "schedutil" may decide which speed to use
>                   within this range.
>   current CPU frequency: 128 MHz (asserted by call to hardware)
>
> 2) For the frequency points 128 MHz, 256 MHz, and 512 MHz, the CPU fixed
> clock should be used.

Apparently, you are relying on the SYS PLL lowest possible rate to
enfore this contraint, which I suppose is 24 * 32 =3D 768MHz. It would be
nice to clearly say so.

> Fortunately, we don't encounter any freeze
> problems when we attempt to change its rate at these frequencies.

That does not sound very solid ...

>
> 3) However, for the frequency points 768 MHz, 1.01 GHz, and 1.20 GHz,
> the sys_pll is used as the clock source because it's a faster option.
> Now, let's imagine that we want to change the CPU clock from 768 MHz to
> 1.01 GHz. Unfortunately, it's not possible due to the broken sys_pll,
> and any execution attempts will result in a hang.

... Because PLL needs to relock, it is going to be off for a while. That
is not "broken", unless there is something else ?

>
> 4) As you can observe, in this case, we actually don't need to lock the
> rate for the sys_pll chain.

In which case ? I'm lost.

> We want to change the rate instead.

... How are you going to do that without relocking the PLL ?

> Hence,
> I'm not aware of any other method to achieve this except by switching
> the cpu_clk parent to a stable clock using clock notifier block.
> Interestingly, I've noticed a similar approach in the CPU clock drivers
> of Rockchip, Qualcomm, and Mediatek.

There is an example of syspll notifier in the g12 clock controller.
You should have a look at it

--=20
Jerome
