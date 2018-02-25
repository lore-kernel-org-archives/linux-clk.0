Return-Path: <icenowy@aosc.io>
Date: Sun, 25 Feb 2018 16:43:52 +0800
In-Reply-To: <CAGRGNgWgkfax2TUSjK4397i678gXTTLh80r2HWwTB6u0GM0Cuw@mail.gmail.com>
References: <20180224214545.3740-1-jernej.skrabec@siol.net> <20180224214545.3740-15-jernej.skrabec@siol.net> <CAGRGNgWgkfax2TUSjK4397i678gXTTLh80r2HWwTB6u0GM0Cuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Subject: Re: [linux-sunxi] [PATCH 14/15] ARM: dts: sun8i: h3: Enable HDMI output on H3 boards
To: linux-arm-kernel@lists.infradead.org,Julian Calaby <julian.calaby@gmail.com>,jernej.skrabec@siol.net
CC: Mark Rutland <mark.rutland@arm.com>,devicetree <devicetree@vger.kernel.org>,David Airlie <airlied@linux.ie>,Michael Turquette <mturquette@baylibre.com>,linux-sunxi <linux-sunxi@googlegroups.com>,"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,dri-devel <dri-devel@lists.freedesktop.org>,sboyd@kernel.org,Chen-Yu Tsai <wens@csie.org>,Rob Herring <robh+dt@kernel.org>,Maxime Ripard <maxime.ripard@free-electrons.com>,"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,"Mailing List, Arm" <linux-arm-kernel@lists.infradead.org>
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <E26547A5-F219-4310-B0E6-49AC3A700566@aosc.io>
List-ID: <linux-clk.vger.kernel.org>



=E4=BA=8E 2018=E5=B9=B42=E6=9C=8825=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=884=
:11:34, Julian Calaby <julian=2Ecalaby@gmail=2Ecom> =E5=86=99=E5=88=B0:
>Hi Jernej,
>
>On Sun, Feb 25, 2018 at 8:45 AM, Jernej Skrabec
><jernej=2Eskrabec@siol=2Enet> wrote:
>> Enable HDMI output on all boards which have HDMI connector=2E
>>
>> Signed-off-by: Jernej Skrabec <jernej=2Eskrabec@siol=2Enet>
>> ---
>>  arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus=2Edts    | 25
>++++++++++++++++++++++
>>  arch/arm/boot/dts/sun8i-h3-beelink-x2=2Edts          | 25
>++++++++++++++++++++++
>>  arch/arm/boot/dts/sun8i-h3-libretech-all-h3-cc=2Edts | 25
>++++++++++++++++++++++
>>  arch/arm/boot/dts/sun8i-h3-nanopi-m1=2Edts           | 25
>++++++++++++++++++++++
>>  arch/arm/boot/dts/sun8i-h3-orangepi-2=2Edts          | 25
>++++++++++++++++++++++
>>  arch/arm/boot/dts/sun8i-h3-orangepi-lite=2Edts       | 25
>++++++++++++++++++++++
>>  arch/arm/boot/dts/sun8i-h3-orangepi-one=2Edts        | 24
>+++++++++++++++++++++
>>  arch/arm/boot/dts/sun8i-h3-orangepi-pc=2Edts         | 25
>++++++++++++++++++++++
>>  8 files changed, 199 insertions(+)
>
>As I understand it, the H2+ is just a slightly trimmed down H3=2E In
>terms of HDMI support, the difference is that the H2+ can't output 4k=2E

H2+ can OUTPUT 4K=2E The BSP restricts it to DECODE 4K=2E (And mainline wo=
n't have such restriction)

>If this code is compatible with the H2+, could you please add the
>necessary bits and pieces to the h2-plus DTSs too?
>
>Thanks,
