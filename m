Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Stephen Boyd <sboyd@codeaurora.org>, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, sjoerd.simons@collabora.co.uk, Xing Zheng <zhengxing@rock-chips.com>
Subject: Re: [PATCH 1/3] clk: add flag for clocks that need to be enabled on rate changes
Date: Mon, 12 Oct 2015 18:03:29 +0200
Message-ID: <37059102.QWiKhRxp8v@diego>
In-Reply-To: <13378907.1JCOSf8QGs@diego>
References: <1929669.AsgMSusdJb@phil> <20151008215840.GJ26883@codeaurora.org> <13378907.1JCOSf8QGs@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Am Sonntag, 11. Oktober 2015, 12:41:09 schrieb Heiko St=FCbner:
> Hi Stephen,
>=20
> Am Donnerstag, 8. Oktober 2015, 14:58:40 schrieb Stephen Boyd:
> > On 10/02, Heiko St=FCbner wrote:
> > > Hi,
> > >=20
> > > any comment on these 3 patches?
> >=20
> > Dong has a similar problem, but those patches conflate this with
> > enabling parent clocks during clk_disable_unused() which makes no
> > sense to me. So I'm ok with the requirement that we turn clocks
> > on to change rates, but I wonder if in this case we need to turn
> > on the clock that's changing rates itself, or if we just need to
> > turn on the parent and/or future parent of the clock during the
> > rate switch. Care to elaborate on that?
>=20
> As you can see in the follow-up patches, the fractional dividers on R=
ockchip
> SoCs are quite strange in that they even need to have their _downstre=
am_
> mux point to them to actually accept rate changes.
>=20
> The register value always reflects the value set by the system, but h=
ardware
> really only accepts it if the clock is enabled and even the downstrea=
m mux
> selects the fractional divider as parent (they call it a auto-gating
> feature).
>=20
> So in the worst (and current) case, you end up with the register show=
ing the
> right value, but the hardware can use completely different dividers f=
rom
> the previous setting.
>=20
> That strange behaviour got quite deeply investigated between Rockchip=
 and
> Google engineers who stumbled upon this in the first place, so I'm
> reasonably sure this is the right solution for that clock type :-) .

Xing Zheng now also independently stumbled upon this issue with his rk3=
036=20
work. And came to the same conclusion that the gate must be enabled as =
well as=20
the downstream mux be set to the fractional divider for it to actually =
accept=20
a new setting.
