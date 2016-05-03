Return-Path: <sboyd@codeaurora.org>
Date: Mon, 2 May 2016 17:52:05 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: fix comment of devm_clk_hw_register()
Message-ID: <20160503005205.GO3492@codeaurora.org>
References: <1462100168-15888-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1462100168-15888-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

On 05/01, Masahiro Yamada wrote:
> Unlike devm_clk_register(), devm_clk_hw_register() returns integer.
> So, the statement "Clocks returned from this function ..." sounds
> odd.  Adjust the comment for this new API.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
