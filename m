Return-Path: <ckeepax@opensource.wolfsonmicro.com>
Date: Tue, 13 Dec 2016 09:16:37 +0000
From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
To: Nicholas Mc Guire <hofrat@osadl.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        Mark Brown
	<broonie@opensource.wolfsonmicro.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        <patches@opensource.wolfsonmicro.com>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC] clk: wm831x: fix usleep_range with bad range
Message-ID: <20161213091637.GM1867@localhost.localdomain>
References: <1481528409-5182-1-git-send-email-hofrat@osadl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <1481528409-5182-1-git-send-email-hofrat@osadl.org>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Dec 12, 2016 at 08:40:09AM +0100, Nicholas Mc Guire wrote:
> The delay here is not in atomic context and does not seem critical with
> respect to precision, but usleep_range(min,max) with min==max results in 
> giving the timer subsystem no room to optimize uncritical delays. Fix 
> this by setting the range to 2000,3000 us.
> 
> Fixes: commit f05259a6ffa4 ("clk: wm831x: Add initial WM831x clock driver")
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> ---

Yeah looks fine waiting longer for the FLL to lock won't cause
any issues.

Acked-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Thanks,
Charles
