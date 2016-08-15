Return-Path: <sboyd@codeaurora.org>
Date: Mon, 15 Aug 2016 15:08:08 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH 1/2] clk: fixed-factor: Remove export symbol on setup
 function
Message-ID: <20160815220808.GH361@codeaurora.org>
References: <20160813015023.28221-1-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160813015023.28221-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/12, Stephen Boyd wrote:
> This function is marked __init, so it can't possibly need to be
> exported to modules. Remove the marking.
> 
> Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
