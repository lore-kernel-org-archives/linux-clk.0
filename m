Return-Path: <sboyd@codeaurora.org>
Date: Thu, 1 Jun 2017 02:15:04 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	cw00.choi@samsung.com
Subject: Re: [PATCH] clk: Fix __set_clk_rates error print-string
Message-ID: <20170601091504.GH20170@codeaurora.org>
References: <1494845939-30724-1-git-send-email-pure.logic@nexus-software.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1494845939-30724-1-git-send-email-pure.logic@nexus-software.ie>
List-ID: <linux-clk.vger.kernel.org>

On 05/15, Bryan O'Donoghue wrote:
> When failing to set a clock the printout emitted is incorrect.
> "u32 rate" is formatted as %d and should be %u whereas "unsigned long
> clk_set_rate()" is formatted as %ld and should be %lu as per
> Documentation/printk-formats.txt.
> 
> Fixes: 2885c3b2a3da ("clk: Show correct information when fail to set clock
>                       rate")
> 
> Signed-off-by: Bryan O'Donoghue <pure.logic@nexus-software.ie>
> ---

Applied to clk-next but I fixed up the Fixes: tag to be on one
line and next to the signed-off one.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
