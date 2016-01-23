Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Heiko Stuebner <heiko@sntech.de>,  sboyd@codeaurora.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1578308.XWWZ6XYns5@phil>
Cc: linux-clk@vger.kernel.org,  linux-rockchip@lists.infradead.org
References: <1578308.XWWZ6XYns5@phil>
Message-ID: <20160123000043.19367.6646@quark.deferred.io>
Subject: Re: [GIT PULL] clk fixes for 4.5
Date: Fri, 22 Jan 2016 16:00:43 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting Heiko Stuebner (2016-01-17 11:07:01)
> Hi Mike, Stephen,
> =

> based on the clk-for-linus-4.5 tag that got merged into mainline
> some asorted fixes for Rockchip clocks.
> =

> So, please pull

Pulled.

Regards,
Mike

> =

> =

> Thanks
> Heiko
> =

> The following changes since commit 3da834e3e5a4a5d26882955298b55a9ed37a00=
bc:
> =

>   clk: remove duplicated COMMON_CLK_NXP record from clk/Kconfig (2016-01-=
13 18:09:52 -0800)
> =

> are available in the git repository at:
> =

>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v4.5-rockchip-clkfixes1
> =

> for you to fetch changes up to 8931f8e02979e4180566907019d432527c80abf7:
> =

>   clk: rockchip: rk3368: fix some clock gates (2016-01-16 16:01:21 +0100)
> =

> ----------------------------------------------------------------
> Fixes for wrong register offsets in both rk3036 and rk3368.
> Also rename the external input for the emac on rk3036, which
> should still be ok to do, as that binding was only introduced
> during this merge-window.
> =

> ----------------------------------------------------------------
> Jianqun xu (1):
>       clk: rockchip: rk3368: fix some clock gates
> =

> Xing Zheng (4):
>       clk: rockchip: rk3036: fix the FLAGs for clock mux
>       clk: rockchip: rk3036: fix uarts clock error
>       clk: rockchip: rk3036: fix the div offset for emac clock
>       clk: rockchip: rk3036: rename emac ext source clock
> =

>  .../bindings/clock/rockchip,rk3036-cru.txt         |  2 +-
>  drivers/clk/rockchip/clk-rk3036.c                  | 26 +++++++++++-----=
------
>  drivers/clk/rockchip/clk-rk3368.c                  | 26 +++++++++++-----=
------
>  3 files changed, 27 insertions(+), 27 deletions(-)
>=20
