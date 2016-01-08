Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Caesar Wang <caesar.upstream@gmail.com>
Cc: Caesar Wang <wxt@rock-chips.com>, Ulf Hansson <ulf.hansson@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, leecam@google.com, linux-arm-kernel@lists.infradead.org, keescook@google.com, linux-clk@vger.kernel.org, leozwang@google.com
Subject: Re: [PATCH v2 04/12] clk: rockchip: rk3036: enable the CLK_IGNORE_UNUSED flag for sclk_i2s_out
Date: Fri, 08 Jan 2016 10:46:26 +0100
Message-ID: <20757797.djuaztrzGE@phil>
In-Reply-To: <568F80BA.6060209@gmail.com>
References: <1452155155-16232-1-git-send-email-wxt@rock-chips.com> <290434099.8XFZ9qmNRz@phil> <568F80BA.6060209@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Caesar,

Am Freitag, 8. Januar 2016, 17:26:18 schrieb Caesar Wang:
> =E5=9C=A8 2016=E5=B9=B401=E6=9C=8807=E6=97=A5 18:05, Heiko Stuebner =E5=
=86=99=E9=81=93:
> > Am Donnerstag, 7. Januar 2016, 16:25:47 schrieb Caesar Wang:
> >> SCLk_I2S_OUT is the noc bus clock for i2s module, this clock is us=
ed by
> >> extra codecs.
> >>=20
> >> Due to it shouldn't belong to any driver, but we need it enabled,
> >> so just mark it as the CLK_IGNORE_UNUSED flag.
> >=20
> > What makes you think it shouldn't belong to any driver?
> >=20
> > In most schematics I have, i2s_clkout is going to some clock-input =
of
> > the
> > audio codec - probably the MCLK input on your rt5616. And while the=
 new
> > rt5616 driver does not seem to do clock handling, it should just ha=
ndle
> > the clock using the normal APIs.
>=20
> You are right,  that's seem has to find the root cause.
> I'm wonder that the codec/i2s is working in kernel v4.1 patch without=
 it.
>=20
> In general,  the MLCK will be handled in i2s driver if the cpu side i=
s
> master.

looking at the rt5616 datasheet, that would be BCLK1 instead I think. T=
his=20
one does differentiate between being master/slave.

The master/sysclk (mclk) is also handled in other drivers in all cases.=
=20
(da7213.c, da7219.c, max98090.c, max98095.c, probably more)


Heiko
