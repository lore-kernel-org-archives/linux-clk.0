Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Barry Song <baohua@kernel.org>, Emilio =?ISO-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 3/7] clk: rockchip: Make reset_control_ops const
Date: Thu, 25 Feb 2016 22:05:58 +0100
Message-ID: <3824099.j8MfGe0JYT@phil>
In-Reply-To: <1456393512-26602-4-git-send-email-p.zabel@pengutronix.de>
References: <1456393512-26602-1-git-send-email-p.zabel@pengutronix.de> <1456393512-26602-4-git-send-email-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Donnerstag, 25. Februar 2016, 10:45:08 schrieb Philipp Zabel:
> The rockchip_softrst_ops structure is never modified. Make it const.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

looks sane, so

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
