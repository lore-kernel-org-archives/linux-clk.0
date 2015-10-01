Return-Path: <sboyd@codeaurora.org>
Date: Thu, 1 Oct 2015 15:25:10 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Victorien Vedrine <victorien.vedrine@ophrys.net>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	mturquette@baylibre.com, shawn.guo@linaro.org
Subject: Re: [PATCH v2] clk:mxs: Fix bug on frequency divider
Message-ID: <20151001222510.GP19319@codeaurora.org>
References: <55BBB1AC.6070102@codeaurora.org>
 <1441010707-17178-1-git-send-email-victorien.vedrine@ophrys.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1441010707-17178-1-git-send-email-victorien.vedrine@ophrys.net>
List-ID: <linux-clk.vger.kernel.org>

On 08/31, Victorien Vedrine wrote:
> On drivers/clk/mxs/clk-frac.c, the function clk_frac_round_rate returned a bad
> result. The division before multiplication computes a wrong value ; the
> calculation is inverted to fix the problem. The second issue is that the exact
> rate have decimals and they are truncate. The consequence is that the function
> clk_frac_set_rate (which use the result of clk_frac_round_rate) computes a
> wrong value for the register (the rate generated can be closer to the desired
> rate). The correction is : if there is decimal to the result, it is rounded to
> the next larger integer.
> On drivers/clk/mxs/clk-frac.c, the function clk_frac_recalc_rate returned
> a bad result. The multiplication is made before the division to compute a
> correct value.
> 
> Signed-off-by: Victorien Vedrine <victorien.vedrine@ophrys.net>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
