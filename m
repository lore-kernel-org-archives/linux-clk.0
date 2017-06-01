Return-Path: <sboyd@codeaurora.org>
Date: Thu, 1 Jun 2017 00:24:29 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Cc: linux-clk@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
	Gregory CLEMENT <gregory.clement@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: mvebu: add support for 1866MHz variants
Message-ID: <20170601072429.GQ20170@codeaurora.org>
References: <20170523210106.16307-1-ralph.sennhauser@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170523210106.16307-1-ralph.sennhauser@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 05/23, Ralph Sennhauser wrote:
> The Linksys WRT3200ACM CPU is clocked at 1866MHz. Add 1866MHz to the
> list of supported CPU frequencies. Also update multiplier and divisor
> for the l2clk and ddrclk.
> 
> Noticed by the following warning:
> [    0.000000] Selected CPU frequency (16) unsupported
> 
> Signed-off-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
