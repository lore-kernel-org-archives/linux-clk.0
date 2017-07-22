Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <20170721161935.18411-1-maxime.ripard@free-electrons.com>
References: <20170721161935.18411-1-maxime.ripard@free-electrons.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 22 Jul 2017 10:23:19 +0800
Message-ID: <CAGb2v64AmFA7qHgTK6+w147-vb0Mv6uh5xx5MXy5jVfKNX_WVg@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: sun5i: Add clk_set_rate_parent to the CPU clock
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Sat, Jul 22, 2017 at 12:19 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> The current CPU clock is missing the option to change the rate of its
> parents, leading to improper rates calculated by cpufreq, and eventually
> crashes.
>
> Cc: <stable@vger.kernel.org>
> Fixes: 5e73761786d6 ("clk: sunxi-ng: Add sun5i CCU driver")
> Reported-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
