Return-Path: <sboyd@codeaurora.org>
Date: Thu, 21 Dec 2017 18:08:28 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: axi-clkgen: Correctly handle nocount bit in
 recalc_rate()
Message-ID: <20171222020828.GH7997@codeaurora.org>
References: <20170905093241.18582-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170905093241.18582-1-lars@metafoo.de>
List-ID: <linux-clk.vger.kernel.org>

On 09/05, Lars-Peter Clausen wrote:
> If the nocount bit is set the divider is bypassed and the settings for the
> divider count should be ignored and a divider value of 1 should be assumed.
> Handle this correctly in the driver recalc_rate() callback.
> 
> While the driver sets up the part so that the read back dividers values
> yield the correct result the power-on reset settings of the part might not
> reflect this and hence calling e.g. clk_get_rate() without prior calls to
> clk_set_rate() will yield the wrong result.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
