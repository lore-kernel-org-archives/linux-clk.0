Return-Path: <sboyd@codeaurora.org>
Date: Wed, 19 Oct 2016 13:14:21 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: uniphier: fix memory overrun bug
Message-ID: <20161019201421.GY8871@codeaurora.org>
References: <1476877779-27854-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1476877779-27854-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/19, Masahiro Yamada wrote:
> The first loop of this "for" statement writes memory beyond the
> allocated clk_hw_onecell_data.
> 
> It should be:
>     for (clk_num--; clk_num >= 0; clk_num--)
>             ...
> 
> Or more simply:
>     while (--clk_num >= 0)
>             ...
> 
> Fixes: 734d82f4a678 ("clk: uniphier: add core support code for UniPhier clock driver")
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
