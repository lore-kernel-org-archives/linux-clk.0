Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1532075856-1723-2-git-send-email-yamada.masahiro@socionext.com>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, linux-arm-kernel@lists.infradead.org
References: <1532075856-1723-1-git-send-email-yamada.masahiro@socionext.com>
 <1532075856-1723-2-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <153256098739.48062.2834824594130786288@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 2/2] clk: uniphier: add more USB3 PHY clocks
Date: Wed, 25 Jul 2018 16:23:07 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Masahiro Yamada (2018-07-20 01:37:36)
> Add USB3 PHY clocks where missing.  Use fixed-factor clocks for those
> without gating.
> =

> For clarification, prefix clock names with 'ss' or 'hs'.
> =

> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to clk-next
