Return-Path: <sboyd@codeaurora.org>
Date: Fri, 29 Jan 2016 16:45:34 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: optimize the divider walk in clk_divider_bestdiv()
Message-ID: <20160130004533.GP12841@codeaurora.org>
References: <1451965421-28227-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1451965421-28227-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

On 01/05, Masahiro Yamada wrote:
> Because _next_div() returns a valid divider, there is no need to
> consult _is_valid_div() for the validity of the divider in every
> iteration.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
