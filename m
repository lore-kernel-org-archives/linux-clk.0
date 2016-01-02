Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Arnd Bergmann" <arnd@arndb.de>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <3926467.jaQRQH5bEO@diego>
Cc: "Stephen Boyd" <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Sjoerd Simons" <sjoerd.simons@collabora.co.uk>
References: <2791943.MBZ53mI7Gp@wuerfel> <1799610.nrn5HMCSxL@diego>
 <6692523.e5K11FUKe0@wuerfel> <3926467.jaQRQH5bEO@diego>
Message-ID: <20160102214217.20626.98999@quark.deferred.io>
Subject: Re: [PATCH] [BUG] clk: rockchip: don't mark clock names as initconst
Date: Sat, 02 Jan 2016 13:42:17 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting Heiko St=C3=BCbner (2016-01-01 14:05:10)
> Am Freitag, 1. Januar 2016, 22:50:43 schrieb Arnd Bergmann:
> > On Friday 01 January 2016 18:06:30 Heiko St=C3=BCbner wrote:
> > > "[PATCH] clk: rockchip: fix section mismatches with new child-clocks"=
 [0]
> > > =

> > > should be in Mike's + Stephen's inbox since last week as well, which =
moves
> > > the offending new elements into separate entities, which can have
> > > __initdata attributes again.
> > > =

> > > =

> > > Heiko
> > > =

> > > [0] http://www.spinics.net/lists/arm-kernel/msg471295.html
> > =

> > The patch looks good, but for some reason, the next-20151223 kernel had=
 no
> > problem and next-20151231 was broken, the top commits in
> > drivers/clk/rockchips are:
> =

> That is correct. next-20151223 did not contain the offending patches yet. =

> After the patches got merged into the clock-tree the kbuild-robot alerted=
 us =

> to the __initdata issue, so I created the linked patch as fixup.

The fix has been pushed to the clk mirror. The next -next should no
longer have the section mismatch warnings.

Regards,
Mike

> =

> =

> Heiko
> =

> > =

> > commit a915e30dd26ea5f3cc2e2c044aba38ee5973d3fa
> > Merge: ce6dd266d535 b0158bb27c7b
> > Author: Michael Turquette <mturquette@baylibre.com>
> > Date:   Wed Dec 23 13:08:56 2015 -0800
> > =

> >     Merge branch 'clk-rockchip' into clk-next
> > =

> > commit b0158bb27c7b6e9843f541c17b24dbd964b76db6
> > Author: Xing Zheng <zhengxing@rock-chips.com>
> > Date:   Tue Dec 22 22:28:01 2015 +0100
> > =

> >     clk: rockchip: rk3036: include downstream muxes into fractional div=
iders
> > =

> >     Use the newly introduced possibility to combine the fractional divi=
ders
> > =

> > =

> >       Arnd
>=20
