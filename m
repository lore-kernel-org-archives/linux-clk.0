Return-Path: <sboyd@codeaurora.org>
Date: Wed, 9 Nov 2016 12:43:31 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] clk: pxa: Use __iomem properly and staticize lock
 variable
Message-ID: <20161109204331.GU16026@codeaurora.org>
References: <20161108224756.25842-1-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20161108224756.25842-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 11/08, Stephen Boyd wrote:
> This function is passed an __iomem pointer but we use a u32
> pointer instead which makes checkers like spare complain.
> Furthermore, "lock" is a pretty poor variable name for a string
> that will go into lockdep reports and the symbol isn't marked
> static. Cleanup all this.
> 
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
