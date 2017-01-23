Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <cad6b82633303e0fe3b231dce364629bc723a808.1485039043.git-series.maxime.ripard@free-electrons.com>
References: <cover.04f797fe015b05f19b1d69d0650680baffb27055.1485039043.git-series.maxime.ripard@free-electrons.com>
 <cad6b82633303e0fe3b231dce364629bc723a808.1485039043.git-series.maxime.ripard@free-electrons.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 23 Jan 2017 12:27:54 +0800
Message-ID: <CAGb2v64W+mo3ByDmD7i_tuXVr+mXd0zqY1gvkPT-hrZsV-BqxA@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] clk: sunxi-ng: mult: Fix minimum in round rate
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Chen-Yu Tsai <wens@csie.org>, linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Sun, Jan 22, 2017 at 6:50 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> The previous code was always taking 1 as the minimum in it's round_rate
> function, ignoring entirely what was set as minimum in the clock
> definition.
>
> Make sure that's not the case anymore.
>
> Fixes: 2beaa601c849 ("clk: sunxi-ng: Implement minimum for multipliers")
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
