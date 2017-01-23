Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <9c11bbe550b3e4918eb70b58d1bc59bdd540c851.1485039043.git-series.maxime.ripard@free-electrons.com>
References: <cover.04f797fe015b05f19b1d69d0650680baffb27055.1485039043.git-series.maxime.ripard@free-electrons.com>
 <9c11bbe550b3e4918eb70b58d1bc59bdd540c851.1485039043.git-series.maxime.ripard@free-electrons.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 23 Jan 2017 16:01:06 +0800
Message-ID: <CAGb2v67GKTa6BV6nisBPmnHnx+X0mFFr6hQZ_-kYGtDVXzAJbQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] clk: sunxi-ng: Add sun5i CCU driver
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Chen-Yu Tsai <wens@csie.org>, linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Sun, Jan 22, 2017 at 6:50 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> The Allwinner A10s, A13, R8 and NextThing GR8 are all based on the same
> silicon, and all share the same clocks.
>
> However, they're not packaged in the same way, and therefore not all the
> controllers are actually available on all these SoCs.
>
> Introduce a clock controller driver for all these SoCs with different
> compatibles to take that into account.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
