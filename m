Return-Path: <sboyd@codeaurora.org>
Date: Mon, 20 Jun 2016 17:44:38 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kernel@lists.codethink.co.uk,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: at91: make of_sama5d2_clk_generated_setup() static
Message-ID: <20160621004438.GG1521@codeaurora.org>
References: <1465317489-14920-1-git-send-email-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1465317489-14920-1-git-send-email-ben.dooks@codethink.co.uk>
List-ID: <linux-clk.vger.kernel.org>

On 06/07, Ben Dooks wrote:
> The of_sama5d2_clk_generated_setup() is not exported outside
> of the driver, so make it static to fix the warning about it
> being not static:
> 
> drivers/clk/at91/clk-generated.c:270:13: warning: symbol 'of_sama5d2_clk_generated_setup' was not declared. Should it be static?
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
