Return-Path: <icenowy@aosc.io>
Date: Tue, 27 Feb 2018 00:21:05 +0800
In-Reply-To: <2676311.2IEVhXnSIE@jernej-laptop>
References: <20180224214545.3740-1-jernej.skrabec@siol.net> <20180224214545.3740-15-jernej.skrabec@siol.net> <CAGRGNgWgkfax2TUSjK4397i678gXTTLh80r2HWwTB6u0GM0Cuw@mail.gmail.com> <2676311.2IEVhXnSIE@jernej-laptop>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Subject: Re: [linux-sunxi] [PATCH 14/15] ARM: dts: sun8i: h3: Enable HDMI output on H3 boards
To: jernej.skrabec@siol.net,=?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>,Julian Calaby <julian.calaby@gmail.com>
CC: Maxime Ripard <maxime.ripard@free-electrons.com>,Chen-Yu Tsai <wens@csie.org>,David Airlie <airlied@linux.ie>,Rob Herring <robh+dt@kernel.org>,Mark Rutland <mark.rutland@arm.com>,Michael Turquette <mturquette@baylibre.com>,sboyd@kernel.org,dri-devel <dri-devel@lists.freedesktop.org>,devicetree <devicetree@vger.kernel.org>,"Mailing List, Arm" <linux-arm-kernel@lists.infradead.org>,"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,linux-sunxi <linux-sunxi@googlegroups.com>
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <4AA78C45-E139-417E-BE89-FE0BFBC409B0@aosc.io>
List-ID: <linux-clk.vger.kernel.org>



=E4=BA=8E 2018=E5=B9=B42=E6=9C=8827=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=881=
2:16:44, "Jernej =C5=A0krabec" <jernej=2Eskrabec@siol=2Enet> =E5=86=99=E5=
=88=B0:
>Hi Julian,
>
>Dne nedelja, 25=2E februar 2018 ob 09:11:34 CET je Julian Calaby
>napisal(a):
>> Hi Jernej,
>>=20
>> On Sun, Feb 25, 2018 at 8:45 AM, Jernej Skrabec
><jernej=2Eskrabec@siol=2Enet>=20
>wrote:
>> > Enable HDMI output on all boards which have HDMI connector=2E
>> >=20
>> > Signed-off-by: Jernej Skrabec <jernej=2Eskrabec@siol=2Enet>
>> > ---
>> >=20
>> >  arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus=2Edts    | 25
>> >  ++++++++++++++++++++++ arch/arm/boot/dts/sun8i-h3-beelink-x2=2Edts =
=20
>    =20
>> >   | 25 ++++++++++++++++++++++
>> >  arch/arm/boot/dts/sun8i-h3-libretech-all-h3-cc=2Edts | 25
>> >  ++++++++++++++++++++++ arch/arm/boot/dts/sun8i-h3-nanopi-m1=2Edts  =
=20
>    =20
>> >   | 25 ++++++++++++++++++++++
>arch/arm/boot/dts/sun8i-h3-orangepi-2=2Edts =20
>> >         | 25 ++++++++++++++++++++++
>> >  arch/arm/boot/dts/sun8i-h3-orangepi-lite=2Edts       | 25
>> >  ++++++++++++++++++++++ arch/arm/boot/dts/sun8i-h3-orangepi-one=2Edts
>    =20
>> >   | 24 +++++++++++++++++++++
>arch/arm/boot/dts/sun8i-h3-orangepi-pc=2Edts =20
>> >        | 25 ++++++++++++++++++++++ 8 files changed, 199
>insertions(+)
>>=20
>> As I understand it, the H2+ is just a slightly trimmed down H3=2E In
>> terms of HDMI support, the difference is that the H2+ can't output
>4k=2E
>> If this code is compatible with the H2+, could you please add the
>> necessary bits and pieces to the h2-plus DTSs too?
>
>There are only 3 H2+ boards in kernel and none of them has HDMI
>connector, so=20

BPi M2 Zero has miniHDMI connector=2E

>there's nothing to do actually=2E But if such board is added to kernel,
>it would=20
>be trivially add proper nodes, since all H2+ boards include H3 DTSI=2E
>
>Best regards,
>Jernej
