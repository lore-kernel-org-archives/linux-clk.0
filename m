Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB52F4028C5
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 12:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781094413; cv=none; b=RIV0erjm319xbPETqjNe0yftuCmsIWzFzD3+eVgxVGGePqnqr02ZyrQVKiCGf+E9VZFZUdq27jJi8BLH3xATqcYjBJ7hrvj06C9xTYggkfUDIrgaH+jInaSznUjLh5wq/dJ33g2DId2/SDeacm9f75jL1RkD3WQi7orPAZQQ+is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781094413; c=relaxed/simple;
	bh=Se3xpdBJrL4E8uDAGJu6LGypc4lZerctdf5UE1wFo64=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jOPZN8g3VikjFt+VdrPHzYstDCe5I7SxQlK14XbzzoX3A81GerAJuyC7o8PZYqyxBYexfj/0Xizv/ZWmQns+ZDiEHjpZ8ivf1ZK41D00WYdSWJwxoaE4nqwtNbFvrkXkogQG8US7aChGvuFiDCea8CA05cZ6FdsXqIDSXXMkPvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gKlZf3CP; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gKlZf3CP"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490abf12f0fso35320405e9.0
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 05:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781094408; x=1781699208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fw2wxypqiSq6JjCrHtFlLbVO37xmRZdL4EKtYtLIJ4I=;
        b=gKlZf3CP9r3A23FzLXrmVYwI1l+hhjuGTX1c6KZ1rlLEa2qM/AY/zDFTKv7tdu2MZX
         GsASoZh/sh2hPuzmb9qQMWceAkr5DS0TujsK8ZodL498germRNDNwQrcMeH78WhEgbbP
         WQ4ypvYeAFI7NVN6gODPVhc3/YQFhqsYJChqqRaM6u4fTZMiplU7/JGws2SbjlMigmmV
         oYRaJumHX8sBTrD5F0qPmxA9EHGcs7CJxbQxjkWE5MhWUXT0lojoH5ZQK0WY6Wu0mj1N
         Pfsmz+VA9muohY73HqmmT6MEQrP08seN8kEeY7B1fFmtw3hZlIfEiSP60/HA96KY/X00
         PkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781094408; x=1781699208;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fw2wxypqiSq6JjCrHtFlLbVO37xmRZdL4EKtYtLIJ4I=;
        b=jUoHIsP+jt3FK1+jYRY3xBzh+WU02+ZKYaJRb7Ips3gg0YJW5axB+3ps83TFliPjQ9
         UFuBN9vvIWR8AHFt6HHixXnyLa/zznULnz3VoHCy3POgPC0WoJXcCpxwZIgLHcqG60zj
         0naGI6QqiY6xg4s6yxF8tUzjnkENwu1DMVTD0te3Zvid0YCjXq04i6LqvzeGr31eWZ6v
         zclcIu5nkAKuSb1gyAb0dEF3K2FjdL6zjiMsqEwMbBYodN1+w92Glbh2V0vK0wtscm3d
         KSjqxpnekSNv66vZZOvs3F4k9dQTG0OP8s/OKIFRh8cEOglxtVGFr3tt7hR/TPxy3fsB
         OMoQ==
X-Forwarded-Encrypted: i=1; AFNElJ9sXPy7Bqc5uX6gAM6jjPzbGbEo+t3ck7FJKn7qPMIT8Yskf8mDfjVINXEDhVxmn/IBPnYq51kO7Bk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUcqAyFZx9Iqe4k4RDww/PMZODiPJDQ4RsI1Gr6W407a5oYZBu
	ALrtZnxTyYAyyshHxxXxDznnBw1F3I+iSRTHjz818IVm0yZ0Vh4uGvk70GzWbXjPNi0=
X-Gm-Gg: Acq92OFaTiIwb3KD5tfuTJN3gTf5NvPxEas5+0MdvEgnh5xcgDXHOw+uS3O26DYAXnz
	CEunwvvZ7FjFOtlCfi5CDji1jAJHAFQnQ7wRyRG6KKrT6QHk1n3AXOvJkhsy5jkWl4DaJTBhgO8
	HfJMtWfVCJV7eTKpWqZjl+8P8dGRrWK1hvCM5iyDtbkdimAyY1plFI3E1HTYYn4faSkDL9XHE2D
	mCWWKYzKDSE84lO93H8SEenZevjBF4+R3fV4U66tSIL4YV5QyT89veWVpILlSNEYuY77Td/A/II
	/Z9t0HPpBODGxEyqJxwxTJu00JNSnldg8bk3F/NWBlbWH/FnEOlmL12Lo82uDwz9z7hdq753IRL
	V1yzGuDNE3a/Uj4w91mb48ye3dqTkirFp49Li1EnrFuIXOzGjnX00S6FIDr9JK7wH/6YGPAR+do
	D6UHSRn/vEymCAva2A92xW2LZC6K8uTaIl
X-Received: by 2002:a05:600c:4ed1:b0:490:b4cb:3866 with SMTP id 5b1f17b1804b1-490c2cf67f7mr331756785e9.10.1781094408066;
        Wed, 10 Jun 2026 05:26:48 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c371:18ed:9599:7f5f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490bc39def5sm547623695e9.5.2026.06.10.05.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:26:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] clk: amlogic: Add A9 AO clock controller driver
In-Reply-To: <67fcf9bc-0ac7-4812-aa7c-4d42d8f1c162@amlogic.com> (Jian Hu's
	message of "Wed, 10 Jun 2026 12:18:54 +0800")
References: <20260603-a9_aoclk-v2-0-f47ea616ee78@amlogic.com>
	<20260603-a9_aoclk-v2-2-f47ea616ee78@amlogic.com>
	<1j7bofd7dr.fsf@starbuckisacylon.baylibre.com>
	<67fcf9bc-0ac7-4812-aa7c-4d42d8f1c162@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 10 Jun 2026 14:26:45 +0200
Message-ID: <1jpl1yfunu.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On mer. 10 juin 2026 at 12:18, Jian Hu <jian.hu@amlogic.com> wrote:

> Hi Jerome,
>
> Thanks for your review
>
> On 6/3/2026 10:29 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On Wed 03 Jun 2026 at 20:17, Jian Hu via B4 Relay <devnull+jian.hu.amlog=
ic.com@kernel.org> wrote:
>>
>>> From: Jian Hu <jian.hu@amlogic.com>
>>>
>>> Add the Always-on clock controller driver for the Amlogic A9 SoC family.
>>>
>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>> ---
>>>   drivers/clk/meson/Kconfig    |  13 ++
>>>   drivers/clk/meson/Makefile   |   1 +
>>>   drivers/clk/meson/a9-aoclk.c | 419 ++++++++++++++++++++++++++++++++++=
+++++++++
>>>   3 files changed, 433 insertions(+)
>>>
>>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>>> index cf8cf3f9e4ee..625e6788b940 100644
>>> --- a/drivers/clk/meson/Kconfig
>>> +++ b/drivers/clk/meson/Kconfig
>>> @@ -132,6 +132,19 @@ config COMMON_CLK_A1_PERIPHERALS
>>>          device, A1 SoC Family. Say Y if you want A1 Peripherals clock
>>>          controller to work.
>>>
>>> +config COMMON_CLK_A9_AO
>>> +     tristate "Amlogic A9 SoC AO clock controller support"
>>> +     depends on ARM64
>>> +     default ARCH_MESON || COMPILE_TEST
>>> +     select COMMON_CLK_MESON_REGMAP
>>> +     select COMMON_CLK_MESON_CLKC_UTILS
>>> +     select COMMON_CLK_MESON_DUALDIV
>>> +     imply COMMON_CLK_SCMI
>>> +     help
>>> +       Support for the AO clock controller on Amlogic A311Y3 based
>>> +       device, AKA A9.
>>> +       Say Y if you want A9 AO clock controller to work.
>>> +
>>>   config COMMON_CLK_C3_PLL
>>>        tristate "Amlogic C3 PLL clock controller"
>>>        depends on ARM64
>>> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
>>> index c6719694a242..f89d027c282c 100644
>>> --- a/drivers/clk/meson/Makefile
>>> +++ b/drivers/clk/meson/Makefile
>>> @@ -19,6 +19,7 @@ obj-$(CONFIG_COMMON_CLK_AXG) +=3D axg.o axg-aoclk.o
>>>   obj-$(CONFIG_COMMON_CLK_AXG_AUDIO) +=3D axg-audio.o
>>>   obj-$(CONFIG_COMMON_CLK_A1_PLL) +=3D a1-pll.o
>>>   obj-$(CONFIG_COMMON_CLK_A1_PERIPHERALS) +=3D a1-peripherals.o
>>> +obj-$(CONFIG_COMMON_CLK_A9_AO) +=3D a9-aoclk.o
>>>   obj-$(CONFIG_COMMON_CLK_C3_PLL) +=3D c3-pll.o
>>>   obj-$(CONFIG_COMMON_CLK_C3_PERIPHERALS) +=3D c3-peripherals.o
>>>   obj-$(CONFIG_COMMON_CLK_GXBB) +=3D gxbb.o gxbb-aoclk.o
>>> diff --git a/drivers/clk/meson/a9-aoclk.c b/drivers/clk/meson/a9-aoclk.c
>>> new file mode 100644
>>> index 000000000000..b7b3ca231a42
>>> --- /dev/null
>>> +++ b/drivers/clk/meson/a9-aoclk.c
>>> @@ -0,0 +1,419 @@
>>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>>> +/*
>>> + * Copyright (C) 2026 Amlogic, Inc. All rights reserved
>>> + */
>>> +
>>> +#include <dt-bindings/clock/amlogic,a9-aoclkc.h>
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/platform_device.h>
>>> +#include "clk-regmap.h"
>>> +#include "clk-dualdiv.h"
>>> +#include "meson-clkc-utils.h"
>>> +
>>> +#define AO_OSCIN_CTRL                        0x00
>>> +#define AO_SYS_CLK0                  0x04
>>> +#define AO_PWM_CLK_A_CTRL            0x1c
>>> +#define AO_PWM_CLK_B_CTRL            0x20
>>> +#define AO_PWM_CLK_C_CTRL            0x24
>>> +#define AO_PWM_CLK_D_CTRL            0x28
>>> +#define AO_PWM_CLK_E_CTRL            0x2c
>>> +#define AO_PWM_CLK_F_CTRL            0x30
>>> +#define AO_PWM_CLK_G_CTRL            0x34
>>> +#define AO_CEC_CTRL0                 0x38
>>> +#define AO_CEC_CTRL1                 0x3c
>>> +#define AO_RTC_BY_OSCIN_CTRL0                0x50
>>> +#define AO_RTC_BY_OSCIN_CTRL1                0x54
>>> +
>>> +#define A9_COMP_SEL(_name, _reg, _shift, _mask, _pdata) \
>>> +     MESON_COMP_SEL(a9_ao_, _name, _reg, _shift, _mask, _pdata, NULL, =
0, 0)
>>> +
>>> +#define A9_COMP_DIV(_name, _reg, _shift, _width) \
>>> +     MESON_COMP_DIV(a9_ao_, _name, _reg, _shift, _width, 0, CLK_SET_RA=
TE_PARENT)
>>> +
>>> +#define A9_COMP_GATE(_name, _reg, _bit) \
>>> +     MESON_COMP_GATE(a9_ao_, _name, _reg, _bit, CLK_SET_RATE_PARENT)
>>> +
>>> +static struct clk_regmap a9_ao_xtal_in =3D {
>>> +     .data =3D &(struct clk_regmap_gate_data){
>>> +             .offset =3D AO_OSCIN_CTRL,
>>> +             .bit_idx =3D 3,
>>> +     },
>>> +     /*
>>> +      * It may be ao_sys's parent clock, its child clocks mark
>>> +      * CLK_IS_CRITICAL, So mark CLK_IS_CRITICAL for it.
>>> +      */
>> I don't really get what you mean ... Could you rephrase ?
>
>
> The AO sys gate clock chain may be:
>
> ao_xtal_in->ao_xtal->ao_sys-> AO sys gate clocks
>
> "ao_xtal_in" is part of the parent chain of the AO sys gate clocks.
>
> Some of its downstream clocks are marked with CLK_IS_CRITICAL. To ensure
> those clocks remain functional, ao_xtal_in must not be disabled and is
> therefore marked as CLK_IS_CRITICAL as well.

If any of the downstream clocks are critical and marked as such, there is n=
ot
need to mark this one as well.

You should only mark the clocks that are actually critical with the flag
and let CCF figure out the dependencies.

>
>
> I will rephrase it like this in the next version:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* ao_sys can select different clock sou=
rces. One possible clock
> path is:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 ao_xtal_in->ao_xt=
al->ao_sys-> ao sys gate clocks
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* ao_xtal_in is in the parent chain of =
AO sys gate clocks.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Since some downstream clocks are mark=
ed CLK_IS_CRITICAL,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* ao_xtal_in must remain enabled and is=
 therefore marked
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* CLK_IS_CRITICAL as well.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
>
>>> +     .hw.init =3D CLK_HW_INIT_FW_NAME("ao_xtal_in", "xtal",
>>> +                                    &clk_regmap_gate_ops, CLK_IS_CRITI=
CAL),
>> I'm honestly not sure about this. It is correct, sure and the macro exis=
t to be
>> used but ... It does not really help readability here, does it ?
>>
>> (I know that was a feedback you've got on v1)
>>
>> Other than that, this looks good to me.
>>
> Ok, I will use the original clk_init_data for this one.

Well my comment applies to whole thing really.

There are surely ways in which the macro but the way we statically
declare things, it adds a level of indirection that makes things harder
to review IMO.

>
>
> [ ... ]
>
>> --
>> Jerome

--=20
Jerome
