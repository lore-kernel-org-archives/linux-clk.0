Return-Path: <sboyd@codeaurora.org>
Date: Thu, 8 Dec 2016 14:55:12 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>,
	Eric Anholt <eric@anholt.net>, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: bcm2835: Avoid overwriting the div info when
 disabling a pll_div clk
Message-ID: <20161208225512.GR5423@codeaurora.org>
References: <1480620441-5442-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1480620441-5442-1-git-send-email-boris.brezillon@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/01, Boris Brezillon wrote:
> bcm2835_pll_divider_off() is resetting the divider field in the A2W reg
> to zero when disabling the clock.
> 
> Make sure we preserve this value by reading the previous a2w_reg value
> first and ORing the result with A2W_PLL_CHANNEL_DISABLE.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Fixes: 41691b8862e2 ("clk: bcm2835: Add support for programming the audio domain clocks")
> Cc: <stable@vger.kernel.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
