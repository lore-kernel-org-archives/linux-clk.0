Return-Path: <sboyd@codeaurora.org>
Date: Mon, 15 Aug 2016 15:06:10 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mark Brown <broonie@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] clk: Make clock framework user selectable
Message-ID: <20160815220610.GG361@codeaurora.org>
References: <1470915049-15249-1-git-send-email-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1470915049-15249-1-git-send-email-broonie@kernel.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/11, Mark Brown wrote:
> Some architectures like x86 don't use the clock API in architecture code
> but one of the advantages of the common clock API is that it can be used
> by regular devices to represent their clocking structures so we should
> allow users to enable the clock API themselves even if the architecture
> doesn't need it. This is more straightforward than going round every
> architecture and convincing their maintainers to add the select.
> 
> Unfortunately some architectures do still provide a custom implementation
> of the clock API which is incompatible with common clock. Provide a config
> option HAS_CUSTOM_CLK which these architectures can select in order to

s/HAS/HAVE/

> prevent COMMON_CLK being enabled.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Concept seems fine.

> ---
>  drivers/clk/Kconfig | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index e2d9bd760c84..08a0b2cd49c6 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -7,7 +7,8 @@ config HAVE_CLK_PREPARE
>  	bool
>  
>  config COMMON_CLK
> -	bool
> +	bool "Common Clock Framework Support"
> +	depends on !HAVE_CUSTOM_CLK

Is the plan that architectures will keep selecting this when they
want to enforce common clk framework on their arch? We could move
enabling this config to the defconfigs if we make of_clk_init() a
stub when this config is disabled. Interestingly arm already has
that ifdefed out so nothing fails to compile there, but not every
arch is following that design.

Also, are there patches for all the users to select
HAVE_CUSTOM_CLK? Otherwise we can get randconfig failures when
two places define clk API functions.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
