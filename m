Return-Path: <sboyd@codeaurora.org>
Date: Fri, 23 Sep 2016 14:44:20 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: change the type of clk_hw_onecell_data.num to
 unsigned int
Message-ID: <20160923214420.GC21232@codeaurora.org>
References: <1474633776-11586-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1474633776-11586-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/23, Masahiro Yamada wrote:
> The "num" is the number of clk_hw entries in the structure, so
> "unsigned int" would be a better fit.  (size_t looks like data
> size we count by byte.)
> 
> Besides, struct clk_onecell_data already uses unsigned int for
> "clk_num".
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Seems fair.

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
