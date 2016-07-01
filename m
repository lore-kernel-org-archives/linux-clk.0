Return-Path: <moinejf@free.fr>
Date: Fri, 1 Jul 2016 08:34:02 +0200
From: Jean-Francois Moine <moinejf@free.fr>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Emilio Lopez <emilio@elopez.com.ar>, Chen-Yu Tsai <wens@csie.org>,
 Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette
 <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sunxi@googlegroups.com
Subject: Re: [PATCH 1/3] clk: sunxi: Add a driver for the CCU
Message-Id: <20160701083402.4f528ca4ed7fbd4877e4ef7b@free.fr>
In-Reply-To: <20160630211635.GE5485@lukather>
References: <cover.1467135898.git.moinejf@free.fr>
	<a55dc5d1a9f02dc4d71d5c21064bffebe5a7b149.1467135898.git.moinejf@free.fr>
	<20160628204502.GG5550@lukather>
	<20160629101256.93895e6ff9184efa340f69dd@free.fr>
	<20160630211635.GE5485@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

On Thu, 30 Jun 2016 23:16:35 +0200
Maxime Ripard <maxime.ripard@free-electrons.com> wrote:

> > > I'm sorry, but the whole point of the initial serie was to rework and
> > > simplify things, precisely because dealing with the clk_factors code
> > > was just too difficult nowadays. And this doesn't solve anything on
> > > that aspect.
> >=20
> > In my code, all the clock factors I know about are handled.
> > Basically, the requested and the parent rates give a multiplier and a
> > divider. These ones are dispatched into the specific clock factors
> > according to their constraints.
>=20
> You missed the "simplify" part. The other reason for this serie to
> exist was to be consistent with what the other architectures are
> doing, which is not the case here either.

The other architectures have not a so complex mechanism as Allwinner's.
The 'divider'/'fractional-divider'/multiplier'/... "standard" functions
cannot be used in ou case. Your 'sunxi-ng' just add new structures to
replace them, and, in fact, you are building an other restricted
composite clock system. which will be unusable when new SoCs will
appear.

Yes, I should not have include the reset/bus gate/factor computation
stuff in my patch series. Because the only important part is to have a
flat definition of all the parameters giving this more simplification:
one structure and one source file.

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
