Return-Path: <sboyd@codeaurora.org>
Date: Fri, 21 Apr 2017 19:14:55 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk@vger.kernel.org,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] clk: at91: Use kcalloc() in
 of_at91_clk_pll_get_characteristics()
Message-ID: <20170422021455.GH7065@codeaurora.org>
References: <2b5c3954-dc45-4f1b-5d94-397f688b23cb@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <2b5c3954-dc45-4f1b-5d94-397f688b23cb@users.sourceforge.net>
List-ID: <linux-clk.vger.kernel.org>

On 04/19, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 19 Apr 2017 19:43:03 +0200
> 
> Multiplications for the size determination of memory allocations
> indicated that array data structures should be processed.
> Thus use the corresponding function "kcalloc".
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
