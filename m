Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3862C4332F
	for <linux-clk@archiver.kernel.org>; Fri, 25 Nov 2022 09:47:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbiKYJrp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Nov 2022 04:47:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbiKYJqu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Nov 2022 04:46:50 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E05B3D91B
        for <linux-clk@vger.kernel.org>; Fri, 25 Nov 2022 01:45:44 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id i12so6003347wrb.0
        for <linux-clk@vger.kernel.org>; Fri, 25 Nov 2022 01:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRHQGS+MoseEWu2yP0z89M73Jh0x//1y0OJv+t/zrF4=;
        b=VHenaF9GA9zau2yTbhZLVlj/UOicgW8VqYY9JP+GKLrUZKstFV4JeYJC14+igFZ5jo
         ivV6GZPYQCSu6F/41h4fNLdg5NXdV6JOc1seY/dmy447b1+Ry/DWlKbMbrEECVWopaFS
         ZbdlzdkDTZKhTb8cp7tdSX8OVFEMKdNNXwJ2BmeCDzKARD9QAKA95dkXrn/WfbadyLPh
         QiKFe5V6aScDowFY2Cb1rsOLTZdBihkp+l7BW/H++uTzBjXCUIWvyIXrSGB4/TCuz7U1
         CVbvKY0EBFGYkXYfBTAAm+zyPCx5lUGCGnJY1WNxYXhwefWSMujvZiQi4FVG0FdYmOZK
         vtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NRHQGS+MoseEWu2yP0z89M73Jh0x//1y0OJv+t/zrF4=;
        b=vbF0oAHKa/Abek2QLXvWBifcOo6qVNcS9uPbgX3/b60ij0iB5tIq/YiEXDePwKQz1Z
         PAcbCGkIlUzNuarPgNuw1tH043qlIQP39HwjkUF9lc6NpCIjwi8s2ePabZiMJLCdBPN+
         O9Ri43gX9y44TcAYgD1Ugnf2aLPW24y345y/QzzsPAQF4aZsRZm8LYqkkpyP3AJ608dY
         CvMWM9OjyIKCO9L1Hbw6jC7Bnzo3MYdIoRjhA/uYUes9cKs1WxrxLayoFqsSSw2RUNCi
         mOVveMWRxW6cWWVsf9bbMX/oh7sB0GUZQGsmFHeM9uZTz/k3fEQTkGeqGcn94LuPmNHl
         +Ktw==
X-Gm-Message-State: ANoB5plH4ZXWH7AFElxmRLZ8FyGKDp7w221wc90tBKXnfAZr6RWrDSxF
        1rmqee3woBSikdH6KLvTSHULTWKytzfsUQ==
X-Google-Smtp-Source: AA0mqf77dAkSUmh1pzGht0Y8PIR6ERxk7qG/8Cmgq5KSMALFlw0aHhnbmfPpk9f+8tHdo0LVxfsSgw==
X-Received: by 2002:a5d:5b19:0:b0:241:dea3:ad48 with SMTP id bx25-20020a5d5b19000000b00241dea3ad48mr12678300wrb.357.1669369542781;
        Fri, 25 Nov 2022 01:45:42 -0800 (PST)
Received: from localhost (253.35.17.109.rev.sfr.net. [109.17.35.253])
        by smtp.gmail.com with ESMTPSA id h12-20020a056000000c00b00241cfa9333fsm3488340wrx.5.2022.11.25.01.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 01:45:42 -0800 (PST)
References: <20221123021346.18136-1-yu.tu@amlogic.com>
 <20221123021346.18136-2-yu.tu@amlogic.com>
 <f03f331a-5666-298e-a1a2-bdb9bab11a48@linaro.org>
 <92b570ea-3ddc-8e91-5a7a-ed601bb7c02c@amlogic.com>
 <eb56ed39-cfaa-3368-a2c0-0a4e89440e40@linaro.org>
 <5b7176b4-d7a2-c67f-31c6-e842e0870836@linaro.org>
User-agent: mu4e 1.8.10; emacs 28.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        neil.armstrong@linaro.org, Yu Tu <yu.tu@amlogic.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     kelvin.zhang@amlogic.com
Subject: Re: [PATCH V5 1/4] clk: meson: S4: add support for Amlogic S4 SoC
 PLL clock driver and bindings
Date:   Fri, 25 Nov 2022 10:23:28 +0100
In-reply-to: <5b7176b4-d7a2-c67f-31c6-e842e0870836@linaro.org>
Message-ID: <1jfse72wqk.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Wed 23 Nov 2022 at 14:53, Krzysztof Kozlowski <krzysztof.kozlowski@linar=
o.org> wrote:

> On 23/11/2022 14:23, Neil Armstrong wrote:
>> Hi,
>>=20
>> On 23/11/2022 12:16, Yu Tu wrote:
>>> Hi Krzysztof,
>>>  =C2=A0=C2=A0=C2=A0=C2=A0Thank you for your reply.
>>>
>>> On 2022/11/23 18:08, Krzysztof Kozlowski wrote:
>>>> [ EXTERNAL EMAIL ]
>>>>
>>>> On 23/11/2022 03:13, Yu Tu wrote:
>>>>> Add the S4 PLL clock controller found and bindings in the s4 SoC fami=
ly.
>>>>>
>>>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>>>> ---
>>>>> =C2=A0 .../bindings/clock/amlogic,s4-pll-clkc.yaml=C2=A0=C2=A0 |=C2=
=A0 51 +
>>>>
>>>> This is v5 and still bindings are here? Bindings are always separate
>>>> patches. Use subject prefixes matching the subsystem (git log --oneline
>>>> -- ...).
>>>>
>>>> And this was split, wasn't it? What happened here?!?
>>>
>>> Put bindings and clock driver patch together from Jerome. Maybe you can=
 read this chat history.
>>> https://lore.kernel.or/all/1jy1v6z14n.fsf@starbuckisacylon.baylibre.com/
>>=20
>> Jerome was asking you to send 2 patchsets, one with :
>> - bindings in separate patches
>> - drivers in separate patches
>> and a second with DT changes.

Indeed, this is what was asked. It is aligned with Krzysztof's request.

>>=20
>> Then when the bindings + clocks patches are merged, a pull request of th=
e bindings
>> can be done to me so I can merge it with DT.
>>=20
>>>
>>>>
>>>>
>>>>> =C2=A0 MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 1 +
>>>>> =C2=A0 drivers/clk/meson/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 13 +
>>>>> =C2=A0 drivers/clk/meson/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 1 +
>>>>> =C2=A0 drivers/clk/meson/s4-pll.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 875 ++++++++++++++++++
>>>>> =C2=A0 drivers/clk/meson/s4-pll.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 88 ++
>>>>> =C2=A0 .../dt-bindings/clock/amlogic,s4-pll-clkc.h=C2=A0=C2=A0 |=C2=
=A0 30 +
>>>>> =C2=A0 7 files changed, 1059 insertions(+)
>>>>> =C2=A0 create mode 100644 Documentation/devicetree/bindings/clock/aml=
ogic,s4-pll-clkc.yaml
>>>>> =C2=A0 create mode 100644 drivers/clk/meson/s4-pll.c
>>>>> =C2=A0 create mode 100644 drivers/clk/meson/s4-pll.h
>>>>> =C2=A0 create mode 100644 include/dt-bindings/clock/amlogic,s4-pll-cl=
kc.h
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,s4-pll-c=
lkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..fd517e8ef14f
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
>>>>> @@ -0,0 +1,51 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/clock/amlogic,s4-pll-clkc.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Amlogic Meson S serials PLL Clock Controller
>>>>> +
>>>>> +maintainers:
>>>>> +=C2=A0 - Neil Armstrong <narmstrong@baylibre.com>
>>>>> +=C2=A0 - Jerome Brunet <jbrunet@baylibre.com>
>>>>> +=C2=A0 - Yu Tu <yu.hu@amlogic.com>
>>>>> +
>>>> One blank line.
>>>
>>>  =C2=A0I will delete this, on next version patch.
>>>
>>>>
>>>>> +
>>>>> +properties:
>>>>> +=C2=A0 compatible:
>>>>> +=C2=A0=C2=A0=C2=A0 const: amlogic,s4-pll-clkc
>>>>> +
>>>>> +=C2=A0 reg:
>>>>> +=C2=A0=C2=A0=C2=A0 maxItems: 1
>>>>> +
>>>>> +=C2=A0 clocks:
>>>>> +=C2=A0=C2=A0=C2=A0 maxItems: 1
>>>>> +
>>>>> +=C2=A0 clock-names:
>>>>> +=C2=A0=C2=A0=C2=A0 items:
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: xtal
>>>>> +
>>>>> +=C2=A0 "#clock-cells":
>>>>> +=C2=A0=C2=A0=C2=A0 const: 1
>>>>> +
>>>>> +required:
>>>>> +=C2=A0 - compatible
>>>>> +=C2=A0 - reg
>>>>> +=C2=A0 - clocks
>>>>> +=C2=A0 - clock-names
>>>>> +=C2=A0 - "#clock-cells"
>>>>> +
>>>>> +additionalProperties: false
>>>>> +
>>>>> +examples:
>>>>> +=C2=A0 - |
>>>>> +=C2=A0=C2=A0=C2=A0 clkc_pll: clock-controller@fe008000 {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "amlogic,s4-pll-clkc";
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0xfe008000 0x1e8>;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks =3D <&xtal>;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-names =3D "xtal";
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #clock-cells =3D <1>;
>>>>> +=C2=A0=C2=A0=C2=A0 };
>>>>
>>>>
>>>>> +#endif /* __MESON_S4_PLL_H__ */
>>>>> diff --git a/include/dt-bindings/clock/amlogic,s4-pll-clkc.h b/includ=
e/dt-bindings/clock/amlogic,s4-pll-clkc.h
>>>>> new file mode 100644
>>>>> index 000000000000..345f87023886
>>>>> --- /dev/null
>>>>> +++ b/include/dt-bindings/clock/amlogic,s4-pll-clkc.h
>>>>
>>>> This belongs to bindings patch, not driver.
>>>>
>>>>> @@ -0,0 +1,30 @@
>>>>> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
>>>>> +/*
>>>>> + * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
>>>>> + * Author: Yu Tu <yu.tu@amlogic.com>
>>>>> + */
>>>>> +
>>>>> +#ifndef _DT_BINDINGS_CLOCK_AMLOGIC_S4_PLL_CLKC_H
>>>>> +#define _DT_BINDINGS_CLOCK_AMLOGIC_S4_PLL_CLKC_H
>>>>> +
>>>>> +/*
>>>>> + * CLKID index values
>>>>> + */
>>>>> +
>>>>> +#define CLKID_FIXED_PLL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 1
>>>>> +#define CLKID_FCLK_DIV2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 3
>>>>
>>>> Indexes start from 0 and are incremented by 1. Not by 2.
>>>>
>>>> NAK.
>>>
>>> I remember Jerome discussing this with you.You can look at this submiss=
ion history.
>>> https://lore.kernel.org/all/c088e01c-0714-82be-8347-6140daf56640@linaro=
.org/
>>=20
>> Historically we did that by only exposing part of the numbers, controlli=
ng which
>> clocks were part of the bindings.
>>=20
>> But it seems this doesn't make sens anymore, maybe it would be time to p=
ut all the
>> clock ids in the bindings for this new SoC and break with the previous s=
trategy.

Krzysztof and I agreed there is nothing wrong with the current
approach, I believe.

It does not prevent someone from using an un-exposed clock, sure, or
exposing it in the future if necessary.

However, I think it clearly shows that an un-exposed element is not
expected to be used by an external consumers. It should be enough to
trigger a discussion if this expectation is wrong.

>
> So the outcome of the previous discussion was somewhere later in that
> thread:
>
>> It is just a choice to not expose some IDs.
>> It is not tied to the implementation at all.
>> I think we actually follow the rules and the idea behind it.
>
>
> Best regards,
> Krzysztof

