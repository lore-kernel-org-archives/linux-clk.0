Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <20170730164150.26302-5-jernej.skrabec@siol.net>
References: <20170730164150.26302-1-jernej.skrabec@siol.net> <20170730164150.26302-5-jernej.skrabec@siol.net>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 31 Jul 2017 13:02:18 +0800
Message-ID: <CAGb2v66FAYtsp39+5Aj2oZfyo=O=R1GJ11w3-vmJOysezsvcYg@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: sunxi-ng: Wait for lock when using fractional mode
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
> Currently ccu_frac_helper_set_rate() doesn't wait for a lock bit to be
> set before returning. Because of that, unstable clock may be used.
>
> Add a wait for lock in the helper function.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Can you provide a Fixes: tag?

Otherwise this looks good.
