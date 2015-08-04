Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Lin Huang <hl@rock-chips.com>, dianders@chromium.org, linux-rockchip@lists.infradead.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] clk: rockchip: add pclk_pd_pmu to the list of rk3288 critical clocks
Date: Tue, 04 Aug 2015 21:40:16 +0200
Message-ID: <10063547.S7PvqCkF78@diego>
In-Reply-To: <55C113CF.2000601@codeaurora.org>
References: <1438670487-27598-1-git-send-email-hl@rock-chips.com> <1588782.u2WKR6eVuV@diego> <55C113CF.2000601@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Am Dienstag, 4. August 2015, 12:34:39 schrieb Stephen Boyd:
> On 08/04/2015 01:54 AM, Heiko St=FCbner wrote:
> > Hi,
> >=20
> > Am Dienstag, 4. August 2015, 14:41:26 schrieb Lin Huang:
> >=20
> > I guess this patch then would need a
> >=20
> > From: Heiko Stuebner <heiko@sntech.de>
> >=20
> > at this point to override the author then.
>=20
> Sounds right. Please resend the patch properly. Also, is there a 2/2?=
 I
> never got it.

Patch 2/2 is a pinctrl change, that actually depends in this patch.
Improved clock-handling in the pinctrl driver caused the pd_pmu clock t=
o get=20
deactivated.

So, perhaps it might be even better to get an Ack from the clock mainta=
iner=20
and merge both patches through the pinctrl tree?


In which case Linus Walleij should also be included as recipient of thi=
s patch=20
when resending.
