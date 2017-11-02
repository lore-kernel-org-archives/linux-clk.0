Return-Path: <sboyd@codeaurora.org>
Date: Thu, 2 Nov 2017 01:16:48 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: clock: tegra: Add sor1_out clock
Message-ID: <20171102081648.GJ11011@codeaurora.org>
References: <20170901145343.19890-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170901145343.19890-1-thierry.reding@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/01, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The sor1_src clock implemented on Tegra210 is modelled the wrong way
> around, which causes some issues with HDMI and DP support. This clock
> implementation is provided by BPMP on Tegra186, which models this in
> a more correct way. Since this introduces incompatibilities between
> the two SoC generations which we want to avoid, the Tegra210 will be
> fixed in subsequent patches.
> 
> This change adds sor1_out as an alias for sor1_src.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
