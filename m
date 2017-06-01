Return-Path: <sboyd@codeaurora.org>
Date: Thu, 1 Jun 2017 02:13:13 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: scpi: fix return type of __scpi_dvfs_round_rate
Message-ID: <20170601091313.GG20170@codeaurora.org>
References: <1495124368-26191-1-git-send-email-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1495124368-26191-1-git-send-email-sudeep.holla@arm.com>
List-ID: <linux-clk.vger.kernel.org>

On 05/18, Sudeep Holla wrote:
> The frequencies above the maximum value of signed integer(i.e. 2^31 -1)
> will overflow with the current code.
> 
> This patch fixes the return type of __scpi_dvfs_round_rate from 'int'
> to 'unsigned long'.
> 
> Fixes: cd52c2a4b5c4 ("clk: add support for clocks provided by SCP(System Control Processor)")
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
