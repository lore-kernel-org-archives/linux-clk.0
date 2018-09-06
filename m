Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:33938 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725929AbeIFKxg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 6 Sep 2018 06:53:36 -0400
Date: Thu, 06 Sep 2018 14:19:17 +0800
In-Reply-To: <CAMty3ZDn=uj3buvJx93R1J7Swr3CyfjJJ=MgQTGvRZ01izbAAA@mail.gmail.com>
References: <20180904044053.15425-1-icenowy@aosc.io> <20180904044053.15425-9-icenowy@aosc.io> <CAMty3ZDn=uj3buvJx93R1J7Swr3CyfjJJ=MgQTGvRZ01izbAAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Subject: Re: [linux-sunxi] [PATCH v4 08/11] arm64: dts: allwinner: a64: Add display pipeline
To: jagan@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
CC: Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <73ADC796-D8CE-417C-82E3-0CDAF710A2F3@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



于 2018年9月6日 GMT+08:00 下午2:18:13, Jagan Teki <jagan@amarulasolutions.com> 写到:
>On Tue, Sep 4, 2018 at 10:10 AM, Icenowy Zheng <icenowy@aosc.io> wrote:
>> From: Jagan Teki <jagan@amarulasolutions.com>
>>
>> Allwinner A64 have a display pipeline with 2 mixers/TCONs, the first
>> TCON is connected to LCD and the second is to HDMI.
>>
>> The HDMI controller/PHY pair is similar to the one on H3/H5.
>>
>> Add all required device tree nodes of the display pipeline, including
>> the TCON0 LCD one and the TCON1 HDMI one.
>>
>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>> [Icenowy: refactor commit message and add 1st pipeline]
>> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
>> ---
>> Changes for v4:
>> - Misc fixes
>> - Dropped second PLL from HDMI PHY clock
>
>Why? it was there in previous versions.

Based on my experiments, the bit has no effect on A64, and the parent
is always PLL-VIDEO0.
