Return-Path: <sboyd@codeaurora.org>
Date: Wed, 30 Aug 2017 22:28:53 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: mturquette@baylibre.com, ulf.hansson@linaro.org,
	linus.walleij@linaro.org, mturquette@linaro.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] clk: ux500: prcc: constify clk_ops.
Message-ID: <20170831052853.GX21656@codeaurora.org>
References: <1503903761-21730-1-git-send-email-arvind.yadav.cs@gmail.com>
 <1503903761-21730-4-git-send-email-arvind.yadav.cs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1503903761-21730-4-git-send-email-arvind.yadav.cs@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/28, Arvind Yadav wrote:
> clk_ops are not supposed to change at runtime. All functions
> working with clk_ops provided by <linux/clk-provider.h> work
> with const clk_ops. So mark the non-const clk_ops as const.
> 
> Here, Function "clk_reg_prcc" is used to initialized clk_init_data.
> clk_init_data is working with const clk_ops. So make clk_reg_prcc
> non-const clk_ops argument as const.
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
