Return-Path: <sboyd@codeaurora.org>
Date: Mon, 1 Feb 2016 17:08:07 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 10/16] clk: move checking .git_parent to
 __clk_core_init()
Message-ID: <20160202010807.GY4848@codeaurora.org>
References: <1451298191-30815-1-git-send-email-yamada.masahiro@socionext.com>
 <1451298191-30815-11-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1451298191-30815-11-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/28, Masahiro Yamada wrote:
> The .git_parent is mandatory for multi-parent clocks.  Move the check
> to __clk_core_init(), like other callback checkings.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Squashed with the next commit and applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
