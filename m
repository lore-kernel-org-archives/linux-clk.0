Return-Path: <sboyd@codeaurora.org>
Date: Mon, 1 Feb 2016 17:08:11 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 11/16] clk: simplify __clk_init_parent()
Message-ID: <20160202010811.GZ4848@codeaurora.org>
References: <1451298191-30815-1-git-send-email-yamada.masahiro@socionext.com>
 <1451298191-30815-12-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1451298191-30815-12-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/28, Masahiro Yamada wrote:
> The translation from the index into clk_core is done by
> clk_core_get_parent_by_index().  The if-block for num_parents == 1
> case is duplicating the code in the clk_core_get_parent_by_index().
> 
> Drop the "if (num_parents == 1)" from the special case.  Instead,
> set the index to zero if .get_parent() is missing.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
