Return-Path: <sboyd@codeaurora.org>
Date: Fri, 28 Apr 2017 11:38:11 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Irina Tirdea <irina.tirdea@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] clk: x86: pmc-atom: Checking for IS_ERR() instead of NULL
Message-ID: <20170428183811.GC7065@codeaurora.org>
References: <20170422104333.tcdpvessre3pvafk@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170422104333.tcdpvessre3pvafk@mwanda>
List-ID: <linux-clk.vger.kernel.org>

On 04/22, Dan Carpenter wrote:
> clkdev_hw_create() returns NULLs on error, it doesn't return error
> pointers.
> 
> Fixes: 41ee7caf59e1 ("clk: x86: add "mclk" alias for Baytrail/Cherrytrail")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/clk/x86/clk-pmc-atom.c b/drivers/clk/x86/clk-pmc-atom.c
> index fafc99120dc2..f99abc1106f0 100644
> --- a/drivers/clk/x86/clk-pmc-atom.c

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
