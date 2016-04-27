Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Mark Brown <broonie@kernel.org>
Cc: Wadim Egorov <w.egorov@phytec.de>, linux-rockchip@lists.infradead.org, mark.rutland@arm.com, devicetree@vger.kernel.org, a.zummo@towertech.it, pawel.moll@arm.com, rtc-linux@googlegroups.com, ijc+devicetree@hellion.org.uk, mturquette@baylibre.com, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com, alexandre.belloni@free-electrons.com, dianders@chromium.org, galak@codeaurora.org, zyw@rock-chips.com, lee.jones@linaro.org, linux-clk@vger.kernel.org
Subject: Re: Applied "regulator: rk808: remove linear range definitions with a single range" to the regulator tree
Date: Wed, 27 Apr 2016 15:56:56 +0200
Message-ID: <13413437.Ipf2eOczfj@diego>
In-Reply-To: <20160427135048.GQ3217@sirena.org.uk>
References: <E1aukkg-0007km-6s@debutante> <57205DC2.7070506@phytec.de> <20160427135048.GQ3217@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Am Mittwoch, 27. April 2016, 14:50:48 schrieb Mark Brown:
> On Wed, Apr 27, 2016 at 08:35:46AM +0200, Wadim Egorov wrote:
> > On 26.04.2016 21:33, Heiko St=FCbner wrote:
> > > with this patch applied, 4.6.0-rc5-next-20160426 fails to boot on=

> > > rk3288-veyron devices with the bug below. Reverting this one patc=
h
> >=20
> > > results in the system booting again:
> > This is because I missed to add the correct ops for LDO_REG3 in thi=
s
> > patch.
>=20
> Any ETA on a fix or should I revert?

I guess
=09[PATCH v4 1/7] regulator: rk808: Add rk808_reg_ops_ranges for LDO3
from yesterday [0] might be the fix? At least it fits Wadim's descripti=
on above=20
but I haven't had time to test it yet.




[0] https://patchwork.kernel.org/patch/8939741/
