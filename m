Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Mark Rutland <mark.rutland@arm.com>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] clk: rockchip: add critical clock for rk3368
Date: Mon, 14 Sep 2015 17:24:55 +0200
Message-ID: <5892333.KZLmY9MJYK@diego>
In-Reply-To: <20150914151942.GJ7002@leverpostej>
References: <5267432.TORlj1Iv40@diego> <6675833.8DAAvDYooL@diego> <20150914151942.GJ7002@leverpostej>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Am Montag, 14. September 2015, 16:19:42 schrieb Mark Rutland:
> On Mon, Sep 14, 2015 at 04:06:05PM +0100, Heiko St=FCbner wrote:
> > Am Montag, 14. September 2015, 15:19:21 schrieb Mark Rutland:
> > > On Sun, Sep 13, 2015 at 12:20:36PM +0100, Heiko St=FCbner wrote:
> > > > Again a result of the gpio-clock-liberation the rk3368 needs th=
e
> > > > pclk_pd_pmu marked as critical, to boot successfully.
> > > >=20
> > > > Reported-by: Mark Rutland <mark.rutland@arm.com>
> > > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > >=20
> > > FWIW: Tested-by: Mark Rutland <mark.rutland@arm.com>
> > >=20
> > > I'm surprised that we don't describe these as critical in the DT,=
 given
> > > that this isn't really an internal property of the clock controll=
er, but
> > > rather what happens to be attached to it. That ship appears to ha=
ve
> > > sailed, however.
> >=20
> > I wouldn't necessarily think so ... what is called critical only me=
ans
> > "don't turn off when walking the clock-tree upwards".
> >=20
> > The pclk_pd_pmu for example simply supplies some more clocks we don=
't
> > handle at all currently (pclk_pmu_noc, ...). That we currently choo=
se to
> > ignore those [because we don't have any code nor dt-bindings to han=
dle
> > the components supplied] sounds very much like an implementation-sp=
ecific
> > detail, not something about the hardware.
>=20
> Sure, but the specific case that lead to this report was the fact tha=
t
> this clock (directly?) feeds the pinctrl programming interface, and t=
hat
> fact is neither described in the DT nor handled by the driver. Surely=

> that should be described and handled?

nope it doesn't :-) pclk_pd_pmu feeds pclk_gpio0.

Before the pinctrl patch, pclk_gpio0 was just statically on all the tim=
e, now=20
it gets turned off when bank0 is not in use (between reads/writes and i=
f no=20
interrupts are enabled). This in turn makes the clock framework turn of=
f=20
pclk_pd_pmu (and thus its other unhandled child-clocks).
