Return-Path: <sboyd@codeaurora.org>
Date: Mon, 17 Oct 2016 15:20:57 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: uniphier: fix type of variable passed to
 regmap_read()
Message-ID: <20161017222057.GD8871@codeaurora.org>
References: <1476631555-2059-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1476631555-2059-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/17, Masahiro Yamada wrote:
> The 3rd argument of regmap_read() takes a pointer to unsigned int.
> This driver is saved just because u32 happens to be typedef'ed as
> unsigned int, but we should not rely on that fact.  Change the
> variable type just in case.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
