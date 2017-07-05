Return-Path: <sboyd@codeaurora.org>
Date: Wed, 5 Jul 2017 14:15:18 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Vincent Legoll <vincent.legoll@gmail.com>
Cc: linux-kernel@vger.kernel.org, mturquette@baylibre.com,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] Make Common clock framework a menuconfig to ease
 disabling it all
Message-ID: <20170705211518.GU22780@codeaurora.org>
References: <1499011768-8046-1-git-send-email-vincent.legoll@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1499011768-8046-1-git-send-email-vincent.legoll@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/02, Vincent Legoll wrote:
> No need to get into the submenu to disable all common clock framework
> -related config entries
> 
> Signed-off-by: Vincent Legoll <vincent.legoll@gmail.com>
> ---
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 36cfea3..a1b174c 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -19,9 +19,12 @@ config COMMON_CLK
>  	  Architectures utilizing the common struct clk should select
>  	  this option.
>  
> -menu "Common Clock Framework"
> +menuconfig COMMON_CLK_FRAMEWORK
> +	tristate "Common Clock Framework"
>  	depends on COMMON_CLK

Wouldn't this put the clk drivers inside the drivers menu? Which
is already quite large right now. Plus this makes common clk
tristate which so far we haven't supported. No thanks.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
