Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8719D369215
	for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 13:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768829235; cv=none; b=aTl4S+fSCXpvuXSstittHFtQ98jJKbjS5ZQLuGrXM1KdAZPPszvYSa6hFPvUsZhnAEhJjoNAbON9aIQq/iDPWd+zPRMe2/3BUlaAhdK8MrBrLSKeXcdkOe6XP3Wr03cvPPjeef8BZMPN0qc19BdYyPsReTsGFehHTHSG8OlDRVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768829235; c=relaxed/simple;
	bh=y4ke/+OyygqynnXX/H59Fqon7GhU3naLqveuRutNem0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Fn+SJ8niUkxKNfyv/K5dGcDSKD7Y/BXnW0Fte3IMHZGQVm7EfeFNgtBuahb4vwpvOPNv1J9dJHH+GsTZGNGPSUFh+iT68NszqM+KtpL1NuDICAY707aysKDMPuVTxFjbV7KfimRMSqmHn5HEb/AOT9weB3Ssk5nN3QrTzL5wf/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=yvt1z8CN; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yvt1z8CN"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4801c731d0aso24176375e9.1
        for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 05:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768829232; x=1769434032; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eCbuiYjGuVvlbB4vqWDSqvvIfZr+F+0/4EzDwihuPK4=;
        b=yvt1z8CNR9CgTzNnVsQj4D0zkhW44gI0GFU50nZ0SE5TC5A+slFsEQ+YuCQQRBsWcI
         kDl4DQgJ1hNO8i9C7JoABsh+WIvh5llU/oGHHjVFy+bkpnXB7FP5We6yD/il93u5T0oD
         TWWG8FkK+ECUfprzI618TP6l4QQXv9L50BD1454I2Orn5uxt9HL729rgFqZFvuC1E4MW
         5lKNaGh/T2Se6H+aYP1hhxP0fmr4GH7DFy2xftheZiyk8paq9PSu48B9hKdwxv0DsdVP
         eidoc8Ezrt+L0h6QIEF3VULgDdJF5Kvt5OBbtF6bMa8RXSMx7dyTxABrrR37PBYuadnP
         /jNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768829232; x=1769434032;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eCbuiYjGuVvlbB4vqWDSqvvIfZr+F+0/4EzDwihuPK4=;
        b=mgxSaQsfDvSJs3+yeFtK+lxxH/99uyOAZq0zunYa4ondhIjs0FJMl9YmvuVPk/kwEZ
         SdFsk7kPrhjFd6zEz8+kcsWjWGmmrRFxmUuykdxNDvPsCzc8tloD/Zc0m004qugObVgn
         1XzGzjd6hWxTxjOsJSns5nqUKOpp+zEtP7NsZdOdMBLpvkmtXS06WkdMFbHpsHFiur+t
         FLX7JRbAHxKL93hIaAfTYcTCdwdL5Ys80MtkAMozT0IiwGOPfqkEdmcet4JMeCWa/+S2
         dDseflesUt+EZUWszfLFiuTlIagvAmbSMAoDywaBW99DNQpq6uvm4WfHyhZUFW11JG3A
         t43g==
X-Forwarded-Encrypted: i=1; AJvYcCUuPweR9O19Mh68CpJFjibqDVGr1mEhvplHlakpyQnjtz5BLlfInW9Cy8SBM5K9C0yzy93WUknAPI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCbyEYvihTQrygLgZeTF/BD7o6xPCF7dk4V4eLVOSBZxToFd1g
	n29nJoZHdGcmr2pGGbHQrG01MVgYZABw5tZlS23fYnwRLUzCFxJ0Pz+6fNeZblvGay4=
X-Gm-Gg: AY/fxX7qtC6g9MlWwfjEKB7FfXSXwTb+UqOSr+NASfgOwJ4b7ksArwaiTjf7v15qiWY
	BSDiaHv4UGmMOC4o1u9kk7N4JwUakNuUaS+GEgqAQ1CG+zBxrTHn378Cc54OgJn019rRXVDziXM
	AheVH+prvdXW5+f2FFBhDwKO8yONqSjz3v+2kqsemOB3fTLy5ADasGv1JEcVoRLzJUaYKmAQJWZ
	MegV6+Iz+nNNc82nwzrSKh92MS/AiBzjIM2voKbbmE0VIaJ7MhSLyqNUbtzsnFqwhkfp4tNAZYb
	08gtle2MTHmhDOry9SRWFdiA134+2+u9ubDDm1AVK/5EFfBMyco91NDGSvVZxfVqdquwdCTwWsY
	DBdc14/AJhV8zbwuCUGN00InRMPGk4Va3cQtjntWoSRRLYkaD+6hSbiu48MStjHEQWiryBZ6zGY
	p/YCdTHlYeqg==
X-Received: by 2002:a05:600c:8b67:b0:47d:3ffb:16c9 with SMTP id 5b1f17b1804b1-4801e342091mr114088625e9.23.1768829231748;
        Mon, 19 Jan 2026 05:27:11 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:4154:6ad6:c781:df9c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4801e8c0499sm197706815e9.9.2026.01.19.05.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 05:27:11 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 5/8] clk: amlogic: Add A5 clock peripherals
 controller driver
In-Reply-To: <ea7e209d-cd30-4d93-9deb-104aaf7c92eb@amlogic.com> (Chuan Liu's
	message of "Mon, 19 Jan 2026 20:16:19 +0800")
References: <20260108-a5-clk-v5-0-9a69fc1ef00a@amlogic.com>
	<20260108-a5-clk-v5-5-9a69fc1ef00a@amlogic.com>
	<1jecnsr1eg.fsf@starbuckisacylon.baylibre.com>
	<ea7e209d-cd30-4d93-9deb-104aaf7c92eb@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 19 Jan 2026 14:27:09 +0100
Message-ID: <1jbjipviky.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On lun. 19 janv. 2026 at 20:16, Chuan Liu <chuan.liu@amlogic.com> wrote:

> Hi Jerome,
>
> On 1/14/2026 5:25 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>> On jeu. 08 janv. 2026 at 14:08, Chuan Liu via B4 Relay
>> <devnull+chuan.liu.amlogic.com@kernel.org> wrote:
>> 
>>> +static struct clk_regmap a5_rtc_clk = {
>>> +     .data = &(struct clk_regmap_mux_data) {
>>> +             .offset = RTC_CTRL,
>>> +             .mask = 0x3,
>>> +             .shift = 0,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data) {
>>> +             .name = "rtc_clk",
>>> +             .ops = &clk_regmap_mux_ops,
>>> +             .parent_data = a5_rtc_clk_parents,
>>> +             .num_parents = ARRAY_SIZE(a5_rtc_clk_parents),
>>> +             .flags = CLK_SET_RATE_NO_REPARENT,
>>> +     },
>>> +};
>>> +
>>> +#define A5_PCLK(_name, _reg, _bit, _pdata, _flags)                   \
>>> +struct clk_regmap a5_##_name = {                                     \
>>> +     .data = &(struct clk_regmap_gate_data) {                        \
>>> +             .offset = (_reg),                                       \
>>> +             .bit_idx = (_bit),                                      \
>>> +     },                                                              \
>>> +     .hw.init = &(struct clk_init_data) {                            \
>>> +             .name = #_name,                                         \
>>> +             .ops = &clk_regmap_gate_ops,                            \
>>> +             .parent_data = (_pdata),                                \
>>> +             .num_parents = 1,                                       \
>>> +             .flags = (_flags),                                      \
>>> +     },                                                              \
>>> +}
>> I wonder why I bothered reviewing v4 ...
>
> Regarding the comment you made on V4, my understanding is that you were
> just teasing ...

You are redefining the PCLK here, the *exact* type of pointless differences
we've worked last year to remove. This is something you can't have
missed since you've complained about it taking too long.

And now, you've thought I was "just teasing" about it ?

I'm bored with your botched submissions Chuan.

> In the next revision, I will change this part to use a
> unified macro.

Yes please.

>
> We may also consider adjusting the "MESON_PCLK" macro later by removing the
> SoC prefix from the clock name,

No

> so that it is consistent with the naming
> style used by "MESON_COMP_SEL" / "MESON_COMP_DIV".
>

Just do the same as c3 and t7.

>> 
>>> +
>>> +static const struct clk_parent_data a5_sys_pclk_parents = { .fw_name = "sysclk" };
>>> +
>>> +#define A5_SYS_PCLK(_name, _reg, _bit, _flags) \
>>> +     A5_PCLK(_name, _reg, _bit, &a5_sys_pclk_parents, _flags)
>>> +
>>> +static A5_SYS_PCLK(sys_reset_ctrl,   SYS_CLK_EN0_REG0, 1, 0);
>>> +static A5_SYS_PCLK(sys_pwr_ctrl,     SYS_CLK_EN0_REG0, 3, 0);
>>> +static A5_SYS_PCLK(sys_pad_ctrl,     SYS_CLK_EN0_REG0, 4, 0);
>>> +static A5_SYS_PCLK(sys_ctrl,         SYS_CLK_EN0_REG0, 5, 0);
>>> +static A5_SYS_PCLK(sys_ts_pll,               SYS_CLK_EN0_REG0, 6, 0);
>>> +
>>>
>> [...]
>> 
>>> +
>>> +static struct clk_regmap a5_gen = {
>>> +     .data = &(struct clk_regmap_gate_data) {
>>> +             .offset = GEN_CLK_CTRL,
>>> +             .bit_idx = 11,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data) {
>>> +             .name = "gen",
>>> +             .ops = &clk_regmap_gate_ops,
>>> +             .parent_hws = (const struct clk_hw *[]) {
>>> +                     &a5_gen_div.hw
>>> +             },
>>> +             .num_parents = 1,
>>> +             .flags = CLK_SET_RATE_PARENT,
>>> +     },
>>> +};
>>> +
>>> +#define A5_COMP_SEL(_name, _reg, _shift, _mask, _pdata, _table) \
>>> +     MESON_COMP_SEL(a5_, _name, _reg, _shift, _mask, _pdata, _table, 0, 0)
>>> +
>>> +#define A5_COMP_DIV(_name, _reg, _shift, _width) \
>>> +     MESON_COMP_DIV(a5_, _name, _reg, _shift, _width, 0, CLK_SET_RATE_PARENT)
>>> +
>>> +#define A5_COMP_GATE(_name, _reg, _bit, _iflags) \
>>> +     MESON_COMP_GATE(a5_, _name, _reg, _bit, CLK_SET_RATE_PARENT | (_iflags))
>>> +
>> At the top. like C3 and T7
>
> Except for A5_COMP_SEL, which differs slightly from T7 due to the
> additional "_table" parameter, the other macros are consistent with T7.
>
> I also asked for your feedback on this in V4 and received your
> confirmation. Is there anything here that still needs to be updated?

Reviewing these long patches takes time. I tend to stop reviewing when I
noticed some feedback was ignored, especially when it is recurrent
problem. I've told you that already. It is up to you to make sure you are
not missing anything before re-submitting if you don't want to waste time.

>
> [...]

-- 
Jerome
