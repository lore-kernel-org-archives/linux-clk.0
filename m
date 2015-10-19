Return-Path: <sboyd@codeaurora.org>
Date: Mon, 19 Oct 2015 14:49:11 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Ray Jui <rjui@broadcom.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
	Simran Rai <ssimran@broadcom.com>
Subject: Re: [PATCH] clk: iproc: Fix PLL output frequency calculation
Message-ID: <20151019214911.GB19782@codeaurora.org>
References: <1445035458-29340-1-git-send-email-rjui@broadcom.com>
 <1445035458-29340-2-git-send-email-rjui@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1445035458-29340-2-git-send-email-rjui@broadcom.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/16, Ray Jui wrote:
> From: Simran Rai <ssimran@broadcom.com>
> 
> This patch affects the clocks that use fractional ndivider in their
> PLL output frequency calculation. Instead of 2^20 divide factor, the
> clock's ndiv integer shift was used. Fixed the bug by replacing ndiv
> integer shift with 2^20 factor.
> 
> Signed-off-by: Simran Rai <ssimran@broadcom.com>
> Signed-off-by: Ray Jui <rjui@broadcom.com>
> Reviewed-by: Scott Branden <sbranden@broadcom.com>
> ---

Did you want any Fixes: tag so this goes back to stable?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
