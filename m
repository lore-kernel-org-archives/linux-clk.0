Return-Path: <sboyd@codeaurora.org>
Date: Mon, 30 Nov 2015 11:29:46 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi: pll2: Fix clock running too fast
Message-ID: <20151130192946.GH11298@codeaurora.org>
References: <1448897699-20475-1-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1448897699-20475-1-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/30, Maxime Ripard wrote:
> Contrary to what the datasheet says, the pre divider doesn't seem to be
> incremented by one in the PLL2, but just uses the value from the register,
> with 0 being a bypass.
> 
> This fixes the audio playing too fast.
> 
> Since we now have the same pre-divider flags, and the only difference with
> the A10 is the post-divider offset, also remove the structure to just pass
> the offset as an argument.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
> 
> Hi Stephen, Mike,
> 
> Could you apply this patch for 4.4?
> 

I take it this should have a 

Fixes: eb662f854710 ("clk: sunxi: pll2: Add A13 support")

attached to it?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
