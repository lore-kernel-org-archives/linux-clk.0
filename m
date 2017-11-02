Return-Path: <sboyd@codeaurora.org>
Date: Thu, 2 Nov 2017 01:16:51 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: tegra: Add peripheral clock registration helper
Message-ID: <20171102081651.GK11011@codeaurora.org>
References: <20170901145343.19890-1-thierry.reding@gmail.com>
 <20170901145343.19890-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170901145343.19890-2-thierry.reding@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/01, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> There is a common pattern that registers individual peripheral clocks
> from an initialization table. Add a common implementation to remove the
> duplication from various call sites.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
