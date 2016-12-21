Return-Path: <sboyd@codeaurora.org>
Date: Wed, 21 Dec 2016 15:27:26 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Nicholas Mc Guire <hofrat@osadl.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Mark Brown <broonie@opensource.wolfsonmicro.com>,
	patches@opensource.wolfsonmicro.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] clk: wm831x: fix usleep_range with bad range
Message-ID: <20161221232726.GC8288@codeaurora.org>
References: <1481528409-5182-1-git-send-email-hofrat@osadl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1481528409-5182-1-git-send-email-hofrat@osadl.org>
List-ID: <linux-clk.vger.kernel.org>

On 12/12, Nicholas Mc Guire wrote:
> The delay here is not in atomic context and does not seem critical with
> respect to precision, but usleep_range(min,max) with min==max results in 
> giving the timer subsystem no room to optimize uncritical delays. Fix 
> this by setting the range to 2000,3000 us.
> 
> Fixes: commit f05259a6ffa4 ("clk: wm831x: Add initial WM831x clock driver")
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
