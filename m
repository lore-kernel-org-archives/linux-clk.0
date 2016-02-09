Return-Path: <sboyd@codeaurora.org>
Date: Tue, 9 Feb 2016 10:18:56 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: fix __clk_init_parent() for single parent clocks
Message-ID: <20160209181856.GB24167@codeaurora.org>
References: <1455016754-26006-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1455016754-26006-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

On 02/09, Masahiro Yamada wrote:
> Before commit b3d192d5121f ("clk: simplify __clk_init_parent()"),
> __clk_init_parent() called .get_parent() only for multi-parent
> clocks.  That commit changed the behavior to call .get_parent()
> if available even for single-parent clocks and root clocks.
> 
> It turned out a problem because there are some single-parent clocks
> that implement .get_parent() callback and return non-zero index.
> The SOCFPGA clock is the case; the commit broke the SOCFPGA boards.
> 
> To keep the original behavior, invoke .get_parent() only when
> num_parents is greater than 1.
> 
> Fixes: b3d192d5121f ("clk: simplify __clk_init_parent()")
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Reported-by: Dinh Nguyen <dinguyen@opensource.altera.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
