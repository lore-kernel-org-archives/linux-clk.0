Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: Re: [PATCH] [BUG] clk: rockchip: don't mark clock names as initconst
Date: Fri, 01 Jan 2016 22:50:43 +0100
Message-ID: <6692523.e5K11FUKe0@wuerfel>
In-Reply-To: <1799610.nrn5HMCSxL@diego>
References: <2791943.MBZ53mI7Gp@wuerfel> <1799610.nrn5HMCSxL@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

On Friday 01 January 2016 18:06:30 Heiko St=FCbner wrote:
>=20
> "[PATCH] clk: rockchip: fix section mismatches with new child-clocks"=
 [0]
>=20
> should be in Mike's + Stephen's inbox since last week as well, which =
moves the=20
> offending new elements into separate entities, which can have __initd=
ata=20
> attributes again.
>=20
>=20
> Heiko
>=20
> [0] http://www.spinics.net/lists/arm-kernel/msg471295.html

The patch looks good, but for some reason, the next-20151223 kernel had=
 no
problem and next-20151231 was broken, the top commits in drivers/clk/ro=
ckchips
are:

commit a915e30dd26ea5f3cc2e2c044aba38ee5973d3fa
Merge: ce6dd266d535 b0158bb27c7b
Author: Michael Turquette <mturquette@baylibre.com>
Date:   Wed Dec 23 13:08:56 2015 -0800

    Merge branch 'clk-rockchip' into clk-next

commit b0158bb27c7b6e9843f541c17b24dbd964b76db6
Author: Xing Zheng <zhengxing@rock-chips.com>
Date:   Tue Dec 22 22:28:01 2015 +0100

    clk: rockchip: rk3036: include downstream muxes into fractional div=
iders
   =20
    Use the newly introduced possibility to combine the fractional divi=
ders


=09Arnd
