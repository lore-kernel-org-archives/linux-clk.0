Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: "David.Wu" <david.wu@rock-chips.com>
Cc: Elaine Zhang <zhangqing@rock-chips.com>, mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, xxx@rock-chips.com, xf@rock-chips.com, huangtao@rock-chips.com, cl@rock-chips.com, andy.yan@rock-chips.com, wdc@rock-chips.com
Subject: Re: [PATCH v2 1/4] clk: rockchip: add rv1108 ACLK_GAMC and PCLK_GMAC ID
Date: Mon, 21 Aug 2017 12:32:49 +0200
Message-ID: <19279521.prAVXYBsZ9@phil>
In-Reply-To: <f51160d5-32cc-a63c-3877-76ea91fb6e8b@rock-chips.com>
References: <1503303367-17915-1-git-send-email-zhangqing@rock-chips.com> <1503303367-17915-2-git-send-email-zhangqing@rock-chips.com> <f51160d5-32cc-a63c-3877-76ea91fb6e8b@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi David,

Am Montag, 21. August 2017, 18:22:31 CEST schrieb David.Wu:
> Hi Elaine,
>=20
> =E5=9C=A8 2017/8/21 16:16, Elaine Zhang =E5=86=99=E9=81=93:
> > This patch exports gmac aclk and pclk for dts reference.
> >=20
> > Signed-off-by: Elaine Zhang<zhangqing@rock-chips.com>
> > ---
> >   include/dt-bindings/clock/rv1108-cru.h | 2 ++
> >   1 file changed, 2 insertions(+)
>=20
> Acked-by: David Wu <david.wu@rock-chips.com>

Acked-by is mainly meant for cross-maintainer stuff (changes
for one subsystem going through a different tree etc).

If you want to show that the change is correct and you have reviewed
the patch, please use "Reviewed-by".


Heiko
