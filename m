Return-Path: <sboyd@codeaurora.org>
Date: Thu, 19 May 2016 14:10:15 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: fix critical clock locking
Message-ID: <20160519211015.GQ3492@codeaurora.org>
References: <1463126431-29071-1-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1463126431-29071-1-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 05/13, Maxime Ripard wrote:
> The critical clock handling in __clk_core_init isn't taking the enable lock
> before calling clk_core_enable, which in turns triggers the warning in the
> lockdep_assert_held call in that function when lockep is enabled.
> 
> Add the calls to clk_enable_lock/unlock to make sure it doesn't happen.
> 
> Fixes: 32b9b1096186 ("clk: Allow clocks to be marked as CRITICAL")
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> 
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
