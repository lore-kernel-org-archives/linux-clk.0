Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Nov 2015 09:15:27 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rhyland Klein <rklein@nvidia.com>
Subject: Re: [PATCH] clk: tegra: Fix bypassing of PLLs
Message-ID: <20151120171527.GL32672@codeaurora.org>
References: <1448032264-29622-1-git-send-email-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1448032264-29622-1-git-send-email-jonathanh@nvidia.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/20, Jon Hunter wrote:
> The _clk_disable_pll() function will attempt to place a PLL into bypass
> if the TEGRA_PLL_BYPASS is specified for the PLL and then disable the PLL
> by clearing the enable bit. To place the PLL into bypass, the bypass bit
> needs to be set and not cleared. Fix this by setting the bypass bit and
> not clearing it.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---

Fixes tag? It looks like this has been wrong from the beginning
of time.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
