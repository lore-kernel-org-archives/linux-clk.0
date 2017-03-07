Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: mturquette@baylibre.com, linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 0/2] rockchip: fix serial output on rk3036
Date: Tue, 07 Mar 2017 15:40:05 +0100
Message-ID: <2904745.ktfkW62xXz@diego>
In-Reply-To: <20170307135443.GA25384@codeaurora.org>
References: <20170301210042.11352-1-heiko@sntech.de> <20170307135443.GA25384@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Am Dienstag, 7. M=E4rz 2017, 05:54:43 CET schrieb Stephen Boyd:
> On 03/01, Heiko Stuebner wrote:
> > Recent changes to the 8250-dw variant revealed issues concerning
> > how the clock rates are handled on the rk3036 uart.
> >=20
> > For one, there was an error in the clock declaration, but also the
> > shared uart-pll-select-mux also as default got supplied from the apll
> > that also supplies the cpu and thus gets frequency scaled.
> >=20
> > The patches in this series remedy this and make the debug uart
> > function again on 4.10 + current merge window.
> >=20
> >=20
> > As for the merge-path, I've now tested all Rockchip socs I have access
> > to (3036, 3288, 3368, 3399) and didn't find any more clock-related issu=
es
> > with the merge-window as of today. So if no other subtle issue turns up
> > this week, these should be all fixes for the 4.11 cycle.
> > So these 2 patches could be picked up by clock-maintainers directly if
> > so desired, or I can send a pull request after the merge-window closes
> > and we're save to say that nothing else broke.
> >=20
> > changes in v3:
> > - use a direct register write, instead of using clock apis
>=20
> Great. I'm happy to merge this into clk-fixes now (and I will do
> it now unless you have some need to send a pull request).

Nope, go ahead ... it seems everything else survived the merge window just =
fine=20
clk-wise
