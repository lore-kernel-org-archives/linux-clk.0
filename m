Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 "Stephen Boyd" <sboyd@codeaurora.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20171219083228.mima36idnmhmogdy@flea.lan>
Cc: "Chen-Yu Tsai" <wens@csie.org>, "Philipp Zabel" <p.zabel@pengutronix.de>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org
References: <20171218035751.20661-1-wens@csie.org> <20171218210709.GY7997@codeaurora.org>
 <20171219083228.mima36idnmhmogdy@flea.lan>
Message-ID: <151371308600.45969.9493234042800039482@resonance>
Subject: Re: [PATCH] clk: sunxi: sun9i-mmc: Implement reset callback for reset
 controls
Date: Tue, 19 Dec 2017 11:51:26 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting Maxime Ripard (2017-12-19 00:32:28)
> On Mon, Dec 18, 2017 at 01:07:09PM -0800, Stephen Boyd wrote:
> > On 12/18, Chen-Yu Tsai wrote:
> > > Our MMC host driver now issues a reset, instead of just deasserting
> > > the reset control, since commit c34eda69ad4c ("mmc: sunxi: Reset the
> > > device at probe time"). The sun9i-mmc clock driver does not support
> > > this, and will fail, which results in MMC not probing.
> > > =

> > > This patch implements the reset callback by asserting the reset contr=
ol,
> > > then deasserting it after a small delay.
> > > =

> > > Fixes: 7a6fca879f59 ("clk: sunxi: Add driver for A80 MMC config clock=
s/resets")
> > > Cc: <stable@vger.kernel.org> # 4.14.x
> > > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > > ---
> > =

> > Did you want us to pick this up into clk-fixes? It seems to be
> > causing MMC to not work for some time? That sounds annoying
> > enough.
> =

> That would be great, thanks!

Applied to clk-fixes.

Regards,
Mike

> Maxime
> =

> -- =

> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
