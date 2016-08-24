Return-Path: <sboyd@codeaurora.org>
Date: Wed, 24 Aug 2016 10:54:19 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH] clk: tegra: remove TEGRA_PLL_USE_LOCK for PLLD/PLLD2
Message-ID: <20160824175419.GD19826@codeaurora.org>
References: <20160824135656.5025-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160824135656.5025-1-thierry.reding@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/24, Thierry Reding wrote:
> From: Vince Hsu <vinceh@nvidia.com>
> 
> Tegra114 has a HW bug that the PLLD/PLLD2 lock bit cannot be asserted when
> the DIS power domain is during up-powergating process but the clamp to this
> domain is not removed yet. That causes a timeout and aborts the power
> sequence, although the PLLD/PLLD2 has already locked. To remove the false
> alarm, we don't use the lock for PLLD/PLLD2. Just wait 1ms and treat the
> clocks as locked.
> 
> Signed-off-by: Vince Hsu <vinceh@nvidia.com>
> Tested-by: Jonathan Hunter <jonathanh@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
