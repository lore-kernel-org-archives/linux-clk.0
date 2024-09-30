Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C71B1885A1
	for <linux-clk@vger.kernel.org>; Mon, 30 Sep 2024 09:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727689307; cv=none; b=WCGo03vMXBACfbSY15SgZ/WSHYRa8YKuLQKmhabN8cKZ4U9DXa2ExZRBHWOTB5P/gixtunR25o34BoLhrjCBFUok4uJlu8x4QZ2UkIJ7BK1aXmE2wFzrXuC0AD10Zo7KNl3yapwFXXUWCZYYIU91g45jVr/WUwrbBwS3cHrpgGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727689307; c=relaxed/simple;
	bh=DvFK/oihNNbtavdQEAMviuE3tItFW+M28krtDAX8Rds=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HpSTb+wTmZOKzlvJt59fiRQMnQWg3BtpbgH3OxBYsSrU9skomLpz1TjE6lZCzML6cjfunYb2bCE45cTyKEjRcLmHnne7OVMkYgoBbMFhI9rxUZmUmEVhpojua8dzYE9zyutq4DMr9Ck1ScofxzA9spZ8DWguRO5gHJX2bT3X7kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=N8rvJTck; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="N8rvJTck"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42cc43454d5so29884495e9.3
        for <linux-clk@vger.kernel.org>; Mon, 30 Sep 2024 02:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727689303; x=1728294103; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sr7h1omB7PXcqQIy1y7utZoiAixP16ugYOgZJbdB6E8=;
        b=N8rvJTck/17sOFkjvPlb38uXt9U1KxgNNXmQcKPeinal47TRcEfYAgC4NLHFLgvb4s
         XdsEpn+Al6FOWmxhT1eqB4irGRaMfUUh9RraoTg77PMZTOtE0gUv5W/KjoaOjnPUKITb
         Y1rcQn4lRK06GIjGoIm3j+y5TKoJk6HbWHjJxcmt5BMoRBqTAltql7fXkdys/g4QSb/7
         ninOINjMmfvnBnVdRR5h2JDscyF5SYtDJHdVYA8y6qgZ/BX3vuXzspAEuYYYgtp9ILKh
         1UKNmXRglLycDKXIokuI8urTy6LnUqdIPnR4gIkM7Z/ei5ovA5pSKqfE+l+YyEQPd1Mu
         JbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727689303; x=1728294103;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sr7h1omB7PXcqQIy1y7utZoiAixP16ugYOgZJbdB6E8=;
        b=GtpT/9HEZye7bFQw5bmViN4MmJCOqxtHgp2Ko6E2vEYRAyZ351fQ2jtdIwpPmiRTTB
         0iKPXH45F3PKJG+v1G84WcZ+r541S6XqXImfDWgzS2h7u10wiWZbsNeQ89SUBR9l6Uxi
         PsoYIEv63dPUpa6dzNNM1YSrz5pgh+2d7tSw+Bj3inGL36PX8p8OF+YzbxldJpeFL18t
         kKs5BBeSY5M+b3diJsr2S8qjqPdvcYXotGBu/fStoZogOY8ZyFKemvdlA0qX6MCqrub1
         0DBkS1cFi9Si+a3FRz2MTLfnMxeaTQK7OyiGmWflC5EZK512KmRK3Q81/p9ESyws/5/y
         bW4w==
X-Forwarded-Encrypted: i=1; AJvYcCVjwoc7qwYVqI6P1pY3rYbxBTLRlUjXn6+QbVufqsj4FHBDrvsZk+Ov7sHEfiN14Aof2T8uCfIBQSU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFKoqCxUN8OFpGZtXmZ9cW7rxlLqLWlUNH0sJ5LjzJwiEnGsOn
	B2xeUGEEDUlcjItXvHvkmJHkhRMHbRUNwyjG/6WAIOl+qAK3K3EMVUo4VX+KQJ0=
X-Google-Smtp-Source: AGHT+IHeE72eB+QBjTT9unQFami/x9Aj5lzN1iDLPKcaORkrj4XgY+DA+r5Wajd2QzFxhub7jH2UNg==
X-Received: by 2002:a05:600c:4747:b0:426:6379:3b4f with SMTP id 5b1f17b1804b1-42f5849092dmr86852765e9.31.1727689303490;
        Mon, 30 Sep 2024 02:41:43 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b6ba:bab:ced3:2667])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd5742230sm8576501f8f.92.2024.09.30.02.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 02:41:42 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>,
  Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Chuan Liu <chuan.liu@amlogic.com>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/5] clk: meson: add support for the A5 SoC PLL clock
In-Reply-To: <4e2c7bb7-b97c-43c3-8938-4831e9d1376d@amlogic.com> (Xianwei
	Zhao's message of "Sun, 29 Sep 2024 16:17:40 +0800")
References: <20240914-a5-clk-v1-0-5ee2c4f1b08c@amlogic.com>
	<20240914-a5-clk-v1-4-5ee2c4f1b08c@amlogic.com>
	<1jplotxg8e.fsf@starbuckisacylon.baylibre.com>
	<4e2c7bb7-b97c-43c3-8938-4831e9d1376d@amlogic.com>
Date: Mon, 30 Sep 2024 11:41:42 +0200
Message-ID: <1jploltr55.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun 29 Sep 2024 at 16:17, Xianwei Zhao <xianwei.zhao@amlogic.com> wrote:

> Hi Jerome,
>    Thanks for your reply.
>
> On 2024/9/24 22:45, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>> On Sat 14 Sep 2024 at 13:25, Xianwei Zhao via B4 Relay
>> <devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>> 
>>> From: Chuan Liu <chuan.liu@amlogic.com>
>>>
>>> Add the PLL clock controller driver for the Amlogic A5 SoC family.
>>>
>>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>> ---
>>>   drivers/clk/meson/Kconfig  |  14 ++
>>>   drivers/clk/meson/Makefile |   1 +
>>>   drivers/clk/meson/a5-pll.c | 553 +++++++++++++++++++++++++++++++++++++++++++++
>>>   3 files changed, 568 insertions(+)
>>>
>>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>>> index 78f648c9c97d..2a713276e46c 100644
>>> --- a/drivers/clk/meson/Kconfig
>>> +++ b/drivers/clk/meson/Kconfig
>>> @@ -132,6 +132,20 @@ config COMMON_CLK_A1_PERIPHERALS
>>>          device, A1 SoC Family. Say Y if you want A1 Peripherals clock
>>>          controller to work.
>>>
>>> +config COMMON_CLK_A5_PLL
>>> +     tristate "Amlogic A5 PLL clock controller"
>>> +     depends on ARM64
>>> +     default y
>>> +     imply ARM_SCMI_PROTOCOL
>> don't think this is needed, same as c3
>> 
>
> Will delete it in the next version.


Ideally, please trim your replies. This avoid the need for me to dig in
such long patch and find whatever it is that you replied.

That means, remove text that is not necessary to the reply, leaving the
necessary context for the discussion.

Also, if it is just to say that 'you will do it', a reply is no
necessary. Just do it, it will be fine. Reply if you have further
questions, remarks or do not agree.

>
>>> +     imply COMMON_CLK_SCMI
>>> +     select COMMON_CLK_MESON_REGMAP
>>> +     select COMMON_CLK_MESON_PLL
>>> +     select COMMON_CLK_MESON_CLKC_UTILS
>>> +     help
>>> +       Support for the PLL clock controller on Amlogic AV40x device, AKA A5.
>>> +       Say Y if you want the board to work, because PLLs are the parent
>>> +       of most peripherals.
>>> +
>>>   config COMMON_CLK_C3_PLL
>>>        tristate "Amlogic C3 PLL clock controller"
>>>        depends on ARM64
>>> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
>>> index bc56a47931c1..fc4b8a723145 100644
>>> --- a/drivers/clk/meson/Makefile
>>> +++ b/drivers/clk/meson/Makefile
>>> @@ -20,6 +20,7 @@ obj-$(CONFIG_COMMON_CLK_AXG) += axg.o axg-aoclk.o
>>>   obj-$(CONFIG_COMMON_CLK_AXG_AUDIO) += axg-audio.o
>>>   obj-$(CONFIG_COMMON_CLK_A1_PLL) += a1-pll.o
>>>   obj-$(CONFIG_COMMON_CLK_A1_PERIPHERALS) += a1-peripherals.o
>>> +obj-$(CONFIG_COMMON_CLK_A5_PLL) += a5-pll.o
>>>   obj-$(CONFIG_COMMON_CLK_C3_PLL) += c3-pll.o
>>>   obj-$(CONFIG_COMMON_CLK_C3_PERIPHERALS) += c3-peripherals.o
>>>   obj-$(CONFIG_COMMON_CLK_GXBB) += gxbb.o gxbb-aoclk.o
>>> diff --git a/drivers/clk/meson/a5-pll.c b/drivers/clk/meson/a5-pll.c
>>> new file mode 100644
>>> index 000000000000..d96ed72ef8d4
>>> --- /dev/null
>>> +++ b/drivers/clk/meson/a5-pll.c
>>> @@ -0,0 +1,553 @@

[...]

>>> +static struct clk_regmap gp0_pll = {
>>> +     .data = &(struct clk_regmap_div_data) {
>>> +             .offset = ANACTRL_GP0PLL_CTRL0,
>>> +             .shift = 16,
>>> +             .width = 3,
>>> +             .table = gp0_pll_od_table,
>>> +             .flags = CLK_DIVIDER_POWER_OF_TWO,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data) {
>>> +             .name = "gp0_pll",
>>> +             .ops = &clk_regmap_divider_ops,
>>> +             .parent_hws = (const struct clk_hw *[]) {
>>> +                     &gp0_pll_dco.hw
>>> +             },
>>> +             .num_parents = 1,
>>> +             .flags = CLK_SET_RATE_PARENT,
>>> +     },
>>> +};
>>> +
>>> +static const struct reg_sequence hifi_init_regs[] = {
>>> +     { .reg = ANACTRL_HIFIPLL_CTRL0, .def = 0X08000000 },
>> What is bit you are flipping in CTRL0 ? it is suspicious
>> 
>
> Yes, CTRL0 and CTRL1 are not necessary here and will be removed in the
> next version.

That does not really answer my question, does it ?

>
>>> +     { .reg = ANACTRL_HIFIPLL_CTRL1, .def = 0x00000000 },
>>> +     { .reg = ANACTRL_HIFIPLL_CTRL2, .def = 0x00000000 },
>>> +     { .reg = ANACTRL_HIFIPLL_CTRL3, .def = 0x6a295c00 },
>>> +     { .reg = ANACTRL_HIFIPLL_CTRL4, .def = 0x65771290 },
>>> +     { .reg = ANACTRL_HIFIPLL_CTRL5, .def = 0x3927200a },
>>> +     { .reg = ANACTRL_HIFIPLL_CTRL6, .def = 0x54540000 }
>>> +};
>>> +
>>> +static const struct pll_mult_range hifi_pll_mult_range = {
>>> +     .min = 125,
>>> +     .max = 250,
>>> +};
>>> +
>>> +static struct clk_regmap hifi_pll_dco = {
>>> +     .data = &(struct meson_clk_pll_data) {
>>> +             .en = {
>>> +                     .reg_off = ANACTRL_HIFIPLL_CTRL0,
>>> +                     .shift   = 28,
>>> +                     .width   = 1,
>>> +             },
>>> +             .m = {
>>> +                     .reg_off = ANACTRL_HIFIPLL_CTRL0,
>>> +                     .shift   = 0,
>>> +                     .width   = 8,
>>> +             },
>>> +             .frac = {
>>> +                     .reg_off = ANACTRL_HIFIPLL_CTRL1,
>>> +                     .shift   = 0,
>>> +                     .width   = 17,
>>> +             },
>>> +             .n = {
>>> +                     .reg_off = ANACTRL_HIFIPLL_CTRL0,
>>> +                     .shift   = 10,
>>> +                     .width   = 5,
>>> +             },
>>> +             .l = {
>>> +                     .reg_off = ANACTRL_HIFIPLL_CTRL0,
>>> +                     .shift   = 31,
>>> +                     .width   = 1,
>>> +             },
>>> +             .rst = {
>>> +                     .reg_off = ANACTRL_HIFIPLL_CTRL0,
>>> +                     .shift   = 29,
>>> +                     .width   = 1,
>>> +             },
>>> +             .range = &hifi_pll_mult_range,
>>> +             .init_regs = hifi_init_regs,
>>> +             .init_count = ARRAY_SIZE(hifi_init_regs),
>>> +             .frac_max = 100000,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data) {
>>> +             .name = "hifi_pll_dco",
>>> +             .ops = &meson_clk_pll_ops,
>>> +             .parent_data = &(const struct clk_parent_data) {
>>> +                     .fw_name = "xtal_24m",
>>> +             },
>>> +             .num_parents = 1,
>>> +     },
>>> +};
>>> +
>>> +/* The maximum frequency divider supports is 16, not 128(2^7) */
>>> +static const struct clk_div_table hifi_pll_od_table[] = {
>>> +     { 0,  1 },
>>> +     { 1,  2 },
>>> +     { 2,  4 },
>>> +     { 3,  8 },
>> Why don't you ajust the mask then ? Looks like a POW_OF_2 basic
>> dividider to me.
>> 
>
> The maximum frequency division value above the design document is 8,
> such as the configuration 4/5/6... The actual frequency division value
> is still 8, so this table is defined, why there is this restriction in
> detail I am not clear about.
>
> Will add these comment ot describe it.

I'm not asking you to add a comment.
With your explanation, my comment still stands.

>
>>> +     { /* sentinel */ }
>>> +};
>>> +
>>> +static struct clk_regmap hifi_pll = {
>>> +     .data = &(struct clk_regmap_div_data) {
>>> +             .offset = ANACTRL_HIFIPLL_CTRL0,
>>> +             .shift = 16,
>>> +             .width = 3,
>>> +             .table = hifi_pll_od_table,
>>> +             .flags = CLK_DIVIDER_POWER_OF_TWO,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data) {
>>> +             .name = "hifi_pll",
>>> +             .ops = &clk_regmap_divider_ops,
>>> +             .parent_hws = (const struct clk_hw *[]) {
>>> +                     &hifi_pll_dco.hw
>>> +             },
>>> +             .num_parents = 1,
>>> +             .flags = CLK_SET_RATE_PARENT,
>>> +     },
>>> +};
>>> +
