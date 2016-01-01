Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: Re: [PATCH] [BUG] clk: rockchip: don't mark clock names as initconst
Date: Fri, 01 Jan 2016 23:05:10 +0100
Message-ID: <3926467.jaQRQH5bEO@diego>
In-Reply-To: <6692523.e5K11FUKe0@wuerfel>
References: <2791943.MBZ53mI7Gp@wuerfel> <1799610.nrn5HMCSxL@diego> <6692523.e5K11FUKe0@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Am Freitag, 1. Januar 2016, 22:50:43 schrieb Arnd Bergmann:
> On Friday 01 January 2016 18:06:30 Heiko St=FCbner wrote:
> > "[PATCH] clk: rockchip: fix section mismatches with new child-clock=
s" [0]
> >=20
> > should be in Mike's + Stephen's inbox since last week as well, whic=
h moves
> > the offending new elements into separate entities, which can have
> > __initdata attributes again.
> >=20
> >=20
> > Heiko
> >=20
> > [0] http://www.spinics.net/lists/arm-kernel/msg471295.html
>=20
> The patch looks good, but for some reason, the next-20151223 kernel h=
ad no
> problem and next-20151231 was broken, the top commits in
> drivers/clk/rockchips are:

That is correct. next-20151223 did not contain the offending patches ye=
t.=20
After the patches got merged into the clock-tree the kbuild-robot alert=
ed us=20
to the __initdata issue, so I created the linked patch as fixup.


Heiko

>=20
> commit a915e30dd26ea5f3cc2e2c044aba38ee5973d3fa
> Merge: ce6dd266d535 b0158bb27c7b
> Author: Michael Turquette <mturquette@baylibre.com>
> Date:   Wed Dec 23 13:08:56 2015 -0800
>=20
>     Merge branch 'clk-rockchip' into clk-next
>=20
> commit b0158bb27c7b6e9843f541c17b24dbd964b76db6
> Author: Xing Zheng <zhengxing@rock-chips.com>
> Date:   Tue Dec 22 22:28:01 2015 +0100
>=20
>     clk: rockchip: rk3036: include downstream muxes into fractional d=
ividers
>=20
>     Use the newly introduced possibility to combine the fractional di=
viders
>=20
>=20
> =09Arnd
