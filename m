Return-Path: <sboyd@codeaurora.org>
Date: Fri, 15 Apr 2016 16:54:36 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Peter Ujfalusi <peter.ujfalusi@ti.com>, Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH 32/41] clk: palmas: Remove CLK_IS_ROOT
Message-ID: <20160415235436.GJ12052@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
 <1456858826-28541-33-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1456858826-28541-33-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 03/01, Stephen Boyd wrote:
> This flag is a no-op now. Remove usage of the flag.
> 
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: Nishanth Menon <nm@ti.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
