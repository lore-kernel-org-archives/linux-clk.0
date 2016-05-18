Return-Path: <moinejf@free.fr>
Date: Wed, 18 May 2016 18:27:24 +0200
From: Jean-Francois Moine <moinejf@free.fr>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Vishnu Patekar
 <vishnupatekar0510@gmail.com>, Andre Przywara <andre.przywara@arm.com>,
 Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 15/16] clk: sunxi-ng: Add H3 clocks
Message-Id: <20160518182724.bf9137a9c04ac670457fc083@free.fr>
In-Reply-To: <20160518140200.GN27618@lukather>
References: <1462737711-10017-1-git-send-email-maxime.ripard@free-electrons.com>
	<1462737711-10017-16-git-send-email-maxime.ripard@free-electrons.com>
	<20160513114559.786221e415ce5956e161dd5b@free.fr>
	<20160518140200.GN27618@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

Hi Maxime,

Sorry, my previous mail was sent while not finished!

On Wed, 18 May 2016 16:02:00 +0200
Maxime Ripard <maxime.ripard@free-electrons.com> wrote:

> On Fri, May 13, 2016 at 11:45:59AM +0200, Jean-Francois Moine wrote:
	[snip]
> > > +static const char * const nand_parents[] =3D { "osc24M", "pll-periph=
0",
> > > +					     "pll-periph1" };
> > > +static SUNXI_CCU_MP_WITH_MUX_GATE(nand_clk, "nand", nand_parents, 0x=
080,
> > > +				  0, 4,		/* M */
> > > +				  16, 2,	/* P */
> > > +				  24, 2,	/* mux */
> > > +				  BIT(31),	/* gate */
> > > +				  0);
> >=20
> > The mux width is 2, meaning there may be 4 parents. Then, there may be
> > an access out of the parent array (and same for mmcx and spix).
>=20
> The mux relies on the number of parents registered in the clock
> framework, which is 3 in this case, so that won't happen.
>=20
> Or am I missing what you're saying?

Sorry, at this time, I did not look yet at the macros.
There is no problem here.

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
