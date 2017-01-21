Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Jan 2017 16:30:00 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: uniphier: continue probing even if some clocks fail
 to register
Message-ID: <20170121003000.GR20800@codeaurora.org>
References: <1484742679-8373-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1484742679-8373-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

On 01/18, Masahiro Yamada wrote:
> Do not let the entire probe function fail even if some clocks fail
> to register.  Let's continue with succeeded clocks.  This will give
> the system more chances to boot and allow us to investigate the
> cause of the failure.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
