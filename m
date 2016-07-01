Return-Path: <moinejf@free.fr>
Date: Fri, 1 Jul 2016 08:01:39 +0200
From: Jean-Francois Moine <moinejf@free.fr>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Emilio Lopez <emilio@elopez.com.ar>, Chen-Yu Tsai <wens@csie.org>,
 Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette
 <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sunxi@googlegroups.com
Subject: Re: [PATCH 1/3] clk: sunxi: Add a driver for the CCU
Message-Id: <20160701080139.6cfbb779b61ba4be9b09d362@free.fr>
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

> > - some fixed_factor clocks may have a gate.
>=20
> Which ones?

I know only the "osc12M" in the A83T. It is used by the ehci1.

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
