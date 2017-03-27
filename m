Return-Path: <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 5/7] clk: tegra: don't warn for PLL defaults
 unnecessarily
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad
	<pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>,
	"Thierry Reding" <thierry.reding@gmail.com>, Alexandre Courbot
	<gnurou@gmail.com>, "Rob Herring" <robh+dt@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, "Rhyland Klein" <rklein@nvidia.com>,
	<linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <1487846686-6388-1-git-send-email-pdeschrijver@nvidia.com>
 <1487846686-6388-6-git-send-email-pdeschrijver@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <b26752ac-5375-86af-8ce8-0be97b99c734@nvidia.com>
Date: Mon, 27 Mar 2017 12:02:28 +0100
MIME-Version: 1.0
In-Reply-To: <1487846686-6388-6-git-send-email-pdeschrijver@nvidia.com>
Return-Path: jonathanh@nvidia.com
Content-Type: text/plain; charset="windows-1252"
List-ID: <linux-clk.vger.kernel.org>

Hi Peter,

On 23/02/17 10:44, Peter De Schrijver wrote:
> If the PLL is on, only warn if the defaults are not yet set. Otherwise be
> silent.
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> index b7ef8a7..fe698d2 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -502,7 +502,7 @@ static void tegra210_pllcx_set_defaults(const char *name,
>  	pllcx->params->defaults_set = true;
>  
>  	if (readl_relaxed(clk_base + pllcx->params->base_reg) &
> -			PLL_ENABLE) {
> +			PLL_ENABLE && !pllcx->params->defaults_set) {
>  		/* PLL is ON: only check if defaults already set */
>  		pllcx_check_defaults(pllcx->params);
>  		pr_warn("%s already enabled. Postponing set full defaults\n",

The above hunk is causing the Tegra210 Smaug boot to fail. Looking more
at the code, I believe that the above hunk is not correct, because
'defaults_set' is always true and this is now causing us to always reset
the PLL if in-use or not. I will send a patch to correct this.

Cheers
Jon

-- 
nvpublic
