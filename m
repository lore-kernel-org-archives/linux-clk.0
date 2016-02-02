Return-Path: <sboyd@codeaurora.org>
Date: Mon, 1 Feb 2016 17:08:31 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 16/16] clk: slightly optimize
 clk_core_set_parent()
Message-ID: <20160202010831.GE4848@codeaurora.org>
References: <1451298191-30815-1-git-send-email-yamada.masahiro@socionext.com>
 <1451298191-30815-17-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1451298191-30815-17-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/28, Masahiro Yamada wrote:
> If clk_fetch_parent_index() fails, p_rate is unused.  Move the
> assignment after the error checking.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
