Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Doug Anderson <dianders@chromium.org>
Cc: Xing Zheng <zhengxing@rock-chips.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Brian Norris <briannorris@chromium.org>, Tao Huang <huangtao@rock-chips.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Elaine Zhang <zhangqing@rock-chips.com>
Subject: Re: [RFC PATCH] clk: rockchip: rk3399: support pll setting automatically
Date: Mon, 29 Aug 2016 19:54:09 +0200
Message-ID: <13164913.BHiQzGsdBU@diego>
In-Reply-To: <CAD=FV=VMqHrKHThSNoz_i=SCwgw=OeOfaww3Ote1id66LXO8JQ@mail.gmail.com>
References: <1470144852-20708-1-git-send-email-zhengxing@rock-chips.com> <4830789.1bI8OsvZy1@phil> <CAD=FV=VMqHrKHThSNoz_i=SCwgw=OeOfaww3Ote1id66LXO8JQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Am Montag, 29. August 2016, 10:35:44 schrieb Doug Anderson:
> Hi,
>=20
> On Sun, Aug 28, 2016 at 8:21 AM, Heiko St=FCbner <heiko@sntech.de> wr=
ote:
> > Hi Xing, Elaine,
> >=20
> > Am Dienstag, 2. August 2016, 21:34:12 schrieb Xing Zheng:
> >> From: Elaine Zhang <zhangqing@rock-chips.com>
> >>=20
> >> The goal is that we can configure the most suitable pll params
> >> automatically.
> >>=20
> >> If setting freq is not supported in rockchip_pll_rate_table
> >> rk3399_pll_rates[], we can set pll params automatically.
> >>=20
> >> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> >> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
> >=20
> > first off, I really like that idea of calculating the generic pll
> > frequencies instead of duplicating these entries in every soc clock=

> > driver.
>=20
> I probably won't have time to look at this any time soon, but when I
> saw this patch fly by I was a little hesitant because:
>=20
> * Not all PLL settings produce the same jitter.  On rk3288 I spent
> loads of time searching for PLL settings that would be low jitter
> enough to make a pixel clock that was happy with lots of different TV=
s
> / monitors.  It's true that there were certain heuristics that could
> be followed but certainly my predictions didn't always match what
> happened.
>=20
> * Depending on what's using the PLL, you might want very different
> settings.  One can optimize for lock time, power usage, jitter,
> accuracy, etc.  For instance for a CPU clock that you change a lot yo=
u
> probably don't care about hitting an exact frequency and you probably=

> don't care overly much about jitter, but you want low lock times.  Fo=
r
> HDMI you don't care about lock times and and probably don't care abou=
t
> power usage, but you care about meeting an exact clock and really
> really care about jitter.
>=20
> * I know that in the past the way I found to make some of the best
> rates for HDMI was to have the PLL make a rate that was several times=

> what I wanted and then activate a divider later in the clock tree.
> That gave me the best jitter / clock accuracy.  I have no idea how to=

> do that automatically, but in the past I relied on the PLL only havin=
g
> a fixed set of rates it could make so it would fail to make the lower=

> clock rate (higher jitter) and eventually end up with the better one.=

>=20
>=20
> Anyway, I don't know how to solve all of the above, but I just wanted=

> to bring it up as a concern.

after talking with Doug on irc, I realized that this really can become =
a=20
problem, as right now we have a list with known-good rates, can adjust =
those=20
as needed and have the clock framework select the best for a certain ta=
rget=20
rate.

But with the automatic calculation it would open up nearly unlimited di=
fferent=20
rates with possible negative effects and no way to eliminate or even te=
st most=20
of them.

So it may very well be best to stay with static rates, in a component a=
s core=20
as the PLLs are?


Heiko
