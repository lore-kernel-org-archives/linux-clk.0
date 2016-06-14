Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Doug Anderson <dianders@chromium.org>
Cc: Xing Zheng <zhengxing@rock-chips.com>, elaine zhang <elaine.zhang@rock-chips.com>, Tao Huang <huangtao@rock-chips.com>, Brian Norris <briannorris@chromium.org>, Yakir Yang <ykk@rock-chips.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: rockchip: add pclk_vio_grf to critical clock on the RK3399
Date: Tue, 14 Jun 2016 08:43:09 +0200
Message-ID: <6790996.3s1cEPUy90@diego>
In-Reply-To: <CAD=FV=X-d+hO_zq4UGMsnpELcpEfiD7wFh5dcmgqM_oiSRwOmg@mail.gmail.com>
References: <1465724913-14553-1-git-send-email-zhengxing@rock-chips.com> <575F73B1.9000703@rock-chips.com> <CAD=FV=X-d+hO_zq4UGMsnpELcpEfiD7wFh5dcmgqM_oiSRwOmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

Am Montag, 13. Juni 2016, 20:49:39 schrieb Doug Anderson:
> Hi,
>=20
> On Mon, Jun 13, 2016 at 8:02 PM, Xing Zheng <zhengxing@rock-chips.com=
>=20
wrote:
> > Hi Doug,
> >=20
> > On 2016=E5=B9=B406=E6=9C=8814=E6=97=A5 07:46, Doug Anderson wrote:
> >> Even if it's not much power, it seems like we should still turn it=
 off
> >> and on in the right place.  Unless I'm mistaken it should be such =
a
> >> simple patch provide the clock to the right driver and then get th=
e
> >> clock when appropriate.
> >=20
> > Yes, I talked with Yakir and we intent to enable/disable the pclk_v=
io_grf
> > in video drivers,
> > so this patch will be dropped.
> >=20
> >>> I will refer the latest TRM to update a new patch for always enab=
le
> >>> these
> >>> GRFs.
> >>=20
> >> Does that mean you're going to make these all critical clocks?  Th=
at
> >> doesn't sound so great...
> >>=20
> >> -Doug
> >=20
> > Maybe, I heard that they are removed in the updated TRM, but I have=
 not
> > got
> > the TRM yet.
> > I will double check it, and it seems that you do not agree to remov=
e these
> > clock...
>=20
> Well, if it were to be removed from the TRM then that would be a
> strong sign that the SoC designers think that this clock should never=

> ever be turned off.  If that were the case I don't think I could
> object to leaving this clock on all the time.  Presumably then we'd
> totally remove the clock from the clock tree and rely on firmware to
> leave it on?  Technically removing this clock is not really
> device-tree backward compatible, but I guess if there are no current
> users...
>=20
> ...note: if the clock IS listed in the TRM and there's ever a chance
> that we'd want to turn it off, it's much easier to set that up all
> now.  Trying to later go in and decide that these clocks are no longe=
r
> "always on" gets into all sorts of weird device tree backward
> compatibility corner cases.

PCLK_VIO_GRF gets already exported as clock-id, so we already have the =
wired=20
corner-case :-) . But we'll see how this plays out.
