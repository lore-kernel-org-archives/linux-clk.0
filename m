Return-Path: <Govindraj.Raja@imgtec.com>
From: Govindraj Raja <Govindraj.Raja@imgtec.com>
To: "Andrew Bresticker (abrestic@chromium.org)" <abrestic@chromium.org>,
	Zdenko Pulitika <Zdenko.Pulitika@imgtec.com>, "linux-mips@linux-mips.org"
	<linux-mips@linux-mips.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, "Michael
 Turquette" <mturquette@baylibre.com>
CC: Kevin Cernekee <cernekee@chromium.org>, Ralf Baechle
	<ralf@linux-mips.org>, Andrew Bresticker <abrestic@chromium.org>, "James
 Hartley" <James.Hartley@imgtec.com>, Damien Horsley
	<Damien.Horsley@imgtec.com>, James Hogan <James.Hogan@imgtec.com>, "Ezequiel
 Garcia" <ezequiel@vanguardiasur.com.ar>
Subject: RE: [PATCH v2 1/4] clk: pistachio: Fix 32bit integer overflows
Date: Wed, 12 Aug 2015 14:31:38 +0000
Message-ID: <4BF5E8683E87FC4DA89822A5A3EB60CB6F32EA@hhmail02.hh.imgtec.org>
References: <1438964413-18876-1-git-send-email-govindraj.raja@imgtec.com>
 <1438964413-18876-2-git-send-email-govindraj.raja@imgtec.com>
 <E3EE94C54B0A8346A2210452C2C8281D288B1B8C@hhmail02.hh.imgtec.org>
In-Reply-To: <E3EE94C54B0A8346A2210452C2C8281D288B1B8C@hhmail02.hh.imgtec.org>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Hi Andrew,

> -----Original Message-----
> From: Zdenko Pulitika
> Sent: 10 August 2015 04:56 PM
> To: Govindraj Raja; linux-mips@linux-mips.org; linux-clk@vger.kernel.org;
> Stephen Boyd; Michael Turquette
> Cc: Kevin Cernekee; Ralf Baechle; Andrew Bresticker; James Hartley; Damie=
n
> Horsley; James Hogan; Ezequiel Garcia
> Subject: RE: [PATCH v2 1/4] clk: pistachio: Fix 32bit integer overflows
>=20
> Govindraj,
>=20
> > -----Original Message-----
> > From: Govindraj Raja
> > Sent: 07 August 2015 17:20
> > To: linux-mips@linux-mips.org; linux-clk@vger.kernel.org; Stephen
> > Boyd; Michael Turquette
> > Cc: Zdenko Pulitika; Kevin Cernekee; Ralf Baechle; Andrew Bresticker;
> > James Hartley; Govindraj Raja; Damien Horsley; James Hogan; Ezequiel
> > Garcia; Govindraj Raja
> > Subject: [PATCH v2 1/4] clk: pistachio: Fix 32bit integer overflows
> >
> > From: Zdenko Pulitika <zdenko.pulitika@imgtec.com>
> >
> > This commit fixes 32bit integer overflows throughout the pll driver (i.=
e.
> > wherever the result of integer multiplication may exceed the range of u=
32).
> >
> > One of the functions affected by this problem is .recalc_rate. It
> > returns incorrect rate for some pll settings (not for all though)
> > which in turn results in the incorrect rate setup of pll's child clocks=
.
> >
> > Signed-off-by: Zdenko Pulitika <zdenko.pulitika@imgtec.com>
> > Signed-off-by: Govindraj Raja <govindraj.raja@imgtec.com>
> > ---
> >  drivers/clk/pistachio/clk-pll.c | 26 ++++++++++++--------------
> >  1 file changed, 12 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/clk/pistachio/clk-pll.c
> > b/drivers/clk/pistachio/clk-pll.c index e17dada..68066ef 100644
> > --- a/drivers/clk/pistachio/clk-pll.c
> > +++ b/drivers/clk/pistachio/clk-pll.c
> > @@ -88,12 +88,10 @@ static inline void pll_lock(struct pistachio_clk_pl=
l *pll)
> >  		cpu_relax();
> >  }
> >
> > -static inline u32 do_div_round_closest(u64 dividend, u32 divisor)

[...]


> > 1.9.1
>=20
> [Zdenko Pulitika] Reverting pll_rate_table members from 64 to 32 bit re-
> introduces multiplication overflow issue.
> We can either 1) keep 64bit members in pll_rate_table and forget about ov=
erflow
> or 2) have 32 bit members but then we need to type cast them to u64 in ev=
ery
> multiplication expression which may overflow. In my opinion, first soluti=
on is
> safer and nicer, 2nd will result in ugly typecasts throughout the code an=
d, more
> importantly, there's a risk of overflow bug being repeated if somebody wi=
shes to
> modify/upgrade the existing code.

Like Zdenko pointed out some operations in pll calculation may overflow wit=
hout=20
converting the struct pistachio_pll_rate_table members to long=20

For example in below code snippet operation:

[..]

params->fref * params->fbdiv

[..]

So to be on safer side it's better to have the original code [1].

--
Thanks,
Govindraj.R

[1]:
http://patchwork.linux-mips.org/patch/10888/
