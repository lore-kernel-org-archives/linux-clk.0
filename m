Return-Path: <sboyd@codeaurora.org>
Date: Thu, 21 Dec 2017 18:08:31 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: axi-clkgen: Round closest in round_rate() and
 recalc_rate()
Message-ID: <20171222020831.GI7997@codeaurora.org>
References: <20170905093241.18582-1-lars@metafoo.de>
 <20170905093241.18582-2-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170905093241.18582-2-lars@metafoo.de>
List-ID: <linux-clk.vger.kernel.org>

On 09/05, Lars-Peter Clausen wrote:
> To minimize the rounding error round to the closest integer when
> calculating the result in the recalc_rate() and set_rate() callbacks.
> 
> Also in order to improve precision multiply first and then divide.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
