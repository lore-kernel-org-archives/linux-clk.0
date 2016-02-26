Return-Path: <sboyd@codeaurora.org>
Date: Thu, 25 Feb 2016 18:11:29 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: skip unnecessary set_phase if nothing to do
Message-ID: <20160226021129.GQ28849@codeaurora.org>
References: <1456449952-27551-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1456449952-27551-1-git-send-email-shawn.lin@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

On 02/26, Shawn Lin wrote:
> Let's compare the degrees from clk_set_rate with
> clk->core->phase. If the requested drgrees is already
> there, skip the following steps.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
