Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Jisheng Zhang <jszhang@marvell.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, pi-cheng.chen@linaro.org
Subject: Re: [Query]set clk rate must operate its coordinated clock
Date: Mon, 06 Jun 2016 10:10:37 +0200
Message-ID: <2738343.ekabfXD0fs@diego>
In-Reply-To: <20160311165152.4103.82090@quark.deferred.io>
References: <20160309152420.20de187a@xhacker> <20160311165152.4103.82090@quark.deferred.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike,

Am Freitag, 11. M=E4rz 2016, 08:51:52 schrieb Michael Turquette:
> Quoting Jisheng Zhang (2016-03-08 23:24:20)
> > I have the following clk case which I dunno the elegant solution:
> >=20
> >=20
> > cpuclk have two parents: cpupll and refclk. When set the cpuclk fre=
q, we
> > have to set its parent's freq, I.E cpupll freq. But before changing=
 the
> > cpupll's freq, we should set its refclk as its parent firstly.
> >=20
> > AFAIK, this is a common case, I have seen such requirement in rockc=
hip,
> > samsung clk driver. They solve this by notifier, but as pointed out=
 by
> > Michael in
> > http://lists.infradead.org/pipermail/linux-arm-kernel/2015-June/351=
565.ht
> > ml
> >=20
> > "This is also a hack and it points towards some missing infrastruct=
ure in
> > the clock framework."
> >=20
> > I also don't like the notifier solution, I believe the elegant solu=
tion
> > could be using the coordinated clock infrastructure. So what's the =
status
> > of this infrastructure? I can test, and I can even add some code to=
 make
> > it be ready to be merged if you guide me ;)
>=20
> Thanks for the email. I hope to finish that feature before ELC. I hav=
e
> Cc'd Pi-Cheng Chen from Mediatek who is also interested in coordinate=
d
> clock rates.

pulling this up again, did this materialize yet? :-)

Because it looks like on Rockchip we're getting yet another clock that =
needs=20
special handling (set_rate needs to go through the trusted-firmware, wh=
ile=20
reading stays the same) which might profit from that as well.


Heiko
