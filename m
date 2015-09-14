Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Mark Rutland <mark.rutland@arm.com>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] clk: rockchip: add critical clock for rk3368
Date: Mon, 14 Sep 2015 17:06:05 +0200
Message-ID: <6675833.8DAAvDYooL@diego>
In-Reply-To: <20150914141920.GF7002@leverpostej>
References: <5267432.TORlj1Iv40@diego> <20150914141920.GF7002@leverpostej>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Am Montag, 14. September 2015, 15:19:21 schrieb Mark Rutland:
> On Sun, Sep 13, 2015 at 12:20:36PM +0100, Heiko St=FCbner wrote:
> > Again a result of the gpio-clock-liberation the rk3368 needs the
> > pclk_pd_pmu marked as critical, to boot successfully.
> >=20
> > Reported-by: Mark Rutland <mark.rutland@arm.com>
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>=20
> FWIW: Tested-by: Mark Rutland <mark.rutland@arm.com>
>=20
> I'm surprised that we don't describe these as critical in the DT, giv=
en
> that this isn't really an internal property of the clock controller, =
but
> rather what happens to be attached to it. That ship appears to have
> sailed, however.

I wouldn't necessarily think so ... what is called critical only means =
"don't=20
turn off when walking the clock-tree upwards".

The pclk_pd_pmu for example simply supplies some more clocks we don't h=
andle=20
at all currently (pclk_pmu_noc, ...). That we currently choose to ignor=
e those=20
[because we don't have any code nor dt-bindings to handle the component=
s=20
supplied] sounds very much like an implementation-specific detail, not=20=

something about the hardware.

I really like the concept of critical clock handling Mike is working on=
, which=20
implements some sort of hand-off and keeps so marked clocks on until a =
real=20
components picks them up.
