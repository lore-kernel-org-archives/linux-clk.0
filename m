Return-Path: <moinejf@free.fr>
Date: Sat, 6 Feb 2016 10:37:51 +0100
From: Jean-Francois Moine <moinejf@free.fr>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Dave Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, Emilio
 Lopez <emilio@elopez.com.ar>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 1/2] clk: sunxi: Add sun6i/8i video support
Message-Id: <20160206103751.eb21edf56ddc6ef7c27907f0@free.fr>
In-Reply-To: <20160205093915.GF1139@lukather>
References: <cover.1454435944.git.moinejf@free.fr>
	<3c0e2cdea659e9e682f80ecf42b252c740095f15.1454435944.git.moinejf@free.fr>
	<20160205093915.GF1139@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

On Fri, 5 Feb 2016 10:39:15 +0100
Maxime Ripard <maxime.ripard@free-electrons.com> wrote:

> > +CLK_OF_DECLARE(sun6i_display, "allwinner,sun6i-display-clk", sun6i_dis=
play_setup);
>=20
> Please use the display driver from my DRM serie, it covers everything
> you need here.

If you give me a pointer, I will have a look.

> > +CLK_OF_DECLARE(sun6i_pll3, "allwinner,sun6i-pll3-clk", sun6i_pll3_setu=
p);
>=20
> And please use the clk-factors code here.

I don't see how I can get direct 297MHz and 270MHz in fractional mode
with that code.

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
