Return-Path: <jonathanh@nvidia.com>
Subject: Re: [PATCH v5 1/4] clk: tegra: Fix includes required by
 fence_udelay()
To: Aapo Vienamo <avienamo@nvidia.com>, Peter De Schrijver
	<pdeschrijver@nvidia.com>
CC: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>
References: <1531319965-19689-1-git-send-email-avienamo@nvidia.com>
 <1531319965-19689-2-git-send-email-avienamo@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <5332f15c-65ae-5a70-577f-6125715233e6@nvidia.com>
Date: Thu, 12 Jul 2018 11:11:14 +0100
MIME-Version: 1.0
In-Reply-To: <1531319965-19689-2-git-send-email-avienamo@nvidia.com>
Return-Path: jonathanh@nvidia.com
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>


On 11/07/18 15:39, Aapo Vienamo wrote:
> Add the missing linux/delay.h include statement for udelay() used by
> fence_udelay() macro.
> 
> Signed-off-by: Aapo Vienamo <avienamo@nvidia.com>
> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  drivers/clk/tegra/clk.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index e1f8846..e3b9c22 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -19,6 +19,7 @@
>  
>  #include <linux/clk-provider.h>
>  #include <linux/clkdev.h>
> +#include <linux/delay.h>
>  
>  /**
>   * struct tegra_clk_sync_source - external clock source from codec

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
