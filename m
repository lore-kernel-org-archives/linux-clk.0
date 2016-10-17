Return-Path: <sboyd@codeaurora.org>
Date: Mon, 17 Oct 2016 15:30:30 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Markus Reichl <m.reichl@fivetechno.de>,
	Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: max77686: fix number of clocks setup for clk_hw
 based registration
Message-ID: <20161017223030.GI8871@codeaurora.org>
References: <1475765999-14366-1-git-send-email-javier@osg.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1475765999-14366-1-git-send-email-javier@osg.samsung.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/06, Javier Martinez Canillas wrote:
> The commit 9b4cac33adc7 ("clk: max77686: Migrate to clk_hw based OF and
> registration APIs") converted the driver to use the new provider API to
> register clocks using clk_hw.
> 
> But unfortunately, in the conversion it missed to set the num_clks value
> which lead to the following error when trying to register a clk provider:
> 
> [    1.963782] of_clk_max77686_get: invalid index 0
> [    1.967460] ERROR: could not get clock /rtc@10070000:rtc_src(1)
> [    1.973638] s3c-rtc 10070000.rtc: failed to find rtc source clock
> 
> Fix it by correctly set the max77686_clk_driver_data num_clks member.
> 
> Fixes: 9b4cac33adc7 ("clk: max77686: Migrate to clk_hw based OF and registration APIs")
> Reported-by: Markus Reichl <m.reichl@fivetechno.de>
> Suggested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Tested-by: Markus Reichl <m.reichl@fivetechno.de>
> 
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
