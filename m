Return-Path: <sboyd@codeaurora.org>
Date: Mon, 17 Oct 2016 15:34:38 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Eric Anholt <eric@anholt.net>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2] clk: bcm2835: Clamp the PLL's requested rate to the
 hardware limits.
Message-ID: <20161017223438.GK8871@codeaurora.org>
References: <20160930170727.32544-1-eric@anholt.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160930170727.32544-1-eric@anholt.net>
List-ID: <linux-clk.vger.kernel.org>

On 09/30, Eric Anholt wrote:
> Fixes setting low-resolution video modes on HDMI.  Now the PLLH_PIX
> divider adjusts itself until the PLLH is within bounds.
> 
> Signed-off-by: Eric Anholt <eric@anholt.net>
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
