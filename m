Return-Path: <sboyd@codeaurora.org>
Date: Fri, 16 Oct 2015 11:57:58 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: Make clk input parameter of __clk_get_name() const
Message-ID: <20151016185758.GG23912@codeaurora.org>
References: <1444998921-15549-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1444998921-15549-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On 10/16, Geert Uytterhoeven wrote:
> When calling __clk_get_name() on a const clock:
> 
>     warning: passing argument 1 of '__clk_get_name' discards 'const' qualifier from pointer target type
>     include/linux/clk-provider.h:613:13: note: expected 'struct clk *' but argument is of type 'const struct clk *'
> 
> __clk_get_name() does not modify the passed clock, hence make it const.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
