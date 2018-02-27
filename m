Return-Path: <julian.calaby@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20180227070735.ml3mc4nr4vpge57u@flea>
References: <20180224214545.3740-1-jernej.skrabec@siol.net>
 <2676311.2IEVhXnSIE@jernej-laptop> <4AA78C45-E139-417E-BE89-FE0BFBC409B0@aosc.io>
 <2342395.9m6rrqTry7@jernej-laptop> <CAGRGNgU8-uJuns7mAzS-gc81qvVAkS9JS2Tm13p2Qp7dMDCNkg@mail.gmail.com>
 <20180227070735.ml3mc4nr4vpge57u@flea>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Tue, 27 Feb 2018 21:35:09 +1100
Message-ID: <CAGRGNgU0_zxejYfTzk5qeNhp5saCtTLy4Ra+oG97anhJwL+qOA@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 14/15] ARM: dts: sun8i: h3: Enable HDMI
 output on H3 boards
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: jernej.skrabec@siol.net, linux-sunxi <linux-sunxi@googlegroups.com>,
	Icenowy Zheng <icenowy@aosc.io>, Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>,
	Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org,
	dri-devel <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>,
	"Mailing List, Arm" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Maxime,

On Tue, Feb 27, 2018 at 6:07 PM, Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
> On Tue, Feb 27, 2018 at 01:29:27PM +1100, Julian Calaby wrote:
>> Hi Jernej,
>>
>> On Tue, Feb 27, 2018 at 3:27 AM, Jernej =C5=A0krabec <jernej.skrabec@sio=
l.net> wrote:
>> > Hi,
>> >
>> > Dne ponedeljek, 26. februar 2018 ob 17:21:05 CET je Icenowy Zheng napi=
sal(a):
>> >> =E4=BA=8E 2018=E5=B9=B42=E6=9C=8827=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=
=8D=8812:16:44, "Jernej =C5=A0krabec"
>> > <jernej.skrabec@siol.net> =E5=86=99=E5=88=B0:
>> >> >Hi Julian,
>> >> >
>> >> >Dne nedelja, 25. februar 2018 ob 09:11:34 CET je Julian Calaby
>> >> >
>> >> >napisal(a):
>> >> >> Hi Jernej,
>> >> >>
>> >> >> On Sun, Feb 25, 2018 at 8:45 AM, Jernej Skrabec
>> >> >
>> >> ><jernej.skrabec@siol.net>
>> >> >
>> >> >wrote:
>> >> >> > Enable HDMI output on all boards which have HDMI connector.
>> >> >> >
>> >> >> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
>> >> >> > ---
>> >> >> >
>> >> >> >  arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts    | 25
>> >> >> >  ++++++++++++++++++++++ arch/arm/boot/dts/sun8i-h3-beelink-x2.dt=
s
>> >> >> >
>> >> >> >   | 25 ++++++++++++++++++++++
>> >> >> >
>> >> >> >  arch/arm/boot/dts/sun8i-h3-libretech-all-h3-cc.dts | 25
>> >> >> >  ++++++++++++++++++++++ arch/arm/boot/dts/sun8i-h3-nanopi-m1.dts
>> >> >> >
>> >> >> >   | 25 ++++++++++++++++++++++
>> >> >
>> >> >arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
>> >> >
>> >> >> >         | 25 ++++++++++++++++++++++
>> >> >> >
>> >> >> >  arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts       | 25
>> >> >> >  ++++++++++++++++++++++ arch/arm/boot/dts/sun8i-h3-orangepi-one.=
dts
>> >> >> >
>> >> >> >   | 24 +++++++++++++++++++++
>> >> >
>> >> >arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
>> >> >
>> >> >> >        | 25 ++++++++++++++++++++++ 8 files changed, 199
>> >> >
>> >> >insertions(+)
>> >> >
>> >> >> As I understand it, the H2+ is just a slightly trimmed down H3. In
>> >> >> terms of HDMI support, the difference is that the H2+ can't output
>> >> >
>> >> >4k.
>> >> >
>> >> >> If this code is compatible with the H2+, could you please add the
>> >> >> necessary bits and pieces to the h2-plus DTSs too?
>> >> >
>> >> >There are only 3 H2+ boards in kernel and none of them has HDMI
>> >> >connector, so
>> >>
>> >> BPi M2 Zero has miniHDMI connector.
>> >
>> > Ah, sorry, I missed that one. Since I don't have it (or any other boar=
d with
>> > H2+) I'm not really comfortable including such patch. If anyone will t=
est it,
>> > I can include it in next revision.
>>
>> I have one of those (this is why I'm interested in this patchset) so
>> I'm willing to test, however I can't guarantee I'll get to it quickly.
>
> Then I guess the best way forward will be to keep the current patch as
> is, and you'll send a patch whenever you have the time to test it.

Fair enough, I'll do that then. =3D)

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
