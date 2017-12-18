Return-Path: <p.zabel@pengutronix.de>
Message-ID: <1513595146.9114.3.camel@pengutronix.de>
Subject: Re: [PATCH] clk: sunxi: sun9i-mmc: Implement reset callback for
 reset controls
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard
 <maxime.ripard@free-electrons.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Date: Mon, 18 Dec 2017 12:05:46 +0100
In-Reply-To: <20171218035751.20661-1-wens@csie.org>
References: <20171218035751.20661-1-wens@csie.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Mon, 2017-12-18 at 11:57 +0800, Chen-Yu Tsai wrote:
> Our MMC host driver now issues a reset, instead of just deasserting
> the reset control, since commit c34eda69ad4c ("mmc: sunxi: Reset the
> device at probe time"). The sun9i-mmc clock driver does not support
> this, and will fail, which results in MMC not probing.
> 
> This patch implements the reset callback by asserting the reset control,
> then deasserting it after a small delay.
> 
> Fixes: 7a6fca879f59 ("clk: sunxi: Add driver for A80 MMC config clocks/resets")
> Cc: <stable@vger.kernel.org> # 4.14.x
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
