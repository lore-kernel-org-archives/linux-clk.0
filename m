Return-Path: <moinejf@free.fr>
Date: Tue, 18 Oct 2016 09:50:44 +0200
From: Jean-Francois Moine <moinejf@free.fr>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-sunxi@googlegroups.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: sun6i-a31: Force AHB1 clock to use PLL6
 as parent
Message-Id: <20161018095044.d1664c4935ad13007453fb35@free.fr>
In-Reply-To: <20161018054209.24546-1-wens@csie.org>
References: <20161018054209.24546-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

On Tue, 18 Oct 2016 13:42:09 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

> On the A31, the DMA engine only works if AHB1 is clocked from PLL6.
> In addition, the hstimer is clocked from AHB1, and if AHB1 is clocked
> from the CPU clock, and cpufreq is working, we get an unstable timer.
>=20
> Force the AHB1 clock to use PLL6 as its parent. Previously this was done
> in the device tree with the assigned-clocks and assigned-clocks-parent
> bindings. However with this new monolithic driver, the system critical
> clocks aren't exported through the device tree. The alternative is to
> force this setting in the driver before the clocks are registered.

It should be simpler to export the constant (CLK_AHB1) instead of
adding code...

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
