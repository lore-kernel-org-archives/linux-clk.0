Return-Path: <sboyd@codeaurora.org>
Date: Fri, 4 Nov 2016 13:33:13 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Alexandre Courbot <gnurou@gmail.com>,
	Aleksandr Frid <afrid@nvidia.com>,
	Paul Walmsley <pwalmsley@nvidia.com>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 09/10] clk: tegra: make clk-tegra124-dfll-fcpu explicitly
 non-modular
Message-ID: <20161104203313.GI16026@codeaurora.org>
References: <20160704211220.5685-1-paul.gortmaker@windriver.com>
 <20160704211220.5685-10-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160704211220.5685-10-paul.gortmaker@windriver.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/04, Paul Gortmaker wrote:
> The Kconfig currently controlling compilation of this code is:
> 
> arch/arm/mach-tegra/Kconfig:config ARCH_TEGRA_124_SOC
> arch/arm/mach-tegra/Kconfig:    bool "Enable support for Tegra124 family"
> 
> ...meaning that it currently is not being built as a module by anyone.
> 
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
> 
> Since module_init translates to device_initcall in the non-modular
> case, the init ordering remains unchanged with this commit.
> 
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
> 
> We also delete the MODULE_LICENSE tags etc. since all that information
> is already contained at the top of the file in the comments.
> 
> Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
> Cc: Prashant Gaikwad <pgaikwad@nvidia.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Stephen Warren <swarren@wwwdotorg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Aleksandr Frid <afrid@nvidia.com>
> Cc: Paul Walmsley <pwalmsley@nvidia.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
