Return-Path: <sboyd@codeaurora.org>
Date: Thu, 3 Mar 2016 11:43:23 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sylvain Lemieux <slemieux.tyco@gmail.com>
Cc: mturquette@baylibre.com, stigge@antcom.de, vz@mleia.com,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2] clk: lpc32xx: fix compilation warning
Message-ID: <20160303194322.GC24999@codeaurora.org>
References: <1456257369-22342-1-git-send-email-slemieux.tyco@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1456257369-22342-1-git-send-email-slemieux.tyco@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 02/23, Sylvain Lemieux wrote:
> From: Sylvain Lemieux <slemieux@tycoint.com>
> 
> Remove the following false positives compilation warning:
> - drivers/clk/nxp/clk-lpc32xx.c: In function 'lpc32xx_clk_register':
>   warning: 'hw' may be used uninitialized in this function [-Wmaybe-uninitialized]
> - drivers/clk/nxp/clk-lpc32xx.c: In function 'clk_hclk_pll_round_rate':
>   warning: 'p' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   warning: 'n' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   warning: 'm' may be used uninitialized in this function [-Wmaybe-uninitialized]
> 
> Tested using gcc version 4.7.3.
> 
> Signed-off-by: Sylvain Lemieux <slemieux@tycoint.com>
> ---

Applied to clk-next but I dropped the assignment of hw to NULL
part because the return takes care of it and is less likely to
lead to use of an uninitialized variable.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
