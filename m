Return-Path: <pdeschrijver@nvidia.com>
Date: Fri, 29 Sep 2017 12:19:16 +0300
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: SF Markus Elfring <elfring@users.sourceforge.net>
CC: <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>, "Jonathan
 Hunter" <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Thierry Reding <thierry.reding@gmail.com>, LKML
	<linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] clk/tegra: Delete an error message for a failed memory
 allocation in three functions
Message-ID: <20170929091915.GL6290@tbergstrom-lnx.Nvidia.com>
References: <9cc51853-c393-91e6-45d8-6516dde90366@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <9cc51853-c393-91e6-45d8-6516dde90366@users.sourceforge.net>
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>


Acked-By: Peter De Schrijver <pdeschrijver@nvidia.com>

On Wed, Sep 27, 2017 at 06:53:10PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 27 Sep 2017 18:40:34 +0200
> 
> Omit extra messages for a memory allocation failure in these functions.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/clk/tegra/clk-audio-sync.c  | 4 +---
>  drivers/clk/tegra/clk-divider.c     | 5 +----
>  drivers/clk/tegra/clk-periph-gate.c | 4 +---
>  3 files changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-audio-sync.c b/drivers/clk/tegra/clk-audio-sync.c
> index 92d04ce2dee6..62a84c883dd4 100644
> --- a/drivers/clk/tegra/clk-audio-sync.c
> +++ b/drivers/clk/tegra/clk-audio-sync.c
> @@ -62,10 +62,8 @@ struct clk *tegra_clk_register_sync_source(const char *name,
>  	struct clk *clk;
>  
>  	sync = kzalloc(sizeof(*sync), GFP_KERNEL);
> -	if (!sync) {
> -		pr_err("%s: could not allocate sync source clk\n", __func__);
> +	if (!sync)
>  		return ERR_PTR(-ENOMEM);
> -	}
>  
>  	sync->rate = rate;
>  	sync->max_rate = max_rate;
> diff --git a/drivers/clk/tegra/clk-divider.c b/drivers/clk/tegra/clk-divider.c
> index 16e0aee14773..5ee9423ccac2 100644
> --- a/drivers/clk/tegra/clk-divider.c
> +++ b/drivers/clk/tegra/clk-divider.c
> @@ -156,11 +156,8 @@ struct clk *tegra_clk_register_divider(const char *name,
>  	struct clk_init_data init;
>  
>  	divider = kzalloc(sizeof(*divider), GFP_KERNEL);
> -	if (!divider) {
> -		pr_err("%s: could not allocate fractional divider clk\n",
> -		       __func__);
> +	if (!divider)
>  		return ERR_PTR(-ENOMEM);
> -	}
>  
>  	init.name = name;
>  	init.ops = &tegra_clk_frac_div_ops;
> diff --git a/drivers/clk/tegra/clk-periph-gate.c b/drivers/clk/tegra/clk-periph-gate.c
> index 303ef32ee3f1..276cc4c59204 100644
> --- a/drivers/clk/tegra/clk-periph-gate.c
> +++ b/drivers/clk/tegra/clk-periph-gate.c
> @@ -141,10 +141,8 @@ struct clk *tegra_clk_register_periph_gate(const char *name,
>  		return ERR_PTR(-EINVAL);
>  
>  	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
> -	if (!gate) {
> -		pr_err("%s: could not allocate periph gate clk\n", __func__);
> +	if (!gate)
>  		return ERR_PTR(-ENOMEM);
> -	}
>  
>  	init.name = name;
>  	init.flags = flags;
> -- 
> 2.14.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
