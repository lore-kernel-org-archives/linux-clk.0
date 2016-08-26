Return-Path: <sboyd@codeaurora.org>
Date: Fri, 26 Aug 2016 12:28:33 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: Simplify __of_clk_get_hw_from_provider()
Message-ID: <20160826192833.GA19826@codeaurora.org>
References: <20160825203536.27235-1-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160825203536.27235-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/25, Stephen Boyd wrote:
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
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
