Return-Path: <sboyd@codeaurora.org>
Date: Thu, 16 Jul 2015 11:07:36 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Axel Lin <axel.lin@ingics.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND] clk: twl6040: Convert to use devm_clk_register
Message-ID: <20150716180736.GA2918@codeaurora.org>
References: <1437056153.15220.1.camel@ingics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1437056153.15220.1.camel@ingics.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/16, Axel Lin wrote:
> Use devm_clk_register() to simplify the code by removing
> twl6040_clk_remove().
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
