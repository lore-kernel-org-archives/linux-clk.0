Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, sjoerd.simons@collabora.co.uk
Subject: Re: [PATCH 1/3] clk: add flag for clocks that need to be enabled on rate changes
Date: Sun, 11 Oct 2015 12:41:09 +0200
Message-ID: <13378907.1JCOSf8QGs@diego>
In-Reply-To: <20151008215840.GJ26883@codeaurora.org>
References: <1929669.AsgMSusdJb@phil> <3137165.kmu68gRS44@diego> <20151008215840.GJ26883@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

Am Donnerstag, 8. Oktober 2015, 14:58:40 schrieb Stephen Boyd:
> On 10/02, Heiko St=FCbner wrote:
> > Hi,
> >=20
> > any comment on these 3 patches?
>=20
> Dong has a similar problem, but those patches conflate this with
> enabling parent clocks during clk_disable_unused() which makes no
> sense to me. So I'm ok with the requirement that we turn clocks
> on to change rates, but I wonder if in this case we need to turn
> on the clock that's changing rates itself, or if we just need to
> turn on the parent and/or future parent of the clock during the
> rate switch. Care to elaborate on that?

As you can see in the follow-up patches, the fractional dividers on Roc=
kchip=20
SoCs are quite strange in that they even need to have their _downstream=
_ mux=20
point to them to actually accept rate changes.

The register value always reflects the value set by the system, but har=
dware=20
really only accepts it if the clock is enabled and even the downstream =
mux=20
selects the fractional divider as parent (they call it a auto-gating fe=
ature).

So in the worst (and current) case, you end up with the register showin=
g the=20
right value, but the hardware can use completely different dividers fro=
m the=20
previous setting.

That strange behaviour got quite deeply investigated between Rockchip a=
nd=20
Google engineers who stumbled upon this in the first place, so I'm reas=
onably=20
sure this is the right solution for that clock type :-) .


Heiko
