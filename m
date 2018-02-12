Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34164 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933090AbeBLJQp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Feb 2018 04:16:45 -0500
Received: by mail-wm0-f68.google.com with SMTP id j21so7816954wmh.1
        for <linux-clk@vger.kernel.org>; Mon, 12 Feb 2018 01:16:44 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <a4299cac-84c1-6468-c38a-f232d0dbfb8a@arm.com>
References: <20180203154942.63566-1-icenowy@aosc.io> <20180203154942.63566-6-icenowy@aosc.io>
 <a4299cac-84c1-6468-c38a-f232d0dbfb8a@arm.com>
From: Philippe Ombredanne <pombredanne@nexb.com>
Date: Mon, 12 Feb 2018 10:16:03 +0100
Message-ID: <CAOFm3uHoQcZ3TZg_uTs2aBgU-p0r2ffJ2VLK+E4V19fmLW10WA@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v2 5/6] arm64: allwinner: h6: add the
 basical Allwinner H6 DTSI file
To: =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-clk@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
        <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org,
        linux-sunxi@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Icenowy,

On Mon, Feb 12, 2018 at 12:26 AM, Andr=C3=A9 Przywara <andre.przywara@arm.c=
om> wrote:
> Hi,
>
> On 03/02/18 15:49, Icenowy Zheng wrote:
>> Allwinner H6 is a new SoC with Cortex-A53 cores from Allwinner, with its
>> memory map fully reworked and some high-speed peripherals (PCIe, USB
>> 3.0) introduced.
>>
>> This commit adds the basical DTSI file of it, including the clock
>> support and UART support.
>
> Checked the MMIO addresses and the interrupt numbers against the manual.
>
>> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
>
> Thanks!
> Andre.
>
>> ---
>> Changes in v2:
>> - Add APB1 clock as PIO's APB clock.
>> - Switched to SPDX license identifier.
>>
>>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 178 ++++++++++++++++++++=
+++++++
>>  1 file changed, 178 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/b=
oot/dts/allwinner/sun50i-h6.dtsi
>> new file mode 100644
>> index 000000000000..d4697bb42496
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
>> @@ -0,0 +1,178 @@
>> +/*
>> + * Copyright (C) 2017 Icenowy Zheng <icenowy@aosc.io>
>> + *
>> + * SPDX-License-Identifier: (GPL-2.0+ or MIT)
>> + */

Thank you for using SPDX ids: this needs to be on the first line
though! [1] and eventually some special comments style.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/license-rules.rst

--=20
Cordially
Philippe Ombredanne
