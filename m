Return-Path: <sboyd@codeaurora.org>
Date: Wed, 2 Mar 2016 17:47:32 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Rhyland Klein <rklein@nvidia.com>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 17/41] clk: tegra: Remove CLK_IS_ROOT
Message-ID: <20160303014732.GO24999@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
 <1456858826-28541-18-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1456858826-28541-18-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 03/01, Stephen Boyd wrote:
> This flag is a no-op now. Remove usage of the flag.
> 
> Cc: Rhyland Klein <rklein@nvidia.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
