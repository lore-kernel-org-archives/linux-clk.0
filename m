Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <1e37c723845efe18540268a168baeb81a86e8179.1484897383.git-series.maxime.ripard@free-electrons.com>
References: <cover.5df5469d9c7a6233e225a875dca513a03b05e871.1484897383.git-series.maxime.ripard@free-electrons.com>
 <1e37c723845efe18540268a168baeb81a86e8179.1484897383.git-series.maxime.ripard@free-electrons.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 21 Jan 2017 09:28:44 +0800
Message-ID: <CAGb2v65TW=WdcMufHsdKn2n4WsKwedE+M45qYQbmxLfrhYjf9g@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] clk: sunxi-ng: Implement global pre-divider
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Chen-Yu Tsai <wens@csie.org>, linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jan 20, 2017 at 3:29 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> Some clocks have a global pre-divider that applies to all their parents.
>
> Since it might also apply to clocks that have a single parent, this is
> merged in the ccu_common structure, unlike the other pre-divider settings
> that are tied to a specific index, and thus a specific parent.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
