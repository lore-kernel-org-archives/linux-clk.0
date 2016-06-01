Return-Path: <sboyd@codeaurora.org>
Date: Wed, 1 Jun 2016 15:14:20 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Joachim Eastwood <manabian@gmail.com>, linux-clk@vger.kernel.org,
	mturquette@baylibre.com
Subject: Re: [PATCH] clk: nxp: Select MFD_SYSCON for creg driver
Message-ID: <20160601221420.GG28218@codeaurora.org>
References: <1463413536-20292-1-git-send-email-ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1463413536-20292-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-ID: <linux-clk.vger.kernel.org>

On 05/16, Ezequiel Garcia wrote:
> Commit 378523d15003 ("clk: add lpc18xx creg clk driver")
> added a new clock driver but missed the proper MFD_SYSCON select.
> Fix it.
> 
> Fixes: 378523d15003 ("clk: add lpc18xx creg clk driver")
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
