Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Frank Wang <frank.wang@rock-chips.com>
Cc: Xing Zheng <zhengxing@rock-chips.com>, linux-rockchip@lists.infradead.org, dianders@chromium.org, briannorris@chromium.org, huangtao@rock-chips.com, zhangqing@rock-chips.com, wulf@rock-chips.com, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, daniel.meng@rock-chips.com
Subject: Re: [PATCH v3 2/7] clk: rockchip: rk3399: export 480M_SRC clock id for usbphy0/usbphy1
Date: Fri, 05 Aug 2016 18:05:51 +0200
Message-ID: <1570410.dThJclhmJd@diego>
In-Reply-To: <cba79ba6-7f41-5398-389c-7fd3fe5e0089@rock-chips.com>
References: <1470122401-31934-1-git-send-email-zhengxing@rock-chips.com> <1918977.W0kRfKbZsD@diego> <cba79ba6-7f41-5398-389c-7fd3fe5e0089@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Hi Frank,

Am Freitag, 5. August 2016, 16:34:42 schrieb Frank Wang:
> On 2016/8/5 3:10, Heiko St=FCbner wrote:
> > Am Dienstag, 2. August 2016, 15:19:56 schrieb Xing Zheng:
> >> Export these source clocks for usbphy.
> >>=20
> >> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
> >=20
> > can you please provide a rationale why you need manual control over=
 that
> > intermediate clock?
>=20
> Well, From below graph, you can see that 'clk_usbphyX_480m' is genera=
ted
> from usb2phy, and 'clk_usbphy_480m' which select from
> clk_usbphyX_480m_src via a gate (G13[12])  provided 480M clock to oth=
er
> modules.
>=20
>    xin24m
>=20
>        |__ clk_usb2phy0_ref
>        |
>        |                 |__ clk_usbphy0_480m
>        |                 |
>        |                                   |__clk_usbphy0_480m_src
>        | |
>        | |__clk_usbphy_480m
>        | |
>        |         |__ ... ...
>        |
>        |__ clk_usb2phy1_ref
>        |
>                           |__ clk_usbphy1_480m
>                           |
>                                           |__clk_usbphy1_480m_src
> >=20
> > The two usbphys seem to use the  clk_usb2phyX_ref clocks, generate =
the
> > 480m
> > clocks, but do not seem to need the clk_usbphyX_480m_src gates.
>=20
> Yeah, they used to be. However, the story went something like this,
>=20
> Some PM suspend process related ehci/ohci controller are base on 480m=

> clocks, unfortunately, usb2-phy suspended earlier than ehci/ohci
> (usb2-phy will be auto suspended if no devices plug-in), and the
> clk-480m provided by it was disabled if no module used. As a result, =
the
> PM suspend process was blocked when it run into ehci/ohci module.

ah, so the ehci controller needs that 480m clock as well? Do you happen=
 to=20
have example patches for the ehci/ohci side already? I'd like to peak a=
t what=20
you mean with "some PM suspend process related" things.

Depending on what is actually needed, you could also pull the usbphy ou=
t of=20
autosuspend in a pm-prepare callback of the phy driver itself ... see=20=

http://lxr.free-electrons.com/source/include/linux/pm.h#L86

Like=20
- in the .prepare callback make sure to unsuspend the phy
  and deactivate the autosuspend
- ehci/ohci will poweroff the phy in it s suspend callback (already doe=
s that)
- suspend -> resume
- ehci/ohci will poweron the phy
- in the phy's .complete callback you can reactivate the autosuspend ti=
mer

Because it looks more like you actually need the phy and not the clock =
alone.
So it would be nicer to use mechanisms already in place instead of crea=
ting=20
new dependencies.


> Hence, we are planing to refer clk_usbphyX_480m_src into each ehci/oh=
ci
> driver. Maybe you will challenge why not refer clk_usbphy_480m direct=
ly?
> because there are two ehci/ohci connected in the different usb2phy, a=
nd
> only one clk_usbphy_480m clock was selected in clock tree.

Nope, no argument from me as I fully understand that each phy provides =
its own=20
480m clock :-) .


Heiko
