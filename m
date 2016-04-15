Return-Path: <sboyd@codeaurora.org>
Date: Fri, 15 Apr 2016 16:57:28 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: at91: fix check of clk_register() returned value
Message-ID: <20160415235728.GP12052@codeaurora.org>
References: <1457394089-15319-1-git-send-email-vz@mleia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1457394089-15319-1-git-send-email-vz@mleia.com>
List-ID: <linux-clk.vger.kernel.org>

On 03/08, Vladimir Zapolskiy wrote:
> The clk_register() function returns a valid pointer to struct clk or
> ERR_PTR() error code, this makes a check for returned NULL value
> useless and may lead to oops on error path.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
> ---

Applied to clk-next + added Fixes tag.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
