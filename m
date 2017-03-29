Return-Path: <pdeschrijver@nvidia.com>
Date: Wed, 29 Mar 2017 15:49:16 +0300
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Jon Hunter <jonathanh@nvidia.com>
CC: Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding
	<thierry.reding@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, <linux-clk@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] clk: tegra: Don't reset PLL-CX if it is already enabled
Message-ID: <20170329124916.GW22128@tbergstrom-lnx.Nvidia.com>
References: <1490612465-12454-1-git-send-email-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <1490612465-12454-1-git-send-email-jonathanh@nvidia.com>
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

Acked-By: Peter De Schrijver <pdeschrijver@nvidia.com>

On Mon, Mar 27, 2017 at 12:01:05PM +0100, Jon Hunter wrote:
> Commit 8dce89a1c2cf ("clk: tegra: Don't warn for PLL defaults unnecessarily")
> changed the tegra210_pllcx_set_defaults() function causing the PLL to
> always be reset regardless of whether it is in-use. This function was
> changed so that resetting of the PLL will only be skipped if the PLL
> is enabled AND 'pllcx->params->defaults_set' is not true. However, the
> 'pllcx->params->defaults_set' is always true and hence, the PLL is now
> always reset. This causes the boot to fail on the Tegra210 Smaug where
> the PLL is already enabled and in-use. Fix this by only resetting the
> PLL if not in-use and only printing the warning that the defaults are
> not set after we have checked the default settings.
> 
> Fixes: 8dce89a1c2cf ("clk: tegra: Don't warn for PLL defaults unnecessarily")
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> index 9897dc55676b..b56a104328fa 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -555,12 +555,12 @@ static void tegra210_pllcx_set_defaults(const char *name,
>  {
>  	pllcx->params->defaults_set = true;
>  
> -	if (readl_relaxed(clk_base + pllcx->params->base_reg) &
> -			PLL_ENABLE && !pllcx->params->defaults_set) {
> +	if (readl_relaxed(clk_base + pllcx->params->base_reg) & PLL_ENABLE) {
>  		/* PLL is ON: only check if defaults already set */
>  		pllcx_check_defaults(pllcx->params);
> -		pr_warn("%s already enabled. Postponing set full defaults\n",
> -			name);
> +		if (!pllcx->params->defaults_set)
> +			pr_warn("%s already enabled. Postponing set full defaults\n",
> +				name);
>  		return;
>  	}
>  
> -- 
> 2.7.4
> 
