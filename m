Return-Path: <sboyd@codeaurora.org>
Date: Mon, 20 Jun 2016 17:45:01 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kernel@lists.codethink.co.uk,
	Michael Turquette <mturquette@baylibre.com>,
	Ray Jui <rjui@broadcom.com>, Jon Mason <jonmason@broadcom.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH] clk: iproc: fix missing include of clk-iproc.h
Message-ID: <20160621004501.GH1521@codeaurora.org>
References: <1465317150-12704-1-git-send-email-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1465317150-12704-1-git-send-email-ben.dooks@codethink.co.uk>
List-ID: <linux-clk.vger.kernel.org>

On 06/07, Ben Dooks wrote:
> Fix the implicit declaration of iproc_armpll_setup() by
> including clk-iproc.h which defines it. Fixes the warning:
> 
> drivers/clk/bcm/clk-iproc-armpll.c:242:13: warning: symbol 'iproc_armpll_setup' was not declared. Should it be static?
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
