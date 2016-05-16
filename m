Return-Path: <moinejf@free.fr>
Date: Mon, 16 May 2016 15:15:01 +0200
From: Jean-Francois Moine <moinejf@free.fr>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Vishnu Patekar
 <vishnupatekar0510@gmail.com>, Andre Przywara <andre.przywara@arm.com>,
 Mike Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, Hans de Goede <hdegoede@redhat.com>, Rob Herring
 <robh+dt@kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 03/16] clk: sunxi-ng: Add fixed factor clock support
Message-Id: <20160516151501.0dccc69384c08d6d646acac1@free.fr>
In-Reply-To: <CAGb2v65LcXnMj7B-0q2MYESM9vGd9k-yChjvFdX--EivSYdVJg@mail.gmail.com>
References: <1462737711-10017-1-git-send-email-maxime.ripard@free-electrons.com>
	<1462737711-10017-4-git-send-email-maxime.ripard@free-electrons.com>
	<CAGb2v65LcXnMj7B-0q2MYESM9vGd9k-yChjvFdX--EivSYdVJg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

On Mon, 9 May 2016 18:05:20 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

> > +}
> > +
> > +static long ccu_fixed_factor_round_rate(struct clk_hw *hw,
> > +                                       unsigned long rate,
> > +                                       unsigned long *parent_rate)
> > +{
> > +       struct ccu_fixed_factor *fix =3D hw_to_ccu_fixed_factor(hw);
> > +
> > +       return *parent_rate / fix->div * fix->mult;
>=20
> Why is this the other way around? With integer math it shouldn't be
> interchangeable. (Though it seems clk_fixed_factor does the same...)
>=20
> Also, clk_fixed_factor handles CLK_SET_RATE_PARENT. Do we need to do the
> same here?

Agree. Otherwise, sound in the H3 does not work.

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
