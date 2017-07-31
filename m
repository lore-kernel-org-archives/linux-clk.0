Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <20170730164150.26302-3-jernej.skrabec@siol.net>
References: <20170730164150.26302-1-jernej.skrabec@siol.net> <20170730164150.26302-3-jernej.skrabec@siol.net>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 31 Jul 2017 13:39:01 +0800
Message-ID: <CAGb2v66_p1kuuU8ZmA=q3O3o342qmcgL6Ny=VEsYg+jksApqKw@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: sunxi-ng: multiplier: Fix fractional mode
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>,
	Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jul 31, 2017 at 12:41 AM, Jernej Skrabec
<jernej.skrabec@siol.net> wrote:
> Driver for multiplier clock is missing a call to
> ccu_frac_helper_enable() when fractional mode is selected.
>
> Add a call to ccu_frac_helper_enable().
>
> Fixes: d77e8135b340 ("clk: sunxi-ng: multiplier: Add fractional support")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Queued as a fix for 4.13.

ChenYu
