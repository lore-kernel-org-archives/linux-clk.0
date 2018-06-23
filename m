Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Sat, 23 Jun 2018 22:18:21 +0800
In-Reply-To: <CAGRGNgUuEjmEcvJ3OUcQ9_6bPs9fDvKzUFm_NfCsYyjxVOVw3A@mail.gmail.com>
References: <20180622124540.56203-1-icenowy@aosc.io> <20180622124540.56203-4-icenowy@aosc.io> <CAGRGNgUuEjmEcvJ3OUcQ9_6bPs9fDvKzUFm_NfCsYyjxVOVw3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Subject: Re: [linux-sunxi] [PATCH v2 5/7] arm64: allwinner: a64: add necessary device tree nodes for DE2 CCU
To: julian.calaby@gmail.com, Julian Calaby <julian.calaby@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, jagan@amarulasolutions.com,
        jernej.skrabec@siol.net, devicetree <devicetree@vger.kernel.org>,
        "Mailing List, Arm" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <3BDC9318-95A5-41BA-801E-6E0814249AFB@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



于 2018年6月23日 GMT+08:00 下午10:06:27, Julian Calaby <julian.calaby@gmail.com> 写到:
>Hi Icenowy,
>
>On Fri, Jun 22, 2018 at 10:49 PM Icenowy Zheng <icenowy@aosc.io> wrote:
>>
>> As we have all necessary parts to enable the DE2 CCU on the Allwinner
>> A64 SoC, add the needed device tree nodes, including the DE2 CCU
>itself
>> and the DE2 bus.
>>
>> The "mixer0-lcd0" simplefb device node is updated to use the DE2 CCU.
>>
>> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
>> ---
>> Changes in v2:
>> - Drop SRAM controller device tree node addition (as it's already
>added
>>   as part of syscon change.)
>> - Fix the clock reference in LCD SimpleFB.
>>
>>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 30
>+++++++++++++++----
>>  1 file changed, 24 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>> index ff2ddde1e117..318c4ba8ae9f 100644
>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>> @@ -58,17 +60,12 @@
>>                 #size-cells = <1>;
>>                 ranges;
>>
>> -/*
>> - * The pipeline mixer0-lcd0 depends on clock CLK_MIXER0 from DE2
>CCU.
>> - * However there is no support for this clock on A64 yet, so we
>depend
>> - * on the upstream clocks here to keep them (and thus CLK_MIXER0)
>up.
>> - */
>>                 simplefb_lcd: framebuffer-lcd {
>>                         compatible = "allwinner,simple-framebuffer",
>>                                      "simple-framebuffer";
>>                         allwinner,pipeline = "mixer0-lcd0";
>>                         clocks = <&ccu CLK_TCON0>,
>> -                                <&ccu CLK_DE>, <&ccu CLK_BUS_DE>;
>> +                                <&display_clocks CLK_MIXER0>;
>
>Doesn't this technically break simplefb if this DT is used with a
>Linux that doesn't have the display clock driver?

1. DT doesn't care forware compatibility.

2. This is a fix for not accurate HW representation. In
fact I have sent the DT with simplefb using DE2 CCU before, but
when they're pending, someone who just wants the simplefb
sent the not temporary version.This must be fixed.

>
>Do we care about breaking that use-case?
>
>Thanks,
