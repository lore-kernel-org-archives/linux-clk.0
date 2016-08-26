Return-Path: <s.nawrocki@samsung.com>
Subject: Re: [PATCH] clk: Simplify __of_clk_get_hw_from_provider()
To: Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
References: <20160825203536.27235-1-sboyd@codeaurora.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <6cd278de-f9f4-74ae-71a0-2cc5601659b1@samsung.com>
Date: Fri, 26 Aug 2016 10:52:00 +0200
MIME-version: 1.0
In-reply-to: <20160825203536.27235-1-sboyd@codeaurora.org>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 08/25/2016 10:35 PM, Stephen Boyd wrote:
> __of_clk_get_hw_from_provider() is confusing because it will
> return EPROBE_DEFER if there isn't a ->get() or ->get_hw()
> function pointer in a provider. That's just a bug though, and we
> used to NULL pointer exception when ->get() was missing anyway,
> so let's make this more obvious that they're not optional. The
> assumption is that most providers will implement ->get_hw() so we
> only fallback to the ->get() function if necessary. This
> clarifies the intent and removes any possibility of probe defer
> happening if clk providers are buggy.
> 
> Reported-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
